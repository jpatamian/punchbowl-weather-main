import { createContext, ReactNode, useState } from "react";

type SessionContextProps = {
  locationSlug: string;
  setLocationSlug: (slug: string | null) => void;
};

export const SessionContext = createContext<SessionContextProps>({
  locationSlug: null,
  setLocationSlug: () => null,
});

export const SessionProvider = ({ children }: { children: ReactNode }) => {
  const [locationSlug, setLocationSlug] = useState<string | null>(null);

  const contextValue: SessionContextProps = {
    locationSlug,
    setLocationSlug,
  };

  return (
    <SessionContext.Provider value={contextValue}>
      {children}
    </SessionContext.Provider>
  );
};
