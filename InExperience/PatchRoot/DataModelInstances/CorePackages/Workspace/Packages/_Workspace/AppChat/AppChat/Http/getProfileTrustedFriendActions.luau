local roduxNetworkingModule = require(script.Parent.RoduxNetworking)
local text = require(script:FindFirstAncestor("AppChat").Parent.Http).Url.APIS_URL .. "profile-platform-api/v1/profiles/get"

return function(p0, p1) --[[ line: 10 ]]
	-- upvalues: roduxNetworkingModule (ref), text (ref)
	return (p1 or roduxNetworkingModule.getNetworkImpl())(text, "POST", {
		postBody = {
			profileType = "User",
			includeComponentOrdering = false,
			profileId = p0,
			components = { { component = "Actions" } }
		}
	}):andThen(function(p2) --[[ line: 24 ]]
		return p2 and (p2.responseBody and (p2.responseBody.components and (p2.responseBody.components.Actions and p2.responseBody.components.Actions.contextual))) or {}
	end)
end