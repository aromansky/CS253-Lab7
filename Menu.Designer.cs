namespace CS253_Lab7
{
    partial class Menu
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.outputBox = new System.Windows.Forms.TextBox();
            this.startButton = new System.Windows.Forms.Button();
            this.resetButton = new System.Windows.Forms.Button();
            this.changeTargetButton = new System.Windows.Forms.Button();
            this.sendButton = new System.Windows.Forms.Button();
            this.inputBox = new System.Windows.Forms.TextBox();
            this.targetInfoLabel = new System.Windows.Forms.Label();
            this.dataInfoLabel = new System.Windows.Forms.Label();
            this.downloadButton = new System.Windows.Forms.Button();
            this.openFileDialog = new System.Windows.Forms.OpenFileDialog();
            this.SuspendLayout();
            // 
            // outputBox
            // 
            this.outputBox.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.outputBox.Location = new System.Drawing.Point(16, 15);
            this.outputBox.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.outputBox.Multiline = true;
            this.outputBox.Name = "outputBox";
            this.outputBox.ReadOnly = true;
            this.outputBox.Size = new System.Drawing.Size(1033, 388);
            this.outputBox.TabIndex = 0;
            // 
            // startButton
            // 
            this.startButton.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.startButton.Location = new System.Drawing.Point(16, 443);
            this.startButton.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.startButton.Name = "startButton";
            this.startButton.Size = new System.Drawing.Size(100, 28);
            this.startButton.TabIndex = 1;
            this.startButton.Text = "Старт";
            this.startButton.UseVisualStyleBackColor = true;
            this.startButton.Click += new System.EventHandler(this.startButton_Click);
            // 
            // resetButton
            // 
            this.resetButton.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.resetButton.Location = new System.Drawing.Point(124, 443);
            this.resetButton.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.resetButton.Name = "resetButton";
            this.resetButton.Size = new System.Drawing.Size(100, 28);
            this.resetButton.TabIndex = 2;
            this.resetButton.Text = "Сброс";
            this.resetButton.UseVisualStyleBackColor = true;
            this.resetButton.Click += new System.EventHandler(this.resetButton_Click);
            // 
            // changeTargetButton
            // 
            this.changeTargetButton.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.changeTargetButton.Location = new System.Drawing.Point(232, 443);
            this.changeTargetButton.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.changeTargetButton.Name = "changeTargetButton";
            this.changeTargetButton.Size = new System.Drawing.Size(132, 28);
            this.changeTargetButton.TabIndex = 3;
            this.changeTargetButton.Text = "Изменить цель";
            this.changeTargetButton.UseVisualStyleBackColor = true;
            this.changeTargetButton.Click += new System.EventHandler(this.changeTargetButton_Click);
            // 
            // sendButton
            // 
            this.sendButton.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.sendButton.Location = new System.Drawing.Point(951, 411);
            this.sendButton.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.sendButton.Name = "sendButton";
            this.sendButton.Size = new System.Drawing.Size(100, 25);
            this.sendButton.TabIndex = 4;
            this.sendButton.Text = "Отправить";
            this.sendButton.UseVisualStyleBackColor = true;
            this.sendButton.Click += new System.EventHandler(this.sendButton_Click);
            // 
            // inputBox
            // 
            this.inputBox.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.inputBox.Location = new System.Drawing.Point(16, 411);
            this.inputBox.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.inputBox.Name = "inputBox";
            this.inputBox.Size = new System.Drawing.Size(925, 22);
            this.inputBox.TabIndex = 5;
            // 
            // targetInfoLabel
            // 
            this.targetInfoLabel.AutoSize = true;
            this.targetInfoLabel.Location = new System.Drawing.Point(372, 449);
            this.targetInfoLabel.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.targetInfoLabel.Name = "targetInfoLabel";
            this.targetInfoLabel.Size = new System.Drawing.Size(101, 16);
            this.targetInfoLabel.TabIndex = 6;
            this.targetInfoLabel.Text = "TARGET_INFO";
            // 
            // dataInfoLabel
            // 
            this.dataInfoLabel.AutoSize = true;
            this.dataInfoLabel.Location = new System.Drawing.Point(16, 511);
            this.dataInfoLabel.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.dataInfoLabel.Name = "dataInfoLabel";
            this.dataInfoLabel.Size = new System.Drawing.Size(78, 16);
            this.dataInfoLabel.TabIndex = 7;
            this.dataInfoLabel.Text = "DATA INFO";
            // 
            // downloadButton
            // 
            this.downloadButton.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.downloadButton.Location = new System.Drawing.Point(16, 479);
            this.downloadButton.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.downloadButton.Name = "downloadButton";
            this.downloadButton.Size = new System.Drawing.Size(208, 28);
            this.downloadButton.TabIndex = 8;
            this.downloadButton.Text = "Загрузить данные";
            this.downloadButton.UseVisualStyleBackColor = true;
            this.downloadButton.Click += new System.EventHandler(this.downloadButton_Click);
            // 
            // openFileDialog
            // 
            this.openFileDialog.FileName = "openFileDialog";
            // 
            // Menu
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1067, 554);
            this.Controls.Add(this.downloadButton);
            this.Controls.Add(this.dataInfoLabel);
            this.Controls.Add(this.targetInfoLabel);
            this.Controls.Add(this.inputBox);
            this.Controls.Add(this.sendButton);
            this.Controls.Add(this.changeTargetButton);
            this.Controls.Add(this.resetButton);
            this.Controls.Add(this.startButton);
            this.Controls.Add(this.outputBox);
            this.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.Name = "Menu";
            this.Text = "Диагностика автомобиля";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox outputBox;
        private System.Windows.Forms.Button startButton;
        private System.Windows.Forms.Button resetButton;
        private System.Windows.Forms.Button changeTargetButton;
        private System.Windows.Forms.Button sendButton;
        private System.Windows.Forms.TextBox inputBox;
        private System.Windows.Forms.Label targetInfoLabel;
        private System.Windows.Forms.Label dataInfoLabel;
        private System.Windows.Forms.Button downloadButton;
        private System.Windows.Forms.OpenFileDialog openFileDialog;
    }
}