local Parent = script:FindFirstAncestor("UserProfiles").Parent
local CreateSignalFunction = require(Parent.Signals).createSignal
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagEnableVerifiedBadgeStore = SharedFlagsModule.FFlagEnableVerifiedBadgeStore
local FFlagEnableBlackbirdCheck = SharedFlagsModule.FFlagEnableBlackbirdCheck

return {
	update = function(p1, p2)
		-- upvalues: FFlagEnableVerifiedBadgeStore (copy), FFlagEnableBlackbirdCheck (copy)
		if not p2 or type(p2) ~= "table" then return end
		local Names = p2.names
		
		if Names and type(Names) == "table" then
			local Username = Names.username
			
			if Username and type(Username) == "string" then
				p1.names.setUsername(Username)
			end
			local DisplayName = Names.displayName
			
			if DisplayName and type(DisplayName) == "string" then
				p1.names.setDisplayName(DisplayName)
			end
			local CombinedName = Names.combinedName
			
			if CombinedName and type(CombinedName) == "string" then
				p1.names.setCombinedName(CombinedName)
			end
			local InExperienceCombinedName = Names.inExperienceCombinedName
			
			if InExperienceCombinedName and type(InExperienceCombinedName) == "string" then
				p1.names.setInExperienceCombinedName(InExperienceCombinedName)
			end
			local PlatformName = Names.platformName
			
			if PlatformName and type(PlatformName) == "string" then
				p1.names.setPlatformName(PlatformName)
			end
			local ContactName = Names.contactName
			
			if ContactName and type(ContactName) == "string" then
				p1.names.setContactName(ContactName)
			end
			local Alias = Names.alias
			
			if Alias and type(Alias) == "string" then
				p1.names.setAlias(Alias)
			end
		end
		local PlatformProfileId = p2.platformProfileId
		
		if PlatformProfileId and type(PlatformProfileId) == "string" then
			p1.setPlatformProfileId(PlatformProfileId)
		end
		local IsVerified = if FFlagEnableVerifiedBadgeStore then p2.isVerified else nil
		
		if IsVerified ~= nil and type(IsVerified) == "boolean" then
			p1.setIsVerified(IsVerified)
		end
		local HasRobloxSubscription = if FFlagEnableBlackbirdCheck then p2.hasRobloxSubscription else nil
		
		if HasRobloxSubscription ~= nil and type(HasRobloxSubscription) == "boolean" then
			p1.setHasRobloxSubscription(HasRobloxSubscription)
		end
	end,
	create = function(UserId)
		-- upvalues: CreateSignalFunction (copy), FFlagEnableVerifiedBadgeStore (copy), FFlagEnableBlackbirdCheck (copy)
		local Signal, Signal2 = CreateSignalFunction("")
		local Signal1, Signal2_1 = CreateSignalFunction("")
		local Signal3, Signal2_2 = CreateSignalFunction("")
		local Signal4, Signal2_3 = CreateSignalFunction("")
		local Signal5, Signal2_4 = CreateSignalFunction("")
		local Signal6, Signal2_5 = CreateSignalFunction("")
		local Signal7, Signal2_6 = CreateSignalFunction("")
		local Signal8, Signal2_7 = CreateSignalFunction("")
		local v1 = nil
		local v2 = nil
		
		if FFlagEnableVerifiedBadgeStore then
			v1, v32 = CreateSignalFunction(false)
		end
		local v3 = nil
		local v4 = nil
		
		if FFlagEnableBlackbirdCheck then
			v3, v34 = CreateSignalFunction(false)
		end
		return {
			userId = UserId,
			names = {
				getUsername = Signal,
				setUsername = Signal2,
				getDisplayName = Signal1,
				setDisplayName = Signal2_1,
				getCombinedName = Signal3,
				setCombinedName = Signal2_2,
				getInExperienceCombinedName = Signal4,
				setInExperienceCombinedName = Signal2_3,
				getPlatformName = Signal5,
				setPlatformName = Signal2_4,
				getContactName = Signal6,
				setContactName = Signal2_5,
				getAlias = Signal7,
				setAlias = Signal2_6
			},
			getPlatformProfileId = Signal8,
			setPlatformProfileId = Signal2_7,
			getIsVerified = if FFlagEnableVerifiedBadgeStore then v1 else nil,
			setIsVerified = if FFlagEnableVerifiedBadgeStore then v2 else nil,
			getHasRobloxSubscription = if FFlagEnableBlackbirdCheck then v3 else nil,
			setHasRobloxSubscription = if FFlagEnableBlackbirdCheck then v4 else nil
		}
	end
}