return {
	formatRecommendationContextType = require(script.formatRecommendationContextType),
	formatPresence = require(script.formatPresence),
	createDiagMetricString = require(script.createDiagMetricString),
	repeatValue = function(p0, p1) --[[ line: 1 ]]
		return table.concat(table.create(p1, tostring(p0)), ",")
	end
}