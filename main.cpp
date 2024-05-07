#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "mytimer.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    MyTimer* myTimer = new MyTimer(&app);
    qmlRegisterSingletonInstance("com.company.mytimer",1,0, "MyTimer", myTimer);
    const QUrl url(u"qrc:/TimerTest/Main.qml"_qs);
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
