import Button from '../ui/button';
import classes from './event-item.module.scss';
import DateIcon from '../icons/date-icon';
import AddressIcon from '../icons/address-icon';
import ArrowRightIcon from '../icons/arrow-right-icon';
import Image from 'next/image';

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
      <Image src={'/' + image} alt={title} width={300} height={200} />
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
