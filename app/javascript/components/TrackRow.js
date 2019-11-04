import React from 'react';
import { withStyles, makeStyles } from '@material-ui/core/styles';
import ArrowUpward from '@material-ui/icons/ArrowUpward';
import ArrowDownward from '@material-ui/icons/ArrowDownward';

export default class TrackRow extends React.Component {
  state = {
    positionChangeStatus: ""
  }

  render() {
    const { track, StyledTableCell, StyledTableRow } = this.props

    return (
      <StyledTableRow key={track.title}>
        <StyledTableCell component="th" scope="row">
          {track.title}
        </StyledTableCell>
        <StyledTableCell align="right">{track.artist_name}</StyledTableCell>
        <StyledTableCell align="center">
          {1}
          {this.renderArrow}
        </StyledTableCell>
      </StyledTableRow>
    )
  }

  componentDidUpdate(prevProps) {
    const prevPosition = prevProps.track.position
    const { position } = this.props.track

    if (prevPosition !== position) {
      if (prevPosition < position){
        this.updateAndNotifyPosition(1)
      } else {
        this.updateAndNotifyPosition(2)
      }
    } else {
      this.updateAndNotifyPosition(0)
    }
  }

  updateAndNotifyPosition(status) {
    this.setState({ positionChangeStatus: status})
  }

  renderArrow() {
    if (this.state.positionChangeStatus === 1){
      return(<ArrowUpward/>)
    } else if (this.state.positionChangeStatus === 2){
      return(<ArrowDownward/>)
    } else {
      return(<div></div>)
    }
  }
}
