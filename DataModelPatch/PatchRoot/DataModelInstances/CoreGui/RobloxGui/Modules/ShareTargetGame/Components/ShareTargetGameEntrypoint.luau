local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local ShareTargetGame = script:FindFirstAncestor("ShareTargetGame")
local AnalyticsModule = require(ShareTargetGame.analytics)
local DependenciesModule = require(ShareTargetGame.dependencies)
local Roact = DependenciesModule.Roact
local Request = DependenciesModule.request
local ShareTargetGameContainerModule = require(script.Parent.ShareTargetGameContainer)
local ShareTargetGameEntrypoint = Roact.PureComponent:extend("ShareTargetGameEntrypoint")
ShareTargetGameEntrypoint.defaultProps = {
	placeId = nil,
	isVisible = false,
	eventStream = DependenciesModule.EventStream.new(RbxAnalyticsService),
	diag = DependenciesModule.Diag.new(RbxAnalyticsService)
}

function ShareTargetGameEntrypoint.render(p1)
	-- upvalues: Roact (copy), ShareTargetGameContainerModule (copy), AnalyticsModule (copy), Request (copy)
	return Roact.createElement(ShareTargetGameContainerModule, {
		placeId = p1.props.placeId,
		analytics = AnalyticsModule(p1.props.eventStream, p1.props.diag),
		networkImpl = Request
	})
end

return ShareTargetGameEntrypoint