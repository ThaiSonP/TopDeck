import React, {Component} from 'react'
import {Link} from 'react-router-dom'
import axios from 'axios'
import index from '../../Images/ChampionIcons/index.js'
import Stats from './stats.js'


class SingleHero extends Component {
  constructor(props){
    super(props);
    this.state=({
      heroId: this.props.match.params.id
      // origin_id: null
    })
  }
  getData = async (id)=>{
    await axios.get(`/hero/${id}`).then(res=>{
      // console.log(res.data.heroes)
      this.setState({
        info:res.data.heroes,
        name:res.data.heroes[0].champion_name,
        className:res.data.heroes[0].class,
        class_id:res.data.heroes[0].class_id,
        class_id_2:res.data.heroes[0].class_id_2,
        originName:res.data.heroes[0].origin,
        origin_id:res.data.heroes[0].origin_id,
        origin_id_2:res.data.heroes[0].origin_id_2,
        stats:res.data.heroes
      })
    })
  }
  componentDidMount(){
    this.getData(this.state.heroId)
  }

  render(){
    const {name,class_id,className,origin_id,originName,stats}=this.state

    return(
      <div>
        <div>
          <img src= {index[name]} alt =''/>
        </div>
        <div>
          Champion: {name}
        </div>
        <div>
          Class 1:
            <Link to={`/class/${ class_id}` }>
              { className}
            </Link>
        </div>
        <div>
          Origin 1:
            <Link to={`/origins/${ origin_id}` }>
              { originName}
            </Link>
        </div>
        <Stats stats={stats}/>
      </div>
    )
  }
}

export default SingleHero
