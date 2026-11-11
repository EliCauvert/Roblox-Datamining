local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local View = require(CorePackages.Packages.Foundation).View
local TopBarModule = require(Modules.LuaApp.Components.TopBar.TopBar)
local AvatarExperienceViewModule = require(Modules.AvatarExperience.Common.Components.AvatarExperienceView)
local ProfilePlatformUniversalAppWrapperModule = require(Modules.LuaApp.Components.ProfilePlatform.ProfilePlatformUniversalAppWrapper)
local AXTransitionSegmentedMenuModule = require(Modules.AvatarExperience.Common.Components.AXTransitionSegmentedMenu)
local RetainTopBarOnProfileTabPageView = game:DefineFastFlag("RetainTopBarOnProfileTabPageView", false)

return function(p1)
	-- upvalues: RetainTopBarOnProfileTabPageView (copy), ReactModule (copy), TopBarModule (copy), AXTransitionSegmentedMenuModule (copy), View (copy), AvatarExperienceViewModule (copy), ProfilePlatformUniversalAppWrapperModule (copy)
	local Element = if RetainTopBarOnProfileTabPageView or p1.isAtProfileRoot then ReactModule.createElement(TopBarModule.Container, {
		useParentSizeForCenterItem = true,
		ZIndex = 2,
		leftItem = p1.leftItem,
		centerItem = AXTransitionSegmentedMenuModule,
		transparentBackground = p1.topBarTransparent
	}) else nil
	
	return ReactModule.createElement(View, {
		tag = {
			["data-testid=ProfileTabPageView"] = true,
			["size-full"] = true
		}
	}, {
		AvatarExperienceView = ReactModule.createElement(AvatarExperienceViewModule, {
			isSceneFullView = false,
			showUndoRedo = true,
			showSaveButton = false,
			isUIFullView = p1.isPortrait,
			topBar = if p1.isPortrait then nil else Element
		}, {
			ProfileWrapper = ReactModule.createElement(ProfilePlatformUniversalAppWrapperModule, p1.wrapperProps)
		}),
		OverlayTopBar = if p1.isOverlayTopBarVisible then Element else nil
	})
end