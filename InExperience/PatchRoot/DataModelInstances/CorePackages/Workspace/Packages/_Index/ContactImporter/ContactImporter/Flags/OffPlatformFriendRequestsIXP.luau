game:DefineFastInt("OffPlatformFriendRequestsRolloutEnabled", 0)
local contactImporter = script:FindFirstAncestor("ContactImporter")
local dependenciesModule = require(contactImporter.dependencies)
local parent = contactImporter.Parent
local setupIsRolloutEnabledForUser = dependenciesModule.SocialLibraries.ReleaseHelpers.setupIsRolloutEnabledForUser
local getFStringSocialFriendsLayer = dependenciesModule.getFStringSocialFriendsLayer
local useUserExperiment = dependenciesModule.useUserExperiment
local IXPVariantsModule = require(contactImporter.Common.IXPVariants)
local var1 = require(script.Parent.getFStringOffPlatformIXPName)()
local fFlagContactImporterIXPCleanup = require(parent.SharedFlags).FFlagContactImporterIXPCleanup

local var2 = function()
	return game:GetFastInt("OffPlatformFriendRequestsRolloutEnabled")
end

local _ = function(p1)
	-- upvalues: var1 (ref)
	return if p1 then p1[var1] else nil
end

local var3 = function(p1)
	-- upvalues: getFStringSocialFriendsLayer (ref), var1 (ref)
	local var4 = if p1 then p1[getFStringSocialFriendsLayer()] else nil
	
	return if var4 then var4[var1] else nil
end

local var4 = setupIsRolloutEnabledForUser(var2)

local var5 = function(p1)
	-- upvalues: getFStringSocialFriendsLayer (ref), var1 (ref), IXPVariantsModule (ref), var4 (ref)
	local var6 = if p1 then p1[getFStringSocialFriendsLayer()] else nil
	local var7 = if var6 then var6[var1] else nil
	local var8 = false
	
	if var7 then
		var7 = true
		
		if var7 ~= IXPVariantsModule.INVITES_ONLY then
			var7 = var7 == IXPVariantsModule.BLENDED
		end
		var8 = var7
	end
	return var8 or var4()
end

return if fFlagContactImporterIXPCleanup then nil else {
	experimentOrRolloutEnabled = var5,
	IXPVariants = IXPVariantsModule,
	useOffPlatformFriendRequestsVariant = function()
		-- upvalues: useUserExperiment (ref), getFStringSocialFriendsLayer (ref), var3 (ref)
		return useUserExperiment({ getFStringSocialFriendsLayer() }, var3)
	end,
	useOffPlatformFriendRequestsEnabled = function()
		-- upvalues: useUserExperiment (ref), getFStringSocialFriendsLayer (ref), var5 (ref)
		return useUserExperiment({ getFStringSocialFriendsLayer() }, var5)
	end,
	getExperimentVariant = var3,
	isRolloutEnabled = function(p1)
		-- upvalues: getFStringSocialFriendsLayer (ref), var1 (ref), IXPVariantsModule (ref), var4 (ref)
		local var6 = if p1 then p1[getFStringSocialFriendsLayer()] else nil
		local var7 = if var6 then var6[var1] else nil
		local var8 = false
		
		if var7 then
			var7 = true
			
			if var7 ~= IXPVariantsModule.INVITES_ONLY then
				var7 = var7 == IXPVariantsModule.BLENDED
			end
			var8 = var7
		end
		return if var8 or var4() then IXPVariantsModule.BLENDED else IXPVariantsModule.CONTROL
	end
}