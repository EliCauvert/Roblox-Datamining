local httpService = game:GetService("HttpService")
local httpRequestModule = require(script:FindFirstAncestor("DataHydration").Parent.HttpRequest)
local communityUserMembershipUrlBuilderModule = require(script.Parent.CommunityUserMembershipUrlBuilder)

return function(p0) --[[ line: 11 | named "requestJoinCommunity" ]]
	-- upvalues: communityUserMembershipUrlBuilderModule (ref), httpRequestModule (ref), httpService (ref)
	return httpRequestModule.config({
		requestFunction = function(p1, p2, p3) --[[ line: 15 ]]
			-- upvalues: httpRequestModule (copy)
			return httpRequestModule.requestFunctions.RequestInternal(p1, p2, p3)
		end
	})(communityUserMembershipUrlBuilderModule.buildJoinCommunityUrl(p0), "POST", { postBody = httpService:JSONEncode({}) })
end