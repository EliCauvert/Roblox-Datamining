local _ = require(script:FindFirstAncestor("GameTile").Parent.UIBlox)

return {
	getTileHeight = function(p0, p1)
		return p1 * 0.5625 + (p0.Size.Size_500 + p0.Size.Size_500 + p0.Size.Size_200 + p0.Size.Size_100)
	end,
	getFooterHeight = function(p2)
		return p2.Size.Size_500 + p2.Size.Size_500 + p2.Size.Size_200 + p2.Size.Size_100
	end,
	getMetadataHeight = function(p3)
		return p3.Size.Size_500
	end,
	getPlayButtonHeight = function(p4)
		return p4.Size.Size_900
	end
}