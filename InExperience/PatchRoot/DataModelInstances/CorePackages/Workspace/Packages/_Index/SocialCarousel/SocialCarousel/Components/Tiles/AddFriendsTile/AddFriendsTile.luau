local SocialCarousel = script:FindFirstAncestor("SocialCarousel")
local Parent = SocialCarousel.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ConstantsModule = require(SocialCarousel.Common.Constants)
local TileModule = require(SocialCarousel.BaseComponents.Tile)
local AddFriends: string = if game:DefineFastFlag("UpdateSocialCarouselAddFriendsIcon", false) then "icons/actions/friend_sort/add_friends" else "icons/common/plus_heavy"

return function(p1) --[[ Line: 16 | Named "AddFriendsTile" ]]
	-- upvalues: UseLocalizationFunction (copy), ConstantsModule (copy), ReactModule (copy), TileModule (copy), AddFriends (copy)
	return ReactModule.createElement(TileModule, {
		index = p1.index,
		itemSize = p1.itemSize,
		onActivated = p1.onActivated,
		title = UseLocalizationFunction({
			addFriendsHeading = ConstantsModule.LOCALIZATION.ADD_FRIENDS_HEADING
		}).addFriendsHeading,
		icon = AddFriends,
		selectionOrder = p1.selectionOrder,
		badge = p1.badge
	})
end