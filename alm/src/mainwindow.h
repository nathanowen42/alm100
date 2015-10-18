#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();

private slots:
    void on_Setting_2_clicked();

    void on_Alarm_2_clicked();

    void on_WiFiPage_clicked();

    void on_AddPage_clicked();

    void on_EditPage_clicked();

    void on_DeletePage_clicked();

    void on_yes_clicked();

    void on_no_clicked();

    void on_yes_3_clicked();

    void on_no_3_clicked();

    void on_yes_2_clicked();

    void on_no_2_clicked();

    void on_Close_clicked();

private:
    Ui::MainWindow *ui;
};

#endif // MAINWINDOW_H
