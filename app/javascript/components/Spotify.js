import React from "react"
import PropTypes from "prop-types"
class Spotify extends React.Component {
  render () {
    return (
      <React.Fragment>
        Auth Token:
        <br/>
        {this.props.authToken}
        <br/><br/>
        Refresh Token:
        <br/>
        {this.props.refreshToken}
      </React.Fragment>
    );
  }
}

Spotify.propTypes = {
  authToken: PropTypes.string,
  refreshToken: PropTypes.string
};
export default Spotify
