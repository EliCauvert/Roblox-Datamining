local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local myHttpRequestModule = require(dataHydration.Profile.Networking.myHttpRequest)
local var2 = require(parent.UrlBuilder).UrlBuilder.new({
	path = "profile-platform-api/v1/profiles/batch/get",
	base = require(parent.Http).Url.APIS_URL
})()

return function(p0) --[[ line: 15 ]]
	-- upvalues: myHttpRequestModule (ref), var2 (ref)
	return myHttpRequestModule(var2, "POST", {
		postBody = {
			profileType = "User",
			excludeContextualActions = true,
			profileIds = p0,
			components = { { component = "Actions" } }
		}
	}):catch(function(p1) --[[ line: 26 ]]
		error(p1)
	end)
end