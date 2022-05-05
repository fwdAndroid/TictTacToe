const express  = require('express');
const http = require('http');


const app = express();
const port = process.env.PORT || 3000;
const mongoose = require("mongoose");

var server = http.createServer(app);
const Room = require('./models/room');
var io = require('socket.io')(server);

//middle ware
app.use(express.json());

const DB = "mongodb+srv://fwdkaleem:abc123456@cluster0.ejioi.mongodb.net/myFirstDatabase?retryWrites=true&w=majority";

io.on("connection",(socket) => {
    console.log("connected");
    socket.on("createRoom", async ({nickname}) => { 
        console.log(nickname);

        try{
            //Create Room
        let room = Room();
        let player = {
            socketID: socket.id,
            nickname,
            playerType: 'X'

        };
        room.players.push(player);
        room.turn = player;
       room = await room.save();
       const roomId = room._id;

       socket.join(roomId);
        // io -> send data to everyone
      // socket -> sending data to yourself
      io.to(roomId).emit("createRoomSuccess", room);
        }catch(e){};
        
    
    });
})

mongoose.connect(DB).then(() => {
    console.log("Connection Successfull")
}).catch((e) => {
    console.log(e);
});

server.listen(port,'0.0.0.0', () => {
 console.log(`Server is started ${port}`)
});
