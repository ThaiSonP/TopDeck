import React, {Component} from 'react'

class Stats extends Component {
  constructor(props){
    super(props)
    this.state = ({
      stats:this.props.stats
    })
  }
  render(){
    // console.log(this.props)
    console.log(this.state)
    return(
      <div>

      this is stats
      </div>
    )
  }
}
export default Stats
