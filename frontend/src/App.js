import React, { Component } from 'react';
import './App.css';

class App extends Component {
  constructor(){
    super();
    this.state=({
      team: null
    })
  }
  render(){
    return(
      <div className="App">
        Welcome to topDeck
      </div>
    )
  }
}

export default App;
