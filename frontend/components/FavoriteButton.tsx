
import { useUserFavorites } from "../hooks/useFavorites";

export default function FavoriteButton({ isFavorite, locationId }: { isFavorite: boolean, locationId: number }) {
  const { mutate } = useUserFavorites();

  const handleToggleFavorite = () => {
    if (isFavorite) {
      fetch(`${process.env.NEXT_PUBLIC_API_BASE}/api/user_favorites/${locationId}`, {
        method: 'DELETE',
      }).then(() => mutate())
    } else {
      fetch(
        `${process.env.NEXT_PUBLIC_API_BASE}/api/user_favorites`,
        {
          method: 'POST',
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({ location_id: locationId })
        },
      ).then(() => mutate())
    }
  }

  return (
    <button
      className="px-4 py-2 font-semibold text-sm bg-sky-500 text-white rounded-none"
      onClick={handleToggleFavorite}
    >
      {isFavorite ? 'Remove from' : 'Add to'} favorites
    </button>
  );
};
