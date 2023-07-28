import axios from 'axios';

export default {

    getAnswersByQuestionId(questionId) {
        return axios.get('/answers/' + questionId);
    },

    getCorrectAnswer(questionId) {
        return axios.get('/answers/' + questionId);

    },

    async validateUserAnswer(questionId, userAnswer) {
        try {
            const response = await axios.get(`answers/${questionId}`);
            const answers = response.data;

            const selectedAnswer = answers.find(answer => answer.answerText === userAnswer);

            if (selectedAnswer && selectedAnswer.correct) {
                return true;
            } else {
                return false;
            }
        } catch (error) {
            console.error("Error fetching answers:", error);
            return false;
        }
    }

}


