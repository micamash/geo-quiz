import axios from 'axios';

export default {

    getRandomQuestion(topicId) {
        return axios.get('/topics/' + topicId);

    },

    getQuestionById(questionId) {
        return axios.get('/questions/' + questionId);
    },

    getQuestionsByTopicId(topicId) {
        return axios.get('/topic/' + topicId);
    },

}
