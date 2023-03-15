import EventList from '@/components/events/event-list';
import { getFeaturedEvents } from '../helpers/api-utils';
import Head from 'next/head';

export default function Home(props) {
  return (
    <div>
      <Head>
        <title>NextJs App</title>
        <meta name='description' content='Find all the events'></meta>
      </Head>
      <EventList items={props.events}></EventList>
    </div>
  );
}

export async function getStaticProps() {
  const featuredEvents = await getFeaturedEvents();
  return {
    props: {
      events: featuredEvents,
    },
  };
}
