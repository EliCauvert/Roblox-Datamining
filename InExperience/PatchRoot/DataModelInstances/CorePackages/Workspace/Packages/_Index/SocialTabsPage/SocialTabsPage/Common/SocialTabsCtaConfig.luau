local Parent = script:FindFirstAncestor("SocialTabsPage").Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local CtaSurfaces = require(Parent.UserList).Enums.CtaSurfaces
local Tbl = {
	primaryCtaMinWidth = 64,
	primaryCtaMaxWidth = 90,
	friendshipOriginSourceType = require(Parent.FriendsNetworking).Enums.FriendshipOriginSourceType.SocialTabsPage.rawValue(),
	chatEntryPoint = require(Parent.SocialCommon).Enums.ChatEntryPointNames.SocialTabsPage
}

local function _(Subpage)
	-- upvalues: Tbl (copy), CtaSurfaces (copy)
	local Copy = table.clone(Tbl)
	Copy.analytics = { surface = CtaSurfaces.SocialTabsPage, subpage = Subpage }
	
	return Copy
end

local Copy = table.clone(Tbl)
Copy.analytics = {
	surface = CtaSurfaces.SocialTabsPage,
	subpage = AppPage.SocialTabsFriends
}
local Copy1 = table.clone(Tbl)
Copy1.analytics = {
	surface = CtaSurfaces.SocialTabsPage,
	subpage = AppPage.SocialTabsMutuals
}

return { Friends = Copy, Mutuals = Copy1 }