local userSearch = script:FindFirstAncestor("UserSearch")
local parent = userSearch.Parent
local reactModule = require(parent.React)
local dashModule = require(parent.Dash)
local useProfileInsightsFetchModule = require(script.Parent.useProfileInsightsFetch)
local useMatchSearchPaginationModule = require(userSearch.Utils.useMatchSearchPagination)
local profileInsightsModule = require(parent.ProfileInsights)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(userSearch.Common.LocalTypes)
local _ = require(parent.GraphQLServer)
local getFFlagEnableProfileInsightsApolloMigration = require(parent.SharedFlags).GetFFlagEnableProfileInsightsApolloMigration
local fFlagPlayerSearchEnableOnlineFrequents = require(parent.SharedFlags).FFlagPlayerSearchEnableOnlineFrequents
local fFlagUserSearchClassmatesInsight = require(parent.SharedFlags).FFlagUserSearchClassmatesInsight

local var1 = function(p1)
	-- upvalues: dashModule (ref)
	return dashModule.reduce(p1, function(p2, p3)
		p2[p3.targetUserId] = p3
		
		return p2
	end, {})
end

local _ = function(p1)
	return "PROFILE_INSIGHTS_SEARCH_PAGE_ID" .. ":" .. p3
end

return function(p1)
	-- upvalues: useMatchSearchPaginationModule (ref), reactModule (ref), dashModule (ref), getFFlagEnableProfileInsightsApolloMigration (ref), profileInsightsModule (ref), fFlagPlayerSearchEnableOnlineFrequents (ref), fFlagUserSearchClassmatesInsight (ref), signalsReactModule (ref), useProfileInsightsFetchModule (ref), var1 (ref)
	local var2
	local var3 = useMatchSearchPaginationModule({ users = p1.users or {} })
	local var4 = reactModule.useMemo(function()
		-- upvalues: dashModule (copy), var3 (ref)
		return dashModule.map(var3, function(p2)
			return p2.id
		end)
	end, { var3 })
	local _ = {}
	
	if getFFlagEnableProfileInsightsApolloMigration() then
		var2 = signalsReactModule.useSignalState(profileInsightsModule.ProfileInsightsStore(false).getProfileInsightsByPage({
			pageId = "PROFILE_INSIGHTS_SEARCH_PAGE_ID" .. ":" .. p4.searchKeyword,
			userIds = var4,
			rankingStrategy = if fFlagPlayerSearchEnableOnlineFrequents then p1.rankingStrategy else nil,
			count = if fFlagUserSearchClassmatesInsight and fFlagPlayerSearchEnableOnlineFrequents and p1.rankingStrategy then 3 else nil
		})(false).data.getProfileInsights)
	else
		local var5 = useProfileInsightsFetchModule(var4, p1.searchKeyword, if fFlagPlayerSearchEnableOnlineFrequents then p1.rankingStrategy else nil)
		var2 = if var5.data and var5.data.profilesInsights then var5.data.profilesInsights.profileInsights else {}
	end
	return reactModule.useMemo(function()
		-- upvalues: var1 (copy), var2 (write)
		return var1(var2)
	end, { var2 })
end