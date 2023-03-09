import { useRouter } from 'next/router';
import { getAllEvents } from '../../dummy-data';
import EventList from '@/components/events/event-list';
import EventsSearch from '@/components/events/events-search';

function Events() {
  const router = useRouter();
  const allEvents = getAllEvents();
  function findEventsHandler(year, month) {
    const fullPath = `events/${year}/${month}`;
    router.push(fullPath);
  }
  return (
    <div>
      <EventsSearch onSearch={findEventsHandler} />
      <EventList items={allEvents}></EventList>
    </div>
  );
}

export default Events;
