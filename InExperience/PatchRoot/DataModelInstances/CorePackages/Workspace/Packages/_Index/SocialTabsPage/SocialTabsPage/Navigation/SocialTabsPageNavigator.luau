local SocialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local Parent = SocialTabsPage.Parent
local ReactModule = require(Parent.React)
local RoactNavigationModule = require(Parent.RoactNavigation)
local UseNavigationPropsFunction = require(Parent.RobloxAppNavigation).useNavigationProps
local SocialTabsPageModule = require(SocialTabsPage.Components.SocialTabsPage)
local UseProfileDockedPanelWidthFunction = require(Parent.ProfilePlatformCommon).Hooks.useProfileDockedPanelWidth
local UseIsProfileSplitDetailFunction = require(Parent.ProfilePlatformCommon).Hooks.useIsProfileSplitDetail
local UseStatusBarHeightFunction = require(Parent.RobloxAppHooks).useStatusBarHeight
local FFlagSocialTabsPageSplitPaneLayout = require(Parent.SharedFlags).FFlagSocialTabsPageSplitPaneLayout
local RobloxSwitchNavigator = RoactNavigationModule.createRobloxSwitchNavigator(require(script.Parent.SocialTabsPageRouter), {
	resetOnBlur = false,
	keepVisitedScreensMounted = true,
	backBehavior = RoactNavigationModule.BackBehavior.None
})

local function SocialTabsPageNavigatorComponent(p1)
	-- upvalues: UseNavigationPropsFunction (copy), UseProfileDockedPanelWidthFunction (copy), FFlagSocialTabsPageSplitPaneLayout (copy), UseIsProfileSplitDetailFunction (copy), UseStatusBarHeightFunction (copy), ReactModule (copy), RobloxSwitchNavigator (copy), SocialTabsPageModule (copy)
	local Navigation = p1.navigation
	local UseNavigationPropsResult = UseNavigationPropsFunction(function(_, p2)
		return {
			profileId = p2.profileId,
			title = p2.title,
			initialTabId = p2.initialTabId,
			tabConfig = p2.tabConfig,
			dockToProfilePanel = p2.dockToProfilePanel
		}
	end)
	local UseIsProfileSplitDetailResult = if FFlagSocialTabsPageSplitPaneLayout then UseIsProfileSplitDetailFunction() else false
	local UseStatusBarHeightResult = if FFlagSocialTabsPageSplitPaneLayout then UseStatusBarHeightFunction() else 0
	
	return ReactModule.createElement(SocialTabsPageModule, {
		renderNavigator = ReactModule.useCallback(function()
			-- upvalues: ReactModule (upval), RobloxSwitchNavigator (upval), Navigation (copy)
			return ReactModule.createElement(RobloxSwitchNavigator, { navigation = Navigation })
		end, { Navigation }),
		tabConfig = UseNavigationPropsResult.tabConfig,
		profileId = UseNavigationPropsResult.profileId,
		title = UseNavigationPropsResult.title,
		initialTabId = UseNavigationPropsResult.initialTabId,
		pageWidth = UseProfileDockedPanelWidthFunction(UseNavigationPropsResult.dockToProfilePanel),
		fillContainer = if FFlagSocialTabsPageSplitPaneLayout and UseIsProfileSplitDetailResult then true else nil,
		topInset = if FFlagSocialTabsPageSplitPaneLayout and UseIsProfileSplitDetailResult then UseStatusBarHeightResult else nil,
		hideBackButton = if FFlagSocialTabsPageSplitPaneLayout and UseIsProfileSplitDetailResult then true else nil
	})
end

local SocialTabsPageNavigatorClassWrapper = ReactModule.PureComponent:extend("SocialTabsPageNavigatorClassWrapper")

function SocialTabsPageNavigatorClassWrapper.render(p1)
	-- upvalues: ReactModule (copy), SocialTabsPageNavigatorComponent (copy)
	return ReactModule.createElement(SocialTabsPageNavigatorComponent, p1.props)
end

SocialTabsPageNavigatorClassWrapper.router = RobloxSwitchNavigator.router

return SocialTabsPageNavigatorClassWrapper