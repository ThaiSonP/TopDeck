import React, { Component } from 'react';
import { Switch, Route } from 'react-router-dom';
import './App.css';
import NavBar from './Components/NavBar/navBar.js'

import Heros from './Components/Heros/heros.js'
import SingleHero from './Components/Heros/singleHero.js'
import Origins from './Components/Origins/origins.js'
import Classes from './Components/Classes/classes.js'
import SingleClass from './Components/Classes/singleClass.js'

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

          <Route exact path='/origin' component={Origins}/>
          <Route exact path='/class' component={Classes}/>
          <Route  path='/class/:id' component={SingleClass}/>
        </Switch>
      </div>
    )
  }
}

export default App;
