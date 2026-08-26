return {
	formatRecommendationContextType = require(script.formatRecommendationContextType),
	formatPresence = require(script.formatPresence),
	createDiagMetricString = require(script.createDiagMetricString),
	repeatValue = function(p1, p2)
		return table.concat(table.create(p2, tostring(p1)), ",")
	end
}