local socialCarousel = script:FindFirstAncestor("SocialCarousel")
local parent = socialCarousel.Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local constantsModule = require(socialCarousel.Common.Constants)
local tileModule = require(socialCarousel.BaseComponents.Tile)
local fFlagConnectionsToFriendsRename = require(parent.SharedFlags).FFlagConnectionsToFriendsRename
local var4 = if game:DefineFastFlag("UpdateSocialCarouselAddFriendsIcon", false) then "icons/actions/friend_sort/add_friends" else "icons/common/plus_heavy"

return function(p0)
	-- upvalues: useAppPolicy (ref), useLocalization (ref), fFlagConnectionsToFriendsRename (ref), constantsModule (ref), reactModule (ref), tileModule (ref), var4 (ref)
	return reactModule.createElement(tileModule, {
		index = p0.index,
		itemSize = p0.itemSize,
		onActivated = p0.onActivated,
		title = useLocalization({
			addFriendsHeading = if fFlagConnectionsToFriendsRename then constantsModule.LOCALIZATION.ADD_FRIENDS_HEADING elseif useAppPolicy(function(p1)
				return p1.getRenameFriendsToConnections()
			end) then constantsModule.LOCALIZATION.ADD_CONNECTIONS_HEADING else constantsModule.LOCALIZATION.ADD_FRIENDS_HEADING
		}).addFriendsHeading,
		icon = var4,
		selectionOrder = p0.selectionOrder,
		badge = p0.badge
	})
end