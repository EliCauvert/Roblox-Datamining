local _ = require(script:FindFirstAncestor("Foundation").Providers.Style.Tokens)
local DAYSPERWEEK = require(script.Parent.DateTimeCalendarConstants).DAYS_PER_WEEK

return {
	CALENDAR_WIDTH = 272,
	PANE_WIDTH = 280,
	TIME_LIST_WIDTH = 132,
	computeSingleWithTimeLayout = function(p1, p2, p3, p4)
		-- upvalues: DAYSPERWEEK (copy)
		local Large: number = p3.Padding.Large
		local ScaledDAYSPERWEEK = p4 * (p1 / DAYSPERWEEK)
		local NewLarge = 2 * Large + (p3.Size.Size_800 + 2 * p3.Padding.Small) + p3.Gap.Small + ScaledDAYSPERWEEK
		local NewLarge1 = p1 + 2 * Large
		local NewLarge2 = p2 + 2 * Large
		
		return {
			bodyHeight = NewLarge,
			calendarColumnWidth = NewLarge1,
			contentWidth = NewLarge1 + p3.Stroke.Standard + NewLarge2,
			gridHeight = ScaledDAYSPERWEEK,
			timeListColumnWidth = NewLarge2,
			timeListHeight = NewLarge - 2 * Large
		}
	end
}