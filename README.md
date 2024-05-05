# Weather App: SkyCast ☀️ ☔ ☁️ ❄️
  ### System requirements 💻
  - Ruby `v3.3.0` or higher
  - Rails `v7.1.3.2` or higher
  - NodeJs `v20.11.0` or higher
  - Yarn `1.22.22` or higher
  - Postgres `14.11`
  ### Server Setup ⚙️
  - Clone the github repository on your local machine.
  - On terminal run `bundle install` this will install the necessary gems to run the web app.
  - Run `rails db:prepare` to setup database.
  - Create a `local_env.yml` file on the config folder
      - This file should contain the necessary credentials for the OpenWeather api
        ```yml
          OPEN_WEATHER_KEY: <Your_api_key>
        ```
      - You can get your own api key here [OpenWeather.org](https://home.openweathermap.org/api_keys).
  - Run `bin/dev` to start the server. The web app should be accessible on this link  `localhost:3000`
  
 ### Screenshot 📷:
  - Forecast Page 
  ![Screenshot 2024-05-05 110904](https://github.com/AndreMigz/skycast/assets/118160061/726d5883-4fb0-4641-bfd0-3fe1f4fb30e3)

  - Weather Logs
  ![Screenshot 2024-05-05 111058](https://github.com/AndreMigz/skycast/assets/118160061/07e279c1-2607-4ecd-b631-a1f4e67285a6)

### Demo:

https://github.com/AndreMigz/skycast/assets/118160061/24342100-8c68-43f0-b6fc-c6d4c7e67dea

