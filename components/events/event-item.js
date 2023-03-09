import Button from '../ui/button';
import classes from './event-item.module.css';
import DateIcon from '../icons/date-icon';
import AddressIcon from '../icons/address-icon';
import ArrowRightIcon from '../icons/arrow-right-icon';

function EventItem(props) {
  const { item } = props;
  const { title, image, date, location, id } = item;
  const dateFormat = new Date(date).toLocaleDateString('en-US', {
    day: 'numeric',
    month: 'long',
    year: 'numeric',
  });
  const addressFormat = location && location.replace(', ', '\n');
  const exploreEvent = `/events/${id}`;
  return (
    <li className={classes.item}>
      <img src={'/' + image} alt={title}></img>
      <div className={classes.content}>
        <div>
          <h2>{title}</h2>
          <div className={classes.date}>
            <DateIcon />
            <time>{dateFormat}</time>
          </div>
          <div className={classes.address}>
            <AddressIcon />
            <address>{addressFormat}</address>
          </div>
        </div>
        <div className={classes.actions}>
          <Button link={exploreEvent}>
            <span>Explore Event</span>
            <span className={classes.icon}>
              <ArrowRightIcon />
            </span>
          </Button>
        </div>
      </div>
    </li>
  );
}

export default EventItem;
