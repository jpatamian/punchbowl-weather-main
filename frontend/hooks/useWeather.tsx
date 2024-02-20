import useSWR from "swr";
import objectPath from "object-path";

export type Weather = {
  temperature: number;
  feelsLike: number;
  low: number;
  high: number;
  description: string;
  icon: string;
};

const rawToWeather: (data: any) => Weather = (data) => ({
  temperature: objectPath.get(data, "current.temp", 0.0),
  feelsLike: objectPath.get(data, "current.feels_like", 0.0),
  low: objectPath.get(data, "daily.0.temp.min", 0.0),
  high: objectPath.get(data, "daily.0.temp.max", 0.0),
  description: objectPath.get(data, "current.weather.0.description", ""),
  icon: objectPath.get(data, "current.weather.0.icon_uri", ""),
});

const fetcher = (path) =>
  fetch(path)
    .then((response) => response.json())
    .then((data) => rawToWeather(data));

export const useWeather = (location_slug: string) => {
  const { data, error } = useSWR<Weather, Error>(
    location_slug
      ? `${process.env.NEXT_PUBLIC_API_BASE}/api/locations/${location_slug}/weather`
      : null,
    fetcher
  );

  return {
    weather: data,
    isLoading: !data && !error,
    isError: error,
  };
};

export default useWeather;
