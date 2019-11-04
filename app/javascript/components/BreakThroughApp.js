import React from "react"
import TracksTable from './TracksTable'
import Instructions from './Instructions'
import { TwitterTimelineEmbed } from 'react-twitter-embed'
import { ActionCableProvider } from 'react-actioncable-provider'


class BreakThroughApp extends React.Component {
  handleIncomingTrack = response => {
    console.log(response)
  }

  render () {
    console.log(this.props)
    return (
      <ActionCableProvider url="ws://localhost:3000/cable">
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
            <TracksTable tracks={this.props.tracks}/>
            <div style={{marginTop:24}}>
              <TwitterTimelineEmbed sourceType="profile" screenName="flatironschool" options={{height: 375, width: 600}}  />
            </div>
          </div>
        </div>
      </ActionCableProvider>
    );
  }

  styles (){
    return {
      backgroundColor: 'rgb(43, 43, 43)'
    }
  }
}

export default BreakThroughApp


// background-color: rgb(43, 43, 43);
