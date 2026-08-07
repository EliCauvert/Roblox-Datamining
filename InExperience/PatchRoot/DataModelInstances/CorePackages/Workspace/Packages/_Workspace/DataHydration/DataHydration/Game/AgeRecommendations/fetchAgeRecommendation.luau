local parent = script:FindFirstAncestor("DataHydration").Parent
local httpModule = require(parent.Http)
local httpRequestModule = require(parent.HttpRequest)
local httpService = game:GetService("HttpService")
local var3 = require(parent.UrlBuilder).UrlBuilder.new({
	path = "experience-guidelines-api/experience-guidelines/get-age-recommendation",
	base = httpModule.Url.APIS_URL
})()

return function(p0) --[[ line: 20 | named "requestAgeRecommendation" ]]
	-- upvalues: httpService (ref), httpRequestModule (ref), var3 (ref)
	return httpRequestModule.config({
		requestFunction = function(p1, p2, p3) --[[ line: 23 ]]
			-- upvalues: httpRequestModule (copy)
			return httpRequestModule.requestFunctions.HttpRbxApi(p1, p2, p3)
		end
	})(var3, "POST", { postBody = httpService:JSONEncode({ universeId = p0 }) })
end