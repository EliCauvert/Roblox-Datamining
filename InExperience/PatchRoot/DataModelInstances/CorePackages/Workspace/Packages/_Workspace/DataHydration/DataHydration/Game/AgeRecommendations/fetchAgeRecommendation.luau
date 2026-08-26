local parent = script:FindFirstAncestor("DataHydration").Parent
local httpModule = require(parent.Http)
local httpRequestModule = require(parent.HttpRequest)
local httpService = game:GetService("HttpService")
local var1 = require(parent.UrlBuilder).UrlBuilder.new({
	path = "experience-guidelines-api/experience-guidelines/get-age-recommendation",
	base = httpModule.Url.APIS_URL
})()

return function(p1)
	-- upvalues: httpService (ref), httpRequestModule (ref), var1 (ref)
	return httpRequestModule.config({
		requestFunction = function(p2, p3, p4)
			-- upvalues: httpRequestModule (copy)
			return httpRequestModule.requestFunctions.HttpRbxApi(p2, p3, p4)
		end
	})(var1, "POST", { postBody = httpService:JSONEncode({ universeId = p1 }) })
end