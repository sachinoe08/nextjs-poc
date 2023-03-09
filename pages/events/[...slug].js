import EventList from '@/components/events/event-list';
import { getFilteredEvents } from '@/dummy-data';
import { useRouter } from 'next/router';
import ResultsTitle from '../../components/events/results-title';

function FilteredEvents() {
  const router = useRouter();
  const slug = router.query.slug;
  if (!slug) {
    return <p className='center'>Loading...</p>;
  }
  const selectedYear = slug[0];
  const selectedMonth = slug[1];

  const numYear = +selectedYear;
  const numMonth = +selectedMonth;

  if (isNaN(numYear) || isNaN(numMonth)) {
    return (
      <p className='center'>Not a valid numbers, please adjust your values!</p>
    );
  }

  const filteredEvents = getFilteredEvents({
    year: numYear,
    month: numMonth,
  });

  if (!filteredEvents || filteredEvents.length === 0) {
    return <p className='center'>No events found for the chosen filter!</p>;
  }

  const date = new Date(numYear, numMonth - 1);
  return (
    <>
      <ResultsTitle date={date} />
      <EventList items={filteredEvents}></EventList>
    </>
  );
}

export default FilteredEvents;
