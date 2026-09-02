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

local _ = function(p1, p2, p3)
	local primaryName = p1.names.primaryName or ""
	
	return if p2.profileUserNickname and p3 and p2.profileUserNickname ~= "" then p2.profileUserNickname .. " (" .. primaryName .. ")" else primaryName
end

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), profileWrapperContextModule (ref), useProfileJsonComponentModule (ref), enumsModule (ref), fFlagFriendRequestNicknames (ref), useAppPolicy (ref), view (ref), avatarHeadshotComponentModule (ref), socialChipCountsRowModule (ref)
	local var1 = reactModule.useContext(profileWrapperContextModule)
	local var2 = useProfileJsonComponentModule(enumsModule.Components.UserProfileHeader)
	local var3 = var2.counts ~= nil
	local var4 = if fFlagFriendRequestNicknames then useAppPolicy(function(p2)
		return p2.getFriendRequestNicknamesEnabled()
	end) else false
	local createElement = reactModule.createElement
	local t = {
		tag = "size-full-0 auto-y col gap-large",
		LayoutOrder = p1.layoutOrder
	}
	local t_1 = {}
	local createElement_1 = reactModule.createElement
	local var5 = avatarHeadshotComponentModule
	local t_2 = { layoutOrder = 1, userId = p1.profileId }
	local primaryName = var2.names.primaryName or ""
	t_2.primaryName = if var1.profileUserNickname and var4 and var1.profileUserNickname ~= "" then var1.profileUserNickname .. " (" .. primaryName .. ")" else primaryName
	t_2.username = var2.names.username
	t_2.isPremium = var2.isPremium
	t_2.isVerified = var2.isVerified
	t_2.isRobloxAdmin = var2.isRobloxAdmin
	t_1.AvatarHeadshotComponent = createElement_1(var5, t_2)
	t_1.SocialCountsRow = if var3 then reactModule.createElement(socialChipCountsRowModule, { layoutOrder = 2, size = UDim2.fromScale(1, 0) }) else nil
	
	return createElement(view, t, t_1)
end)