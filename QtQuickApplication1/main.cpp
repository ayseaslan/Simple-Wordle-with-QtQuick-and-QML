
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "stringprocessor.h"

int main(int argc, char* argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    StringProcessor stringProcessor;

    engine.rootContext()->setContextProperty("stringProcessor", &stringProcessor);
    engine.load(QUrl(QStringLiteral("main.qml")));

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
