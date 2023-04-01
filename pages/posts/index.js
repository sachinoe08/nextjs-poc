import axios from 'axios';
import PostsList from '@/components/posts/posts-list';

function Posts({ posts }) {
  return (
    <>
      <PostsList posts={posts}></PostsList>
    </>
  );
}

export default Posts;

// This gets called on every request
export async function getServerSideProps() {
  // Fetch data from external API
  const res = await axios.get(`https://jsonplaceholder.typicode.com/posts`);
  console.log(res.data);
  // Pass data to the page via props
  return { props: { posts: res.data } };
}
