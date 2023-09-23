
import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.VirtualKeyboard
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    visible: true 
    width: 700
    height: 800
    title: "Wordle Game App: 5-letter Word Guessing"

    Rectangle {
        color: "lightgray"
        anchors.fill: parent

            Column{
                spacing: 30
                anchors.centerIn: parent

                Rectangle {
                    color: "pink"
                   // anchors.fill: parent
                    height:200
                    width:400

                    Text{
                        anchors.centerIn: parent // Center the text within the rectangle
                                    text: "Select a seed to sample a 5-letter word.
Enter 6 guesses and obtain match results.
'1' means exact match.
'2' means the letter is present in the word but not in the right place.
'3' means the letter is not present in the word.
If you enter an invalid word (not a 5-letter english word)
the match result gives no information denoted with 'XXXXX'."
                                    font.pixelSize: 13 // Font size (optional)
                                    color: "black" // Text color (optional)


                    }

                }

                TextField {
                    id: input_seed
                    placeholderText: "Enter a seed (number)"
                    width: 200
                    enabled:true
                   
                }

                Button {
                    text: "Submit Seed"
                    onClicked: {
                        var seed = input_seed.text;
                        stringProcessor.assignWord(seed);
                        input_seed.enabled=false;

                    }
                }

           Row{
                spacing: 30

            TextField {
                id: inputField
                placeholderText: "Enter word 1"
                maximumLength :5
                
            }

            Button {
                text: "Process"
                onClicked: {
                    var inputText = inputField.text;
                    var result = stringProcessor.processString(inputText);

                   
                    inputField.enabled=false;
                  
                     outputText.text = "Match Result: " + result;

                     
                    
                }
            }

            Label {
                id: outputText
            }
           }
           Row{
                spacing: 30

            TextField {
                id: inputField_2
                placeholderText: "Enter word 2"
                maximumLength :5


            }

            Button {
                text: "Process"
                onClicked: {
                    var inputText = inputField_2.text;
                    var result = stringProcessor.processString(inputText);
                    outputText_2.text = "Match Result: " + result;
                    inputField_2.enabled=false;
                }
            }

            Label {
                id: outputText_2
            }
           }

           Row{
                spacing: 30

            TextField {
                id: inputField_3
                placeholderText: "Enter word 3"
                maximumLength :5
            }

            Button {
                text: "Process"
                onClicked: {
                    var inputText = inputField_3.text;
                    var result = stringProcessor.processString(inputText);
                    outputText_3.text = "Match Result: " + result;
                    inputField_3.enabled=false;
                }
            }

            Label {
                id: outputText_3
            }
           }

           Row{
                spacing: 30

            TextField {
                id: inputField_4
                placeholderText: "Enter word 4"
                maximumLength :5
            }

            Button {
                text: "Process"
                onClicked: {
                    var inputText = inputField_4.text;
                    var result = stringProcessor.processString(inputText);
                    outputText_4.text = "Match Result: " + result;
                    inputField_4.enabled=false;
                }
            }

            Label {
                id: outputText_4
            }
           }

           Row{
                spacing: 30

            TextField {
                id: inputField_5
                placeholderText: "Enter word 5"
                maximumLength :5
            }

            Button {
                text: "Process"
                onClicked: {
                    var inputText = inputField_5.text;

                    var result = stringProcessor.processString(inputText);
                   
                    outputText_5.text = "Match Result: " + result;

                    inputField_5.enabled=false;
                }
            }

            Label {
                id: outputText_5
            }
           }


    

       Row{
                spacing: 30

            TextField {
                id: inputField_6
                placeholderText: "Enter word 6"
                maximumLength :5
            }

            Button {
                text: "Process"
                onClicked: {
                    var inputText = inputField_6.text;

                    var result = stringProcessor.processString(inputText);
                   
                  var act=stringProcessor.getCharArrayContents();

                    if(inputText==act){
                     outputText_6.text = "Congragulations! You found the word "+act;
                       
                        }
                    else{
                    outputText_6.text= "You lost the game. The word was " + act;
                    }

                    inputField_6.enabled=false;
                }
            }

            Label {
                id: outputText_6
            }
           }

}
    
}
}

/*
//window containing the application
ApplicationWindow {
    id:root
    visible: true

    //title of the application
    title: qsTr("WORDLE - 5 GUESSES FOR A 5-LETTER WORD")
    width: 640
    height: 480



    //menu containing two menu items
    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            MenuItem {
                text: qsTr("&Open")
                onTriggered: console.log("Open action triggered");
            }
            MenuItem {
                text: qsTr("Exit")
                onTriggered: Qt.quit();
            }
        }
    }



    ColumnLayout {
        anchors.fill: parent

               Rectangle {
                   color: "lightpink"
                   Layout.fillWidth: true
                   Layout.fillHeight: true
                   RowLayout{
                       anchors.fill: parent
                       spacing: 20
                       TextInput{
                            id:i_w1
                            color:"white"
                            text: qlinks_i.w1
                            //onTextChanged: qlinks_i.w1 = i_w1.text
                            Binding {
                                    target: qlinks_i
                                    property: "text"
                                    value: qlinks_i.w1
                                }

                       }

                       Label{
                            color:"white"
                            text:"outcome"
                            id:o_w1
                       }

                   Button {
                       text: qsTr("Word 1")
                       //anchors.horizontalCenter: parent.horizontalCenter
                       //anchors.verticalCenter: parent.verticalCenter
                       id:b_w1
                       onClicked: o_w1.text=qlinks_i.w1_new


                   }




               }
        }
               Rectangle {
                   color: "slategray"
                   Layout.fillWidth: true
                   Layout.fillHeight: true
                   Button {
                       text: qsTr("Word 2")


                   }
               }
               Rectangle {
                   color: "lightskyblue"
                   Layout.fillWidth: true
                   Layout.fillHeight: true
                   Button {
                       text: qsTr("Word 3")

                   }
               }
               Rectangle {
                   color: "yellow"
                   Layout.fillWidth: true
                   Layout.fillHeight: true
                   Button {
                       text: qsTr("Word 4")

                   }
               }
               Rectangle {
                   color: "green"
                   Layout.fillWidth: true
                   Layout.fillHeight: true
                   Button {
                       text: qsTr("Word 5")

                   }
               }
           }




    }

*/


