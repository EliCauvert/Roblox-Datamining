local _ = require(script.Analytics.VideoAnalyticsTypes)

return {
	FeedVideoPlaybackContext = require(script.FeedVideoPlaybackContext),
	VideoPlaybackCoordinator = require(script.VideoPlaybackCoordinator),
	VideoPlaybackDetector = require(script.VideoPlaybackDetector),
	ViewportVideoAutoplayController = require(script.ViewportVideoAutoplayController),
	ViewportVideoAutoplaySync = require(script.ViewportVideoAutoplaySync),
	VideoPlayer = require(script.VideoPlayer),
	AnalyticsEnums = require(script.Analytics.Enums),
	VideoLogger = require(script.Analytics.VideoLogger),
	getIsInstanceVisible = require(script.getIsInstanceVisible),
	RoundIconButton = require(script.RoundIconButton),
	useCanDevicePlayVideoPreview = require(script.useCanDevicePlayVideoPreview),
	useTagAsViewportAutoplayCandidate = require(script.useTagAsViewportAutoplayCandidate),
	EdpVideoBlockingConfig = require(script.EdpVideoBlockingConfig),
	VideoBlockingHelpers = require(script.VideoBlockingHelpers),
	["jest.config"] = script["jest.config"]
}