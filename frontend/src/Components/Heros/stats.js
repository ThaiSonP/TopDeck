import React, {Component} from 'react'

const Stats = props =>{
   const renderTable =()=>{
    return props.stats((stat,i)=>{
      const{armor,attack_speed,critical_chance,dps,health,level,magic_resistance,mana,physical_damage,special,special_damage,special_health}=props.stats
      return(
        <tr key={i}>
          <td>{level}</td>
          <td>{health}</td>
          <td>{mana}</td>
          <td>{physical_damage} </td>
          <td>{attack_speed}</td>
          <td>{dps}</td>
          <td>{critical_chance}</td>
          <td>{special}</td>
          <td>{special_damage}</td>
          <td>{special_health}</td>
          <td>{armor}</td>
          <td>{magic_resistance}</td>
        </tr>
      )
    })
  }

  if(!props){
    return (
      <div>
        Loading!
      </div>
    )
  }else{
    // console.log(props.stats)
    return(
      <div>
        // {this.renderTable()}
        this is stats
      </div>
    )
  }
}
export default Stats
