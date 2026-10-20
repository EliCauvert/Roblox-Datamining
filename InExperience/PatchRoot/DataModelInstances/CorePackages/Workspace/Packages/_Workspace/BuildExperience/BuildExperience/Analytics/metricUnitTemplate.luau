local BuildExperience = script:FindFirstAncestor("BuildExperience")
local AnalyticsKeysModule = require(BuildExperience.Analytics.AnalyticsKeys)
local AnalyticsUnitModule = require(BuildExperience.Analytics.AnalyticsUnit)

return {
	templateFor = function(Minutes)
		-- upvalues: AnalyticsUnitModule (copy), AnalyticsKeysModule (copy)
		return if Minutes == AnalyticsUnitModule.Percent then AnalyticsKeysModule.ANALYTICS_PERCENT_TEMPLATE elseif Minutes == AnalyticsUnitModule.Minutes then AnalyticsKeysModule.ANALYTICS_DURATION_MINUTES_TEMPLATE elseif Minutes == AnalyticsUnitModule.Temporal then AnalyticsKeysModule.ANALYTICS_DURATION_TEMPLATE else nil
	end,
	fillTemplate = function(Text: string, p1): string
		return (string.gsub(Text, "{number}", function()
			-- upvalues: p1 (copy)
			return p1
		end))
	end
}