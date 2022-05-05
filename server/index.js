//Importing 
const { Socket } = require("dgram");
const express = require("express");
const http = require("http");

const app = express();
const port = process.env.PORT || 3000;
var server = http.createServer(app);

var io = require("socket.io")(server);

const mongoose = require("mongoose");

// Middle Ware use to transfer data from client to server side
app.use(express.json());

//Establish Connection
const DB = "mongodb+srv://fwdkaleem:zeo123456@cluster0.ejioi.mongodb.net/myFirstDatabase?retryWrites=true&w=majority";
mongoose.connect(DB).then(() => {
    console.log("Connection Established");
}).catch((e) => {
    console.log(e);
});
//Socket Connection
io.on('connection',(socket) => {
    console.log("connect");
    socket.on("createRoom",({ nickname }) => {});
})

server.listen(port,'0.0.0.0',() => {
    console.log(`server started ${port}`)
});

