local SocialCarousel = script:FindFirstAncestor("SocialCarousel")
local Parent = SocialCarousel.Parent
local ReactModule = require(Parent.React)
local LocalizationModule = require(Parent.Localization)
local FoundationModule = require(Parent.Foundation)
local FFlagSocialCarouselXXSmallTilesModule = require(SocialCarousel.Flags.FFlagSocialCarouselXXSmallTiles)
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization
local ConstantsModule = require(SocialCarousel.Common.Constants)
local TileModule = require(SocialCarousel.BaseComponents.Tile)
local UpdateSocialCarouselAddFriendsIcon = game:DefineFastFlag("UpdateSocialCarouselAddFriendsIcon", false)
local AddFriends: string = if UpdateSocialCarouselAddFriendsIcon then "icons/actions/friend_sort/add_friends" else "icons/common/plus_heavy"

return function(p1)
	-- upvalues: FFlagSocialCarouselXXSmallTilesModule (copy), UseLocalizationFunction (copy), ConstantsModule (copy), ReactModule (copy), TileModule (copy), UpdateSocialCarouselAddFriendsIcon (copy), AddFriends (copy), FoundationModule (copy)
	local IsIsCompact: boolean = FFlagSocialCarouselXXSmallTilesModule and p1.isCompact == true
	
	return ReactModule.createElement(TileModule, {
		testId = p1.testId or `--social-social-carousel-view-add-friends-{p0.index}`,
		index = p1.index,
		itemSize = p1.itemSize,
		onActivated = p1.onActivated,
		title = UseLocalizationFunction({
			addFriendsHeading = if IsIsCompact then ConstantsModule.LOCALIZATION.ADD_FRIENDS_HEADING_SENTENCE_CASE else ConstantsModule.LOCALIZATION.ADD_FRIENDS_HEADING
		}).addFriendsHeading,
		icon = if IsIsCompact then if UpdateSocialCarouselAddFriendsIcon then "person-plus" else "plus-large" else AddFriends,
		iconScale = if IsIsCompact then ConstantsModule.TILE_ICON_SCALE else nil,
		titleOverhang = if IsIsCompact then ConstantsModule.ADD_FRIENDS_TITLE_OVERHANG else nil,
		iconVariant = if IsIsCompact and not UpdateSocialCarouselAddFriendsIcon then FoundationModule.Enums.IconVariant.Filled else nil,
		selectionOrder = p1.selectionOrder,
		badge = p1.badge
	})
end