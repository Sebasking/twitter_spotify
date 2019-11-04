import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Card from '@material-ui/core/Card';
import CardContent from '@material-ui/core/CardContent';
import Typography from '@material-ui/core/Typography';

const useStyles = makeStyles({
  card: {
    width: 380,
    height: 170,
  },
  pos: {
    marginBottom: 12,
  },
  paragraph: {
    fontSize: '0.75rem'
  },
  cardContent: {
    paddingTop: 5
  }
});

export default function SimpleCard() {
  const classes = useStyles();

  return (
    <Card className={classes.card}>
      <CardContent className={classes.cardContent}>
        <Typography className={classes.pos} color="textSecondary">
          Instructions
        </Typography>
        <Typography variant="body2" component="p" className={classes.paragraph}>
          1. Tweet the full name of the song then artist<br />
          2.  Tag #Breakthrough @Flatiron School<br />
          &nbsp; ex. No Guidance - Drake #breakthrough @flatironschool<br />
          3. You’re song will be added to the playlist
          <br /><br />
          To upvote a song, re-tweet the original tweet
          Find through searching for the hashtags
        </Typography>
      </CardContent>
    </Card>
  );
}
