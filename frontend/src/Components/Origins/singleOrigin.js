import React, {Component} from 'react'
import {Link} from 'react-router-dom'
import axios from 'axios'
import index from '../../Images/ChampionIcons/index.js'


class SingleOrigin extends Component {
  constructor(props){
    super(props);
    this.state=({
      heroId: this.props.match.params.id,
    })
  }
  getData = async (id)=>{
    await axios.get(`/origin/${id}`).then(res=>{
      // console.log(res.data.heroes)
      this.setState({
        heros: res.data.heroes,
        origin: res.data.origin
      })
    })
  }

  makeIcons =  (data)=>{
    if(data){
      return(
        data.map((el,i)=>{
        return(
          <div key={i} className ="Hero">
            <Link to={`/hero/${el.hero_id}` }>
              <img src= {index[el.champion_name]} alt =''/>
            </Link>
            <br/>
            <Link to={`/hero/${el.hero_id}` }>
              {el.champion_name}
            </Link>
          </div>
        )
      })
    )}
    }


  componentDidMount(){
    this.getData(this.state.heroId)
  }

  render(){
    const {heros,origin}=this.state

    return(
      <div>
        This is a list of all {origin}s
        {this.makeIcons(heros)}
      </div>
    )
  }
}

export default SingleOrigin
