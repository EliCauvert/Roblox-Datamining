local _ = require(script:FindFirstAncestor("Foundation").Providers.Style.Tokens)
local DAYS_PER_WEEK = require(script.Parent.DateTimeCalendarConstants).DAYS_PER_WEEK

return {
	CALENDAR_WIDTH = 272,
	PANE_WIDTH = 280,
	TIME_LIST_WIDTH = 132,
	computeSingleWithTimeLayout = function(p0, p1, p2, p3) --[[ line: 30 ]]
		-- upvalues: DAYS_PER_WEEK (ref)
		local large = p2.Padding.Large
		local var0 = p3 * (p0 / DAYS_PER_WEEK)
		local var1 = 2 * large + (p2.Size.Size_800 + 2 * p2.Padding.Small) + p2.Gap.Small + var0
		
		return {
			bodyHeight = var1,
			calendarColumnWidth = p0 + 2 * large,
			gridHeight = var0,
			timeListColumnWidth = p1 + 2 * large,
			timeListHeight = var1 - 2 * large
		}
	end
}