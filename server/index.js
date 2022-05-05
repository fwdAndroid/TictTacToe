//Importing 
// importing modules
const express = require("express");
const http = require("http");
const mongoose = require("mongoose");

const app = express();
const port = process.env.PORT || 3000;
var server = http.createServer(app);
const Room = require("./models/room");
var io = require("socket.io")(server);

// Middle Ware use to transfer data from client to server side
app.use(express.json());

//Establish Connection
const DB = "mongodb+srv://fwdkaleem:abc123456@cluster0.ejioi.mongodb.net/myFirstDatabase?retryWrites=true&w=majority";

//Socket Connection
io.on("connection", (socket) => {
    console.log("connected!");
    socket.on("createRoom", async ({ nickname }) => {
        console.log(nickname);
        try {
            // room is created
            let room = new Room();
            let player = {
                socketID: socket.id,
                nickname,
                playerType: "X",
            };
            room.players.push(player);
            room.turn = player;
            room = await room.save();
            console.log(room);
            const roomId = room._id.toString();

            socket.join(roomId);
            // io -> send data to everyone
            // socket -> sending data to yourself
            io.to(roomId).emit("createRoomSuccess", room);
        } catch (e) {
            console.log(e);
        }
    })


    mongoose
    .connect(DB)
    .then(() => {
      console.log("Connection successful!");
    })
    .catch((e) => {
      console.log(e);
    });
  
  server.listen(port, "0.0.0.0", () => {
    console.log(`Server started and running on port ${port}`);
  });
});
