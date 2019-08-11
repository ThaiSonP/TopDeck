import React, {Component} from 'react'
import {Link} from 'react-router-dom'
import axios from 'axios'

class Classes extends Component {
  constructor(){
    super()
    this.state={
      classes:null
    }
  }

  getInfo = ()=>{
    axios.get(`/class`)
    .then(response=>{
      this.setState({
        classes:response.data.class
      })
    })
  }

  makeClasses=(classes)=>{
    if(classes){
      return(
        classes.map((el,i)=>{
        return(
          <div key={i} className ="classes">
            <Link to={`/class/${el.id}` }>
              <p>
                {el.class}:
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
    const {classes}=this.state
    return(
      <div className = "origin">
        {this.makeClasses(classes)}
      </div>
    )
  }

}
export default Classes
