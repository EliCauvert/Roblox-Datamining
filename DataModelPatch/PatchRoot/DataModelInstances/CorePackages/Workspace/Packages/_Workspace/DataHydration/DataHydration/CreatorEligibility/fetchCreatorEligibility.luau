local Parent = script:FindFirstAncestor("DataHydration").Parent
local HttpClientModule = require(Parent.HttpClient)
local UrlBase = require(Parent.UrlBuilder).UrlBase
local _ = require(script.Parent.CreatorEligibilityStoreTypes)
local FetchFunction = HttpClientModule.fetch
local AsPromiseFunction = HttpClientModule.asPromise

return {
	fetchEligibility = function(p1, p2)
		-- upvalues: UrlBase (copy), FetchFunction (copy), AsPromiseFunction (copy)
		local P1 = p2 or {}
		
		return AsPromiseFunction((FetchFunction({
			method = "GET",
			analyticsKey = "creator-eligibility.get",
			network = P1.network,
			url = ("%s/core-content/v1/creator-eligibility/%d"):format(P1.baseUrl or UrlBase.APIS, p1),
			decode = function(p3)
				return p3
			end
		})))
	end,
	isFlagPresent = function(p1, Value): boolean
		return table.find(p1.creatorEligibility, Value) ~= nil
	end
}