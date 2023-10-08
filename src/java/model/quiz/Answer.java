/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.quiz;

/**
 *
 * @author To Mamiarilaza
 */
public class Answer {
/// field
    int idAnswer;
    String answer;
    int value;
    
/// getter and setter

    public int getIdAnswer() {
        return idAnswer;
    }

    public void setIdAnswer(int idAnswer) {
        this.idAnswer = idAnswer;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }
    
/// constructor

    public Answer(int idAnswer, String answer, int value) {
        this.idAnswer = idAnswer;
        this.answer = answer;
        this.value = value;
    }
    
}
