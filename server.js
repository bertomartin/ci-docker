//our app, can be a big and complex as you'd like

var express = require("express");

express()
  .get("*", function (req, res) {
    res.send("Hello world");
  })
  .listen(3000, function(err){
    if(err){
      console.error(err);
      return;
    }

    console.log("Express running on port 3000")
  })