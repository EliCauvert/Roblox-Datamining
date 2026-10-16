local socialCarousel = script:FindFirstAncestor("SocialCarousel")
local parent = socialCarousel.Parent
local reactModule = require(parent.React)
local tile = require(socialCarousel.Common.Enums).Tile
local userTileModule = require(socialCarousel.Components.Tiles.UserTile)
local addFriendsTileModule = require(socialCarousel.Components.Tiles.AddFriendsTile)
local friendsHintTileModule = require(socialCarousel.Components.Tiles.FriendsHintTile)
local startSquadTileModule = require(socialCarousel.Components.Tiles.StartSquadTile)
local shareQRTileModule = require(socialCarousel.Components.Tiles.ShareQRTile)
local tileModule = require(socialCarousel.BaseComponents.Tile)

return {
	[tile.Friend] = function(p1, p2, p3, p4, p5)
		-- upvalues: reactModule (ref), userTileModule (ref)
		return reactModule.createElement(userTileModule, {
			item = p1,
			index = p2,
			itemSize = p3,
			selectionOrder = p4,
			onTileContentChanged = p5
		})
	end,
	[tile.Recommendation] = function(p1, p2, p3, p4, p5)
		-- upvalues: reactModule (ref), userTileModule (ref)
		return reactModule.createElement(userTileModule, {
			item = p1,
			index = p2,
			itemSize = p3,
			selectionOrder = p4,
			onTileContentChanged = p5
		})
	end,
	[tile.AddFriends] = function(_, p1, p2, p3, _)
		-- upvalues: reactModule (ref), addFriendsTileModule (ref)
		return reactModule.createElement(addFriendsTileModule, { index = p1, itemSize = p2, selectionOrder = p3 })
	end,
	[tile.FriendsHint] = function(_, p1, p2, p3, _)
		-- upvalues: reactModule (ref), friendsHintTileModule (ref)
		return reactModule.createElement(friendsHintTileModule, { index = p1, itemSize = p2, selectionOrder = p3 })
	end,
	[tile.StartSquad] = function(p1, p2, p3, p4, _)
		-- upvalues: reactModule (ref), startSquadTileModule (ref)
		return reactModule.createElement(startSquadTileModule, {
			index = p2,
			item = p1,
			itemSize = p3,
			selectionOrder = p4
		})
	end,
	[tile.ShareQR] = if require(parent.SharedFlags).FFlagSocialCarouselShareQREnabled then function(_, p1, p2, p3, _)
		-- upvalues: reactModule (ref), shareQRTileModule (ref)
		return reactModule.createElement(shareQRTileModule, { index = p1, itemSize = p2, selectionOrder = p3 })
	end else nil,
	[tile.Skeleton] = function(_, p1, p2, _, _)
		-- upvalues: reactModule (ref), tileModule (ref)
		return reactModule.createElement(tileModule, { isLoading = true, index = p1, itemSize = p2 })
	end
}