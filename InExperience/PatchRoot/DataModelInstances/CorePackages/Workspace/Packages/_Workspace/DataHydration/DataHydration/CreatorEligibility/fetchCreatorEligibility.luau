local parent = script:FindFirstAncestor("DataHydration").Parent
local httpClientModule = require(parent.HttpClient)
local urlBase = require(parent.UrlBuilder).UrlBase
local _ = require(script.Parent.CreatorEligibilityStoreTypes)
local fetch = httpClientModule.fetch
local asPromise = httpClientModule.asPromise

return {
	fetchEligibility = function(p1, p2)
		-- upvalues: urlBase (ref), fetch (ref), asPromise (ref)
		p2 = p2 or {}
		
		return asPromise(fetch({
			method = "GET",
			analyticsKey = "creator-eligibility.get",
			network = p2.network,
			url = ("%s/core-content/v1/creator-eligibility/%d"):format(p2.baseUrl or urlBase.APIS, p1),
			decode = function(p3)
				return p3
			end
		}))
	end,
	isFlagPresent = function(p1, p2)
		return table.find(p1.creatorEligibility, p2) ~= nil
	end
}