local parent = script:FindFirstAncestor("SocialTabsPage").Parent
local friendsNetworkingModule = require(parent.FriendsNetworking)
local socialCommonModule = require(parent.SocialCommon)
local appPage = require(parent.RobloxAppEnums).AppPage
local ctaSurfaces = require(parent.UserList).Enums.CtaSurfaces
local t = {
	primaryCtaMinWidth = 64,
	primaryCtaMaxWidth = 90,
	friendshipOriginSourceType = friendsNetworkingModule.Enums.FriendshipOriginSourceType.SocialTabsPage.rawValue(),
	chatEntryPoint = socialCommonModule.Enums.ChatEntryPointNames.SocialTabsPage
}

local function _(p1)
	-- upvalues: t (ref), ctaSurfaces (ref)
	local cloned = table.clone(t)
	cloned.analytics = { surface = ctaSurfaces.SocialTabsPage, subpage = p1 }
	
	return cloned
end

local t_1 = {}
local cloned = table.clone(t)
cloned.analytics = {
	surface = ctaSurfaces.SocialTabsPage,
	subpage = appPage.SocialTabsFriends
}
t_1.Friends = cloned
local cloned_1 = table.clone(t)
cloned_1.analytics = {
	surface = ctaSurfaces.SocialTabsPage,
	subpage = appPage.SocialTabsMutuals
}
t_1.Mutuals = cloned_1

return t_1