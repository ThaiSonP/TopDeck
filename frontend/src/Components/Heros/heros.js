import React, {Component} from 'react'
import {Link} from 'react-router-dom'
import axios from 'axios'
import banner from "../../Images/banner.jpg";
import index from '../../Images/Icons/index.js'

class Heros extends Component {
  constructor(){
    super();
    this.state=({
      heroes: null
    })
  }

  getInfo = ()=>{
    axios.get('/hero')
    .then(reponse=>{
      this.setState({
        heroes:reponse.data.class
      })
    })
  }

  makeIcons=(heroes)=>{
    if(heroes){
      return(
        heroes.map((el,i)=>{
          // {console.log(el.champion_name)}
        return(

          <div key={i} className ="hero">
            <Link to={`/hero/${el.id}` }>
              <img src= {index[el.champion_name]} alt =''/>
            </Link>
            <br/>
            <Link to={`/hero/${el.id}` }>
              {el.champion_name}
            </Link>
          </div>
        )
      })
    )}
  }

  componentDidMount(){
    this.getInfo()
  }

  render(){

    const {heroes}= this.state
    return(
      <div className="Heros">
        {this.makeIcons(heroes)}

      </div>
    )
  }
}

export default Heros;