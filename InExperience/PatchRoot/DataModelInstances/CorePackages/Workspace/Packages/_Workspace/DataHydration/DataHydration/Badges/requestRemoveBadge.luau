local httpRequestModule = require(script:FindFirstAncestor("DataHydration").Parent.HttpRequest)
local httpService = game:GetService("HttpService")
local badgesUrlBuilderModule = require(script.Parent.BadgesUrlBuilder)

return function(p0) --[[ line: 10 | named "requestRemoveBadge" ]]
	-- upvalues: badgesUrlBuilderModule (ref), httpRequestModule (ref), httpService (ref)
	return httpRequestModule.config({
		requestFunction = function(p1, p2, p3) --[[ line: 14 ]]
			-- upvalues: httpRequestModule (copy)
			return httpRequestModule.requestFunctions.RequestInternal(p1, p2, p3)
		end
	})(badgesUrlBuilderModule.buildBadgeRemoveUrl(p0), "DELETE", { postBody = httpService:JSONEncode({}) })
end