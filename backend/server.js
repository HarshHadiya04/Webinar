const express = require('express');
const dotenv = require('dotenv');
const cors = require('cors');
const connectDB = require('./config/db');
const Webinar = require('./models/Webinar');
const Event = require('./models/event'); // Update to lowercase 'event'

// Load env vars
dotenv.config();

// Connect to database
connectDB();

const app = express();

// Middleware
app.use(cors());
app.use(express.json());

// Basic route
app.get('/', (req, res) => {
    res.send('API is running');
});

// Webinar routes
app.get('/api/webinars', async (req, res) => {
    try {
        const webinars = await Webinar.find({});
        res.json(webinars);
    } catch (error) {
        res.status(500).json({ message: 'Error fetching webinars', error: error.message });
    }
});

// Add POST route for creating webinars
app.post('/api/webinars', async (req, res) => {
    try {
        const { 
            title, 
            description, 
            date, 
            time, 
            duration, 
            maxParticipants, 
            registrationLink 
        } = req.body;

        // Create new webinar
        const webinar = new Webinar({
            title,
            description,
            date,
            time,
            duration,
            maxParticipants,
            registrationLink,
            isActive: true
        });

        // Save to database
        const savedWebinar = await webinar.save();
        res.status(201).json(savedWebinar);
    } catch (error) {
        res.status(400).json({ 
            message: 'Error creating webinar', 
            error: error.message 
        });
    }
});

// Event routes
app.get('/api/events', async (req, res) => {
    try {
        const events = await Event.find({});
        console.log('Found events:', events); // Add logging
        res.json(events);
    } catch (error) {
        console.error('Error fetching events:', error);
        res.status(500).json({ message: 'Error fetching events', error: error.message });
    }
});

app.post('/api/events', async (req, res) => {
    try {
        const { 
            title, 
            description, 
            venue, 
            date, 
            time, 
            category,
            organizer,
            ticketPrice,
            capacity,
            isActive,
            image
        } = req.body;

        // Create new event
        const event = new Event({
            title,
            description,
            venue,
            date,
            time,
            category,
            organizer: {
                name: organizer.name || organizer,  // Handle both object and string
                contact: organizer.contact || '',
                email: organizer.email || ''
            },
            ticketPrice: ticketPrice || 0,
            capacity,
            isActive: isActive !== undefined ? isActive : true,
            image: image || ''
        });

        // Save to database
        const savedEvent = await event.save();
        res.status(201).json(savedEvent);
    } catch (error) {
        console.error('Event creation error:', error);
        res.status(400).json({ 
            message: 'Error creating event', 
            error: error.message 
        });
    }
});

const PORT = process.env.PORT || 5000;

app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
