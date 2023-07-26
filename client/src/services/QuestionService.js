import axios from 'axios';

const BASE_URL = 'http://localhost:9000';

export default {
    async getRandomQuestion() {
        try {
            const response = await axios.get(`${BASE_URL}/questions/us-states`);
            return response.data;
        } catch (error) {
            console.error('Error fetching random question:', error);
            throw error;
        }
    },

    async getQuestionById(questionId) {
        try {
            const response = await axios.get(`${BASE_URL}/questions/${questionId}`);
            return response.data;
        } catch (error) {
            console.error('Error fetching question by ID:', error);
            throw error;
        }
    },

    async getQuestionsByTopicId(topicId) {
        try {
            const response = await axios.get(`${BASE_URL}/questions/topic/${topicId}`);
            return response.data;
        } catch (error) {
            console.error('Error fetching questions by topic ID:', error);
            throw error;
        }
    },
};