local parent = script:FindFirstAncestor("Groups").Parent
local httpService = game:GetService("HttpService")
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local fFlagAddCommunityDeactivatedToJoinPrompt = require(parent.SharedFlags).FFlagAddCommunityDeactivatedToJoinPrompt

return function(p1, p2)
	-- upvalues: urlBuilder (ref), fFlagAddCommunityDeactivatedToJoinPrompt (ref), httpService (ref)
	local var1 = urlBuilder.fromString("apis:profile-platform-api/v1/profiles/get")
	local list = {
		{ component = "CommunityProfileHeader" },
		{ component = "Actions" },
		{ component = "CommunityLocked" }
	}
	
	if fFlagAddCommunityDeactivatedToJoinPrompt then
		table.insert(list, { component = "CommunityDeactivated" })
	end
	return p1(var1(), "POST", {
		postBody = httpService:JSONEncode({
			profileType = "Community",
			profileId = p2,
			components = list
		})
	}):andThen(function(p3)
		return p3.responseBody
	end)
end