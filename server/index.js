//Importing 
const express = require("express");
const http = require("http");

const app = express();
const port = process.env.PORT || 3000;
var server = http.createServer(app);

var io = require("socket.io")(server);

const mongoose = require("mongoose");
const Room = require("./models/room");

// Middle Ware use to transfer data from client to server side
app.use(express.json());

//Establish Connection
const DB = "mongodb+srv://fwdkaleem:abc123456@cluster0.ejioi.mongodb.net/myFirstDatabase?retryWrites=true&w=majority";
mongoose.connect(DB).then(() => {
    console.log("Connection Established");
}).catch((e) => {
    console.log(e);
});
//Socket Connection
io.on("connection",(socket) => {
    console.log("connect");
    socket.on("createRoom",async ({nickname}) => {
        console.log(nickname);
        //Creating Room
        try{
            let room = new Room();
        let player = {
             socketID: socket.id,
             nickname,
             playerType:'X'
        };
        room.players.push(player);
        room.turn = player;
       room = await room.save();
       
       console.log(room);
       //Save Room ID
       const roomId = room._id.toString();
       socket.join(roomId);
       //Tell The Client room is created and goto next page
       io.to(roomId).emit("createRoomSuccess", room);
        }catch(e){
            console.log(e);
        }

    });
})

server.listen(port,'0.0.0.0',() => {
    console.log(`s started ${port}`)
});

