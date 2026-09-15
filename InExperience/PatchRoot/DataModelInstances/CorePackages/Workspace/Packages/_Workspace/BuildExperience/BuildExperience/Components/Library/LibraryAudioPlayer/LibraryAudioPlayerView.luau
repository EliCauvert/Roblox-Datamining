local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local assetLibraryAudioPlayerViewModule = require(buildExperience.Components.AssetLibrary.AssetLibraryAudioPlayer.AssetLibraryAudioPlayerView)

return function(p1)
	-- upvalues: reactModule (ref), foundationModule (ref), assetLibraryAudioPlayerViewModule (ref)
	return if p1.status == "Failed" then reactModule.createElement(foundationModule.Text, {
		Text = "Unable to load sound.",
		tag = "auto-xy text-body-medium content-default"
	}) elseif p1.status == "Ready" then reactModule.createElement(assetLibraryAudioPlayerViewModule, {
		title = p1.title,
		artist = p1.artist,
		isPlaying = p1.isPlaying,
		elapsed = p1.elapsed,
		duration = p1.duration,
		onTogglePlayback = p1.onTogglePlayback
	}) else reactModule.createElement(foundationModule.Skeleton, {
		testId = "Library.Preview.SoundLoading",
		Size = UDim2.fromOffset(168, 168),
		radius = foundationModule.Enums.Radius.Medium
	})
end