local UserSearch = script:FindFirstAncestor("UserSearch")
local Parent = UserSearch.Parent
local ReactModule = require(Parent.React)
local DashModule = require(Parent.Dash)
local UseProfileInsightsFetchModule = require(script.Parent.useProfileInsightsFetch)
local UseMatchSearchPaginationModule = require(UserSearch.Utils.useMatchSearchPagination)
local ProfileInsightsModule = require(Parent.ProfileInsights)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(UserSearch.Common.LocalTypes)
local _ = require(Parent.GraphQLServer)
local GetFFlagEnableProfileInsightsApolloMigrationFunction = require(Parent.SharedFlags).GetFFlagEnableProfileInsightsApolloMigration
local FFlagPlayerSearchEnableOnlineFrequents = require(Parent.SharedFlags).FFlagPlayerSearchEnableOnlineFrequents
local FFlagUserSearchClassmatesInsight = require(Parent.SharedFlags).FFlagUserSearchClassmatesInsight

local function v12(ProfileInsights)
	-- upvalues: DashModule (copy)
	return DashModule.reduce(ProfileInsights, function(p1, p2)
		p1[p2.targetUserId] = p2
		
		return p1
	end, {})
end

local function _(Text): string
	return "PROFILE_INSIGHTS_SEARCH_PAGE_ID" .. ":" .. Text
end

return function(p1)
	-- upvalues: UseMatchSearchPaginationModule (copy), ReactModule (copy), DashModule (copy), GetFFlagEnableProfileInsightsApolloMigrationFunction (copy), ProfileInsightsModule (copy), FFlagPlayerSearchEnableOnlineFrequents (copy), FFlagUserSearchClassmatesInsight (copy), SignalsReactModule (copy), UseProfileInsightsFetchModule (copy), v12 (copy)
	local UseMatchSearchPaginationModuleResult = UseMatchSearchPaginationModule({ users = p1.users or {} })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: DashModule (upval), UseMatchSearchPaginationModuleResult (copy)
		return DashModule.map(UseMatchSearchPaginationModuleResult, function(p2)
			return p2.id
		end)
	end, { UseMatchSearchPaginationModuleResult })
	local UseSignalStateResult = {}
	
	if GetFFlagEnableProfileInsightsApolloMigrationFunction() then
		UseSignalStateResult = SignalsReactModule.useSignalState(ProfileInsightsModule.ProfileInsightsStore(false).getProfileInsightsByPage({
			pageId = "PROFILE_INSIGHTS_SEARCH_PAGE_ID" .. ":" .. p1.searchKeyword,
			userIds = UseMemoResult,
			rankingStrategy = if FFlagPlayerSearchEnableOnlineFrequents then p1.rankingStrategy else nil,
			count = if FFlagUserSearchClassmatesInsight and FFlagPlayerSearchEnableOnlineFrequents and p1.rankingStrategy then 3 else nil
		})(false).data.getProfileInsights)
	else
		local UseProfileInsightsFetchModuleResult = UseProfileInsightsFetchModule(UseMemoResult, p1.searchKeyword, if FFlagPlayerSearchEnableOnlineFrequents then p1.rankingStrategy else nil)
		UseSignalStateResult = if UseProfileInsightsFetchModuleResult.data and UseProfileInsightsFetchModuleResult.data.profilesInsights then UseProfileInsightsFetchModuleResult.data.profilesInsights.profileInsights else {}
	end
	return (ReactModule.useMemo(function()
		-- upvalues: v12 (upval), UseSignalStateResult (ref)
		return v12(UseSignalStateResult)
	end, { UseSignalStateResult }))
end