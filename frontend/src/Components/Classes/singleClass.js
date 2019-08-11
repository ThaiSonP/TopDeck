import React, {Component} from 'react'
import {Link} from 'react-router-dom'
import axios from 'axios'
import index from '../../Images/Icons/index.js'


class SingleClass extends Component {
  constructor(props){
    super(props);
    this.state=({
      classId: this.props.match.params.id
    })
  }
  getData = async (id)=>{
    await axios.get(`/class/${id}`).then(res=>{
      console.log(res.data)
      this.setState({
        heroes:res.data.heroes,
        blurb:res.data.blurb
      })
    })
  }
  componentDidMount(){
    this.getData(this.state.classId)
  }

  displayData =  (heroes) =>{
    if(heroes){
      return(heroes.map((el,i)=>{
        return(
          <div key ={i} className = 'heroes'>
            <img src = {index[el.champion_name]} alt =''/>
              <p>
                <Link to={`/hero/${el.hero_id}`}>
                  {el.champion_name}
                </Link>
              </p>
          </div>
        )
      })
    )}
  }

  render(){
    const{blurb,heroes}=this.state
    return(
      <div>
        {blurb}
        {this.displayData(heroes)}
      </div>
    )
  }
}

export default SingleClass
