local FunnelTypes = {
	AppNavigation = "App Navigation",
	CreationFlow = "Creation Flow",
	MusicEnhancement = "Music Enhancement",
	TextOverlayEnhancement = "Text Enhancement",
	StickerOverlayEnhancement = "Sticker Enhancement",
	TrimEnhancement = "Trim Enhancement",
	VoiceEnhancement = "Voice Enhancement",
	DraftRecovery = "Draft Recovery"
}
local AppNavigationSteps = {
	AppLaunched = "AppLaunched",
	TrendingScreenView = "TrendingScreenView",
	MyMomentsScreenView = "MyMomentsScreenView",
	UserProfileScreenView = "UserProfileScreenView"
}
local CreationFlowSteps = {
	CreateIntent = "CreateIntent",
	GalleryItemSelected = "GalleryItemSelected",
	GalleryItemSelectedContinuePressed = "GalleryItemSelectedContinuePressed",
	EditingScreenContinuePressed = "EditingScreenContinuePressed",
	Published = "Published"
}
local MusicEnhancementSteps = {
	MusicButtonPressed = "MusicButtonPressed",
	MusicSelected = "MusicSelected",
	MusicApplied = "MusicApplied"
}
local TextOverlayEnhancementSteps = {
	TextOverlayButtonPressed = "TextOverlayButtonPressed",
	TextOverlayCompleted = "TextOverlayCompleted"
}
local StickerOverlayEnhancementSteps = {
	StickerOverlayButtonPressed = "StickerOverlayButtonPressed",
	StickerOverlaySelected = "StickerOverlaySelected",
	StickerOverlayCompleted = "StickerOverlayCompleted"
}
local TrimEnhancementSteps = {
	TrimButtonPressed = "TrimButtonPressed",
	TrimCompleted = "TrimCompleted"
}
local VoiceEnhancementSteps = {
	VoiceButtonPressed = "VoiceButtonPressed",
	VoiceTextEntered = "VoiceTextEntered",
	VoiceGeneratePressed = "VoiceGeneratePressed",
	VoiceGenerateSucceeded = "VoiceGenerateSucceeded",
	VoiceApplied = "VoiceApplied"
}
local DraftRecoverySteps = {
	DraftRestored = "DraftRestored",
	DraftPublished = "DraftPublished"
}

return {
	FunnelTypes = FunnelTypes,
	FunnelSteps = {
		[FunnelTypes.AppNavigation] = {
			[AppNavigationSteps.AppLaunched] = { stepNumber = 1, stepName = "App Launched" },
			[AppNavigationSteps.TrendingScreenView] = { stepNumber = 2, stepName = "Trending Screen View" },
			[AppNavigationSteps.MyMomentsScreenView] = { stepNumber = 3, stepName = "My Moments Screen View" },
			[AppNavigationSteps.UserProfileScreenView] = { stepNumber = 4, stepName = "User Profile Screen View" }
		},
		[FunnelTypes.CreationFlow] = {
			[CreationFlowSteps.CreateIntent] = { stepNumber = 1, stepName = "Create Intent" },
			[CreationFlowSteps.GalleryItemSelected] = { stepNumber = 2, stepName = "Gallery Item Selected" },
			[CreationFlowSteps.GalleryItemSelectedContinuePressed] = {
				stepNumber = 3,
				stepName = "Gallery Item Selected Continue Pressed"
			},
			[CreationFlowSteps.EditingScreenContinuePressed] = {
				stepNumber = 4,
				stepName = "Editing Screen Continue Pressed"
			},
			[CreationFlowSteps.Published] = { stepNumber = 5, stepName = "Published" }
		},
		[FunnelTypes.MusicEnhancement] = {
			[MusicEnhancementSteps.MusicButtonPressed] = { stepNumber = 1, stepName = "Music Button Pressed" },
			[MusicEnhancementSteps.MusicSelected] = { stepNumber = 2, stepName = "Music Selected" },
			[MusicEnhancementSteps.MusicApplied] = { stepNumber = 3, stepName = "Music Applied" }
		},
		[FunnelTypes.TrimEnhancement] = {
			[TrimEnhancementSteps.TrimButtonPressed] = { stepNumber = 1, stepName = "Trim Button Pressed" },
			[TrimEnhancementSteps.TrimCompleted] = { stepNumber = 2, stepName = "Trim Completed" }
		},
		[FunnelTypes.TextOverlayEnhancement] = {
			[TextOverlayEnhancementSteps.TextOverlayButtonPressed] = { stepNumber = 1, stepName = "Text Overlay Button Pressed" },
			[TextOverlayEnhancementSteps.TextOverlayCompleted] = { stepNumber = 2, stepName = "Text Overlay Completed" }
		},
		[FunnelTypes.StickerOverlayEnhancement] = {
			[StickerOverlayEnhancementSteps.StickerOverlayButtonPressed] = {
				stepNumber = 1,
				stepName = "Sticker Overlay Button Pressed"
			},
			[StickerOverlayEnhancementSteps.StickerOverlaySelected] = { stepNumber = 2, stepName = "Sticker Overlay Selected" },
			[StickerOverlayEnhancementSteps.StickerOverlayCompleted] = { stepNumber = 3, stepName = "Sticker Overlay Completed" }
		},
		[FunnelTypes.VoiceEnhancement] = {
			[VoiceEnhancementSteps.VoiceButtonPressed] = { stepNumber = 1, stepName = "Voice Button Pressed" },
			[VoiceEnhancementSteps.VoiceTextEntered] = { stepNumber = 2, stepName = "Voice Text Entered" },
			[VoiceEnhancementSteps.VoiceGeneratePressed] = { stepNumber = 3, stepName = "Voice Generate Pressed" },
			[VoiceEnhancementSteps.VoiceGenerateSucceeded] = { stepNumber = 4, stepName = "Voice Generate Succeeded" },
			[VoiceEnhancementSteps.VoiceApplied] = { stepNumber = 5, stepName = "Voice Applied" }
		},
		[FunnelTypes.DraftRecovery] = {
			[DraftRecoverySteps.DraftRestored] = { stepNumber = 1, stepName = "Draft Restored" },
			[DraftRecoverySteps.DraftPublished] = { stepNumber = 2, stepName = "Draft Published" }
		}
	},
	CreationIntentSource = { Captures = "Captures", TopBar = "TopBar" },
	AppNavigationSteps = AppNavigationSteps,
	CreationFlowSteps = CreationFlowSteps,
	MusicEnhancementSteps = MusicEnhancementSteps,
	TrimEnhancementSteps = TrimEnhancementSteps,
	TextOverlayEnhancementSteps = TextOverlayEnhancementSteps,
	StickerOverlayEnhancementSteps = StickerOverlayEnhancementSteps,
	VoiceEnhancementSteps = VoiceEnhancementSteps,
	DraftRecoverySteps = DraftRecoverySteps
}