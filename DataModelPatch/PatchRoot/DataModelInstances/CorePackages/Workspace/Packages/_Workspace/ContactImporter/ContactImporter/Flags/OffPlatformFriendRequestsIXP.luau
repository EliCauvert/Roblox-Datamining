game:DefineFastInt("OffPlatformFriendRequestsRolloutEnabled", 0)
local ContactImporter = script:FindFirstAncestor("ContactImporter")
local DependenciesModule = require(ContactImporter.dependencies)
local GetFStringSocialFriendsLayerFunction = DependenciesModule.getFStringSocialFriendsLayer
local UseUserExperimentFunction = DependenciesModule.useUserExperiment
local IXPVariantsModule = require(ContactImporter.Common.IXPVariants)
local v1 = require(script.Parent.getFStringOffPlatformIXPName)()

local function _(p1)
	-- upvalues: v1 (copy)
	return if p1 then p1[v1] else nil
end

local function GetExperimentVariant(p1)
	-- upvalues: GetFStringSocialFriendsLayerFunction (copy), v1 (copy)
	local v2 = if p1 then p1[GetFStringSocialFriendsLayerFunction()] else nil
	
	return if v2 then v2[v1] else nil
end

local SetupIsRolloutEnabledForUserResult = DependenciesModule.SocialLibraries.ReleaseHelpers.setupIsRolloutEnabledForUser(function()
	return game:GetFastInt("OffPlatformFriendRequestsRolloutEnabled")
end)

local function ExperimentOrRolloutEnabled(p1)
	-- upvalues: GetFStringSocialFriendsLayerFunction (copy), v1 (copy), IXPVariantsModule (copy), SetupIsRolloutEnabledForUserResult (copy)
	local v2 = if p1 then p1[GetFStringSocialFriendsLayerFunction()] else nil
	local BLENDED = if v2 then v2[v1] else nil
	
	return (if BLENDED then BLENDED == IXPVariantsModule.INVITES_ONLY or BLENDED == IXPVariantsModule.BLENDED else false) or SetupIsRolloutEnabledForUserResult()
end

local function UseOffPlatformFriendRequestsVariant()
	-- upvalues: UseUserExperimentFunction (copy), GetFStringSocialFriendsLayerFunction (copy), GetExperimentVariant (copy)
	return UseUserExperimentFunction({ GetFStringSocialFriendsLayerFunction() }, GetExperimentVariant)
end

local function UseOffPlatformFriendRequestsEnabled()
	-- upvalues: UseUserExperimentFunction (copy), GetFStringSocialFriendsLayerFunction (copy), ExperimentOrRolloutEnabled (copy)
	return UseUserExperimentFunction({ GetFStringSocialFriendsLayerFunction() }, ExperimentOrRolloutEnabled)
end

return if require(ContactImporter.Parent.SharedFlags).FFlagContactImporterIXPCleanup then nil else {
	experimentOrRolloutEnabled = ExperimentOrRolloutEnabled,
	IXPVariants = IXPVariantsModule,
	useOffPlatformFriendRequestsVariant = UseOffPlatformFriendRequestsVariant,
	useOffPlatformFriendRequestsEnabled = UseOffPlatformFriendRequestsEnabled,
	getExperimentVariant = GetExperimentVariant,
	isRolloutEnabled = function(p1)
		-- upvalues: GetFStringSocialFriendsLayerFunction (copy), v1 (copy), IXPVariantsModule (copy), SetupIsRolloutEnabledForUserResult (copy)
		local v2 = if p1 then p1[GetFStringSocialFriendsLayerFunction()] else nil
		local BLENDED = if v2 then v2[v1] else nil
		local IsBLENDEDMatch = (if BLENDED then BLENDED == IXPVariantsModule.INVITES_ONLY or BLENDED == IXPVariantsModule.BLENDED else false) or SetupIsRolloutEnabledForUserResult()
		
		return if IsBLENDEDMatch then IXPVariantsModule.BLENDED else IXPVariantsModule.CONTROL
	end
}