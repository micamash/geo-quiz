import axios from 'axios';

export default {

    getAnswersByQuestionId(questionId) {
        return axios.get('/answers/' + questionId);
    },

    getCorrectAnswer(questionId) {
        return axios.get('/answers/' + questionId);

    },

    validateUserAnswer(questionId, userAnswer) {
        const correctAnswer = this.getCorrectAnswer(questionId);
        const isCorrect = userAnswer.trim().toLowerCase() === correctAnswer.answerText.trim().toLowerCase();

        return isCorrect;
    }
}


