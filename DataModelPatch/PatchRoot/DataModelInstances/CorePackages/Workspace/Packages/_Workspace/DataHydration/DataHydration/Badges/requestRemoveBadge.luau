local HttpRequestModule = require(script:FindFirstAncestor("DataHydration").Parent.HttpRequest)
local HttpService = game:GetService("HttpService")
local BadgesUrlBuilderModule = require(script.Parent.BadgesUrlBuilder)

return function(p1)
	-- upvalues: BadgesUrlBuilderModule (copy), HttpRequestModule (copy), HttpService (copy)
	return HttpRequestModule.config({
		requestFunction = function(p2, p3, p4)
			-- upvalues: HttpRequestModule (upval)
			return HttpRequestModule.requestFunctions.RequestInternal(p2, p3, p4)
		end
	})(BadgesUrlBuilderModule.buildBadgeRemoveUrl(p1), "DELETE", { postBody = HttpService:JSONEncode({}) })
end