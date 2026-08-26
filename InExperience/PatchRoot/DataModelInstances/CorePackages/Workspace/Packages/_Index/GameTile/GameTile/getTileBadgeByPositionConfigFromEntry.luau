local _ = require(script:FindFirstAncestor("GameTile").GameTileTypes)

return function(p1)
	return if p1.badgePosition and p1.badgeAnalyticsId and p1.badgeType and (p1.badgeText or p1.badgeIcon) then {
		[p1.badgePosition] = {
			{
				analyticsId = p1.badgeAnalyticsId,
				tileBadgeType = p1.badgeType,
				text = p1.badgeText,
				icons = if p1.badgeIcon then { p1.badgeIcon } else nil,
				tileBadgeComponentType = p1.badgeComponentType
			}
		}
	} else nil
end