local t = {
	AppNavigation = "App Navigation",
	CreationFlow = "Creation Flow",
	MusicEnhancement = "Music Enhancement",
	TextOverlayEnhancement = "Text Enhancement",
	StickerOverlayEnhancement = "Sticker Enhancement",
	TrimEnhancement = "Trim Enhancement",
	DraftRecovery = "Draft Recovery"
}
local t_1 = {
	AppLaunched = "AppLaunched",
	TrendingScreenView = "TrendingScreenView",
	MyMomentsScreenView = "MyMomentsScreenView",
	UserProfileScreenView = "UserProfileScreenView"
}
local t_2 = { TopBar = "TopBar" }
local t_3 = {
	CreateIntent = "CreateIntent",
	GalleryItemSelected = "GalleryItemSelected",
	GalleryItemSelectedContinuePressed = "GalleryItemSelectedContinuePressed",
	EditingScreenContinuePressed = "EditingScreenContinuePressed",
	Published = "Published"
}
local t_4 = {
	MusicButtonPressed = "MusicButtonPressed",
	MusicSelected = "MusicSelected",
	MusicApplied = "MusicApplied"
}
local t_5 = {
	TextOverlayButtonPressed = "TextOverlayButtonPressed",
	TextOverlayCompleted = "TextOverlayCompleted"
}
local t_6 = {
	StickerOverlayButtonPressed = "StickerOverlayButtonPressed",
	StickerOverlaySelected = "StickerOverlaySelected",
	StickerOverlayCompleted = "StickerOverlayCompleted"
}
local t_7 = {
	TrimButtonPressed = "TrimButtonPressed",
	TrimCompleted = "TrimCompleted"
}
local t_8 = {
	DraftRestored = "DraftRestored",
	DraftPublished = "DraftPublished"
}

return {
	FunnelTypes = t,
	FunnelSteps = {
		[t.AppNavigation] = {
			[t_1.AppLaunched] = { stepNumber = 1, stepName = "App Launched" },
			[t_1.TrendingScreenView] = { stepNumber = 2, stepName = "Trending Screen View" },
			[t_1.MyMomentsScreenView] = { stepNumber = 3, stepName = "My Moments Screen View" },
			[t_1.UserProfileScreenView] = { stepNumber = 4, stepName = "User Profile Screen View" }
		},
		[t.CreationFlow] = {
			[t_3.CreateIntent] = { stepNumber = 1, stepName = "Create Intent" },
			[t_3.GalleryItemSelected] = { stepNumber = 2, stepName = "Gallery Item Selected" },
			[t_3.GalleryItemSelectedContinuePressed] = {
				stepNumber = 3,
				stepName = "Gallery Item Selected Continue Pressed"
			},
			[t_3.EditingScreenContinuePressed] = {
				stepNumber = 4,
				stepName = "Editing Screen Continue Pressed"
			},
			[t_3.Published] = { stepNumber = 5, stepName = "Published" }
		},
		[t.MusicEnhancement] = {
			[t_4.MusicButtonPressed] = { stepNumber = 1, stepName = "Music Button Pressed" },
			[t_4.MusicSelected] = { stepNumber = 2, stepName = "Music Selected" },
			[t_4.MusicApplied] = { stepNumber = 3, stepName = "Music Applied" }
		},
		[t.TrimEnhancement] = {
			[t_7.TrimButtonPressed] = { stepNumber = 1, stepName = "Trim Button Pressed" },
			[t_7.TrimCompleted] = { stepNumber = 2, stepName = "Trim Completed" }
		},
		[t.TextOverlayEnhancement] = {
			[t_5.TextOverlayButtonPressed] = { stepNumber = 1, stepName = "Text Overlay Button Pressed" },
			[t_5.TextOverlayCompleted] = { stepNumber = 2, stepName = "Text Overlay Completed" }
		},
		[t.StickerOverlayEnhancement] = {
			[t_6.StickerOverlayButtonPressed] = {
				stepNumber = 1,
				stepName = "Sticker Overlay Button Pressed"
			},
			[t_6.StickerOverlaySelected] = { stepNumber = 2, stepName = "Sticker Overlay Selected" },
			[t_6.StickerOverlayCompleted] = { stepNumber = 3, stepName = "Sticker Overlay Completed" }
		},
		[t.DraftRecovery] = {
			[t_8.DraftRestored] = { stepNumber = 1, stepName = "Draft Restored" },
			[t_8.DraftPublished] = { stepNumber = 2, stepName = "Draft Published" }
		}
	},
	CreationIntentSource = t_2,
	AppNavigationSteps = t_1,
	CreationFlowSteps = t_3,
	MusicEnhancementSteps = t_4,
	TrimEnhancementSteps = t_7,
	TextOverlayEnhancementSteps = t_5,
	StickerOverlayEnhancementSteps = t_6,
	DraftRecoverySteps = t_8
}