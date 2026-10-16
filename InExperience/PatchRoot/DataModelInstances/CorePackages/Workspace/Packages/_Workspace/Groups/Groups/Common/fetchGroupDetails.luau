local Parent = script:FindFirstAncestor("Groups").Parent
local HttpService = game:GetService("HttpService")
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local FFlagAddCommunityDeactivatedToJoinPrompt = require(Parent.SharedFlags).FFlagAddCommunityDeactivatedToJoinPrompt

return function(Callback, ProfileId) --[[ Line: 10 ]]
	-- upvalues: UrlBuilder (copy), FFlagAddCommunityDeactivatedToJoinPrompt (copy), HttpService (copy)
	local Get = UrlBuilder.fromString("apis:profile-platform-api/v1/profiles/get")
	local Components = {
		{ component = "CommunityProfileHeader" },
		{ component = "Actions" },
		{ component = "CommunityLocked" }
	}
	
	if FFlagAddCommunityDeactivatedToJoinPrompt then
		table.insert(Components, { component = "CommunityDeactivated" })
	end
	return Callback(Get(), "POST", {
		postBody = HttpService:JSONEncode({
			profileType = "Community",
			profileId = ProfileId,
			components = Components
		})
	}):andThen(function(Result) --[[ Line: 34 ]]
		return Result.responseBody
	end)
end