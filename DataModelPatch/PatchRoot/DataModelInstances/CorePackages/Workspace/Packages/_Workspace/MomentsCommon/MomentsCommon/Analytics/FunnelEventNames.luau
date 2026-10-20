local FunnelTypes = {
	AppNavigation = "App Navigation",
	CreationFlow = "Creation Flow",
	MusicEnhancement = "Music Enhancement",
	TextOverlayEnhancement = "Text Enhancement",
	TrimEnhancement = "Trim Enhancement"
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
local TrimEnhancementSteps = {
	TrimButtonPressed = "TrimButtonPressed",
	TrimCompleted = "TrimCompleted"
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
		}
	},
	CreationIntentSource = { TopBar = "TopBar" },
	AppNavigationSteps = AppNavigationSteps,
	CreationFlowSteps = CreationFlowSteps,
	MusicEnhancementSteps = MusicEnhancementSteps,
	TrimEnhancementSteps = TrimEnhancementSteps,
	TextOverlayEnhancementSteps = TextOverlayEnhancementSteps
}