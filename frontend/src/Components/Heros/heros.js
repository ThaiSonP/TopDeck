import React, {Component} from 'react'
import {Link} from 'react-router-dom'
import axios from 'axios'

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
      console.log(reponse.data.class)
      this.setState({
        heroes:reponse.data.class
      })
    })
  }

  makeIcons=()=>{
    const {heroes}=this.state
    if(heroes){
      heroes.map(el=>{
        return(
          <Link to={`/hero/${el.id}`}>
            {el.champion_name}
          </Link>
        )
      })
    }

  }

  componentDidMount(){
    this.getInfo()
  }

  render(){
    return(
      <div className="Heros">
        
        <makeIcons/>
      </div>
    )
  }
}

export default Heros;
