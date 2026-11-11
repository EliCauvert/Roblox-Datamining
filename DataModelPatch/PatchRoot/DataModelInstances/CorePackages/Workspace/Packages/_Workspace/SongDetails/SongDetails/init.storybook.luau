local SongDetails = script:FindFirstAncestor("SongDetails")

return {
	name = SongDetails.Name,
	storyRoots = { script.Parent },
	roact = require(SongDetails.Parent.Dev.Roact)
}