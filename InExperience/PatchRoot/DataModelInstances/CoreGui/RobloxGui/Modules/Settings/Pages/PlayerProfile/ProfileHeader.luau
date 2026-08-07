local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local view = require(corePackagesService.Packages.Foundation).View
local enumsModule = require(corePackagesService.Workspace.Packages.ProfilePlatform.Enums)
local useProfileJsonComponentModule = require(corePackagesService.Workspace.Packages.ProfilePlatform.useProfileJsonComponent)
local profileWrapperContextModule = require(corePackagesService.Workspace.Packages.ProfilePlatform.ProfileWrapperContext)
local avatarHeadshotComponentModule = require(corePackagesService.Workspace.Packages.ProfilePlatform.AvatarHeadshotComponent)
local socialChipCountsRowModule = require(corePackagesService.Workspace.Packages.ProfilePlatform.SocialChipCountsRow)
local useAppPolicy = require(corePackagesService.Workspace.Packages.UniversalAppPolicy).useAppPolicy
local fFlagFriendRequestNicknames = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagFriendRequestNicknames

local _ = function(p0, p1, p2) --[[ line: 20 ]]
	local primaryName = p0.names.primaryName or ""
	
	return if p1.profileUserNickname and p2 and p1.profileUserNickname ~= "" then p1.profileUserNickname .. " (" .. primaryName .. ")" else primaryName
end

return reactModule.memo(function(p3) --[[ line: 42 | named "ProfileHeader" ]]
	-- upvalues: reactModule (ref), profileWrapperContextModule (ref), useProfileJsonComponentModule (ref), enumsModule (ref), fFlagFriendRequestNicknames (ref), useAppPolicy (ref), view (ref), avatarHeadshotComponentModule (ref), socialChipCountsRowModule (ref)
	local var8 = reactModule.useContext(profileWrapperContextModule)
	local var9 = useProfileJsonComponentModule(enumsModule.Components.UserProfileHeader)
	local var10 = var9.counts ~= nil
	local var11 = if fFlagFriendRequestNicknames then useAppPolicy(function(p4) --[[ line: 49 ]]
		return p4.getFriendRequestNicknamesEnabled()
	end) else false
	local createElement = reactModule.createElement
	local t = {
		tag = "size-full-0 auto-y col gap-large",
		LayoutOrder = p3.layoutOrder
	}
	local t_1 = {}
	local createElement_1 = reactModule.createElement
	local var14 = avatarHeadshotComponentModule
	local t_2 = { layoutOrder = 1, userId = p3.profileId }
	local primaryName = var9.names.primaryName or ""
	t_2.primaryName = if var8.profileUserNickname and var11 and var8.profileUserNickname ~= "" then var8.profileUserNickname .. " (" .. primaryName .. ")" else primaryName
	t_2.username = var9.names.username
	t_2.isPremium = var9.isPremium
	t_2.isVerified = var9.isVerified
	t_2.isRobloxAdmin = var9.isRobloxAdmin
	t_1.AvatarHeadshotComponent = createElement_1(var14, t_2)
	t_1.SocialCountsRow = if var10 then reactModule.createElement(socialChipCountsRowModule, { layoutOrder = 2, size = UDim2.fromScale(1, 0) }) else nil
	
	return createElement(view, t, t_1)
end)