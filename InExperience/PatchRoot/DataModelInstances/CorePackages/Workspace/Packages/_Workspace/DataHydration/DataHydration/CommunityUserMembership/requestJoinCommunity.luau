local HttpService = game:GetService("HttpService")
local HttpRequestModule = require(script:FindFirstAncestor("DataHydration").Parent.HttpRequest)
local CommunityUserMembershipUrlBuilderModule = require(script.Parent.CommunityUserMembershipUrlBuilder)

return function(p1)
	-- upvalues: CommunityUserMembershipUrlBuilderModule (copy), HttpRequestModule (copy), HttpService (copy)
	return HttpRequestModule.config({
		requestFunction = function(p2, p3, p4)
			-- upvalues: HttpRequestModule (upval)
			return HttpRequestModule.requestFunctions.RequestInternal(p2, p3, p4)
		end
	})(CommunityUserMembershipUrlBuilderModule.buildJoinCommunityUrl(p1), "POST", { postBody = HttpService:JSONEncode({}) })
end