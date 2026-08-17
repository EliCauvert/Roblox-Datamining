local _ = require(script.Media.MediaTypes)

return {
	Analytics = require(script.Analytics),
	canRenderNativeMoments = function(p0) --[[ line: 97 ]]
		return p0.isTabEnabled or p0.isFlyoutEntryEnabled and p0.platformIntegrationEnabled
	end,
	Flags = {
		ArgusExperiment = require(script.Flags.ArgusExperiment),
		GetFFlagMomentsAnalyticsProducerPrereqs = require(script.Flags.GetFFlagMomentsAnalyticsProducerPrereqs),
		GetFFlagMomentsCreationSaveDraft = require(script.Flags.GetFFlagMomentsCreationSaveDraft),
		GetFFlagMomentsStickerButton = require(script.Flags.GetFFlagMomentsStickerButton),
		GetFFlagMomentsAnalyticsSchemaIdentity = require(script.Flags.GetFFlagMomentsAnalyticsSchemaIdentity),
		FFlagMomentsFeedHealthAnalytics = require(script.Flags.FFlagMomentsFeedHealthAnalytics),
		FFlagMomentsMediaSmoothnessTelemetry = require(script.Flags.FFlagMomentsMediaSmoothnessTelemetry),
		FFlagMomentsProfileGridInfiniteLoad = require(script.Flags.FFlagMomentsProfileGridInfiniteLoad),
		FFlagMomentsRealtimeObservability = require(script.Flags.FFlagMomentsRealtimeObservability),
		FFlagMomentsRealtimeSessionTelemetry = require(script.Flags.FFlagMomentsRealtimeSessionTelemetry),
		FFlagMomentsSessionHeartbeat = require(script.Flags.FFlagMomentsSessionHeartbeat),
		FFlagMomentsContentStatsTelemetry = require(script.Flags.FFlagMomentsContentStatsTelemetry),
		GetFFlagMomentsUseUploadPostAsync = require(script.Flags.GetFFlagMomentsUseUploadPostAsync)
	},
	Components = {
		GradientBackdrop = require(script.Components.GradientBackdrop),
		MusicThumbnailIcon = require(script.Components.MusicThumbnailIcon),
		Reaction = require(script.Components.Reaction.Reaction),
		OverlayDisplay = require(script.Components.OverlayDisplay),
		TextOverlay = require(script.Components.TextOverlay),
		TextOverlayDisplay = require(script.Components.TextOverlayDisplay),
		StickerOverlay = require(script.Components.StickerOverlay),
		ReactionAssets = require(script.Components.Reaction.ReactionAssets)
	},
	Enums = {
		CaptureKind = require(script.Enums.CaptureKind),
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
		useMomentsGating = function(...) --[[ line: 101 ]]
			return require(script.Hooks.useMomentsGating)(...)
		end,
		useScreenSize = require(script.Hooks.useScreenSize),
		useStatusBarHeight = require(script.Hooks.useStatusBarHeight),
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
		feedPlaybackSuspension = require(script.Media.feedPlaybackSuspension),
		reportModalCovering = require(script.Media.reportModalCovering)
	},
	Performance = require(script.Performance),
	Utils = {
		clampOverlayPosition = require(script.Utils.clampOverlayPosition),
		clampTextOverlayPosition = require(script.Utils.clampOverlayPosition),
		getCropSize = require(script.Utils.getCropSize),
		getEasingNumberSequence = require(script.Utils.getEasingNumberSequence),
		getFitSize = require(script.Utils.getFitSize),
		getScale = require(script.Utils.getScale),
		isStudio = require(script.Utils.isStudio),
		Oklab = require(script.Utils.Oklab)
	},
	["jest.config"] = script["jest.config"]
}