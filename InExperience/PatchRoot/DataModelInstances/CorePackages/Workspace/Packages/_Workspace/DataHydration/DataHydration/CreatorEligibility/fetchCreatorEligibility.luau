local parent = script:FindFirstAncestor("DataHydration").Parent
local httpClientModule = require(parent.HttpClient)
local urlBase = require(parent.UrlBuilder).UrlBase
local _ = require(script.Parent.CreatorEligibilityStoreTypes)
local fetch = httpClientModule.fetch
local asPromise = httpClientModule.asPromise

return {
	fetchEligibility = function(p0, p1)
		-- upvalues: urlBase (ref), fetch (ref), asPromise (ref)
		p1 = p1 or {}
		
		return asPromise(fetch({
			method = "GET",
			analyticsKey = "creator-eligibility.get",
			network = p1.network,
			url = ("%s/core-content/v1/creator-eligibility/%d"):format(p1.baseUrl or urlBase.APIS, p0),
			decode = function(p2)
				return p2
			end
		}))
	end,
	isFlagPresent = function(p3, p4)
		return table.find(p3.creatorEligibility, p4) ~= nil
	end
}