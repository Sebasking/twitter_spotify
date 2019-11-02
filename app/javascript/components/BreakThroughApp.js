import React from "react"
import TracksTable from './TracksTable'


class BreakThroughApp extends React.Component {
  render () {
    console.log(this.props)
    return (
      <React.Fragment>
        Hi, this is where all of my app should render, this is the top level component
        <img src={window.flatiron_logo} />
        <img src={window.we_of_color_logo} />
        <img src={window.break_through_logo} />
        <TracksTable tracks={this.props.tracks}/>
      </React.Fragment>
    );
  }
}

export default BreakThroughApp
