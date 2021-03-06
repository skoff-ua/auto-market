"use strict";

var Dispatcher = require('../dispatcher/appDispatcher');
var AutoApi = require('../api/autoApi');
var ActionTypes = require('../constants/actionTypes');

var AutoActions = {
    saveMaker: function(maker) {
        AutoApi.saveMaker(maker).then(function(data){
            Dispatcher.dispatch({
                actionType: ActionTypes.SAVE_MAKER,
                maker: data
            });
        });
    },
    removeMaker: function (maker) {
        AutoApi.removeMaker(maker).then(function(data){
            Dispatcher.dispatch({
                actionType: ActionTypes.REMOVE_MAKER,
                maker: data
            });
        });
    }
};

module.exports = AutoActions;