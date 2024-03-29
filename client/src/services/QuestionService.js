import axios from 'axios';

export default {

    getRandomQuestion(topicId) {
        return axios.get(`/questions/random/${topicId}`);

    },

    getQuestionById(questionId) {
        return axios.get('/questions/' + questionId);
    },

    getQuestionsByTopicId(topicId) {
        return axios.get(`/questions/topics/${topicId}`);
    },

}
