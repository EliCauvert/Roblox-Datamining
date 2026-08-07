local _ = require(script.types)

return {
	AudioPlaybackTimeline = require(script.Components.AudioPlaybackTimeline),
	AudioPlayer = require(script.Components.AudioPlayer),
	AudioPlayerActions = require(script.Components.AudioPlayerActions),
	ChromeWindowWrapper = require(script.Components.ChromeWindowWrapper),
	ReportAudioPopup = require(script.Components.ReportAudioPopup),
	ReportAudioPopupContext = require(script.Components.ReportAudioPopupContext),
	ReportSongDialog = require(script.Components.ReportSongDialog),
	DebugAudioEmitters = require(script.Components.DebugAudioEmitters),
	useCurrentSong = require(script.Hooks.useCurrentSong),
	useSongAlbumArt = require(script.Hooks.useSongAlbumArt),
	useAudioMetadata = require(script.Hooks.useAudioMetadata),
	["jest.config"] = script["jest.config"]
}