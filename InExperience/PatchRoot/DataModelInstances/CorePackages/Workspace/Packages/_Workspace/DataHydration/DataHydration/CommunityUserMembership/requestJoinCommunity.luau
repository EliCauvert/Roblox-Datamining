local httpService = game:GetService("HttpService")
local httpRequestModule = require(script:FindFirstAncestor("DataHydration").Parent.HttpRequest)
local communityUserMembershipUrlBuilderModule = require(script.Parent.CommunityUserMembershipUrlBuilder)

return function(p1)
	-- upvalues: communityUserMembershipUrlBuilderModule (ref), httpRequestModule (ref), httpService (ref)
	return httpRequestModule.config({
		requestFunction = function(p2, p3, p4)
			-- upvalues: httpRequestModule (copy)
			return httpRequestModule.requestFunctions.RequestInternal(p2, p3, p4)
		end
	})(communityUserMembershipUrlBuilderModule.buildJoinCommunityUrl(p1), "POST", { postBody = httpService:JSONEncode({}) })
end