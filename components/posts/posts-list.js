import classes from './posts-list.module.scss';
function PostsList({ posts }) {
  const list =
    posts &&
    posts.length &&
    posts.map((post) => {
      return <li key={post.id}>{post.title}</li>;
    });
  return (
    <div className={classes.posts}>
      <h1 className={classes.title}>Posts:</h1>
      <div className={classes.list}>
        <ul>{list}</ul>
      </div>
    </div>
  );
}

export default PostsList;
