local ConnectionsHub = script:FindFirstAncestor("ConnectionsHub")
local Parent = ConnectionsHub.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FullscreenPageWithSafeArea = require(Parent.AppBlox).FullscreenPageWithSafeArea
local ConnectionsHubHeaderModule = require(ConnectionsHub.Components.ConnectionsHubHeader)
local ConnectionsHubTabsModule = require(ConnectionsHub.Components.ConnectionsHubTabs)
local UseMakeTabsModule = require(ConnectionsHub.Hooks.useMakeTabs)

return function(p1)
	-- upvalues: UseMakeTabsModule (copy), UseTokensFunction (copy), ReactModule (copy), FullscreenPageWithSafeArea (copy), FoundationModule (copy), ConnectionsHubHeaderModule (copy), ConnectionsHubTabsModule (copy)
	local RenderNavigatorFunction = p1.renderNavigator
	local UseMakeTabsModuleResult = UseMakeTabsModule(p1.tabConfig)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(FullscreenPageWithSafeArea, {
		includeStatusBar = true,
		BackgroundColor3 = UseTokensResult.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = UseTokensResult.Color.Surface.Surface_0.Transparency
	}, {
		ConnectionsHubPage = ReactModule.createElement(FoundationModule.View, { tag = "size-full-full col" }, {
			ConnectionsHub = ReactModule.createElement(FoundationModule.View, {
				tag = "size-full-0 auto-y gap-small col bg-surface-0",
				LayoutOrder = 1
			}, {
				Header = ReactModule.createElement(FoundationModule.View, {
					tag = "size-full-0 auto-y bg-surface-0 align-x-center",
					layoutOrder = 1
				}, {
					CoHubHeader = ReactModule.createElement(ConnectionsHubHeaderModule)
				}),
				CoHubTabs = ReactModule.createElement(ConnectionsHubTabsModule, { layoutOrder = 2, tabs = UseMakeTabsModuleResult })
			}),
			ConnectionsHubSwitchNavigatorView = ReactModule.createElement(FoundationModule.View, { tag = "size-full-0 auto-y fill", LayoutOrder = 2 }, {
				ConnectionsHubSwitchNavigator = RenderNavigatorFunction()
			})
		})
	})
end