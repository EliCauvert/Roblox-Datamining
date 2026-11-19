local _ = require(script.Parent.Types)

local function _(p1: number): number
	return math.max(p1, 0) / 1000
end

local _ = function(p1: number): number
	return math.max(p1, 0) / 100
end

return {
	warmUpSeconds = math.max(game:DefineFastInt("AXAutoplayWarmUpMs", 300), 0) / 1000,
	crossfadeSeconds = math.max(game:DefineFastInt("AXAutoplayCrossfadeMs", 350), 0) / 1000,
	trackBlendSeconds = math.max(game:DefineFastInt("AXAutoplayTrackBlendMs", 100), 0) / 1000,
	minLoopedPlaySeconds = math.max(game:DefineFastInt("AXAutoplayMinLoopedPlayMs", 2000), 0) / 1000,
	unknownLengthPlaySeconds = math.max(game:DefineFastInt("AXAutoplayUnknownLengthPlayMs", 2000), 0) / 1000,
	animationLengthTimeoutSeconds = math.max(game:DefineFastInt("AXAutoplayAnimationLengthTimeoutMs", 3000), 0) / 1000,
	animationLengthPollSeconds = math.max(math.max(game:DefineFastInt("AXAutoplayAnimationLengthPollMs", 50), 0) / 1000, 0.01),
	requestedAnimationTimeoutSeconds = math.max(game:DefineFastInt("AXAutoplayRequestedAnimationTimeoutMs", 5000), 0) / 1000,
	failedTileSkipSeconds = math.max(game:DefineFastInt("AXAutoplayFailedTileSkipMs", 0), 0) / 1000,
	spinPeriodSeconds = math.max(math.max(game:DefineFastInt("AXAutoplaySpinPeriodMs", 5000), 0) / 1000, 0.1),
	cameraFieldOfView = math.clamp(game:DefineFastInt("AXAutoplayCameraFieldOfView", 30), 1, 120),
	cameraPitch = math.rad((game:DefineFastInt("AXAutoplayCameraPitchDegrees", 5))),
	cameraYaw = math.rad((game:DefineFastInt("AXAutoplayCameraYawDegrees", 0))),
	spinFramingPadding = math.max(game:DefineFastInt("AXAutoplaySpinFramingPaddingPercent", 105), 0) / 100,
	animationFramingPadding = math.max(game:DefineFastInt("AXAutoplayAnimationFramingPaddingPercent", 125), 0) / 100,
	rowRefreshSeconds = math.max(game:DefineFastInt("AXAutoplayRowRefreshMs", 100), 0) / 1000,
	carouselMinVisibleFraction = math.max(game:DefineFastInt("AXAutoplayCarouselMinVisiblePercent", 50), 0) / 100,
	rowAdvanceDelaySeconds = math.max(game:DefineFastInt("AXAutoplayRowAdvanceDelayMs", 0), 0) / 1000,
	startDelaySeconds = math.max(game:DefineFastInt("AXAutoplayStartDelayMs", 250), 0) / 1000,
	telemetrySampleRate = math.clamp(game:DefineFastInt("AXAutoplayTelemetrySampleRate", 0), 0, 1000)
}