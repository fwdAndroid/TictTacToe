const mongoose = require('mongoose');
const playerSchema = require('./players');

const roomSchema =  new mongoose.Schema({
    occupancy:{
        type : Number,
        default:2
    },
    maxRounds:{
        type: Number,
        default: 6,
    },
    currentRound: {
        required: true,
        type: Number,
        default : 1
    },
    players: [playerSchema],
    isJoin:{
        type: Boolean,
        default: true
    },
    turn: playerSchema,
    turnIndex: {
        type: Number,
        default: 0
    }
});

//Converting Skelton Data into Modal

const roomModel = mongoose.model('Room',roomSchema);
module.exports = roomModel;
