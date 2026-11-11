local RoduxNetworkingModule = require(script.Parent.RoduxNetworking)
local Text = require(script:FindFirstAncestor("AppChat").Parent.Http).Url.APIS_URL .. "profile-platform-api/v1/profiles/get"

return function(ProfileId, p1)
	-- upvalues: RoduxNetworkingModule (copy), Text (copy)
	return (p1 or RoduxNetworkingModule.getNetworkImpl())(Text, "POST", {
		postBody = {
			profileType = "User",
			includeComponentOrdering = false,
			profileId = ProfileId,
			components = { { component = "Actions" } }
		}
	}):andThen(function(Result)
		return Result and (Result.responseBody and (Result.responseBody.components and (Result.responseBody.components.Actions and Result.responseBody.components.Actions.contextual))) or {}
	end)
end