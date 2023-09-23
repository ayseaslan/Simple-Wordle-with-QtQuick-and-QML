
#ifndef GUESSWORD_H
#define GUESSWORD_H

#include <string>
#include <QChar>

class guessWord
{
public:

    char letters[5] = { 'b','r', 'e', 'a', 'd' };

    int matches[5] = { 0,0,0,0,0 };

    guessWord(std::string s)
    {

        for (int i = 0; i < s.length(); i++) {
            letters[i] = s[i];
        }


    }
    void find_matches(char letters_actual[5]) {
        for (int i = 0; i < 5; i++) {
            if (letters[i] == letters_actual[i]) {
                matches[i] = 1; // green match, exact
            }
            else {
                for (int j = 0; j < 5; j++) {
                    if (letters[i] == letters_actual[j]) {
                        matches[i] = 2; // yellow match
                    }
                }
            }
        }
    }

};

#endif // GUESSWORD_H


