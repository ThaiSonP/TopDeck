import React, {Component} from 'react'
import {Link} from 'react-router-dom'
import axios from 'axios'
import index from '../../Images/ChampionIcons/index.js'
// import Stats from './stats.js'


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
  renderTable =()=>{
    if(this.state.stats){
      return this.state.stats.map((stats,i)=>{
        const{armor,attack_speed,critical_chance,dps,health,level,magic_resistance,mana,physical_damage,special,special_damage,special_health}=stats
        return(
          <tr key={i}>
            <td>{level}</td>
            <td>{health}</td>
            <td>{mana}</td>
            <td>{physical_damage} </td>
            <td>{attack_speed}</td>
            <td>{dps}</td>
            <td>{critical_chance}%</td>
            <td>{special}</td>
            <td>{special_damage}</td>
            <td>{special_health}</td>
            <td>{armor}</td>
            <td>{magic_resistance}</td>
          </tr>
        )
      })}
 }

  componentDidMount(){
    this.getData(this.state.heroId)
  }

  render(){
    const {name,class_id,className,origin_id,originName}=this.state
    return(
      <div>
        <div>
          <img src= {index[name]} alt =''/>
        </div>
        <div>
          Champion : {name}
        </div>
        <div>
          Class :
            <Link to={`/class/${ class_id}` }>
              { className}
            </Link>
        </div>
        <div>
          Origin :
            <Link to={`/origins/${ origin_id}` }>
              { originName}
            </Link>
        </div>
        <table>
          <tbody>
            <tr>
              <th>Level</th>
              <th>Max Health</th>
              <th>Max Mana</th>
              <th>Physical Damage </th>
              <th>Attack Speed</th>
              <th>Damage Per Second</th>
              <th>Critical Chance</th>
              <th>Special</th>
              <th>Special Damage</th>
              <th>Special Health</th>
              <th>Armor</th>
              <th>Magic Resistance</th>
            </tr>
            {this.renderTable()}
          </tbody>

        </table>


      </div>
    )
  }
}

export default SingleHero
