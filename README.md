Teamfight Tactics is a round based strategy game hosted via Riot Games. https://na.leagueoflegends.com/en/featured/events/teamfight-tactics

TopDeck is an application to help players learn how to play and develop strategies while playing.

Purpose:
 1. Scrape data to keep track of all units currently on the map.
 2. From that data app will calculate probability of obtaining units the client is looking for.
 3. App will help players by suggesting team comps / counters to what is currently on the board. 

-> PostgreSQL will be used to keep track of the units and all their stats.
-> Will attempt to use the RiotGames API to scrape information to give live updates for the APP.
https://developer.riotgames.com/api-methods/#spectator-v4/GET_getCurrentGameInfoBySummoner
-> Will be written with React-Redux
