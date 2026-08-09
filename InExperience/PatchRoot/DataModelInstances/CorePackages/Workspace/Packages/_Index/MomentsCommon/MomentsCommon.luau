local _ = require(script.Media.MediaTypes)

return {
	Analytics = require(script.Analytics),
	Flags = { ArgusExperiment = require(script.Flags.ArgusExperiment) },
	Components = {
		GradientBackdrop = require(script.Components.GradientBackdrop),
		MusicThumbnailIcon = require(script.Components.MusicThumbnailIcon),
		Reaction = require(script.Components.Reaction.Reaction),
		TextOverlay = require(script.Components.TextOverlay),
		TextOverlayDisplay = require(script.Components.TextOverlayDisplay)
	},
	Enums = {
		FormFactor = require(script.Enums.FormFactor),
		LoadingState = require(script.Enums.LoadingState),
		MusicThumbnailIconSize = require(script.Enums.MusicThumbnailIconSize),
		ReactionSize = require(script.Enums.ReactionSize),
		ReactionType = require(script.Enums.ReactionType)
	},
	Hooks = {
		useDeviceInsets = require(script.Hooks.useDeviceInsets),
		useFormFactor = require(script.Hooks.useFormFactor),
		useImageLoadingState = require(script.Hooks.useImageLoadingState),
		useMomentsGating = function(...) --[[ line: 63 ]]
			return require(script.Hooks.useMomentsGating)(...)
		end,
		useScreenSize = require(script.Hooks.useScreenSize),
		useToggleState = require(script.Hooks.useToggleState)
	},
	ScrollingGridView = require(script.Components.ScrollingGridView),
	Media = {
		createMediaPreloadCoordinator = require(script.Media.createMediaPreloadCoordinator),
		mediaTelemetry = require(script.Media.Telemetry.mediaTelemetry),
		selectPreloadPolicy = require(script.Media.Preload.selectPreloadPolicy),
		MediaPreloadProvider = require(script.Media.Components.MediaPreloadProvider),
		MomentMediaView = require(script.Media.Components.MomentMediaView),
		MomentMediaTile = require(script.Media.Components.MomentMediaTile),
		useMomentMediaController = require(script.Media.Components.useMomentMediaController),
		feedPlaybackSuspension = require(script.Media.feedPlaybackSuspension)
	},
	Performance = require(script.Performance),
	Utils = {
		clampTextOverlayPosition = require(script.Utils.clampTextOverlayPosition),
		getCropSize = require(script.Utils.getCropSize),
		getEasingNumberSequence = require(script.Utils.getEasingNumberSequence),
		getFitSize = require(script.Utils.getFitSize),
		getScale = require(script.Utils.getScale),
		isStudio = require(script.Utils.isStudio),
		Oklab = require(script.Utils.Oklab)
	},
	["jest.config"] = script["jest.config"]
}