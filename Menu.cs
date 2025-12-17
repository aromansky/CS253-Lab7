using CLIPSNET;

using System;

using System.Collections.Generic;

using System.ComponentModel;

using System.Data;

using System.Drawing;

using System.IO;

using System.Linq;

using System.Text;

using System.Threading.Tasks;

using System.Windows.Forms;



namespace CS253_Lab7

{

    public partial class Menu : Form

    {

        KnowledgeBase kb = new KnowledgeBase();

        HashSet<int> knownFactsIds = new HashSet<int>();

        private CLIPSNET.Environment clips = new CLIPSNET.Environment();



        int cntRules = 0;

        bool targetFound = false;

        public Menu()

        {

            InitializeComponent();

            LoadKnowledgeBase();

            InitFactsList();

        }



        private void InitFactsList()

        {

            foreach (Fact fact in kb.Facts)

                factListBox.Items.Add(fact);

        }



        private void UpdateDataLabel()

        {

            dataInfoLabel.Text = $"Кол-во правил: {cntRules}" +

                "\n" +

                $"Кол-во известных фактов: {knownFactsIds.Count}";



            targetInfoLabel.Text = $"Целевой факт: f{kb.TargetFact.ID} - {kb.TargetFact.Description}";

        }



        private void LoadKnowledgeBase()

        {

            kb.LoadKnowledgeBase();

            UpdateDataLabel();

        }



        private void SetIOProxyFact(string userInput, string message = "", string[] answers = null)

        {

            // 1. Проверяем, есть ли факт ioproxy

            string checkFact = "(if (facts) then (return (find-all-facts ((?f ioproxy)) TRUE)) else (return NIL))";

            MultifieldValue existingFacts = clips.Eval(checkFact) as MultifieldValue;



            string answersStr = "";

            if (answers != null && answers.Length > 0)

            {

                answersStr = "(answers " + string.Join(" ", Array.ConvertAll(answers, a => $"\"{a}\"")) + ")";

            }



            if (existingFacts != null && existingFacts.Count > 0)

            {

                // Факт существует → модифицируем первый

                string modifyCmd = $"(modify {existingFacts[0].ToString()} (user-input \"{userInput}\") (messages \"{message}\") {answersStr})";

                clips.Eval(modifyCmd);

            }

            else

            {

                // Факта нет → создаём новый

                string assertCmd = $"(assert (ioproxy (user-input \"{userInput}\") (messages \"{message}\") {answersStr}))";

                clips.Eval(assertCmd);

            }

        }



        private void PrintNewFacts()

        {

            MultifieldValue facts =

                clips.Eval("(find-all-facts ((?f item)) TRUE)") as MultifieldValue;



            foreach (FactAddressValue fav in facts)

            {

                int id = (int)((IntegerValue)fav.GetSlotValue("id")).Value;



                if (knownFactsIds.Contains(id))

                    continue;



                string descr = kb.GetFactById(id).Description;

                double conf = ((FloatValue)fav.GetSlotValue("conf")).Value;



                outputBox.Text += $"==================================" + System.Environment.NewLine;

                Fact fact = new Fact(id, descr, conf);

                outputBox.Text += $"Выведен новый факт: {fact}" + System.Environment.NewLine;



                knownFactsIds.Add(id);

                if (fact.ID == kb.TargetFact.ID)

                {

                    outputBox.Text += System.Environment.NewLine;

                    outputBox.Text += System.Environment.NewLine;



                    outputBox.Text += $"Выведен целевой факт: {fact}" + System.Environment.NewLine;

                    targetFound = true;

                    return;

                }



            }

        }



        private void UserInputHandler(string input)

        {

            if (string.IsNullOrEmpty(input))

                return;



            List<string> inputFacts = input.Split(new char[] { ';' }).ToList();

            FactsProcessInput(inputFacts);

            while (clips.Run() > 0 && !targetFound)

            {

                PrintNewFacts();

            }

            UpdateDataLabel();

        }



        /// <summary>

        /// Экранирует кавычки

        /// </summary>

        private string Escape(string s) => s?.Replace("\"", "\\\"");



        private void FactsProcessInput(List<string> facts)

