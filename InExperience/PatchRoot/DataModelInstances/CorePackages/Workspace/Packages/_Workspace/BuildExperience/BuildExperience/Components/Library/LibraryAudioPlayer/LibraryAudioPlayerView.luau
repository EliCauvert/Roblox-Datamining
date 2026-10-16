local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local LibraryAudioPlayerContentViewModule = require(script.Parent.LibraryAudioPlayerContentView)

return function(p1) --[[ Line: 10 | Named "LibraryAudioPlayerView" ]]
	-- upvalues: FoundationModule (copy), ReactModule (copy), LibraryAudioPlayerContentViewModule (copy)
	local UseScaledValueResult = FoundationModule.Hooks.useScaledValue(168)
	
	return if p1.status == "Failed" then ReactModule.createElement(FoundationModule.Text, {
		tag = "auto-xy text-body-medium content-default",
		Text = p1.unavailableText
	}) elseif p1.status == "Ready" then ReactModule.createElement(LibraryAudioPlayerContentViewModule, {
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
	}) else ReactModule.createElement(FoundationModule.Skeleton, {
		testId = "Library.Preview.SoundLoading",
		Size = UDim2.fromOffset(UseScaledValueResult, UseScaledValueResult),
		radius = FoundationModule.Enums.Radius.Medium
	})
end