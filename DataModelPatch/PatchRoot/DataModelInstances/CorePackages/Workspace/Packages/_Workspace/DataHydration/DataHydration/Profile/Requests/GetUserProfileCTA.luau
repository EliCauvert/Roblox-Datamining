local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local MyHttpRequestModule = require(DataHydration.Profile.Networking.myHttpRequest)
local v1 = require(Parent.UrlBuilder).UrlBuilder.new({
	path = "profile-platform-api/v1/profiles/batch/get",
	base = require(Parent.Http).Url.APIS_URL
})()

return function(ProfileIds)
	-- upvalues: MyHttpRequestModule (copy), v1 (copy)
	return MyHttpRequestModule(v1, "POST", {
		postBody = {
			profileType = "User",
			excludeContextualActions = true,
			profileIds = ProfileIds,
			components = { { component = "Actions" } }
		}
	}):catch(function(Err)
		error(Err)
	end)
end