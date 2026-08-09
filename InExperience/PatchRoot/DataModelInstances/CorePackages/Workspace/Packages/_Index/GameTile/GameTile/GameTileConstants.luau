local parent = script:FindFirstAncestor("GameTile").Parent
local foundationModule = require(parent.Foundation)
local gameTileLayoutType = require(script.Parent.GameTileTypes).GameTileLayoutType
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagLuaAppGameTileLockedBadge = sharedFlagsModule.FFlagLuaAppGameTileLockedBadge

return {
	TileOverlay = { BottomRightPosition = UDim2.new(0.96, 0, 0.93, 0) },
	PlayButtonStyleValues = { Enabled = "Enabled", Disabled = "Disabled" },
	PlayerCountStyleValues = { Hover = "Hover", Always = "Always", Footer = "Footer" },
	TileBadgeTypeValues = if fFlagLuaAppGameTileLockedBadge then nil else { Text = "Text" },
	TileBadgeComponentTypeValues = { Pill = "Pill", RoundedRectangle = "RoundedRectangle" },
	TileBadgePositionValues = {
		ImageTopLeft = "ImageTopLeft",
		ImageBottomLeft = "ImageBottomLeft",
		ImageTopRight = "ImageTopRight",
		ImageBottomRight = "ImageBottomRight"
	},
	TileBadgePositionCalculators = {
		ImageTopLeft = function(p0) --[[ line: 42 ]]
			return UDim2.new(0, p0, 0, p0), Vector2.new(0, 0)
		end,
		ImageBottomLeft = function(p1) --[[ line: 45 ]]
			return UDim2.new(0, p1, 1, -p1), Vector2.new(0, 1)
		end,
		ImageTopRight = function(p2) --[[ line: 48 ]]
			return UDim2.new(1, -p2, 0, p2), Vector2.new(1, 0)
		end,
		ImageBottomRight = function(p3) --[[ line: 51 ]]
			return UDim2.new(1, -p3, 1, -p3), Vector2.new(1, 1)
		end
	},
	TileBadgeIconTypeValues = if fFlagLuaAppGameTileLockedBadge then nil else { PaidAccess = "PaidAccess" },
	TileBadgeIconNamesByType = {
		PaidAccess = "icons/menu/gem_small",
		["icons/menu/lock_closed"] = if fFlagLuaAppGameTileLockedBadge then foundationModule.Enums.IconName.LockClosed else nil
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
		ReportAd = if sharedFlagsModule.FFlagLuaAppEnableSponsoredReportAd then "ReportAd" else nil
	}
}