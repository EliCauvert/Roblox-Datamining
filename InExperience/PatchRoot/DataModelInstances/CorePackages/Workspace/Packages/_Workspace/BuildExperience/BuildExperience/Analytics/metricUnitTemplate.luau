local buildExperience = script:FindFirstAncestor("BuildExperience")
local analyticsKeysModule = require(buildExperience.Analytics.AnalyticsKeys)
local analyticsUnitModule = require(buildExperience.Analytics.AnalyticsUnit)

return {
	templateFor = function(p1)
		-- upvalues: analyticsUnitModule (ref), analyticsKeysModule (ref)
		return if p1 == analyticsUnitModule.Percent then analyticsKeysModule.ANALYTICS_PERCENT_TEMPLATE elseif p1 == analyticsUnitModule.Temporal then analyticsKeysModule.ANALYTICS_DURATION_TEMPLATE else nil
	end,
	fillTemplate = function(p1, p2)
		return string.gsub(p1, "{number}", function()
			-- upvalues: p2 (ref)
			return p2
		end)
	end
}