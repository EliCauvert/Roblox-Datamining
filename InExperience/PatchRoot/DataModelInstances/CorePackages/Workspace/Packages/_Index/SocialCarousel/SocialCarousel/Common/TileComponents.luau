local SocialCarousel = script:FindFirstAncestor("SocialCarousel")
local Parent = SocialCarousel.Parent
local ReactModule = require(Parent.React)
local Tile = require(SocialCarousel.Common.Enums).Tile
local UserTileModule = require(SocialCarousel.Components.Tiles.UserTile)
local AddFriendsTileModule = require(SocialCarousel.Components.Tiles.AddFriendsTile)
local FriendsHintTileModule = require(SocialCarousel.Components.Tiles.FriendsHintTile)
local StartSquadTileModule = require(SocialCarousel.Components.Tiles.StartSquadTile)
local ShareQRTileModule = require(SocialCarousel.Components.Tiles.ShareQRTile)
local TileModule = require(SocialCarousel.BaseComponents.Tile)
local FFlagSocialCarouselInGameTitleMarquee = require(Parent.SharedFlags).FFlagSocialCarouselInGameTitleMarquee
local FFlagSocialCarouselXXSmallTilesModule = require(SocialCarousel.Flags.FFlagSocialCarouselXXSmallTiles)

local function renderUserTile(Item, Index, ItemSize, SelectionOrder, OnTileContentChanged, _, PlayStatus, OnMarqueeFinished, MarqueeRunId, OnManualMarqueeStart, OnManualMarqueeEnd, MarqueeOnFocusEnabled, MarqueeShortTitlesEnabled)
	-- upvalues: FFlagSocialCarouselInGameTitleMarquee (copy), ReactModule (copy), UserTileModule (copy)
	local config = {
		item = Item,
		index = Index,
		itemSize = ItemSize,
		selectionOrder = SelectionOrder,
		onTileContentChanged = OnTileContentChanged
	}
	
	if FFlagSocialCarouselInGameTitleMarquee then
		config.playStatus = PlayStatus
		config.onMarqueeFinished = OnMarqueeFinished
		config.marqueeRunId = MarqueeRunId
		config.onManualMarqueeStart = OnManualMarqueeStart
		config.onManualMarqueeEnd = OnManualMarqueeEnd
		config.marqueeOnFocusEnabled = MarqueeOnFocusEnabled
		config.marqueeShortTitlesEnabled = MarqueeShortTitlesEnabled
	end
	return ReactModule.createElement(UserTileModule, config)
end

return {
	[Tile.Friend] = renderUserTile,
	[Tile.Recommendation] = renderUserTile,
	[Tile.FriendRequest] = renderUserTile,
	[Tile.AddFriends] = function(_, Index, ItemSize, SelectionOrder, _, p1)
		-- upvalues: ReactModule (copy), AddFriendsTileModule (copy), FFlagSocialCarouselXXSmallTilesModule (copy)
		return ReactModule.createElement(AddFriendsTileModule, {
			index = Index,
			itemSize = ItemSize,
			selectionOrder = SelectionOrder,
			isCompact = if FFlagSocialCarouselXXSmallTilesModule then p1 else nil
		})
	end,
	[Tile.FriendsHint] = function(_, Index, ItemSize, SelectionOrder, _)
		-- upvalues: ReactModule (copy), FriendsHintTileModule (copy)
		return ReactModule.createElement(FriendsHintTileModule, {
			index = Index,
			itemSize = ItemSize,
			selectionOrder = SelectionOrder
		})
	end,
	[Tile.StartSquad] = function(Item, Index, ItemSize, SelectionOrder, _, p1)
		-- upvalues: ReactModule (copy), StartSquadTileModule (copy), FFlagSocialCarouselXXSmallTilesModule (copy)
		return ReactModule.createElement(StartSquadTileModule, {
			index = Index,
			item = Item,
			itemSize = ItemSize,
			selectionOrder = SelectionOrder,
			isCompact = if FFlagSocialCarouselXXSmallTilesModule then p1 else nil
		})
	end,
	[Tile.ShareQR] = if require(Parent.SharedFlags).FFlagSocialCarouselShareQREnabled then function(_, Index, ItemSize, SelectionOrder, _, p1)
		-- upvalues: ReactModule (copy), ShareQRTileModule (copy), FFlagSocialCarouselXXSmallTilesModule (copy)
		return ReactModule.createElement(ShareQRTileModule, {
			index = Index,
			itemSize = ItemSize,
			selectionOrder = SelectionOrder,
			isCompact = if FFlagSocialCarouselXXSmallTilesModule then p1 else nil
		})
	end else nil,
	[Tile.Skeleton] = function(_, Index, ItemSize, _, _)
		-- upvalues: ReactModule (copy), TileModule (copy)
		return ReactModule.createElement(TileModule, { isLoading = true, index = Index, itemSize = ItemSize })
	end
}