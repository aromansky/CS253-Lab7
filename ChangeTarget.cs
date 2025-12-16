using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CS253_Lab7
{
    public partial class ChangeTarget : Form
    {
        private KnowledgeBase kb;
        public ChangeTarget(KnowledgeBase kb)
        {
            InitializeComponent();
            this.kb = kb;
            InitFactsList();
        }

        private void InitFactsList()
        {
            foreach (Fact fact in kb.Facts)
                listBox.Items.Add(fact);
        }

        private void okButton_Click(object sender, EventArgs e)
        {
            if (listBox.SelectedIndex == -1)
            {
                if (MessageBox.Show("Оставить текущий факт?", "Не выбран факт", MessageBoxButtons.YesNo) == DialogResult.Yes)
                    this.Close();
            }
            else
            {
                kb.TargetFact = (Fact)listBox.Items[listBox.SelectedIndex];
                this.DialogResult = DialogResult.OK;
                this.Close();
            }
        }

        private void exitButton_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
