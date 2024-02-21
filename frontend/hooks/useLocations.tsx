import { useState, useEffect } from 'react';

export type Location = {
  slug: string;
  name: string;
  id: number;
};

const api = `${process.env.NEXT_PUBLIC_API_BASE}/api/locations`

export const useLocations = () => {
  const [data, setData] = useState([]);
  const [isLoading, setIsLoading] = useState(false);
  const [isError, setIsError] = useState(false);

  const fetchData = async () => {
    setIsLoading(true);

    try {
      const response = await fetch(api);
      const data = await response.json();
      setData(data);
    } catch (error) {
      setIsError(true);
      console.error('Error fetching data:', error);
    } finally {
      setIsLoading(false);
    }
  };

  useEffect(() => {
    fetchData();
  }, []);

  return {
    locations: data,
    isLoading,
    isError
  };
};

export const useLocation: (slug: string) => Location | null = (slug) => {
  const { locations } = useLocations();

  return locations ? locations.find((location) => location.slug === slug) : null;
};
