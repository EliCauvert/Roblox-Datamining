local _ = require(script:FindFirstAncestor("GameTile").GameTileTypes)

return function(p0)
	return if p0.badgePosition and p0.badgeAnalyticsId and p0.badgeType and (p0.badgeText or p0.badgeIcon) then {
		[p0.badgePosition] = {
			{
				analyticsId = p0.badgeAnalyticsId,
				tileBadgeType = p0.badgeType,
				text = p0.badgeText,
				icons = if p0.badgeIcon then { p0.badgeIcon } else nil,
				tileBadgeComponentType = p0.badgeComponentType
			}
		}
	} else nil
end