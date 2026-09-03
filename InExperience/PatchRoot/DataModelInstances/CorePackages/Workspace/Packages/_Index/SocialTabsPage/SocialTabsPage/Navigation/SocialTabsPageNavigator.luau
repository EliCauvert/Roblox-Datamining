local socialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local parent = socialTabsPage.Parent
local reactModule = require(parent.React)
local roactNavigationModule = require(parent.RoactNavigation)
local useNavigationProps = require(parent.RobloxAppNavigation).useNavigationProps
local socialTabsPageModule = require(socialTabsPage.Components.SocialTabsPage)
local useProfileDockedPanelWidth = require(parent.ProfilePlatformCommon).Hooks.useProfileDockedPanelWidth
local var1 = roactNavigationModule.createRobloxSwitchNavigator(require(script.Parent.SocialTabsPageRouter), {
	resetOnBlur = false,
	keepVisitedScreensMounted = true,
	backBehavior = roactNavigationModule.BackBehavior.None
})

local function SocialTabsPageNavigatorComponent(value)
	-- upvalues: useNavigationProps (ref), useProfileDockedPanelWidth (ref), reactModule (ref), var1 (ref), socialTabsPageModule (ref)
	local navigation = value.navigation
	local var2 = useNavigationProps(function(_, p1)
		return {
			profileId = p1.profileId,
			title = p1.title,
			initialTabId = p1.initialTabId,
			tabConfig = p1.tabConfig,
			dockToProfilePanel = p1.dockToProfilePanel
		}
	end)
	
	return reactModule.createElement(socialTabsPageModule, {
		renderNavigator = reactModule.useCallback(function()
			-- upvalues: reactModule (copy), var1 (copy), navigation (ref)
			return reactModule.createElement(var1, { navigation = navigation })
		end, { navigation }),
		tabConfig = var2.tabConfig,
		profileId = var2.profileId,
		title = var2.title,
		initialTabId = var2.initialTabId,
		pageWidth = useProfileDockedPanelWidth(var2.dockToProfilePanel)
	})
end

local socialTabsPageNavigatorClassWrapper = reactModule.PureComponent:extend("SocialTabsPageNavigatorClassWrapper")

function socialTabsPageNavigatorClassWrapper.render(p1)
	-- upvalues: reactModule (ref), SocialTabsPageNavigatorComponent (ref)
	return reactModule.createElement(SocialTabsPageNavigatorComponent, p1.props)
end

socialTabsPageNavigatorClassWrapper.router = var1.router

return socialTabsPageNavigatorClassWrapper