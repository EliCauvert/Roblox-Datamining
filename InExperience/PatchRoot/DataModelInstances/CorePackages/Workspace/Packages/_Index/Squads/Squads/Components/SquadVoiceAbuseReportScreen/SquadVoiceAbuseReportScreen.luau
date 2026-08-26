local squads = script:FindFirstAncestor("Squads")
local _ = require(squads.Common.ModelTypes)
local squadVoiceAbuseReportModule = require(script.Parent.SquadVoiceAbuseReport)
local dependenciesModule = require(squads.dependencies)
local react = dependenciesModule.React
local foundation = dependenciesModule.Foundation

return function(p1)
	-- upvalues: react (ref), foundation (ref), squadVoiceAbuseReportModule (ref)
	local navigation = p1.navigation
	local reportData = navigation.getParam("reportData", nil)
	assert(reportData ~= nil, "SquadVoiceAbuseReportScreen requires reportData to be passed in")
	
	return react.createElement(foundation.View, {
		Size = UDim2.new(1, 0, 1, 0),
		padding = UDim.new(0, 12),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		sizeConstraint = { MaxSize = Vector2.new(800, 450) }
	}, {
		abuseReportFlow = react.createElement(squadVoiceAbuseReportModule, {
			reportData = reportData,
			onAbandon = navigation.pop,
			onComplete = navigation.pop
		})
	})
end