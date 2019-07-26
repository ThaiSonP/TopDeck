import React, { Component } from 'react';
import { Switch, Route } from 'react-router-dom';
import './App.css';
import NavBar from './Components/NavBar/navBar.js'

import Heros from './Components/Heros/heros.js'
import SingleHero from './Components/Heros/singleHero.js'

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
          <Route exact path='/hero' component={Heros}/>
          <Route path = '/hero/:id' component={SingleHero}/>
        </Switch>
      </div>
    )
  }
}

export default App;
