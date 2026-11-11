return {
	ArtistSongReducer = require(script.Reducers.ArtistSongReducer),
	SongDetailReducer = require(script.Reducers.SongDetailReducer),
	SongExperiencesReducer = require(script.Reducers.SongExperiencesReducer),
	useFetchArtistSongs = require(script.Hooks.useFetchArtistSongs),
	useFetchSongDetail = require(script.Hooks.useFetchSongDetail),
	useFetchSongExperiences = require(script.Hooks.useFetchSongExperiences),
	["jest.config"] = script["jest.config"]
}