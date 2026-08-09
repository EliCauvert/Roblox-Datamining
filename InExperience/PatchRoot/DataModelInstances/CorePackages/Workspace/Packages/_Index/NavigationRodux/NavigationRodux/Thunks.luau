local navigationRodux = script:FindFirstAncestor("NavigationRodux")

return {
	NavigateBack = require(navigationRodux.Thunks.NavigateBack),
	NavigateDown = require(navigationRodux.Thunks.NavigateDown),
	NavigateSideways = require(navigationRodux.Thunks.NavigateSideways),
	NavigateToRoute = require(navigationRodux.Thunks.NavigateToRoute),
	NavigateFromWebView = require(navigationRodux.Thunks.NavigateFromWebView),
	RNAdapterThunk = require(navigationRodux.Thunks.RNAdapterThunk),
	SetNavigationLocked = require(navigationRodux.Thunks.SetNavigationLocked),
	NavigateDownToGroups = require(navigationRodux.Thunks.NavigateDownToGroups),
	NavigateDownToNotifications = require(navigationRodux.Thunks.NavigateDownToNotifications),
	NavigateDownToPrivacySettings = require(navigationRodux.Thunks.NavigateDownToPrivacySettings),
	NavigateDownToReportAbuse = require(navigationRodux.Thunks.NavigateDownToReportAbuse),
	NavigateDownToViewUserProfile = require(navigationRodux.Thunks.NavigateDownToViewUserProfile)
}