local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local MyHttpRequestModule = require(DataHydration.Profile.Networking.myHttpRequest)
local FFlagJoinabilityCTARefactor = require(Parent.SharedFlags).FFlagJoinabilityCTARefactor
local v1 = require(Parent.UrlBuilder).UrlBuilder.new({
	path = "profile-platform-api/v1/profiles/batch/get",
	base = require(Parent.Http).Url.APIS_URL
})()
local list = {
	{ component = "Actions", excludeContextualActions = true }
}

return function(ProfileIds, p1) --[[ Line: 41 ]]
	-- upvalues: FFlagJoinabilityCTARefactor (copy), list (copy), MyHttpRequestModule (copy), v1 (copy)
	return MyHttpRequestModule(v1, "POST", {
		postBody = if FFlagJoinabilityCTARefactor then {
			profileType = "User",
			profileIds = ProfileIds,
			components = p1 or list
		} else {
			profileType = "User",
			excludeContextualActions = true,
			profileIds = ProfileIds,
			components = { { component = "Actions" } }
		}
	}):catch(function(Err) --[[ Line: 62 ]]
		error(Err)
	end)
end