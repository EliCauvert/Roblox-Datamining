local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local MyHttpRequestModule = require(DataHydration.Profile.Networking.myHttpRequest)
local FFlagJoinabilityCTARefactor = require(Parent.SharedFlags).FFlagJoinabilityCTARefactor
local FFlagUserListActionsV2 = require(Parent.SharedFlags).FFlagUserListActionsV2
local v1 = require(Parent.UrlBuilder).UrlBuilder.new({
	path = "profile-platform-api/v1/profiles/batch/get",
	base = require(Parent.Http).Url.APIS_URL
})()
local list = {
	{ component = "Actions", excludeContextualActions = true }
}

return function(ProfileIds, Components)
	-- upvalues: FFlagJoinabilityCTARefactor (copy), list (copy), FFlagUserListActionsV2 (copy), MyHttpRequestModule (copy), v1 (copy)
	local PostBody = nil
	if FFlagJoinabilityCTARefactor then
		PostBody = {
			profileType = "User",
			profileIds = ProfileIds,
			components = Components or list
		}
	else
		PostBody = {
			profileType = "User",
			excludeContextualActions = true,
			profileIds = ProfileIds,
			components = { { component = "Actions" } }
		}
		
		if FFlagUserListActionsV2 and Components then
			PostBody.components = Components
		end
	end
	return MyHttpRequestModule(v1, "POST", { postBody = PostBody }):catch(function(Err)
		error(Err)
	end)
end