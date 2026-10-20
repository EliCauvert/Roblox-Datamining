local Parent = script:FindFirstAncestor("DataHydration").Parent
local HttpRequestModule = require(Parent.HttpRequest)
local HttpService = game:GetService("HttpService")
local v1 = require(Parent.UrlBuilder).UrlBuilder.new({
	path = "experience-guidelines-api/experience-guidelines/get-age-recommendation",
	base = require(Parent.Http).Url.APIS_URL
})()

return function(UniverseId)
	-- upvalues: HttpService (copy), HttpRequestModule (copy), v1 (copy)
	return HttpRequestModule.config({
		requestFunction = function(p1, p2, p3)
			-- upvalues: HttpRequestModule (upval)
			return HttpRequestModule.requestFunctions.HttpRbxApi(p1, p2, p3)
		end
	})(v1, "POST", {
		postBody = HttpService:JSONEncode({ universeId = UniverseId })
	})
end