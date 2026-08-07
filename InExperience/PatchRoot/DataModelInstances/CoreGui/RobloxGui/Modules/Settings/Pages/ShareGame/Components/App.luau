local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local modules = coreGuiService.RobloxGui.Modules
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local roactAppPolicy = require(corePackagesService.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local shareGame = modules.Settings.Pages.ShareGame
local constantsModule = require(shareGame.Constants)
local appFeaturePolicies = require(corePackagesService.Workspace.Packages.UniversalAppPolicy).AppFeaturePolicies
local eventStream = require(corePackagesService.Workspace.Packages.Analytics).AnalyticsReporters.EventStream
local layoutProviderModule = require(shareGame.Components.LayoutProvider)
local shareGameContainerModule = require(shareGame.Components.ShareGameContainer)
local app = roactModule.PureComponent:extend("App")

local function wrapWithProviders(p0) --[[ line: 23 ]]
	-- upvalues: roactModule (ref), layoutProviderModule (ref), roactAppPolicy (ref), appFeaturePolicies (ref)
	return roactModule.createElement(layoutProviderModule, nil, {
		PolicyProvider = roactModule.createElement(roactAppPolicy.Provider, { policy = { appFeaturePolicies } }, p0)
	})
end

function app.render(p1) --[[ line: 33 ]]
	-- upvalues: roactModule (ref), shareGameContainerModule (ref), constantsModule (ref), wrapWithProviders (ref)
	return wrapWithProviders({
		roactModule.createElement(roactModule.Portal, { target = p1.props.pageTarget }, {
			ShareGamePageFrame = if p1.props.isPageOpen then roactModule.createElement(shareGameContainerModule, {
				analytics = p1.props.analytics,
				zIndex = constantsModule.SHARE_GAME_Z_INDEX
			}) else nil
		})
	})
end

function app.didMount(p2) --[[ line: 54 ]]
	-- upvalues: eventStream (ref), rbxAnalyticsService (ref)
	p2.eventStream = eventStream.new(rbxAnalyticsService)
end

function app.willUnmount(p3) --[[ line: 58 ]]
	p3.eventStream:releaseRBXEventStream()
end

return roactRoduxModule.UNSTABLE_connect2(function(p4, _) --[[ line: 62 ]]
	return { isPageOpen = p4.Page.IsOpen }
end)(app)