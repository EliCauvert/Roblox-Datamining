local parent = script:FindFirstAncestor("DataHydration").Parent
local httpClientModule = require(parent.HttpClient)
local urlBase = require(parent.UrlBuilder).UrlBase
local _ = require(script.Parent.ExperienceGuidelinesStoreTypes)
local fetch = httpClientModule.fetch
local asPromise = httpClientModule.asPromise

return {
	fetchDetailedGuidelines = function(p0, p1) --[[ line: 21 ]]
		-- upvalues: urlBase (ref), fetch (ref), asPromise (ref)
		p1 = p1 or {}
		
		return asPromise(fetch({
			method = "POST",
			analyticsKey = "experience-guidelines.get",
			network = p1.network,
			url = (p1.baseUrl or urlBase.APIS) .. "/experience-guidelines-service/v1beta1/detailed-guidelines",
			body = { universeId = p0 },
			decode = function(p2) --[[ line: 33 ]]
				return p2
			end
		}))
	end
}