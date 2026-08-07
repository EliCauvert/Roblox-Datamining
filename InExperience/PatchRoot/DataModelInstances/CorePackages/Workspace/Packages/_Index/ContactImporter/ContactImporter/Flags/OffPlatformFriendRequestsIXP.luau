game:DefineFastInt("OffPlatformFriendRequestsRolloutEnabled", 0)
local contactImporter = script:FindFirstAncestor("ContactImporter")
local dependenciesModule = require(contactImporter.dependencies)
local parent = contactImporter.Parent
local setupIsRolloutEnabledForUser = dependenciesModule.SocialLibraries.ReleaseHelpers.setupIsRolloutEnabledForUser
local getFStringSocialFriendsLayer = dependenciesModule.getFStringSocialFriendsLayer
local useUserExperiment = dependenciesModule.useUserExperiment
local IXPVariantsModule = require(contactImporter.Common.IXPVariants)
local var3 = require(script.Parent.getFStringOffPlatformIXPName)()
local fFlagContactImporterIXPCleanup = require(parent.SharedFlags).FFlagContactImporterIXPCleanup

local var4 = function() --[[ line: 21 ]]
	return game:GetFastInt("OffPlatformFriendRequestsRolloutEnabled")
end

local _ = function(p0) --[[ line: 25 ]]
	-- upvalues: var3 (ref)
	return if p0 then p0[var3] else nil
end

local var5 = function(p1) --[[ line: 34 ]]
	-- upvalues: getFStringSocialFriendsLayer (ref), var3 (ref)
	local var8 = if p1 then p1[getFStringSocialFriendsLayer()] else nil
	
	return if var8 then var8[var3] else nil
end

local var6 = setupIsRolloutEnabledForUser(var4)

local var7 = function(p2) --[[ line: 40 ]]
	-- upvalues: getFStringSocialFriendsLayer (ref), var3 (ref), IXPVariantsModule (ref), var6 (ref)
	local var9 = if p2 then p2[getFStringSocialFriendsLayer()] else nil
	local var10 = if var9 then var9[var3] else nil
	local var11 = false
	
	if var10 then
		var10 = true
		
		if var10 ~= IXPVariantsModule.INVITES_ONLY then
			var10 = var10 == IXPVariantsModule.BLENDED
		end
		var11 = var10
	end
	return var11 or var6()
end

return if fFlagContactImporterIXPCleanup then nil else {
	experimentOrRolloutEnabled = var7,
	IXPVariants = IXPVariantsModule,
	useOffPlatformFriendRequestsVariant = function() --[[ line: 51 ]]
		-- upvalues: useUserExperiment (ref), getFStringSocialFriendsLayer (ref), var5 (ref)
		return useUserExperiment({ getFStringSocialFriendsLayer() }, var5)
	end,
	useOffPlatformFriendRequestsEnabled = function() --[[ line: 57 ]]
		-- upvalues: useUserExperiment (ref), getFStringSocialFriendsLayer (ref), var7 (ref)
		return useUserExperiment({ getFStringSocialFriendsLayer() }, var7)
	end,
	getExperimentVariant = var5,
	isRolloutEnabled = function(p3) --[[ line: 72 ]]
		-- upvalues: getFStringSocialFriendsLayer (ref), var3 (ref), IXPVariantsModule (ref), var6 (ref)
		local var12 = if p3 then p3[getFStringSocialFriendsLayer()] else nil
		local var13 = if var12 then var12[var3] else nil
		local var14 = false
		
		if var13 then
			var13 = true
			
			if var13 ~= IXPVariantsModule.INVITES_ONLY then
				var13 = var13 == IXPVariantsModule.BLENDED
			end
			var14 = var13
		end
		return if var14 or var6() then IXPVariantsModule.BLENDED else IXPVariantsModule.CONTROL
	end
}