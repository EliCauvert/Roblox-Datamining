local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local libraryAudioPlayerContentViewModule = require(script.Parent.LibraryAudioPlayerContentView)

return function(p1)
	-- upvalues: foundationModule (ref), reactModule (ref), libraryAudioPlayerContentViewModule (ref)
	local var1 = foundationModule.Hooks.useScaledValue(168)
	
	return if p1.status == "Failed" then reactModule.createElement(foundationModule.Text, {
		tag = "auto-xy text-body-medium content-default",
		Text = p1.unavailableText
	}) elseif p1.status == "Ready" then reactModule.createElement(libraryAudioPlayerContentViewModule, {
		isCompact = p1.isCompact,
		title = p1.title,
		artist = p1.artist,
		isPlaying = p1.isPlaying,
		elapsed = p1.elapsed,
		duration = p1.duration,
		onTogglePlayback = p1.onTogglePlayback,
		onSeek = p1.onSeek,
		onSeekStarted = p1.onSeekStarted,
		onSeekEnded = p1.onSeekEnded
	}) else reactModule.createElement(foundationModule.Skeleton, {
		testId = "Library.Preview.SoundLoading",
		Size = UDim2.fromOffset(var1, var1),
		radius = foundationModule.Enums.Radius.Medium
	})
end