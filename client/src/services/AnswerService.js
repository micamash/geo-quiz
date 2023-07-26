import axios from '/node_modules/axios/dist/axios.min.js';

const BASE_URL = 'http://localhost:9000';

export default {
    async getAnswersByQuestionId(questionId) {
        try {
            const response = await axios.get(`${BASE_URL}/answers/${questionId}`);
            return response.data;
        } catch (error) {
            console.error('Error fetching answers by question ID:', error);
            throw error;
        }
    },

    async getCorrectAnswer(questionId) {
        try {
            const response = await axios.get(`${BASE_URL}/answers/correct/${questionId}`);
            return response.data;
        } catch (error) {
            console.error('Error fetching correct answer:', error);
            throw error;
        }
    },
    async validateUserAnswer(questionId, userAnswer) {
        try {
            const correctAnswer = await this.getCorrectAnswer(questionId);

            const isCorrect = userAnswer.trim().toLowerCase() === correctAnswer.answerText.trim().toLowerCase();

            return isCorrect;
        } catch (error) {
            console.error('Error validating user answer:', error);
            throw error;
        }
    },
};
