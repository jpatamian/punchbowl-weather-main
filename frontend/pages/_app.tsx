import type { AppProps /*, AppContext */ } from "next/app";
import "tailwindcss/tailwind.css";

import { Layout } from "../components/Layout";
import { SessionProvider } from "../components/SessionProvider";

function MyApp({ Component, pageProps }: AppProps) {
  return (
    <SessionProvider>
      <Layout>
        <Component {...pageProps} />
      </Layout>
    </SessionProvider>
  );
}

export default MyApp;
