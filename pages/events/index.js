import { useRouter } from 'next/router';
import { getAllEvents } from '../../helpers/api-utils';
import EventList from '@/components/events/event-list';
import EventsSearch from '@/components/events/events-search';
import Head from 'next/head';

function Events({ allEvents }) {
  const router = useRouter();

  function findEventsHandler(year, month) {
    const fullPath = `events/${year}/${month}`;
    router.push(fullPath);
  }
  return (
    <div>
      <Head>
        <title>All Events</title>
        <meta name='description' content='Find all the events'></meta>
      </Head>
      <EventsSearch onSearch={findEventsHandler} />
      <EventList items={allEvents}></EventList>
    </div>
  );
}

export async function getStaticProps(context) {
  const allEvents = await getAllEvents();
  return {
    props: {
      allEvents,
    },
    // Next.js will attempt to re-generate the page:
    // - When a request comes in
    // - At most once every 10 seconds
    revalidate: 60, // In seconds
  };
}

export default Events;
