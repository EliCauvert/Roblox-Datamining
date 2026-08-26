local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useIsRobloxSubscriber = require(parent.UserProfiles).Hooks.useIsRobloxSubscriber
local fFlagEnableBlackbirdCheck = require(parent.SharedFlags).FFlagEnableBlackbirdCheck
local enumsModule = require(profilePlatform.Common.Enums)
local useProfileJsonComponentModule = require(profilePlatform.Hooks.useProfileJsonComponent)
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)

return function(p1)
	-- upvalues: useIsRobloxSubscriber (ref), useSelector (ref), useProfileWrapperContextModule (ref), useProfileJsonComponentModule (ref), enumsModule (ref), fFlagEnableBlackbirdCheck (ref)
	return useSelector(function(p2)
		-- upvalues: p1 (ref)
		if not p1 then
			return false
		end
		local users = p2.Users
		local var1 = users and users[p1]
		
		return if var1 then var1.membership == Enum.MembershipType.Premium else false
	end) or ((tostring(useProfileWrapperContextModule().profileId) == tostring(p1) and useProfileJsonComponentModule(enumsModule.Components.UserProfileHeader).isPremium == true) or fFlagEnableBlackbirdCheck and useIsRobloxSubscriber(p1))
end