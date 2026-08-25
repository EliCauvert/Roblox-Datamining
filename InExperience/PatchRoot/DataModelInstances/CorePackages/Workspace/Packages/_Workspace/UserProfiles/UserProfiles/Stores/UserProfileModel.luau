local parent = script:FindFirstAncestor("UserProfiles").Parent
local createSignal = require(parent.Signals).createSignal
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagEnableVerifiedBadgeStore = sharedFlagsModule.FFlagEnableVerifiedBadgeStore
local fFlagEnableBlackbirdCheck = sharedFlagsModule.FFlagEnableBlackbirdCheck

return {
	update = function(p0, p1)
		-- upvalues: fFlagEnableVerifiedBadgeStore (ref), fFlagEnableBlackbirdCheck (ref)
		if not p1 or type(p1) ~= "table" then return end
		local names = p1.names
		
		if names and type(names) == "table" then
			local username = names.username
			
			if username and type(username) == "string" then
				p0.names.setUsername(username)
			end
			local displayName = names.displayName
			
			if displayName and type(displayName) == "string" then
				p0.names.setDisplayName(displayName)
			end
			local combinedName = names.combinedName
			
			if combinedName and type(combinedName) == "string" then
				p0.names.setCombinedName(combinedName)
			end
			local inExperienceCombinedName = names.inExperienceCombinedName
			
			if inExperienceCombinedName and type(inExperienceCombinedName) == "string" then
				p0.names.setInExperienceCombinedName(inExperienceCombinedName)
			end
			local platformName = names.platformName
			
			if platformName and type(platformName) == "string" then
				p0.names.setPlatformName(platformName)
			end
			local contactName = names.contactName
			
			if contactName and type(contactName) == "string" then
				p0.names.setContactName(contactName)
			end
			local alias = names.alias
			
			if alias and type(alias) == "string" then
				p0.names.setAlias(alias)
			end
		end
		local platformProfileId = p1.platformProfileId
		
		if platformProfileId and type(platformProfileId) == "string" then
			p0.setPlatformProfileId(platformProfileId)
		end
		local var1 = if fFlagEnableVerifiedBadgeStore then p1.isVerified else nil
		
		if var1 ~= nil and type(var1) == "boolean" then
			p0.setIsVerified(var1)
		end
		local var2 = if fFlagEnableBlackbirdCheck then p1.hasRobloxSubscription else nil
		
		if var2 ~= nil and type(var2) == "boolean" then
			p0.setHasRobloxSubscription(var2)
		end
	end,
	create = function(p2)
		-- upvalues: createSignal (ref), fFlagEnableVerifiedBadgeStore (ref), fFlagEnableBlackbirdCheck (ref)
		local var3, var4 = createSignal("")
		local var5, var6 = createSignal("")
		local var7, var8 = createSignal("")
		local var9, var10 = createSignal("")
		local var11, var12 = createSignal("")
		local var13, var14 = createSignal("")
		local var15, var16 = createSignal("")
		local var17, var18 = createSignal("")
		local var19 = nil
		local var20 = nil
		
		if fFlagEnableVerifiedBadgeStore then
			local var21, var22 = createSignal(false)
			var19 = var21
			var20 = var22
		end
		local var23 = nil
		local var24 = nil
		
		if fFlagEnableBlackbirdCheck then
			local var25, var26 = createSignal(false)
			var23 = var25
			var24 = var26
		end
		return {
			userId = p2,
			names = {
				getUsername = var3,
				setUsername = var4,
				getDisplayName = var5,
				setDisplayName = var6,
				getCombinedName = var7,
				setCombinedName = var8,
				getInExperienceCombinedName = var9,
				setInExperienceCombinedName = var10,
				getPlatformName = var11,
				setPlatformName = var12,
				getContactName = var13,
				setContactName = var14,
				getAlias = var15,
				setAlias = var16
			},
			getPlatformProfileId = var17,
			setPlatformProfileId = var18,
			getIsVerified = if fFlagEnableVerifiedBadgeStore then var19 else nil,
			setIsVerified = if fFlagEnableVerifiedBadgeStore then var20 else nil,
			getHasRobloxSubscription = if fFlagEnableBlackbirdCheck then var23 else nil,
			setHasRobloxSubscription = if fFlagEnableBlackbirdCheck then var24 else nil
		}
	end
}