class Api::WeathersController < ApplicationController
  def show
    location = Location.find_by(slug: params[:location_id])

    if location.nil?
      render json: { error: 'Location not found' }, status: :not_found
      return
    end

    client = OpenWeather::Client.new
    data = client.one_call(lat: location.latitude, lon: location.longitude, exclude: %w[minutely hourly alerts])

    render json: data, status: :ok
  rescue OpenWeather::Errors::Fault
    logger.error 'Error accessing OpenWeather API'
    head :bad_request
  end
end

__END__

######################################################################
######################################################################
# Example Response:
######################################################################
######################################################################

{
  "lat": 40.71,
  "lon": -74.01,
  "timezone": "America/New_York",
  "current": {
    "dt": "2020-11-19T23:38:24.000Z",
    "sunrise": "2020-11-19T11:48:16.000Z",
    "sunset": "2020-11-19T21:35:11.000Z",
    "temp": 45.61,
    "feels_like": 32.99,
    "pressure": 1031,
    "humidity": 49,
    "dew_point": 28.09,
    "uvi": 1.91,
    "clouds": 1,
    "visibility": 10000,
    "wind_speed": 14.99,
    "wind_deg": 240,
    "wind_gust": 21.92,
    "weather": [
      {
        "id": 800,
        "main": "Clear",
        "description": "clear sky",
        "icon_uri": "http://openweathermap.org/img/wn/01n@2x.png",
        "icon": "01n"
      }
    ]
  },
  "daily": [
    {
      "dt": "2020-11-19T16:00:00.000Z",
      "sunrise": "2020-11-19T11:48:16.000Z",
      "sunset": "2020-11-19T21:35:11.000Z",
      "temp": {
        "day": 38.7,
        "min": 32.7,
        "max": 45.88,
        "night": 45.88,
        "eve": 45.61,
        "morn": 33.46
      },
      "feels_like": {
        "day": 29.08,
        "night": 33.21,
        "eve": 32.7,
        "morn": 27.45
      },
      "pressure": 1036,
      "humidity": 66,
      "dew_point": 19.24,
      "wind_speed": 9.82,
      "wind_deg": 210,
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon_uri": "http://openweathermap.org/img/wn/04d@2x.png",
          "icon": "04d"
        }
      ],
      "clouds": 87,
      "uvi": 1.91
    },
    {
      "dt": "2020-11-20T16:00:00.000Z",
      "sunrise": "2020-11-20T11:49:25.000Z",
      "sunset": "2020-11-20T21:34:31.000Z",
      "temp": {
        "day": 49.21,
        "min": 45.61,
        "max": 56.23,
        "night": 51.57,
        "eve": 56.23,
        "morn": 46.09
      },
      "feels_like": {
        "day": 39.2,
        "night": 43.32,
        "eve": 47.64,
        "morn": 35.53
      },
      "pressure": 1029,
      "humidity": 54,
      "dew_point": 33.62,
      "wind_speed": 11.77,
      "wind_deg": 230,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon_uri": "http://openweathermap.org/img/wn/01d@2x.png",
          "icon": "01d"
        }
      ],
      "clouds": 0,
      "uvi": 2.07
    },
    {
      "dt": "2020-11-21T16:00:00.000Z",
      "sunrise": "2020-11-21T11:50:34.000Z",
      "sunset": "2020-11-21T21:33:54.000Z",
      "temp": {
        "day": 54.63,
        "min": 48.81,
        "max": 58.91,
        "night": 48.81,
        "eve": 58.59,
        "morn": 51.98
      },
      "feels_like": {
        "day": 49.75,
        "night": 39.47,
        "eve": 53.73,
        "morn": 46.8
      },
      "pressure": 1027,
      "humidity": 65,
      "dew_point": 43.32,
      "wind_speed": 5.84,
      "wind_deg": 280,
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon_uri": "http://openweathermap.org/img/wn/04d@2x.png",
          "icon": "04d"
        }
      ],
      "clouds": 71,
      "uvi": 2.11
    },
    {
      "dt": "2020-11-22T16:00:00.000Z",
      "sunrise": "2020-11-22T11:51:42.000Z",
      "sunset": "2020-11-22T21:33:18.000Z",
      "temp": {
        "day": 45.3,
        "min": 43.09,
        "max": 55.6,
        "night": 55.6,
        "eve": 48.42,
        "morn": 43.09
      },
      "feels_like": {
        "day": 37.09,
        "night": 49.48,
        "eve": 41.16,
        "morn": 32.94
      },
      "pressure": 1031,
      "humidity": 67,
      "dew_point": 35.1,
      "wind_speed": 9.06,
      "wind_deg": 65,
      "weather": [
        {
          "id": 500,
          "main": "Rain",
          "description": "light rain",
          "icon_uri": "http://openweathermap.org/img/wn/10d@2x.png",
          "icon": "10d"
        }
      ],
      "clouds": 100,
      "rain": 1.33,
      "uvi": 1.94
    },
    {
      "dt": "2020-11-23T16:00:00.000Z",
      "sunrise": "2020-11-23T11:52:50.000Z",
      "sunset": "2020-11-23T21:32:45.000Z",
      "temp": {
        "day": 49.6,
        "min": 42.26,
        "max": 55.47,
        "night": 42.26,
        "eve": 51.28,
        "morn": 54.79
      },
      "feels_like": {
        "day": 38.25,
        "night": 30.88,
        "eve": 40.06,
        "morn": 47.68
      },
      "pressure": 1020,
      "humidity": 55,
      "dew_point": 34.12,
      "wind_speed": 14.38,
      "wind_deg": 314,
      "weather": [
        {
          "id": 500,
          "main": "Rain",
          "description": "light rain",
          "icon_uri": "http://openweathermap.org/img/wn/10d@2x.png",
          "icon": "10d"
        }
      ],
      "clouds": 6,
      "rain": 1.29,
      "uvi": 1.78
    },
    {
      "dt": "2020-11-24T16:00:00.000Z",
      "sunrise": "2020-11-24T11:53:58.000Z",
      "sunset": "2020-11-24T21:32:13.000Z",
      "temp": {
        "day": 39.34,
        "min": 36.34,
        "max": 44.46,
        "night": 44.46,
        "eve": 44.38,
        "morn": 37.83
      },
      "feels_like": {
        "day": 32.47,
        "night": 36.45,
        "eve": 37.13,
        "morn": 26.69
      },
      "pressure": 1032,
      "humidity": 66,
      "dew_point": 20.77,
      "wind_speed": 5.12,
      "wind_deg": 36,
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon_uri": "http://openweathermap.org/img/wn/03d@2x.png",
          "icon": "03d"
        }
      ],
      "clouds": 29,
      "uvi": 1.72
    },
    {
      "dt": "2020-11-25T16:00:00.000Z",
      "sunrise": "2020-11-25T11:55:04.000Z",
      "sunset": "2020-11-25T21:31:44.000Z",
      "temp": {
        "day": 54.82,
        "min": 46.47,
        "max": 60.64,
        "night": 60.64,
        "eve": 57.27,
        "morn": 49.59
      },
      "feels_like": {
        "day": 46.63,
        "night": 50.2,
        "eve": 51.6,
        "morn": 41.31
      },
      "pressure": 1020,
      "humidity": 81,
      "dew_point": 49.44,
      "wind_speed": 14.25,
      "wind_deg": 162,
      "weather": [
        {
          "id": 502,
          "main": "Rain",
          "description": "heavy intensity rain",
          "icon_uri": "http://openweathermap.org/img/wn/10d@2x.png",
          "icon": "10d"
        }
      ],
      "clouds": 100,
      "rain": 23.05,
      "uvi": 1.55
    },
    {
      "dt": "2020-11-26T16:00:00.000Z",
      "sunrise": "2020-11-26T11:56:10.000Z",
      "sunset": "2020-11-26T21:31:16.000Z",
      "temp": {
        "day": 54.61,
        "min": 47.34,
        "max": 57.69,
        "night": 47.34,
        "eve": 51.03,
        "morn": 56.25
      },
      "feels_like": {
        "day": 42.75,
        "night": 38.86,
        "eve": 39.49,
        "morn": 50.38
      },
      "pressure": 1009,
      "humidity": 63,
      "dew_point": 42.64,
      "wind_speed": 17.92,
      "wind_deg": 309,
      "weather": [
        {
          "id": 501,
          "main": "Rain",
          "description": "moderate rain",
          "icon_uri": "http://openweathermap.org/img/wn/10d@2x.png",
          "icon": "10d"
        }
      ],
      "clouds": 62,
      "rain": 3.81,
      "uvi": 1.74
    }
  ]
}
