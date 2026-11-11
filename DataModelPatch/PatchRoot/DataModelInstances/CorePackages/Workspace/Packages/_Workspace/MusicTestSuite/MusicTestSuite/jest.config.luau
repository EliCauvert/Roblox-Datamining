local MusicTestSuite = script:FindFirstAncestor("MusicTestSuite")

return {
	displayName = "MusicTestSuite",
	projects = {
		require(MusicTestSuite.Parent.Songbird)["jest.config"],
		require(MusicTestSuite.Parent.MediaPlayback)["jest.config"],
		require(MusicTestSuite.Parent.AppMusicPlayer)["jest.config"],
		require(MusicTestSuite.Parent.ExperienceSongsRodux)["jest.config"],
		require(MusicTestSuite.Parent.SongDetailRodux)["jest.config"],
		require(MusicTestSuite.Parent.SongDetails)["jest.config"],
		require(MusicTestSuite.Parent.SongInfosRodux)["jest.config"],
		require(MusicTestSuite.Parent.SongModels)["jest.config"],
		require(MusicTestSuite.Parent.SongTile)["jest.config"]
	}
}