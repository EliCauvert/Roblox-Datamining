local dataHydration = script:FindFirstAncestor("DataHydration")
local profile = dataHydration.Profile
local parent = dataHydration.Parent
local url = require(parent.Http).Url
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local myHttpRequestModule = require(profile.Networking.myHttpRequest)
local fFlagJoinabilityCTARefactor = require(parent.SharedFlags).FFlagJoinabilityCTARefactor
local var1 = urlBuilder.new({
	path = "profile-platform-api/v1/profiles/batch/get",
	base = url.APIS_URL
})()
local list = {
	{ component = "Actions", excludeContextualActions = true }
}

return function(p1, p2)
	-- upvalues: fFlagJoinabilityCTARefactor (ref), list (ref), myHttpRequestModule (ref), var1 (ref)
	return myHttpRequestModule(var1, "POST", {
		postBody = if fFlagJoinabilityCTARefactor then {
			profileType = "User",
			profileIds = p1,
			components = p2 or list
		} else {
			profileType = "User",
			excludeContextualActions = true,
			profileIds = p1,
			components = { { component = "Actions" } }
		}
	}):catch(function(p3)
		error(p3)
	end)
end