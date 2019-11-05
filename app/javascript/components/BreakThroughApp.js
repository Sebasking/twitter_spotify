import React from "react"
import TracksTable from './TracksTable'
import Instructions from './Instructions'
import { TwitterTimelineEmbed } from 'react-twitter-embed'


class BreakThroughApp extends React.Component {
  state = {tracks: []}
  handleIncomingTrack = response => {
    console.log(response)
  }

  componentDidMount() {
    fetch('http://localhost:3000/api/v1/get_tracks').then((req) => {
      return req.json()
    })
    .then((data) => {
      const { tracks } = data
      this.setState({ tracks })
    })
  }

  render () {
    const { tracks } = this.state
    if (tracks.length <= 0) {
      return <div>{tracks.length <= 0}</div>
    } else {
      return (
        <div>
          <div style={{display: 'flex', justifyContent: 'space-around'}}>
            <img src={window.flatiron_logo} style={{height: '25px', paddingTop: '5px'}}/>
            <img src={window.we_of_color_logo} style={{height: '50px'}}/>
          </div>
          <div style={{display: 'flex', flexDirection: 'column', alignItems: 'center'}}>
            <img src={window.break_through_logo} style={{height: '120px', width: '380px'}}/>
            <Instructions />
          </div>

          <div style={{display: 'flex', justifyContent: 'space-around', marginTop:50}}>
            <TracksTable tracks={this.state.tracks}/>
            <div style={{marginTop:24}}>
              <TwitterTimelineEmbed sourceType="profile" screenName="flatironschool" options={{height: 375, width: 600}}  />
            </div>
          </div>
        </div>
    );
    }
  }

  styles (){
    return {
      backgroundColor: 'rgb(43, 43, 43)'
    }
  }
}

export default BreakThroughApp


// background-color: rgb(43, 43, 43);
