import { useSelector, useDispatch } from 'react-redux';
import { fetchUsers } from '@/store/reducers/userSlice';
import { useEffect } from 'react';
import UsersList from '@/components/users/users-list';

function Users() {
  const dispatch = useDispatch();
  const users = useSelector((state) => state.user.users);
  useEffect(() => {
    dispatch(fetchUsers());
  }, [dispatch]);

  return <UsersList users={users}></UsersList>;
}

export default Users;
