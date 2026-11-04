local SocialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local Parent = SocialTabsPage.Parent
local UserListModule = require(Parent.UserList)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local CtaSurfaces = UserListModule.Enums.CtaSurfaces
local ClientCtaActions = UserListModule.Enums.ClientCtaActions
local FFlagSocialTabsSelfRowViewCtaModule = require(SocialTabsPage.Flags.FFlagSocialTabsSelfRowViewCta)
local Tbl = {
	primaryCtaMinWidth = 64,
	primaryCtaMaxWidth = 90,
	friendshipOriginSourceType = require(Parent.FriendsNetworking).Enums.FriendshipOriginSourceType.SocialTabsPage.rawValue(),
	chatEntryPoint = require(Parent.SocialCommon).Enums.ChatEntryPointNames.SocialTabsPage,
	clientActions = if require(SocialTabsPage.Flags.FFlagSocialTabsViewOnlyRowCta) then { ClientCtaActions.ViewProfile } else nil,
	showSelfProfileCta = if FFlagSocialTabsSelfRowViewCtaModule then true else nil
}

local function _(Subpage)
	-- upvalues: Tbl (copy), CtaSurfaces (copy)
	local Copy = table.clone(Tbl)
	Copy.analytics = { surface = CtaSurfaces.SocialTabsPage, subpage = Subpage }
	
	return Copy
end

local RowSelection = {
	friendshipOriginSourceType = Tbl.friendshipOriginSourceType
}
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

return {
	Friends = Copy,
	Mutuals = Copy1,
	RowSelection = RowSelection
}