import EventItem from './event-item';
import classes from './event-list.module.css';

function EventList(props) {
  const { items } = props;
  return (
    <div className={classes.list}>
      <ul>
        {items.map((item) => (
          <EventItem item={item} key={item.id}></EventItem>
        ))}
      </ul>
    </div>
  );
}

export default EventList;
