

#ifndef STRINGPROCESSOR_H
#define STRINGPROCESSOR_H

#include <QObject>
#include <QChar>
#include <QString>
#include <fstream>
#include <sstream>
#include <string>
#include <iostream>
#include <random>




class StringProcessor : public QObject
{
    Q_OBJECT

public:
    explicit StringProcessor(QObject* parent = nullptr);
   
    char letters_actual[5] = { 'b','r', 'e', 'a', 'd' };
   
   
    Q_INVOKABLE QString getCharArrayContents() const;
    

public slots:
    QString processString(const QString& input);
    bool validInput(const QString& input);
    void assignWord(const QString& input) {

        int n = 1; // initialize to 1
        int seed = input.toInt();
        std::uniform_int_distribution<int> distribution(1, 14855); // the number of words 
        std::mt19937 gen(seed);
        n = distribution(gen);

        int row = 1;
        std::string selection;
        std::ifstream infile("words.txt");
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


                if (row == n) {
                    selection = s.c_str();

                }

            }
            row++;
          
            if (row == n + 1) {
                break;
            }

        }
      
        
       
        for (int i = 0; i < 5; i++) {
            letters_actual[i] = selection[i];
        }

    }
};

#endif // STRINGPROCESSOR_H


