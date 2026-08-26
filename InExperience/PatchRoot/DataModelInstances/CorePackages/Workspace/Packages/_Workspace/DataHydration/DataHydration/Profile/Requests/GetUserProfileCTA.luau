local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local myHttpRequestModule = require(dataHydration.Profile.Networking.myHttpRequest)
local var1 = require(parent.UrlBuilder).UrlBuilder.new({
	path = "profile-platform-api/v1/profiles/batch/get",
	base = require(parent.Http).Url.APIS_URL
})()

return function(p1)
	-- upvalues: myHttpRequestModule (ref), var1 (ref)
	return myHttpRequestModule(var1, "POST", {
		postBody = {
			profileType = "User",
			excludeContextualActions = true,
			profileIds = p1,
			components = { { component = "Actions" } }
		}
	}):catch(function(p2)
		error(p2)
	end)
end