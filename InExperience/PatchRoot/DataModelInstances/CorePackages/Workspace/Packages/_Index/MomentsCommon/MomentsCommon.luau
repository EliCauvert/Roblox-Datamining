local _ = require(script.Media.MediaTypes)

return {
	Analytics = require(script.Analytics),
	canRenderNativeMoments = function(p1)
		return p1.isTabEnabled or p1.isFlyoutEntryEnabled and p1.platformIntegrationEnabled
	end,
	Flags = {
		ArgusExperiment = require(script.Flags.ArgusExperiment),
		GetFFlagEnableMomentTextGeneration = require(script.Flags.GetFFlagEnableMomentTextGeneration),
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
		FFlagMomentsUploadOutcomeTelemetry = require(script.Flags.FFlagMomentsUploadOutcomeTelemetry),
		FFlagMomentsContentStatsTelemetry = require(script.Flags.FFlagMomentsContentStatsTelemetry),
		FFlagMomentTextGenerationFilteredSignal = require(script.Flags.FFlagMomentTextGenerationFilteredSignal),
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
		useMomentsGating = function(...)
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