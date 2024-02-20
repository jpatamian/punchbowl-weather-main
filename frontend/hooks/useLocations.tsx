export type Location = {
  slug: string;
  name: string;
  id: number;
};

const locations: Array<Location> = [
  { slug: "new_york", name: "New York", id: 1 },
  { slug: "boston", name: "Boston", id: 2 },
  { slug: "chicago", name: "Chicago", id: 3 },
];

export const useLocations = () => {
  // TODO: Fetch this data from the API as a React Hook.
  return {
    locations,
    isLoading: false,
    isError: false,
  };
};

export const useLocation: (slug: string) => Location | null = (slug) => {
  const { locations } = useLocations();

  return locations ? locations.find((location) => location.slug === slug) : null;
};