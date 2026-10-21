local Parent = script:FindFirstAncestor("DataHydration").Parent
local HttpClientModule = require(Parent.HttpClient)
local HttpModule = require(Parent.Http)
local TModule = require(Parent.t)
local _ = require(script.Parent.GamePermissionsStoreTypes)
local FetchFunction = HttpClientModule.fetch
local AsPromiseFunction = HttpClientModule.asPromise
local InterfaceResult = TModule.interface({
	permissions = TModule.map(TModule.string, TModule.boolean)
})

local function decodeUniversePermissions(p1)
	-- upvalues: InterfaceResult (copy)
	local InterfaceResultResult, InterfaceResultResult2 = InterfaceResult(p1)
	assert(InterfaceResultResult, `Invalid universe permissions response: {tostring(InterfaceResultResult2)}`)
	local Permissions = p1.permissions
	
	return {
		canEdit = Permissions.canEdit == true,
		canEditOnBuild = Permissions.canEditOnBuild == true,
		canPublish = Permissions.canPublish == true,
		canMonetize = Permissions.canMonetize == true,
		canViewAnalytics = Permissions.canViewAnalytics == true,
		canPreview = Permissions.canPreview == true,
		canAdvertise = Permissions.canAdvertise == true,
		canViewOnCreatorHub = Permissions.canViewOnCreatorHub == true
	}
end

return {
	fetchUniversePermissions = function(p1, p2)
		-- upvalues: HttpModule (copy), FetchFunction (copy), decodeUniversePermissions (copy), AsPromiseFunction (copy)
		local P2 = p2 or {}
		
		return AsPromiseFunction((FetchFunction({
			method = "GET",
			analyticsKey = "groups.universe-permissions",
			network = P2.network,
			url = `{P2.baseUrl or HttpModule.Url.GROUPS_URL}v2/universes/{p1}/permissions/resolved`,
			decode = decodeUniversePermissions
		})))
	end
}