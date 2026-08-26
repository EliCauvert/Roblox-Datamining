local parent = script:FindFirstAncestor("UserProfiles").Parent
local createSignal = require(parent.Signals).createSignal
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagEnableVerifiedBadgeStore = sharedFlagsModule.FFlagEnableVerifiedBadgeStore
local fFlagEnableBlackbirdCheck = sharedFlagsModule.FFlagEnableBlackbirdCheck

return {
	update = function(p1, p2)
		-- upvalues: fFlagEnableVerifiedBadgeStore (ref), fFlagEnableBlackbirdCheck (ref)
		if not p2 or type(p2) ~= "table" then return end
		local names = p2.names
		
		if names and type(names) == "table" then
			local username = names.username
			
			if username and type(username) == "string" then
				p1.names.setUsername(username)
			end
			local displayName = names.displayName
			
			if displayName and type(displayName) == "string" then
				p1.names.setDisplayName(displayName)
			end
			local combinedName = names.combinedName
			
			if combinedName and type(combinedName) == "string" then
				p1.names.setCombinedName(combinedName)
			end
			local inExperienceCombinedName = names.inExperienceCombinedName
			
			if inExperienceCombinedName and type(inExperienceCombinedName) == "string" then
				p1.names.setInExperienceCombinedName(inExperienceCombinedName)
			end
			local platformName = names.platformName
			
			if platformName and type(platformName) == "string" then
				p1.names.setPlatformName(platformName)
			end
			local contactName = names.contactName
			
			if contactName and type(contactName) == "string" then
				p1.names.setContactName(contactName)
			end
			local alias = names.alias
			
			if alias and type(alias) == "string" then
				p1.names.setAlias(alias)
			end
		end
		local platformProfileId = p2.platformProfileId
		
		if platformProfileId and type(platformProfileId) == "string" then
			p1.setPlatformProfileId(platformProfileId)
		end
		local var1 = if fFlagEnableVerifiedBadgeStore then p2.isVerified else nil
		
		if var1 ~= nil and type(var1) == "boolean" then
			p1.setIsVerified(var1)
		end
		local var2 = if fFlagEnableBlackbirdCheck then p2.hasRobloxSubscription else nil
		
		if var2 ~= nil and type(var2) == "boolean" then
			p1.setHasRobloxSubscription(var2)
		end
	end,
	create = function(p1)
		-- upvalues: createSignal (ref), fFlagEnableVerifiedBadgeStore (ref), fFlagEnableBlackbirdCheck (ref)
		local var1, var2 = createSignal("")
		local var3, var4 = createSignal("")
		local var5, var6 = createSignal("")
		local var7, var8 = createSignal("")
		local var9, var10 = createSignal("")
		local var11, var12 = createSignal("")
		local var13, var14 = createSignal("")
		local var15, var16 = createSignal("")
		local var17 = nil
		local var18 = nil
		
		if fFlagEnableVerifiedBadgeStore then
			local var19, var20 = createSignal(false)
			var17 = var19
			var18 = var20
		end
		local var21 = nil
		local var22 = nil
		
		if fFlagEnableBlackbirdCheck then
			local var23, var24 = createSignal(false)
			var21 = var23
			var22 = var24
		end
		return {
			userId = p1,
			names = {
				getUsername = var1,
				setUsername = var2,
				getDisplayName = var3,
				setDisplayName = var4,
				getCombinedName = var5,
				setCombinedName = var6,
				getInExperienceCombinedName = var7,
				setInExperienceCombinedName = var8,
				getPlatformName = var9,
				setPlatformName = var10,
				getContactName = var11,
				setContactName = var12,
				getAlias = var13,
				setAlias = var14
			},
			getPlatformProfileId = var15,
			setPlatformProfileId = var16,
			getIsVerified = if fFlagEnableVerifiedBadgeStore then var17 else nil,
			setIsVerified = if fFlagEnableVerifiedBadgeStore then var18 else nil,
			getHasRobloxSubscription = if fFlagEnableBlackbirdCheck then var21 else nil,
			setHasRobloxSubscription = if fFlagEnableBlackbirdCheck then var22 else nil
		}
	end
}