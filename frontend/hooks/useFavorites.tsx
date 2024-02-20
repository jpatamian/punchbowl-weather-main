
import useSWR from "swr";

export type UserFavorite = {
  id: number;
  location_id: number;
  user_id: number;
};

const fetcher = (path) =>
  fetch(path)
    .then((response) => response.json());

export const useUserFavorites = () => {
  const { data, error, mutate } = useSWR<Array<UserFavorite>, Error>(
    `${process.env.NEXT_PUBLIC_API_BASE}/api/user_favorites`,
    fetcher
  );

  return {
    favorites: data,
    isLoading: !data && !error,
    isError: error,
    mutate
  };
};
