import EventSummary from '@/components/event-detail/event-summary';
import EventLogistics from '@/components/event-detail/event-logistics';
import EventContent from '@/components/event-detail/event-content';
import { getAllEvents, getEventById } from '../../helpers/api-utils';

function EventDetails(props) {
  const event = props.event;
  if (!event) {
    return <p>No event found!</p>;
  }
  return (
    <>
      <EventSummary title={event.title} />
      <EventLogistics
        date={event.date}
        address={event.location}
        image={event.image}
        imageAlt={event.title}
      />
      <EventContent>
        <p>{event.description}</p>
      </EventContent>
    </>
  );
}

export default EventDetails;

export async function getStaticProps(context) {
  const eventId = context.params.eventId;
  const event = await getEventById(eventId);
  return {
    props: {
      event: event,
    },
  };
}

export async function getStaticPaths() {
  const events = await getAllEvents();
  console.log('events', events);
  const paths = events.map((event) => ({
    params: {
      eventId: event.id,
    },
  }));
  console.log('paths', paths);
  return {
    paths: paths,
    fallback: false,
  };
}
