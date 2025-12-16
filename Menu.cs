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
        private CLIPSNET.Environment clips = new CLIPSNET.Environment();
        public Menu()
        {
            InitializeComponent();
            LoadKnowledgeBase();
        }

        private void LoadKnowledgeBase()
        {
            kb.LoadKnowledgeBase();
            dataInfoLabel.Text = $"Кол-во правил: 0" +
                "\n" +
                $"Кол-во известных фактов: 0";

            targetInfoLabel.Text = $"Целевой факт: f{kb.TargetFact.ID} - {kb.TargetFact.Description}";
        }

        public void HandleClipsResponse()
        {
            try
            {
                PrimitiveValue pv = clips.Eval("(find-all-facts ((?f ioproxy)) TRUE)");
                var result = pv as MultifieldValue;

                if (result == null || result.Count == 0)
                {
                    outputBox.AppendText("ЭС: Система не готова или вывод завершен." + System.Environment.NewLine);
                    return;
                }

                FactAddressValue fv = (FactAddressValue)result[0];

                string message = fv["messages"].ToString();
                outputBox.AppendText("ЭС: " + message + "\n");

                var answersMf = fv["answers"] as MultifieldValue;

                if (answersMf != null && answersMf.Count > 0)
                {
                    var options = new List<string>();
                    foreach (var a in answersMf)
                        options.Add(a.ToString());

                    outputBox.AppendText($"[Подсказка: {string.Join(", ", options)}]\n");
                    inputBox.Focus();
                }
                else
                {
                    outputBox.AppendText("--- Вывод завершен ---\n");
                    clips.Eval("(assert (dialog-finished))");
                }
            }
            catch (Exception ex)
            {
                outputBox.AppendText($"[Ошибка CLIPSNET]: {ex.Message}" + System.Environment.NewLine);
            }
        }


        private void startButton_Click(object sender, EventArgs e)
        {
            clips.Reset();
            clips.Run();
            HandleClipsResponse();
        }

        private void resetButton_Click(object sender, EventArgs e)
        {
            kb.Clear();
            clips.Reset();
            LoadKnowledgeBase();
            outputBox.Clear();
        }

        private void changeTargetButton_Click(object sender, EventArgs e)
        {
            using (ChangeTarget form = new ChangeTarget(kb))
            {
                if(form.ShowDialog() == DialogResult.OK)
                    targetInfoLabel.Text = $"Целевой факт: f{kb.TargetFact.ID} - {kb.TargetFact.Description}";
            }
        }

        private void sendButton_Click(object sender, EventArgs e)
        {
            
        }


        private void UpdateClipsStats()
        {
            try
            {
                string rulesList = clips.Eval("(list-defrules)").ToString();

                int ruleCount = rulesList.Split(new[] { '\r', '\n' }, StringSplitOptions.RemoveEmptyEntries)
                                         .Count(line => line.TrimStart().StartsWith("defrule"));

                dataInfoLabel.Text = $"Кол-во загруженных правил: {int.Parse(clips.Eval("(length$ (get-defrule-list))").ToString()) - 2}" +
                                     "\n" +
                                     $"Кол-во известных фактов: {0}";
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
    }
}
