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

local function renderUserTile(Item, Index, ItemSize, SelectionOrder, OnTileContentChanged, PlayStatus, OnMarqueeFinished, MarqueeRunId, OnManualMarqueeStart, OnManualMarqueeEnd, MarqueeOnFocusEnabled)
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
	end
	return ReactModule.createElement(UserTileModule, config)
end

return {
	[Tile.Friend] = renderUserTile,
	[Tile.Recommendation] = renderUserTile,
	[Tile.AddFriends] = function(_, Index, ItemSize, SelectionOrder, _)
		-- upvalues: ReactModule (copy), AddFriendsTileModule (copy)
		return ReactModule.createElement(AddFriendsTileModule, {
			index = Index,
			itemSize = ItemSize,
			selectionOrder = SelectionOrder
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
	[Tile.StartSquad] = function(Item, Index, ItemSize, SelectionOrder, _)
		-- upvalues: ReactModule (copy), StartSquadTileModule (copy)
		return ReactModule.createElement(StartSquadTileModule, {
			index = Index,
			item = Item,
			itemSize = ItemSize,
			selectionOrder = SelectionOrder
		})
	end,
	[Tile.ShareQR] = if require(Parent.SharedFlags).FFlagSocialCarouselShareQREnabled then function(_, Index, ItemSize, SelectionOrder, _)
		-- upvalues: ReactModule (copy), ShareQRTileModule (copy)
		return ReactModule.createElement(ShareQRTileModule, {
			index = Index,
			itemSize = ItemSize,
			selectionOrder = SelectionOrder
		})
	end else nil,
	[Tile.Skeleton] = function(_, Index, ItemSize, _, _)
		-- upvalues: ReactModule (copy), TileModule (copy)
		return ReactModule.createElement(TileModule, { isLoading = true, index = Index, itemSize = ItemSize })
	end
}