        {

            bool newFactAdded = false;



            foreach (string factDescr in facts)

            {

                if (string.IsNullOrEmpty(factDescr)) continue;

                Fact fact = kb.GetFactByDescription(factDescr.Trim());



                if (fact is null || knownFactsIds.Contains(fact.ID)) continue;



                string assertCmd = $"(assert (item " +

                    $"(id {fact.ID}) " +

                    $"(descr \"{Escape(fact.Description)}\") " +

                    $"(conf {fact.Confidence.ToString(System.Globalization.CultureInfo.InvariantCulture)}))" +

                    $")";



                clips.Eval(assertCmd);



                outputBox.Text += $"> Добавлен новый факт: {fact}" + System.Environment.NewLine;



                knownFactsIds.Add(fact.ID);

                newFactAdded = true;

            }



            if (!newFactAdded)

            {

                outputBox.Text += "Вы ввели несуществующие или уже известные факты" + System.Environment.NewLine;

            }



        }



        private void startButton_Click(object sender, EventArgs e)

        {

            outputBox.Clear();

            knownFactsIds.Clear();



            clips.Reset();

            clips.Run();

            //HandleClipsResponse();



            outputBox.Text += "НАЧАЛО ДИАГНОСТИКИ" + System.Environment.NewLine;

            outputBox.Text += $"Целевой факт: f{kb.TargetFact.ID} - {kb.TargetFact.Description}" + System.Environment.NewLine;

            outputBox.Text += System.Environment.NewLine;

            outputBox.Text += "Введите известные проблемы разделяя ';':" + System.Environment.NewLine;

        }



        private void resetButton_Click(object sender, EventArgs e)

        {

            outputBox.Clear();

            knownFactsIds.Clear();



            kb.Clear();

            clips.Reset();

            LoadKnowledgeBase();

            outputBox.Clear();

        }



        private void changeTargetButton_Click(object sender, EventArgs e)

        {

            using (ChangeTarget form = new ChangeTarget(kb))

            {

                if (form.ShowDialog() == DialogResult.OK)

                    targetInfoLabel.Text = $"Целевой факт: f{kb.TargetFact.ID} - {kb.TargetFact.Description}";

            }

        }



        private void sendButton_Click(object sender, EventArgs e)

        {

            UserInputHandler(inputBox.Text);

            inputBox.Clear();

        }





        private void UpdateClipsStats()

        {

            try

            {

                string rulesList = clips.Eval("(list-defrules)").ToString();



                int ruleCount = rulesList.Split(new[] { '\r', '\n' }, StringSplitOptions.RemoveEmptyEntries)

                                         .Count(line => line.TrimStart().StartsWith("defrule"));

                cntRules = int.Parse(clips.Eval("(length$ (get-defrule-list))").ToString()) - 2;

                UpdateDataLabel();

            }

            catch (Exception ex)

            {

                dataInfoLabel.Text = $"Ошибка получения статистики CLIPS: {ex.Message}";

            }

        }



        private void downloadButton_Click(object sender, EventArgs e)

        {

            using (OpenFileDialog openFileDialog = new OpenFileDialog())

            {

                openFileDialog.Title = "Выберите один или несколько файлов правил CLIPS для ДОГРУЗКИ";

                openFileDialog.Filter = "Файлы CLIPS (*.clp)|*.clp|Все файлы (*.*)|*.*";

                openFileDialog.Multiselect = true;



                if (openFileDialog.ShowDialog() == DialogResult.OK)

                {

                    // clips.Clear(); // <-- Эту строку удаляем!



                    StringBuilder log = new StringBuilder();

                    log.AppendLine("Догрузка правил CLIPS");



                    try

                    {

                        foreach (string filePath in openFileDialog.FileNames)

                        {

                            clips.Load(filePath);

                            log.AppendLine($"Загружен файл: {Path.GetFileName(filePath)}");

                        }



                        // 2. Сброс среды CLIPS (для активации deffacts и сброса рабочей памяти)

                        // Reset очищает рабочую память от динамических фактов, 

                        // но сохраняет все загруженные правила и шаблоны.

                        clips.Reset();

                        log.AppendLine("Догрузка завершена. CLIPS сброшен");



                        // 3. Обновление статистики (теперь учитывает новые и старые правила)

                        UpdateClipsStats();



                    }

                    catch (Exception ex)

                    {

                        log.AppendLine($"[Ошибка] Не удалось загрузить файлы: {ex.Message}");

                        MessageBox.Show($"Ошибка загрузки CLIPS: {ex.Message}", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);

                    }



                    MessageBox.Show(log.ToString(), "Результат загрузки CLIPS");

                }

            }

        }



        private void factListBox_DoubleClick(object sender, EventArgs e)

        {

            inputBox.Text += $"{((Fact)factListBox.SelectedItem).Description}; ";

        }

    }

}