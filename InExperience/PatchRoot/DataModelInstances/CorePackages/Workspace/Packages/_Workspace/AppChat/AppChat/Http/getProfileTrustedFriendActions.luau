local roduxNetworkingModule = require(script.Parent.RoduxNetworking)
local text = require(script:FindFirstAncestor("AppChat").Parent.Http).Url.APIS_URL .. "profile-platform-api/v1/profiles/get"

return function(p1, p2)
	-- upvalues: roduxNetworkingModule (ref), text (ref)
	return (p2 or roduxNetworkingModule.getNetworkImpl())(text, "POST", {
		postBody = {
			profileType = "User",
			includeComponentOrdering = false,
			profileId = p1,
			components = { { component = "Actions" } }
		}
	}):andThen(function(p3)
		return p3 and (p3.responseBody and (p3.responseBody.components and (p3.responseBody.components.Actions and p3.responseBody.components.Actions.contextual))) or {}
	end)
end