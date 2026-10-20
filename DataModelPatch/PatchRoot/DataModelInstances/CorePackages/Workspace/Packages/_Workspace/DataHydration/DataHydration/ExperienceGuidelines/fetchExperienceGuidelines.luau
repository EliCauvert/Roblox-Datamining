local Parent = script:FindFirstAncestor("DataHydration").Parent
local HttpClientModule = require(Parent.HttpClient)
local UrlBase = require(Parent.UrlBuilder).UrlBase
local _ = require(script.Parent.ExperienceGuidelinesStoreTypes)
local FetchFunction = HttpClientModule.fetch
local AsPromiseFunction = HttpClientModule.asPromise

return {
	fetchDetailedGuidelines = function(UniverseId, p1)
		-- upvalues: UrlBase (copy), FetchFunction (copy), AsPromiseFunction (copy)
		local P1 = p1 or {}
		
		return AsPromiseFunction((FetchFunction({
			method = "POST",
			analyticsKey = "experience-guidelines.get",
			network = P1.network,
			url = (P1.baseUrl or UrlBase.APIS) .. "/experience-guidelines-service/v1beta1/detailed-guidelines",
			body = { universeId = UniverseId },
			decode = function(p2)
				return p2
			end
		})))
	end
}