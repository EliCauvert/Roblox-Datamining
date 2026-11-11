local CorePackages = game:GetService("CorePackages")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local ShareGame = game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame
local ConstantsModule = require(ShareGame.Constants)
local AppFeaturePolicies = require(CorePackages.Workspace.Packages.UniversalAppPolicy).AppFeaturePolicies
local EventStream = require(CorePackages.Workspace.Packages.Analytics).AnalyticsReporters.EventStream
local LayoutProviderModule = require(ShareGame.Components.LayoutProvider)
local ShareGameContainerModule = require(ShareGame.Components.ShareGameContainer)
local App = RoactModule.PureComponent:extend("App")

local function wrapWithProviders(p1)
	-- upvalues: RoactModule (copy), LayoutProviderModule (copy), RoactAppPolicy (copy), AppFeaturePolicies (copy)
	return RoactModule.createElement(LayoutProviderModule, nil, {
		PolicyProvider = RoactModule.createElement(RoactAppPolicy.Provider, { policy = { AppFeaturePolicies } }, p1)
	})
end

function App.render(p1)
	-- upvalues: RoactModule (copy), ShareGameContainerModule (copy), ConstantsModule (copy), wrapWithProviders (copy)
	local Analytics = p1.props.analytics
	
	return wrapWithProviders({
		RoactModule.createElement(RoactModule.Portal, { target = p1.props.pageTarget }, {
			ShareGamePageFrame = if p1.props.isPageOpen then RoactModule.createElement(ShareGameContainerModule, {
				analytics = Analytics,
				zIndex = ConstantsModule.SHARE_GAME_Z_INDEX
			}) else nil
		})
	})
end

function App.didMount(p1)
	-- upvalues: EventStream (copy), RbxAnalyticsService (copy)
	p1.eventStream = EventStream.new(RbxAnalyticsService)
end

function App.willUnmount(p1)
	p1.eventStream:releaseRBXEventStream()
end

return RoactRoduxModule.UNSTABLE_connect2(function(p1, _)
	return { isPageOpen = p1.Page.IsOpen }
end)(App)