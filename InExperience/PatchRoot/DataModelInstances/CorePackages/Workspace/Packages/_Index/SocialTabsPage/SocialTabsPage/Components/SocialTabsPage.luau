local SocialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local Parent = SocialTabsPage.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance
local FullscreenPageWithSafeArea = require(Parent.AppBlox).FullscreenPageWithSafeArea
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local DisplayModule = require(Parent.Display)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local FFlagSocialTabsPageDockedPanelSafeAreaModule = require(SocialTabsPage.Flags.FFlagSocialTabsPageDockedPanelSafeArea)
local SocialTabsHeaderModule = require(SocialTabsPage.Components.SocialTabsHeader)
local SocialTabBarModule = require(SocialTabsPage.Components.SocialTabBar)
local SocialTabsContextModule = require(SocialTabsPage.Contexts.SocialTabsContext)
local UseLocalizedTabsModule = require(SocialTabsPage.Hooks.useLocalizedTabs)
local _ = require(SocialTabsPage.Common.Types)

return function(p1)
	-- upvalues: ReactModule (copy), UseLocalizedTabsModule (copy), UseTokensFunction (copy), UseNavigationFunction (copy), FFlagSocialTabsPageDockedPanelSafeAreaModule (copy), UseSignalStateFunction (copy), DisplayModule (copy), View (copy), SocialTabsHeaderModule (copy), SocialTabBarModule (copy), StateLayerAffordance (copy), SocialTabsContextModule (copy), FullscreenPageWithSafeArea (copy)
	local RenderNavigatorFunction = p1.renderNavigator
	local RenderHeaderFunction = p1.renderHeader
	local TabConfig = p1.tabConfig
	local ProfileId = p1.profileId
	local Title = p1.title
	local InitialTabId = p1.initialTabId
	local PageWidth = p1.pageWidth
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: ProfileId (copy), Title (copy)
		return { profileId = ProfileId, title = Title }
	end, { ProfileId, Title })
	local UseLocalizedTabsModuleResult = UseLocalizedTabsModule(TabConfig)
	local UseTokensResult = UseTokensFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseSignalStateResult = if FFlagSocialTabsPageDockedPanelSafeAreaModule then UseSignalStateFunction(DisplayModule.GetDisplayStore().getDeviceSafePadding) else nil
	local UseRefResult = ReactModule.useRef(false)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (copy)
		UseNavigationResult.goBack()
	end, { UseNavigationResult })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), InitialTabId (copy), TabConfig (copy), UseNavigationResult (copy)
		if UseRefResult.current then return end
		if not InitialTabId or #TabConfig == 0 then return end
		local Flag = false
		
		for _, value in TabConfig do
			if value.id == InitialTabId then
				Flag = true
				break
			end
		end
		local InitialTabId1 = if Flag then InitialTabId else TabConfig[1].id
		
		if UseNavigationResult.state.routes[UseNavigationResult.state.index].routeName ~= InitialTabId1 then
			UseNavigationResult.navigate(InitialTabId1)
		end
		UseRefResult.current = true
	end, { InitialTabId, TabConfig, UseNavigationResult })
	local Element = ReactModule.createElement(View, { tag = "col size-full" }, {
		HeaderSection = ReactModule.createElement(View, {
			tag = "col size-full-0 auto-y bg-surface-0",
			LayoutOrder = 1
		}, {
			Header = if RenderHeaderFunction then RenderHeaderFunction() else ReactModule.createElement(SocialTabsHeaderModule, { layoutOrder = 1 }),
			TabBar = ReactModule.createElement(SocialTabBarModule, { layoutOrder = 2, tabs = UseLocalizedTabsModuleResult })
		}),
		TabContent = ReactModule.createElement(View, { tag = "fill size-full-0", LayoutOrder = 2 }, { Navigator = RenderNavigatorFunction() })
	})
	local config = nil
	local SurfaceColor3 = nil
	local Transparency = nil
	
	if PageWidth == nil then
		SurfaceColor3 = UseTokensResult.Color.Surface.Surface_0.Color3
		Transparency = UseTokensResult.Color.Surface.Surface_0.Transparency
		config = { SocialTabsPageContent = Element }
	else
		local StateLayer = { affordance = StateLayerAffordance.None }
		SurfaceColor3 = UseTokensResult.Color.Surface.Surface_0.Color3
		Transparency = 1
		config = {
			ScrimClickHandler = ReactModule.createElement(View, {
				tag = "size-full",
				stateLayer = StateLayer,
				onActivated = UseResult
			}, {
				Panel = ReactModule.createElement(View, {
					tag = {
						["col anchor-top-right bg-surface-0"] = true,
						["position-top-right padding-top-xxlarge"] = not FFlagSocialTabsPageDockedPanelSafeAreaModule
					},
					Position = if FFlagSocialTabsPageDockedPanelSafeAreaModule then UDim2.new(1, UseSignalStateResult.right, 0, -UseSignalStateResult.top) else nil,
					Size = if FFlagSocialTabsPageDockedPanelSafeAreaModule then UDim2.new(0, PageWidth, 1, UseSignalStateResult.top + UseSignalStateResult.bottom) else UDim2.new(0, PageWidth, 1, 0),
					padding = if FFlagSocialTabsPageDockedPanelSafeAreaModule then {
						top = UDim.new(0, UseSignalStateResult.top + UseTokensResult.Padding.XXLarge),
						right = UDim.new(0, UseSignalStateResult.right),
						bottom = UDim.new(0, UseSignalStateResult.bottom)
					} else nil,
					stateLayer = StateLayer,
					onActivated = function() end
				}, { Content = Element })
			})
		}
	end
	return ReactModule.createElement(SocialTabsContextModule.Provider, { value = UseMemoResult }, {
		Page = ReactModule.createElement(FullscreenPageWithSafeArea, {
			includeStatusBar = true,
			BackgroundColor3 = SurfaceColor3,
			BackgroundTransparency = Transparency
		}, config)
	})
end