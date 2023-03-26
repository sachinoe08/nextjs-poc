import classes from './user-list.module.scss';
function UsersList({ users }) {
  const userList =
    users &&
    users.length &&
    users.map((user) => {
      return <li key={user.id}>{user.name}</li>;
    });
  return (
    <div className={classes.users}>
      <h1 className={classes.title}>Users List:</h1>
      <div className={classes.userList}>
        <ul>{userList}</ul>
      </div>
    </div>
  );
}

export default UsersList;
