local parent = script:FindFirstAncestor("DataHydration").Parent
local httpClientModule = require(parent.HttpClient)
local urlBase = require(parent.UrlBuilder).UrlBase
local fStringBuildAnalyticsGoalMilestonesFeatureNameModule = require(script.Parent.FStringBuildAnalyticsGoalMilestonesFeatureName)
local _ = require(script.Parent.GoalMilestonesTypes)

local function toMilestones(p1, p2)
	local t = {}
	
	for i, v in p1.features or {} do
		if v.name == p2 then
			for i_1, v_1 in v.values or {} do
				t[i_1] = string.lower(v_1) == "true"
			end
		end
	end
	return t
end

return function(p3, p4)
	-- upvalues: urlBase (ref), fStringBuildAnalyticsGoalMilestonesFeatureNameModule (ref), httpClientModule (ref), toMilestones (ref)
	p4 = p4 or {}
	
	return httpClientModule.asPromise(httpClientModule.fetch({
		method = "GET",
		analyticsKey = "analytics-features.goal-milestones.get",
		url = `{p4.baseUrl or urlBase.APIS}/analytics-features/v1/universes/{p3}/features?featureNames={fStringBuildAnalyticsGoalMilestonesFeatureNameModule}`,
		network = p4.network,
		decode = function(p5)
			-- upvalues: toMilestones (copy), fStringBuildAnalyticsGoalMilestonesFeatureNameModule (ref)
			return toMilestones(p5, fStringBuildAnalyticsGoalMilestonesFeatureNameModule)
		end
	}))
end