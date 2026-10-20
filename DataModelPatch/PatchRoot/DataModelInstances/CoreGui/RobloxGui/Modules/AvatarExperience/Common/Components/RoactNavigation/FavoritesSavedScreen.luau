local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local FoundationModule = require(CorePackages.Packages.Foundation)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local FullView = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Enums.FullView
local FavoritesSavedView = require(CorePackages.Workspace.Packages.AvatarExperienceFavoritesManager).Components.FavoritesSavedView
local Common = Modules.AvatarExperience.Common
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local NamedRefsContextModule = require(Common.Context.NamedRefsContext)
local UseOverlayClosedCallbackModule = require(Common.Hooks.useOverlayClosedCallback)
local UseAvatarExperienceFocusNavigationBindingsModule = require(Common.Hooks.useAvatarExperienceFocusNavigationBindings)
local UseFullViewModule = require(Common.Hooks.useFullView)
local NavigationEventsLoggerModule = require(Common.Components.RoactNavigation.Debug.NavigationEventsLogger)
local AvatarExperienceViewModule = require(Common.Components.AvatarExperienceView)
local FavoritesSavedTopBarModule = require(Common.Components.TopBar.FavoritesSavedTopBar)

return require(Common.Components.RoactNavigation.withStackVisibilityWrapper)(function(_)
	-- upvalues: ReactModule (copy), UseOverlayClosedCallbackModule (copy), UseFullViewModule (copy), FullView (copy), NamedRefsContextModule (copy), RoactGamepadModule (copy), UseAvatarExperienceFocusNavigationBindingsModule (copy), AvatarScreen (copy), UtilsModule (copy), FoundationModule (copy), NavigationEventsLoggerModule (copy), AvatarExperienceViewModule (copy), FavoritesSavedTopBarModule (copy), FavoritesSavedView (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseOverlayClosedCallbackModuleResult = UseOverlayClosedCallbackModule()
	local UseFullViewModuleResult, UseFullViewModuleResult2 = UseFullViewModule()
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "size-full gui-object-defaults",
		ref = UseAvatarExperienceFocusNavigationBindingsModule({
			overlayClosedCallback = UseOverlayClosedCallbackModuleResult
		}, ReactModule.useContext(NamedRefsContextModule)[AvatarScreen.FavoritesSaved])
	}, {
		NavigationEventsLogger = ReactModule.createElement(NavigationEventsLoggerModule, { pageName = AvatarScreen.FavoritesSaved }),
		AvatarExperienceView = ReactModule.createElement(AvatarExperienceViewModule, {
			allowAdaptiveScrolling = true,
			bottomBarEnabled = false,
			changeViewFunction = ReactModule.useCallback(function()
				-- upvalues: UtilsModule (upval), UseFullViewModuleResult (copy), UseFullViewModuleResult2 (copy)
				UseFullViewModuleResult2((UtilsModule.getNewFullViewEnum(UseFullViewModuleResult)))
			end, { UseFullViewModuleResult, UseFullViewModuleResult2 }),
			isSceneFullView = UseFullViewModuleResult == FullView.SceneFullView,
			isUIFullView = UseFullViewModuleResult == FullView.UIFullView,
			topBar = ReactModule.createElement(FavoritesSavedTopBarModule, { topBarRef = ReactModule.useRef(nil) }),
			refinementButtonsRef = ReactModule.useRef(nil),
			quickButtonsRef = ReactModule.useRef(nil),
			ref = ReactModule.useRef(nil),
			multiTryOnBottomBarRef = UseRefResult,
			itemDetailsPeekViewRefs = RoactGamepadModule.useRefCache()
		}, {
			FavoritesSavedView = ReactModule.createElement(FavoritesSavedView)
		})
	})
end)