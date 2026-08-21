local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useIsRobloxSubscriber = require(parent.UserProfiles).Hooks.useIsRobloxSubscriber
local fFlagEnableBlackbirdCheck = require(parent.SharedFlags).FFlagEnableBlackbirdCheck
local enumsModule = require(profilePlatform.Common.Enums)
local useProfileJsonComponentModule = require(profilePlatform.Hooks.useProfileJsonComponent)
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)

return function(p0) --[[ line: 15 | named "useHasPaidTradingAccess" ]]
	-- upvalues: useIsRobloxSubscriber (ref), useSelector (ref), useProfileWrapperContextModule (ref), useProfileJsonComponentModule (ref), enumsModule (ref), fFlagEnableBlackbirdCheck (ref)
	return useSelector(function(p1) --[[ line: 17 ]]
		-- upvalues: p0 (ref)
		if not p0 then
			return false
		end
		local users = p1.Users
		local var4 = users and users[p0]
		
		return if var4 then var4.membership == Enum.MembershipType.Premium else false
	end) or ((tostring(useProfileWrapperContextModule().profileId) == tostring(p0) and useProfileJsonComponentModule(enumsModule.Components.UserProfileHeader).isPremium == true) or fFlagEnableBlackbirdCheck and useIsRobloxSubscriber(p0))
end