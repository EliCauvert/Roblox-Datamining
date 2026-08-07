return {
	useLazyFmod = require(script.Hooks.useLazyFmod),
	getAudioPlaybackStore = require(script.Stores.getAudioPlaybackStore),
	useAudioStore = require(script.Hooks.useAudioStore),
	useLastPlayedAudioStore = require(script.Hooks.useLastPlayedAudioStore),
	enableAudioPlaybackInApp = require(script.Common.enableAudioPlaybackInApp),
	getFFlagAudioPreviewLua = require(script.Flags.getFFlagAudioPreviewLua),
	["jest.config"] = script["jest.config"]
}