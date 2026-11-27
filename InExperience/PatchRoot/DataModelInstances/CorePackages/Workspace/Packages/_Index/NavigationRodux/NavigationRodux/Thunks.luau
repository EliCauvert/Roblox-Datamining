local NavigationRodux = script:FindFirstAncestor("NavigationRodux")

return {
	NavigateBack = require(NavigationRodux.Thunks.NavigateBack),
	NavigateDown = require(NavigationRodux.Thunks.NavigateDown),
	NavigateSideways = require(NavigationRodux.Thunks.NavigateSideways),
	NavigateToRoute = require(NavigationRodux.Thunks.NavigateToRoute),
	NavigateFromWebView = require(NavigationRodux.Thunks.NavigateFromWebView),
	RNAdapterThunk = require(NavigationRodux.Thunks.RNAdapterThunk),
	SetNavigationLocked = require(NavigationRodux.Thunks.SetNavigationLocked),
	NavigateDownToGroups = require(NavigationRodux.Thunks.NavigateDownToGroups),
	NavigateDownToNotifications = require(NavigationRodux.Thunks.NavigateDownToNotifications),
	NavigateDownToPrivacySettings = require(NavigationRodux.Thunks.NavigateDownToPrivacySettings),
	NavigateDownToNotificationSettings = require(NavigationRodux.Thunks.NavigateDownToNotificationSettings),
	NavigateDownToReportAbuse = require(NavigationRodux.Thunks.NavigateDownToReportAbuse),
	NavigateDownToViewUserProfile = require(NavigationRodux.Thunks.NavigateDownToViewUserProfile)
}