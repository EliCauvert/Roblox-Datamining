local registerCustomGetStateForActionModule = require(script.NavigationActions.RegisterCustomGetStateForAction)
local customGetStateForActionModule = require(script.Enums.CustomGetStateForAction)
local _ = require(script.AvatarRoute.Types)
local _ = require(script.Types.NavigationType)

return {
	AvatarRoute = {
		Context = {
			AvatarRouteContext = require(script.AvatarRoute.Context.AvatarRouteContext)
		},
		Hooks = {
			useAvatarRoute = require(script.AvatarRoute.Hooks.useAvatarRoute)
		},
		RouteInfo = require(script.AvatarRoute.RouteInfo),
		AvatarRoute = require(script.AvatarRoute.AvatarRoute),
		AvatarScreenProperties = require(script.AvatarRoute.AvatarScreenProperties),
		getActiveAvatarScreen = require(script.AvatarRoute.getActiveAvatarScreen)
	},
	Enums = {
		AvatarScreen = require(script.Enums.AvatarScreen),
		AvatarEditorNavigation = require(script.Enums.AvatarEditorNavigation),
		AvatarRootNavigationAction = require(script.Enums.AvatarRootNavigationAction),
		UnifiedLoggingSurface = require(script.Enums.UnifiedLoggingSurface),
		CustomGetStateForAction = customGetStateForActionModule
	},
	Actions = {
		DeregisterCustomGetStateForAction = require(script.NavigationActions.DeregisterCustomGetStateForAction),
		RegisterCustomGetStateForAction = registerCustomGetStateForActionModule,
		ClearScreens = require(script.NavigationActions.ClearScreens)
	},
	Debug = {
		logOnOverlayClosed = require(script.Debug.logOnOverlayClosed)
	},
	withMappedNavigationParams = require(script.withMappedNavigationParams),
	Thunks = {
		NavigateWithLock = require(script.Thunks.NavigateWithLock)
	},
	["jest.config"] = script["jest.config"]
}