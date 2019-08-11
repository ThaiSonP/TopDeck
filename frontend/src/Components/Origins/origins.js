import React, {Component} from 'react'
import {Link} from 'react-router-dom'
import axios from 'axios'

class Origins extends Component {
  constructor(){
    super()
    this.state={
      origins:null
    }
  }

  getInfo = ()=>{
    axios.get(`/origin`)
    .then(response=>{
      this.setState({
        origins:response.data.origin
      })
    })
  }

  makeOrigins=(origins)=>{
    if(origins){
      return(
        origins.map((el,i)=>{
        return(
          <div key={i} className ="origins">
            <Link to={`/origins/${el.id}` }>
              <p>
                {el.origin}:
              </p>
            </Link>
            <p>
              {el.blurb}
            </p>
          </div>
        )
      })
    )}
  }

  componentDidMount(){
    this.getInfo()
  }

  render(){
    const {origins}=this.state
    return(
      <div className = "origin">
        {this.makeOrigins(origins)}
      </div>
    )
  }

}
export default Origins
