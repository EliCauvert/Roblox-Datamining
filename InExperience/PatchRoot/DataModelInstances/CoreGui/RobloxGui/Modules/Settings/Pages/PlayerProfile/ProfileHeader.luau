local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local view = require(corePackagesService.Packages.Foundation).View
local enumsModule = require(corePackagesService.Workspace.Packages.ProfilePlatform.Enums)
local useProfileJsonComponentModule = require(corePackagesService.Workspace.Packages.ProfilePlatform.useProfileJsonComponent)
local profileWrapperContextModule = require(corePackagesService.Workspace.Packages.ProfilePlatform.ProfileWrapperContext)
local avatarHeadshotComponentModule = require(corePackagesService.Workspace.Packages.ProfilePlatform.AvatarHeadshotComponent)
local socialChipCountsRowModule = require(corePackagesService.Workspace.Packages.ProfilePlatform.SocialChipCountsRow)

local _ = function(p1, p2, p3)
	local primaryName = p1.names.primaryName or ""
	
	return if p2.profileUserNickname and p3 and p2.profileUserNickname ~= "" then p2.profileUserNickname .. " (" .. primaryName .. ")" else primaryName
end

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), profileWrapperContextModule (ref), useProfileJsonComponentModule (ref), enumsModule (ref), view (ref), avatarHeadshotComponentModule (ref), socialChipCountsRowModule (ref)
	local _ = reactModule.useContext(profileWrapperContextModule)
	local var1 = useProfileJsonComponentModule(enumsModule.Components.UserProfileHeader)
	local var2 = var1.counts ~= nil
	local createElement = reactModule.createElement
	local t = {
		tag = "size-full-0 auto-y col gap-large",
		LayoutOrder = p1.layoutOrder
	}
	local t_1 = {}
	local createElement_1 = reactModule.createElement
	local var3 = avatarHeadshotComponentModule
	local t_2 = { layoutOrder = 1, userId = p1.profileId }
	local primaryName = var1.names.primaryName or ""
	t_2.primaryName = primaryName
	t_2.username = var1.names.username
	t_2.isPremium = var1.isPremium
	t_2.isVerified = var1.isVerified
	t_2.isRobloxAdmin = var1.isRobloxAdmin
	t_1.AvatarHeadshotComponent = createElement_1(var3, t_2)
	t_1.SocialCountsRow = if var2 then reactModule.createElement(socialChipCountsRowModule, { layoutOrder = 2, size = UDim2.fromScale(1, 0) }) else nil
	
	return createElement(view, t, t_1)
end)