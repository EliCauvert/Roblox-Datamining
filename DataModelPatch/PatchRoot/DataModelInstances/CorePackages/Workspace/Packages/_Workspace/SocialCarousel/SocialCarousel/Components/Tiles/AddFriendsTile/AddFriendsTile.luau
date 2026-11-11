local SocialCarousel = script:FindFirstAncestor("SocialCarousel")
local Parent = SocialCarousel.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local ConstantsModule = require(SocialCarousel.Common.Constants)
local TileModule = require(SocialCarousel.BaseComponents.Tile)
local FFlagConnectionsToFriendsRename = require(Parent.SharedFlags).FFlagConnectionsToFriendsRename
local AddFriends: string = if game:DefineFastFlag("UpdateSocialCarouselAddFriendsIcon", false) then "icons/actions/friend_sort/add_friends" else "icons/common/plus_heavy"

return function(p1)
	-- upvalues: UseAppPolicyFunction (copy), UseLocalizationFunction (copy), FFlagConnectionsToFriendsRename (copy), ConstantsModule (copy), ReactModule (copy), TileModule (copy), AddFriends (copy)
	local UseAppPolicyResult = UseAppPolicyFunction(function(p2)
		return p2.getRenameFriendsToConnections()
	end)
	
	return ReactModule.createElement(TileModule, {
		index = p1.index,
		itemSize = p1.itemSize,
		onActivated = p1.onActivated,
		title = UseLocalizationFunction({
			addFriendsHeading = if FFlagConnectionsToFriendsRename then ConstantsModule.LOCALIZATION.ADD_FRIENDS_HEADING elseif UseAppPolicyResult then ConstantsModule.LOCALIZATION.ADD_CONNECTIONS_HEADING else ConstantsModule.LOCALIZATION.ADD_FRIENDS_HEADING
		}).addFriendsHeading,
		icon = AddFriends,
		selectionOrder = p1.selectionOrder,
		badge = p1.badge
	})
end