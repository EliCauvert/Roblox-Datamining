local _ = require(script:FindFirstAncestor("GameTile").Parent.UIBlox)

return {
	getTileHeight = function(p0, p1) --[[ line: 18 ]]
		return p1 * 0.5625 + (p0.Size.Size_500 + p0.Size.Size_500 + p0.Size.Size_200 + p0.Size.Size_100)
	end,
	getFooterHeight = function(p2) --[[ line: 11 ]]
		return p2.Size.Size_500 + p2.Size.Size_500 + p2.Size.Size_200 + p2.Size.Size_100
	end,
	getMetadataHeight = function(p3) --[[ line: 7 ]]
		return p3.Size.Size_500
	end,
	getPlayButtonHeight = function(p4) --[[ line: 22 ]]
		return p4.Size.Size_900
	end
}