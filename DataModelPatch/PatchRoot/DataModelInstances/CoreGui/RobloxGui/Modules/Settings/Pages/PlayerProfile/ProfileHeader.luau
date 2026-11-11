local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local View = require(CorePackages.Packages.Foundation).View
local EnumsModule = require(CorePackages.Workspace.Packages.ProfilePlatform.Enums)
local UseProfileJsonComponentModule = require(CorePackages.Workspace.Packages.ProfilePlatform.useProfileJsonComponent)
local ProfileWrapperContextModule = require(CorePackages.Workspace.Packages.ProfilePlatform.ProfileWrapperContext)
local AvatarHeadshotComponentModule = require(CorePackages.Workspace.Packages.ProfilePlatform.AvatarHeadshotComponent)
local SocialChipCountsRowModule = require(CorePackages.Workspace.Packages.ProfilePlatform.SocialChipCountsRow)
local UseAppPolicyFunction = require(CorePackages.Workspace.Packages.UniversalAppPolicy).useAppPolicy
local FFlagFriendRequestNicknames = require(CorePackages.Workspace.Packages.SharedFlags).FFlagFriendRequestNicknames

local function _(p1, p2, p3)
	local PrimaryName = p1.names.primaryName or ""
	
	return if p2.profileUserNickname and p3 and p2.profileUserNickname ~= "" then p2.profileUserNickname .. " (" .. PrimaryName .. ")" else PrimaryName
end

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), ProfileWrapperContextModule (copy), UseProfileJsonComponentModule (copy), EnumsModule (copy), FFlagFriendRequestNicknames (copy), UseAppPolicyFunction (copy), View (copy), AvatarHeadshotComponentModule (copy), SocialChipCountsRowModule (copy)
	local UseContextResult = ReactModule.useContext(ProfileWrapperContextModule)
	local UseProfileJsonComponentModuleResult = UseProfileJsonComponentModule(EnumsModule.Components.UserProfileHeader)
	local HasCounts = UseProfileJsonComponentModuleResult.counts ~= nil
	local UseAppPolicyResult = if FFlagFriendRequestNicknames then UseAppPolicyFunction(function(p2)
		return p2.getFriendRequestNicknamesEnabled()
	end) else false
	local PrimaryName = UseProfileJsonComponentModuleResult.names.primaryName or ""
	
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y col gap-large",
		LayoutOrder = p1.layoutOrder
	}, {
		AvatarHeadshotComponent = ReactModule.createElement(AvatarHeadshotComponentModule, {
			layoutOrder = 1,
			userId = p1.profileId,
			primaryName = if UseContextResult.profileUserNickname and UseAppPolicyResult and UseContextResult.profileUserNickname ~= "" then UseContextResult.profileUserNickname .. " (" .. PrimaryName .. ")" else PrimaryName,
			username = UseProfileJsonComponentModuleResult.names.username,
			isPremium = UseProfileJsonComponentModuleResult.isPremium,
			isVerified = UseProfileJsonComponentModuleResult.isVerified,
			isRobloxAdmin = UseProfileJsonComponentModuleResult.isRobloxAdmin
		}),
		SocialCountsRow = if HasCounts then ReactModule.createElement(SocialChipCountsRowModule, { layoutOrder = 2, size = UDim2.fromScale(1, 0) }) else nil
	})
end)