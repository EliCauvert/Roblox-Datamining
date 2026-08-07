local parent = script:FindFirstAncestor("GameTile").Parent
local gameTileLayoutType = require(script.Parent.GameTileTypes).GameTileLayoutType

return {
	TileOverlay = { BottomRightPosition = UDim2.new(0.96, 0, 0.93, 0) },
	PlayButtonStyleValues = { Enabled = "Enabled", Disabled = "Disabled" },
	PlayerCountStyleValues = { Hover = "Hover", Always = "Always", Footer = "Footer" },
	TileBadgeComponentTypeValues = { Pill = "Pill", RoundedRectangle = "RoundedRectangle" },
	TileBadgePositionValues = {
		ImageTopLeft = "ImageTopLeft",
		ImageBottomLeft = "ImageBottomLeft",
		ImageTopRight = "ImageTopRight",
		ImageBottomRight = "ImageBottomRight"
	},
	TileBadgePositionCalculators = {
		ImageTopLeft = function(p0) --[[ line: 36 ]]
			return UDim2.new(0, p0, 0, p0), Vector2.new(0, 0)
		end,
		ImageBottomLeft = function(p1) --[[ line: 39 ]]
			return UDim2.new(0, p1, 1, -p1), Vector2.new(0, 1)
		end,
		ImageTopRight = function(p2) --[[ line: 42 ]]
			return UDim2.new(1, -p2, 0, p2), Vector2.new(1, 0)
		end,
		ImageBottomRight = function(p3) --[[ line: 45 ]]
			return UDim2.new(1, -p3, 1, -p3), Vector2.new(1, 1)
		end
	},
	TileBadgeIconNamesByType = {
		PaidAccess = "icons/menu/gem_small",
		["icons/menu/lock_closed"] = require(parent.Foundation).Enums.IconName.LockClosed
	},
	TileTextLines = {
		[gameTileLayoutType.Narrow] = {
			titleTextLines = 2,
			metadataTextLines = 1,
			largeMetadataTextLines = 2
		},
		[gameTileLayoutType.Wide] = {
			titleTextLines = 1,
			metadataTextLines = 1,
			largeMetadataTextLines = 1
		},
		[gameTileLayoutType.Event] = {
			titleTextLines = 1,
			metadataTextLines = 1,
			largeMetadataTextLines = 1
		}
	},
	TileOverflowMenuItems = {
		NotInterested = "NotInterested",
		WhyThisAd = "WhyThisAd",
		ReportAd = if require(parent.SharedFlags).FFlagLuaAppEnableSponsoredReportAd then "ReportAd" else nil
	}
}