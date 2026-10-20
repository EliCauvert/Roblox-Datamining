local Squads = script:FindFirstAncestor("Squads")
local _ = require(Squads.Common.ModelTypes)
local SquadVoiceAbuseReportModule = require(script.Parent.SquadVoiceAbuseReport)
local DependenciesModule = require(Squads.dependencies)
local React = DependenciesModule.React
local Foundation = DependenciesModule.Foundation

return function(p1)
	-- upvalues: React (copy), Foundation (copy), SquadVoiceAbuseReportModule (copy)
	local Navigation = p1.navigation
	local ReportDataParam = Navigation.getParam("reportData", nil)
	assert(ReportDataParam ~= nil, "SquadVoiceAbuseReportScreen requires reportData to be passed in")
	
	return React.createElement(Foundation.View, {
		Size = UDim2.new(1, 0, 1, 0),
		padding = UDim.new(0, 12),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		sizeConstraint = { MaxSize = Vector2.new(800, 450) }
	}, {
		abuseReportFlow = React.createElement(SquadVoiceAbuseReportModule, {
			reportData = ReportDataParam,
			onAbandon = Navigation.pop,
			onComplete = Navigation.pop
		})
	})
end