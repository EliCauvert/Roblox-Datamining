local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseIsRobloxSubscriberFunction = require(Parent.UserProfiles).Hooks.useIsRobloxSubscriber
local FFlagEnableBlackbirdCheck = require(Parent.SharedFlags).FFlagEnableBlackbirdCheck
local EnumsModule = require(ProfilePlatform.Common.Enums)
local UseProfileJsonComponentModule = require(ProfilePlatform.Hooks.useProfileJsonComponent)
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)

return function(p1)
	-- upvalues: UseIsRobloxSubscriberFunction (copy), UseSelectorFunction (copy), UseProfileWrapperContextModule (copy), UseProfileJsonComponentModule (copy), EnumsModule (copy), FFlagEnableBlackbirdCheck (copy)
	local UseIsRobloxSubscriberResult = UseIsRobloxSubscriberFunction(p1)
	local UseSelectorResult = UseSelectorFunction(function(p2): boolean
		-- upvalues: p1 (copy)
		if p1 then
			local Users = p2.Users
			local User = Users and Users[p1]
			
			return if User then User.membership == Enum.MembershipType.Premium else false
		else
			return false
		end
	end)
	local UseProfileWrapperContextModuleResult = UseProfileWrapperContextModule()
	local UseProfileJsonComponentModuleResult = UseProfileJsonComponentModule(EnumsModule.Components.UserProfileHeader)
	local IsIsPremium: boolean = tostring(UseProfileWrapperContextModuleResult.profileId) == tostring(p1) and UseProfileJsonComponentModuleResult.isPremium == true
	
	return UseSelectorResult or (IsIsPremium or FFlagEnableBlackbirdCheck and UseIsRobloxSubscriberResult)
end