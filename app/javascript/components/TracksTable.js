import React from 'react';
import { withStyles, makeStyles } from '@material-ui/core/styles';
import Table from '@material-ui/core/Table';
import TableBody from '@material-ui/core/TableBody';
import TableCell from '@material-ui/core/TableCell';
import TableHead from '@material-ui/core/TableHead';
import TableRow from '@material-ui/core/TableRow';
import Paper from '@material-ui/core/Paper';
import TrackRow from './TrackRow';


const StyledTableCell = withStyles(theme => ({
  head: {
    backgroundColor: theme.palette.common.black,
    color: theme.palette.common.white,
  },
  body: {
    fontSize: 14,
  },
}))(TableCell);

const StyledTableRow = withStyles(theme => ({
  root: {
    '&:nth-of-type(odd)': {
      backgroundColor: theme.palette.background.default,
    },
  },
}))(TableRow);

const useStyles = makeStyles(theme => ({
  root: {
    width: '40%',
    marginTop: theme.spacing(3),
    overflowX: 'auto',
  },
  table: {
    minWidth: 500,
  },
}));

export default function TracksTable(props) {
  const classes = useStyles();
  const { tracks } = props

  return (
    <Paper className={classes.root}>
      <Table className={classes.table} aria-label="customized table">
        <TableHead>
          <TableRow>
            <StyledTableCell>Song Title</StyledTableCell>
            <StyledTableCell align="right">Artist</StyledTableCell>
            <StyledTableCell align="right">@TwitterUsername</StyledTableCell>
            <StyledTableCell align="right">Position</StyledTableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          {tracks.map(track => (
            <TrackRow track={track} key={track.id} StyledTableRow={StyledTableRow} StyledTableCell={StyledTableCell} />
          ))}
        </TableBody>
      </Table>
    </Paper>
  )
}
