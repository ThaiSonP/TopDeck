import React, { Component } from 'react';
import { Switch, Route } from 'react-router-dom';
import './App.css';
import NavBar from './Components/NavBar/navBar.js'

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
        <NavBar/>
        <Switch>

        </Switch>
      </div>
    )
  }
}

export default App;
