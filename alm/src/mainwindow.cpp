#include "include/mainwindow.h"
#include "include/ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
}

MainWindow::~MainWindow()
{
    delete ui;
    ui->stackedWidget->setCurrentIndex(0);
}

void MainWindow::on_Setting_2_clicked()
{
    ui->stackedWidget->setCurrentIndex(1);
}

void MainWindow::on_Alarm_2_clicked()
{
    ui->stackedWidget->setCurrentIndex(2);
}

void MainWindow::on_WiFiPage_clicked()
{
    ui->stackedWidget->setCurrentIndex(6);
}

void MainWindow::on_AddPage_clicked()
{
    ui->stackedWidget->setCurrentIndex(3);
}

void MainWindow::on_EditPage_clicked()
{
    ui->stackedWidget->setCurrentIndex(4);
}

void MainWindow::on_DeletePage_clicked()
{
    ui->stackedWidget->setCurrentIndex(5);
}

void MainWindow::on_yes_clicked()
{
    ui->stackedWidget->setCurrentIndex(2);
}

void MainWindow::on_no_clicked()
{
    ui->stackedWidget->setCurrentIndex(2);
}

void MainWindow::on_yes_3_clicked()
{
    ui->stackedWidget->setCurrentIndex(2);
}

void MainWindow::on_no_3_clicked()
{
    ui->stackedWidget->setCurrentIndex(2);
}

void MainWindow::on_yes_2_clicked()
{
    ui->stackedWidget->setCurrentIndex(2);
}

void MainWindow::on_no_2_clicked()
{
    ui->stackedWidget->setCurrentIndex(2);
}

void MainWindow::on_Close_clicked()
{
    this->close();
}
