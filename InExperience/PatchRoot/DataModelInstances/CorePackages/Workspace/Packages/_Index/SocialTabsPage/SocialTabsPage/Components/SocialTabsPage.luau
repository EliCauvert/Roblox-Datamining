local socialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local parent = socialTabsPage.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance
local fullscreenPageWithSafeArea = require(parent.AppBlox).FullscreenPageWithSafeArea
local useNavigation = require(parent.Navigation).useNavigation
local socialTabsHeaderModule = require(socialTabsPage.Components.SocialTabsHeader)
local socialTabBarModule = require(socialTabsPage.Components.SocialTabBar)
local socialTabsContextModule = require(socialTabsPage.Contexts.SocialTabsContext)
local useLocalizedTabsModule = require(socialTabsPage.Hooks.useLocalizedTabs)
local _ = require(socialTabsPage.Common.Types)

return function(value)
	-- upvalues: reactModule (ref), useLocalizedTabsModule (ref), useTokens (ref), useNavigation (ref), view (ref), socialTabsHeaderModule (ref), socialTabBarModule (ref), stateLayerAffordance (ref), socialTabsContextModule (ref), fullscreenPageWithSafeArea (ref)
	local color3, var1, t_1
	local renderNavigator = value.renderNavigator
	local renderHeader = value.renderHeader
	local tabConfig = value.tabConfig
	local profileId = value.profileId
	local title = value.title
	local initialTabId = value.initialTabId
	local pageWidth = value.pageWidth
	local var2 = reactModule.useMemo(function()
		-- upvalues: profileId (ref), title (ref)
		return { profileId = profileId, title = title }
	end, { profileId, title })
	local var3 = useLocalizedTabsModule(tabConfig)
	local var4 = useTokens()
	local var5 = useNavigation()
	local var6 = reactModule.useRef(false)
	local var7 = reactModule.useCallback(function()
		-- upvalues: var5 (ref)
		var5.goBack()
	end, { var5 })
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), initialTabId (ref), tabConfig (ref), var5 (ref)
		if var6.current then return end
		if not initialTabId or #tabConfig == 0 then return end
		local var8 = false
		
		for i, v in tabConfig do
			if v.id == initialTabId then
				var8 = true
				break
			end
		end
		local var9 = if var8 then initialTabId else tabConfig[1].id
		
		if var5.state.routes[var5.state.index].routeName ~= var9 then
			var5.navigate(var9)
		end
		var6.current = true
	end, { initialTabId, tabConfig, var5 })
	local var10 = reactModule.createElement(view, { tag = "col size-full" }, {
		HeaderSection = reactModule.createElement(view, {
			tag = "col size-full-0 auto-y bg-surface-0",
			LayoutOrder = 1
		}, {
			Header = if renderHeader then renderHeader() else reactModule.createElement(socialTabsHeaderModule, { layoutOrder = 1 }),
			TabBar = reactModule.createElement(socialTabBarModule, { layoutOrder = 2, tabs = var3 })
		}),
		TabContent = reactModule.createElement(view, { tag = "fill size-full-0", LayoutOrder = 2 }, { Navigator = renderNavigator() })
	})
	local _ = nil
	local _ = nil
	local _ = nil
	
	if pageWidth == nil then
		color3 = var4.Color.Surface.Surface_0.Color3
		var1 = var4.Color.Surface.Surface_0.Transparency
		t_1 = { SocialTabsPageContent = var10 }
	else
		local t = { affordance = stateLayerAffordance.None }
		color3 = var4.Color.Surface.Surface_0.Color3
		var1 = 1
		t_1 = {
			ScrimClickHandler = reactModule.createElement(view, { tag = "size-full", stateLayer = t, onActivated = var7 }, {
				Panel = reactModule.createElement(view, {
					tag = "col position-top-right anchor-top-right padding-top-xxlarge bg-surface-0",
					Size = UDim2.new(0, pageWidth, 1, 0),
					stateLayer = t,
					onActivated = function() end
				}, { Content = var10 })
			})
		}
	end
	return reactModule.createElement(socialTabsContextModule.Provider, { value = var2 }, {
		Page = reactModule.createElement(fullscreenPageWithSafeArea, {
			includeStatusBar = true,
			BackgroundColor3 = color3,
			BackgroundTransparency = var1
		}, t_1)
	})
end