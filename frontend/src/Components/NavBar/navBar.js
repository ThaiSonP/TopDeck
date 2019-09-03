import React, {Component} from 'react'
import {NavLink} from 'react-router-dom'
import './navBar.css'

class NavBar extends Component{

  render(){
    return(

    <div className = 'nav'>
      <NavLink className = 'nav' to ='/'>Home</NavLink>
      <NavLink className = 'nav' to ='/hero'>Hero</NavLink>
      <NavLink className = 'nav' to ='/origins'>Origin</NavLink>
      <NavLink className = 'nav' to ='/class'>Class</NavLink>
      <NavLink className = 'nav' to ='/item'>Item</NavLink>
      <NavLink className = 'nav' to ='/demo'>Demo</NavLink>
    </div>

    )
  }
}

export default NavBar
