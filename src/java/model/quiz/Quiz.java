/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.quiz;

import java.util.List;
import model.requis.Service;

/**
 *
 * @author To Mamiarilaza
 */
public class Quiz {
/// field
    int idQuiz;
    Service service;
    String quizName;
    QuizType type;
    List<Question> questions;
    
/// getter and setter

    public int getIdQuiz() {
        return idQuiz;
    }

    public void setIdQuiz(int idQuiz) {
        this.idQuiz = idQuiz;
    }

    public Service getService() {
        return service;
    }

    public void setService(Service service) {
        this.service = service;
    }

    public String getQuizName() {
        return quizName;
    }

    public void setQuizName(String quizName) {
        this.quizName = quizName;
    }

    public QuizType getType() {
        return type;
    }

    public void setType(QuizType type) {
        this.type = type;
    }

    public List<Question> getQuestions() {
        return questions;
    }

    public void setQuestions(List<Question> questions) {
        this.questions = questions;
    }
    
/// constructor

    public Quiz(int idQuiz, Service service, String quizName, QuizType type, List<Question> questions) {
        this.idQuiz = idQuiz;
        this.service = service;
        this.quizName = quizName;
        this.type = type;
        this.questions = questions;
    }
    
}
