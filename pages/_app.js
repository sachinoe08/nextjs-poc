import { Provider } from 'react-redux';
import Layout from '@/components/layout/layout';
import '../styles/globals.scss';
import { store } from '../store/store';

function MyApp({ Component, pageProps }) {
  return (
    <>
      <title>Next Events</title>
      <meta name='description' content='NextJS Events' />
      <meta name='viewport' content='initial-scale=1.0, width=device-width' />
      <Provider store={store}>
        <Layout>
          <Component {...pageProps} />
        </Layout>
      </Provider>
    </>
  );
}

export default MyApp;
