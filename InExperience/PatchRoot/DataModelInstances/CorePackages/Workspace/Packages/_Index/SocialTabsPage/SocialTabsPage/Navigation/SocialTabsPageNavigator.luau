local socialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local parent = socialTabsPage.Parent
local reactModule = require(parent.React)
local roactNavigationModule = require(parent.RoactNavigation)
local useNavigationProps = require(parent.RobloxAppNavigation).useNavigationProps
local socialTabsPageModule = require(socialTabsPage.Components.SocialTabsPage)
local var4 = roactNavigationModule.createRobloxSwitchNavigator(require(script.Parent.SocialTabsPageRouter), {
	resetOnBlur = false,
	keepVisitedScreensMounted = true,
	backBehavior = roactNavigationModule.BackBehavior.None
})

local function SocialTabsPageNavigatorComponent(value) --[[ line: 21 ]]
	-- upvalues: useNavigationProps (ref), reactModule (ref), var4 (ref), socialTabsPageModule (ref)
	local navigation = value.navigation
	local var7 = useNavigationProps(function(_, p0) --[[ line: 24 ]]
		return {
			profileId = p0.profileId,
			title = p0.title,
			initialTabId = p0.initialTabId,
			tabConfig = p0.tabConfig,
			pageWidth = p0.pageWidth
		}
	end)
	
	return reactModule.createElement(socialTabsPageModule, {
		renderNavigator = reactModule.useCallback(function() --[[ line: 34 ]]
			-- upvalues: reactModule (copy), var4 (copy), navigation (ref)
			return reactModule.createElement(var4, { navigation = navigation })
		end, { navigation }),
		tabConfig = var7.tabConfig,
		profileId = var7.profileId,
		title = var7.title,
		initialTabId = var7.initialTabId,
		pageWidth = var7.pageWidth
	})
end

local socialTabsPageNavigatorClassWrapper = reactModule.PureComponent:extend("SocialTabsPageNavigatorClassWrapper")

function socialTabsPageNavigatorClassWrapper.render(p1) --[[ line: 52 ]]
	-- upvalues: reactModule (ref), SocialTabsPageNavigatorComponent (ref)
	return reactModule.createElement(SocialTabsPageNavigatorComponent, p1.props)
end

socialTabsPageNavigatorClassWrapper.router = var4.router

return socialTabsPageNavigatorClassWrapper