/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.quiz;

import java.util.List;

/**
 *
 * @author To Mamiarilaza
 */
public class Question {
/// field
    int idQuestion;
    String question;
    List<Answer> answers;
    
/// getter and setter

    public int getIdQuestion() {
        return idQuestion;
    }

    public void setIdQuestion(int idQuestion) {
        this.idQuestion = idQuestion;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public List<Answer> getAnswers() {
        return answers;
    }

    public void setAnswers(List<Answer> answers) {
        this.answers = answers;
    }
    
/// constructor

    public Question(int idQuestion, String question, List<Answer> answers) {
        this.idQuestion = idQuestion;
        this.question = question;
        this.answers = answers;
    }
    
}
