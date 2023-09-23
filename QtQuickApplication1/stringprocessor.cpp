#include "StringProcessor.h"
#include <QString>
#include <QTextStream>
#include "guessword.h"

StringProcessor::StringProcessor(QObject* parent) : QObject(parent) {}

QString StringProcessor::processString(const QString& input)
{
    std::string s_input = input.toStdString();

    bool validity = validInput(input);

    QString new_s;

    if (validity == true) {
        guessWord guess(s_input);

        guess.find_matches(letters_actual);

        int n_match = 0;
        for (int i = 0; i < 5; i++) {
            if (guess.matches[i] == 1) {
                n_match++;
            }
        }
        if (n_match == 5) {
            new_s = "WELL DONE YOU FOUND IT!";
        }
        else {
            for (int i = 0; i < 5; i++)
                QTextStream(&new_s) << guess.matches[i];
        }
    }
    else {
        new_s = "XXXXX";
    }

    return new_s.toUpper(); // You can replace this with your desired string operation
}

bool StringProcessor::validInput(const QString& input) {

    std::string s_input = input.toStdString();
    int row = 1;
    bool found = false;
    std::ifstream infile("words5757.txt");
    while (infile)
    {
        std::string s;

        if (!std::getline(infile, s))
            break;

        std::istringstream ss(s);
        while (ss)
        {
            std::string s;
            if (!std::getline(ss, s, ',')) break;

            if (s_input == s.c_str()) found = true;

        }

        if (found == true) {
            break;
        }

    }
    return found;
}

QString StringProcessor::getCharArrayContents() const {
    // Convert the char array to QString
    return QString(letters_actual).toUpper();
}
