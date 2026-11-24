local AvatarExperienceSearch = script:FindFirstAncestor("AvatarExperienceSearch")
local Parent = AvatarExperienceSearch.Parent
local ReactModule = require(Parent.React)
local AXCommonModule = require(Parent.AXCommon)
local SignalsReactModule = require(Parent.SignalsReact)
local GetTrendingSearchQueriesStoreModule = require(AvatarExperienceSearch.Stores.GetTrendingSearchQueriesStore)
local UseNetworkingFunction = AXCommonModule.Hooks.useNetworking
local UseSignalStateFunction = SignalsReactModule.useSignalState

return function()
	-- upvalues: UseNetworkingFunction (copy), GetTrendingSearchQueriesStoreModule (copy), ReactModule (copy), UseSignalStateFunction (copy)
	local UseNetworkingResult = UseNetworkingFunction()
	local TrendingSearchQueriesStoreModule = GetTrendingSearchQueriesStoreModule(false)
	ReactModule.useEffect(function()
		-- upvalues: TrendingSearchQueriesStoreModule (copy), UseNetworkingResult (copy)
		return TrendingSearchQueriesStoreModule.fetchQueriesIfNeeded(UseNetworkingResult)
	end, { UseNetworkingResult, TrendingSearchQueriesStoreModule })
	
	return UseSignalStateFunction(TrendingSearchQueriesStoreModule.getQueries)
end