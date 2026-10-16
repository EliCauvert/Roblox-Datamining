local Parent = script:FindFirstAncestor("DataHydration").Parent
local HttpClientModule = require(Parent.HttpClient)
local UrlBase = require(Parent.UrlBuilder).UrlBase
local FStringBuildAnalyticsGoalMilestonesFeatureNameModule = require(script.Parent.FStringBuildAnalyticsGoalMilestonesFeatureName)
local _ = require(script.Parent.GoalMilestonesTypes)

local function toMilestones(p1, FStringBuildAnalyticsGoalMilestonesFeatureNameModule) --[[ Line: 29 ]]
	local t = {}
	local Features = p1.features or {}
	for _, feature in Features do
		if feature.name == FStringBuildAnalyticsGoalMilestonesFeatureNameModule then
			local Values = feature.values or {}
			for i, value in Values do
				t[i] = string.lower(value) == "true"
			end
		end
	end
	return t
end

return function(p2, p3) --[[ Line: 46 | Named "fetchGoalMilestones" ]]
	-- upvalues: UrlBase (copy), FStringBuildAnalyticsGoalMilestonesFeatureNameModule (copy), HttpClientModule (copy), toMilestones (copy)
	local P3 = p3 or {}
	
	return HttpClientModule.asPromise((HttpClientModule.fetch({
		method = "GET",
		analyticsKey = "analytics-features.goal-milestones.get",
		url = `{P3.baseUrl or UrlBase.APIS}/analytics-features/v1/universes/{p2}/features?featureNames={FStringBuildAnalyticsGoalMilestonesFeatureNameModule}`,
		network = P3.network,
		decode = function(p4) --[[ Line: 56 ]]
			-- upvalues: toMilestones (upval), FStringBuildAnalyticsGoalMilestonesFeatureNameModule (copy)
			return (toMilestones(p4, FStringBuildAnalyticsGoalMilestonesFeatureNameModule))
		end
	})))
end