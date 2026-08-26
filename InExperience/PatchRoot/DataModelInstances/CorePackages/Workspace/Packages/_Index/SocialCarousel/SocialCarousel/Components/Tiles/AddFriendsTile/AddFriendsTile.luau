local socialCarousel = script:FindFirstAncestor("SocialCarousel")
local parent = socialCarousel.Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local constantsModule = require(socialCarousel.Common.Constants)
local tileModule = require(socialCarousel.BaseComponents.Tile)
local fFlagConnectionsToFriendsRename = require(parent.SharedFlags).FFlagConnectionsToFriendsRename
local var1 = if game:DefineFastFlag("UpdateSocialCarouselAddFriendsIcon", false) then "icons/actions/friend_sort/add_friends" else "icons/common/plus_heavy"

return function(p1)
	-- upvalues: useAppPolicy (ref), useLocalization (ref), fFlagConnectionsToFriendsRename (ref), constantsModule (ref), reactModule (ref), tileModule (ref), var1 (ref)
	return reactModule.createElement(tileModule, {
		index = p1.index,
		itemSize = p1.itemSize,
		onActivated = p1.onActivated,
		title = useLocalization({
			addFriendsHeading = if fFlagConnectionsToFriendsRename then constantsModule.LOCALIZATION.ADD_FRIENDS_HEADING elseif useAppPolicy(function(p2)
				return p2.getRenameFriendsToConnections()
			end) then constantsModule.LOCALIZATION.ADD_CONNECTIONS_HEADING else constantsModule.LOCALIZATION.ADD_FRIENDS_HEADING
		}).addFriendsHeading,
		icon = var1,
		selectionOrder = p1.selectionOrder,
		badge = p1.badge
	})
end