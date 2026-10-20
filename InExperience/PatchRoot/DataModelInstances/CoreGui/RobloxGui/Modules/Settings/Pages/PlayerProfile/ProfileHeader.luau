local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local View = require(CorePackages.Packages.Foundation).View
local EnumsModule = require(CorePackages.Workspace.Packages.ProfilePlatform.Enums)
local UseProfileJsonComponentModule = require(CorePackages.Workspace.Packages.ProfilePlatform.useProfileJsonComponent)
local ProfileWrapperContextModule = require(CorePackages.Workspace.Packages.ProfilePlatform.ProfileWrapperContext)
local AvatarHeadshotComponentModule = require(CorePackages.Workspace.Packages.ProfilePlatform.AvatarHeadshotComponent)
local SocialChipCountsRowModule = require(CorePackages.Workspace.Packages.ProfilePlatform.SocialChipCountsRow)

local function _(p1, p2, p3)
	local PrimaryName = p1.names.primaryName or ""
	
	return if p2.profileUserNickname and p3 and p2.profileUserNickname ~= "" then p2.profileUserNickname .. " (" .. PrimaryName .. ")" else PrimaryName
end

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), ProfileWrapperContextModule (copy), UseProfileJsonComponentModule (copy), EnumsModule (copy), View (copy), AvatarHeadshotComponentModule (copy), SocialChipCountsRowModule (copy)
	local UseContextResult = ReactModule.useContext(ProfileWrapperContextModule)
	local UseProfileJsonComponentModuleResult = UseProfileJsonComponentModule(EnumsModule.Components.UserProfileHeader)
	local HasCounts = UseProfileJsonComponentModuleResult.counts ~= nil
	local CreateElementFunction1 = ReactModule.createElement
	local config = {
		tag = "size-full-0 auto-y col gap-large",
		LayoutOrder = p1.layoutOrder
	}
	local t = {}
	local CreateElementFunction = ReactModule.createElement
	local config1 = { layoutOrder = 1, userId = p1.profileId }
	local PrimaryName = UseProfileJsonComponentModuleResult.names.primaryName or ""
	
	if UseContextResult.profileUserNickname then
	end
	config1.primaryName = PrimaryName
	config1.username = UseProfileJsonComponentModuleResult.names.username
	config1.isPremium = UseProfileJsonComponentModuleResult.isPremium
	config1.isVerified = UseProfileJsonComponentModuleResult.isVerified
	config1.isRobloxAdmin = UseProfileJsonComponentModuleResult.isRobloxAdmin
	t.AvatarHeadshotComponent = CreateElementFunction(AvatarHeadshotComponentModule, config1)
	t.SocialCountsRow = if HasCounts then ReactModule.createElement(SocialChipCountsRowModule, { layoutOrder = 2, size = UDim2.fromScale(1, 0) }) else nil
	
	return CreateElementFunction1(View, config, t)
end)