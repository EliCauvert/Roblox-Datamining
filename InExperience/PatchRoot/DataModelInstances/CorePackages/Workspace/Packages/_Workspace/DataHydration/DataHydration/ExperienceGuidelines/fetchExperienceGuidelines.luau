local parent = script:FindFirstAncestor("DataHydration").Parent
local httpClientModule = require(parent.HttpClient)
local urlBase = require(parent.UrlBuilder).UrlBase
local _ = require(script.Parent.ExperienceGuidelinesStoreTypes)
local fetch = httpClientModule.fetch
local asPromise = httpClientModule.asPromise

return {
	fetchDetailedGuidelines = function(p1, p2)
		-- upvalues: urlBase (ref), fetch (ref), asPromise (ref)
		p2 = p2 or {}
		
		return asPromise(fetch({
			method = "POST",
			analyticsKey = "experience-guidelines.get",
			network = p2.network,
			url = (p2.baseUrl or urlBase.APIS) .. "/experience-guidelines-service/v1beta1/detailed-guidelines",
			body = { universeId = p1 },
			decode = function(p3)
				return p3
			end
		}))
	end
}