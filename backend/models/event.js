const mongoose = require('mongoose');

const eventSchema = new mongoose.Schema({
    title: {
        type: String,
        required: true,
    },
    description: {
        type: String,
        required: true,
    },
    venue: {
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
    category: {
        type: String,
        required: true,
        enum: ['workshop', 'conference', 'seminar', 'other']
    },
    organizer: {
        name: String,
        contact: String,
        email: String
    },
    ticketPrice: {
        type: Number,
        default: 0
    },
    capacity: {
        type: Number,
        required: true
    },
    isActive: {
        type: Boolean,
        default: true
    },
    image: {
        type: String
    }
}, {
    timestamps: true
});

module.exports = mongoose.model('Event', eventSchema);
