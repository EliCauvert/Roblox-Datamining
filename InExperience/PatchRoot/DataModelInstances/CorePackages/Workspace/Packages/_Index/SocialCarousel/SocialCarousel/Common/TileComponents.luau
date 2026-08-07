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
	[tile.Friend] = function(p0, p1, p2, p3, p4) --[[ line: 14 ]]
		-- upvalues: reactModule (ref), userTileModule (ref)
		return reactModule.createElement(userTileModule, {
			item = p0,
			index = p1,
			itemSize = p2,
			selectionOrder = p3,
			onTileContentChanged = p4
		})
	end,
	[tile.Recommendation] = function(p5, p6, p7, p8, p9) --[[ line: 29 ]]
		-- upvalues: reactModule (ref), userTileModule (ref)
		return reactModule.createElement(userTileModule, {
			item = p5,
			index = p6,
			itemSize = p7,
			selectionOrder = p8,
			onTileContentChanged = p9
		})
	end,
	[tile.AddFriends] = function(_, p10, p11, p12, _) --[[ line: 44 ]]
		-- upvalues: reactModule (ref), addFriendsTileModule (ref)
		return reactModule.createElement(addFriendsTileModule, { index = p10, itemSize = p11, selectionOrder = p12 })
	end,
	[tile.FriendsHint] = function(_, p13, p14, p15, _) --[[ line: 51 ]]
		-- upvalues: reactModule (ref), friendsHintTileModule (ref)
		return reactModule.createElement(friendsHintTileModule, { index = p13, itemSize = p14, selectionOrder = p15 })
	end,
	[tile.StartSquad] = function(p16, p17, p18, p19, _) --[[ line: 58 ]]
		-- upvalues: reactModule (ref), startSquadTileModule (ref)
		return reactModule.createElement(startSquadTileModule, {
			index = p17,
			item = p16,
			itemSize = p18,
			selectionOrder = p19
		})
	end,
	[tile.ShareQR] = if require(parent.SharedFlags).FFlagSocialCarouselShareQREnabled then function(_, p20, p21, p22, _) --[[ line: 67 ]]
		-- upvalues: reactModule (ref), shareQRTileModule (ref)
		return reactModule.createElement(shareQRTileModule, { index = p20, itemSize = p21, selectionOrder = p22 })
	end else nil,
	[tile.Skeleton] = function(_, p23, p24, _, _) --[[ line: 75 ]]
		-- upvalues: reactModule (ref), tileModule (ref)
		return reactModule.createElement(tileModule, { isLoading = true, index = p23, itemSize = p24 })
	end
}