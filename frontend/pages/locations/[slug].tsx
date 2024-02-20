import { useRouter } from "next/router";
import { useContext, useEffect, useMemo } from "react";

import FavoriteButton from "../../components/FavoriteButton";
import { LocationHeading } from "../../components/LocationHeading";
import { SessionContext } from "../../components/SessionProvider";
import { CurrentWeather } from "../../components/CurrentWeather";
import { useLocation } from "../../hooks/useLocations";
import { useWeather } from "../../hooks/useWeather";

export default function WeatherPage() {
  const router = useRouter();
  const slug = router.query.slug as string;

  const { setLocationSlug, locationSlug } = useContext(SessionContext);
  const { name } = useLocation(locationSlug) ?? {};
  const { weather } = useWeather(locationSlug);
  // const { favorites } = useUserFavorites();

  const isFavorite = false; // Remove this line and uncomment the section below when you implement favorites.
  // const isFavorite = useMemo(() => {
  //   return favorites?.some((favorite) => favorite.location_id === id);
  // }, [favorites, id])

  useEffect(() => {
    setLocationSlug(slug);
  }, [slug]);

  return (
    <div className="space-y-4">
      <LocationHeading name={name} />
      <CurrentWeather weather={weather} />
      {/* <FavoriteButton isFavorite={isFavorite} locationId={id} /> */}
    </div>
  );
}
