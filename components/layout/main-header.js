import Link from 'next/link';
import classes from './main-header.module.scss';

function MainHeader() {
  return (
    <header className={classes.header}>
      <div className={classes.logo}>
        <Link href={'/'}> Next Events</Link>
        <Link href={'/users'}> Users</Link>
        <Link href={'/posts'}> Posts</Link>
      </div>
      <nav className={classes.navigation}>
        <ul>
          <li>
            <Link href={'/events'}>Browse All Events</Link>
          </li>
        </ul>
      </nav>
    </header>
  );
}

export default MainHeader;
