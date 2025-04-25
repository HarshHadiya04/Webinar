const mongoose = require('mongoose');

const webinarSchema = new mongoose.Schema({
    title: {
        type: String,
        required: true,
    },
    description: {
        type: String,
        required: true,
    },
    date: {
        type: Date,
        required: true,
    },
    time: {
        type: String,
        required: true,
    },
    speaker: {
        name: String,
        bio: String,
        image: String,
    },
    duration: {
        type: Number,  // in minutes
        required: true,
    },
    registrationLink: {
        type: String,
        required: true,
    },
    maxParticipants: {
        type: Number,
        default: 100,
    },
    isActive: {
        type: Boolean,
        default: true,
    }
}, {
    timestamps: true
});

module.exports = mongoose.model('Webinar', webinarSchema);
