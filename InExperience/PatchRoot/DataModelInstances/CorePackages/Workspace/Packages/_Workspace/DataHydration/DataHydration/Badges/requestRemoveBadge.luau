local httpRequestModule = require(script:FindFirstAncestor("DataHydration").Parent.HttpRequest)
local httpService = game:GetService("HttpService")
local badgesUrlBuilderModule = require(script.Parent.BadgesUrlBuilder)

return function(p1)
	-- upvalues: badgesUrlBuilderModule (ref), httpRequestModule (ref), httpService (ref)
	return httpRequestModule.config({
		requestFunction = function(p2, p3, p4)
			-- upvalues: httpRequestModule (copy)
			return httpRequestModule.requestFunctions.RequestInternal(p2, p3, p4)
		end
	})(badgesUrlBuilderModule.buildBadgeRemoveUrl(p1), "DELETE", { postBody = httpService:JSONEncode({}) })
end