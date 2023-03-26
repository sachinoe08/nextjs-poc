import Link from 'next/link';
import classes from './button.module.css';
import Button from '@mui/material/Button';

function MUIButton(props) {
  if (props.link) {
    return (
      <Link href={props.link} className={classes.btn}>
        {props.children}
      </Link>
    );
  }
  return (
    <Button variant='contained' onClick={props.onClick}>
      {props.children}
    </Button>
  );
}

export default MUIButton;
