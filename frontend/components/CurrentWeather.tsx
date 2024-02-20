import React from "react";
import capitalize from "capitalize";

import { Weather } from "../hooks/useWeather";

export const CurrentWeather = ({ weather }: { weather?: Weather }) => {
  if (!weather) return null;

  return (
    <div className="space-y-4 min-w-[400px]">
      <div className="flex flex-row justify-center items-center bg-white text-gray-900 antialiased rounded-md p-4 shadow-lg">
        <img
          className="w-[100px] h-[100px]"
          src={weather.icon}
          alt={weather.description}
        />
        <div className="flex flex-col justify-center">
          <div className="text-4xl font-bold">
            {Math.round(weather.temperature)}°
          </div>
          <div className="text-lg font-normal tracking-tight">
            {capitalize.words(weather.description)}
          </div>
        </div>
      </div>

      <div className="grid grid-cols-3 px-2 text-center">
        <div className="text-sm font-medium">Feels Like</div>
        <div className="text-sm font-medium">Low</div>
        <div className="text-sm font-medium">High</div>

        <div className="text-lg font-medium">
          {Math.round(weather.feelsLike)}°
        </div>
        <div className="text-lg font-medium">{Math.round(weather.low)}°</div>
        <div className="text-lg font-medium">{Math.round(weather.high)}°</div>
      </div>
    </div>
  );
};

export default CurrentWeather;
