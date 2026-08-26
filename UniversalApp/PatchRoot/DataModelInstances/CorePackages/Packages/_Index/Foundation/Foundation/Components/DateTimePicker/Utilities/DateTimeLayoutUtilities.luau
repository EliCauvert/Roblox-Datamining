local _ = require(script:FindFirstAncestor("Foundation").Providers.Style.Tokens)
local DAYS_PER_WEEK = require(script.Parent.DateTimeCalendarConstants).DAYS_PER_WEEK

return {
	CALENDAR_WIDTH = 272,
	PANE_WIDTH = 280,
	TIME_LIST_WIDTH = 132,
	computeSingleWithTimeLayout = function(p1, p2, p3, p4)
		-- upvalues: DAYS_PER_WEEK (ref)
		local large = p3.Padding.Large
		local var1 = p4 * (p1 / DAYS_PER_WEEK)
		local var2 = 2 * large + (p3.Size.Size_800 + 2 * p3.Padding.Small) + p3.Gap.Small + var1
		local var3 = p1 + 2 * large
		local var4 = p2 + 2 * large
		
		return {
			bodyHeight = var2,
			calendarColumnWidth = var3,
			contentWidth = var3 + p3.Stroke.Standard + var4,
			gridHeight = var1,
			timeListColumnWidth = var4,
			timeListHeight = var2 - 2 * large
		}
	end
}