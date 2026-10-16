local _ = require(script:FindFirstAncestor("GameTile").Parent.UIBlox)

return {
	getTileHeight = function(p1, p2: number): number --[[ Line: 18 ]]
		return p2 * 0.5625 + (p1.Size.Size_500 + p1.Size.Size_500 + p1.Size.Size_200 + p1.Size.Size_100)
	end,
	getFooterHeight = function(p1) --[[ Line: 11 ]]
		return p1.Size.Size_500 + p1.Size.Size_500 + p1.Size.Size_200 + p1.Size.Size_100
	end,
	getMetadataHeight = function(p1) --[[ Line: 7 ]]
		return p1.Size.Size_500
	end,
	getPlayButtonHeight = function(p1) --[[ Line: 22 ]]
		return p1.Size.Size_900
	end
}