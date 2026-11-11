local Parent = script:FindFirstAncestor("GameTile").Parent
local GameTileLayoutType = require(script.Parent.GameTileTypes).GameTileLayoutType

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
		ImageTopLeft = function(XOffset)
			return UDim2.new(0, XOffset, 0, XOffset), Vector2.new(0, 0)
		end,
		ImageBottomLeft = function(XOffset)
			return UDim2.new(0, XOffset, 1, -XOffset), Vector2.new(0, 1)
		end,
		ImageTopRight = function(YOffset)
			return UDim2.new(1, -YOffset, 0, YOffset), Vector2.new(1, 0)
		end,
		ImageBottomRight = function(p1)
			return UDim2.new(1, -p1, 1, -p1), Vector2.new(1, 1)
		end
	},
	TileBadgeIconNamesByType = {
		PaidAccess = "icons/menu/gem_small",
		["icons/menu/lock_closed"] = require(Parent.Foundation).Enums.IconName.LockClosed
	},
	TileTextLines = {
		[GameTileLayoutType.Narrow] = {
			titleTextLines = 2,
			metadataTextLines = 1,
			largeMetadataTextLines = 2
		},
		[GameTileLayoutType.Wide] = {
			titleTextLines = 1,
			metadataTextLines = 1,
			largeMetadataTextLines = 1
		},
		[GameTileLayoutType.Event] = {
			titleTextLines = 1,
			metadataTextLines = 1,
			largeMetadataTextLines = 1
		}
	},
	TileOverflowMenuItems = {
		NotInterested = "NotInterested",
		WhyThisAd = "WhyThisAd",
		ReportAd = if require(Parent.SharedFlags).FFlagLuaAppEnableSponsoredReportAd then "ReportAd" else nil
	}
}