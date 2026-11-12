return function(p1: number, p2)
	local Largest = math.max(p1, 1)
	local SideMargin: number = p2.sideMargin
	local ColumnGap: number = p2.columnGap
	
	local function _(p3)
		-- upvalues: Largest (copy), SideMargin (copy), p2 (copy), ColumnGap (copy)
		return (Largest - SideMargin * 2 - p2.carouselPeek + (p2.fractionalItemAmount + 1) * ColumnGap) / (p3 + p2.fractionalItemAmount)
	end
	
	local function getSlotLayout(p3, NewHoverOverflow, SideMargin, p4: number, YScale)
		-- upvalues: Largest (copy)
		local Largest1 = math.max(NewHoverOverflow - p3, 1)
		
		return {
			clipPosition = UDim2.fromScale(p3 / Largest, 0),
			clipSize = UDim2.fromScale(Largest1 / Largest, YScale),
			position = UDim2.fromScale((SideMargin - p3) / Largest1, 0),
			size = UDim2.fromScale(math.max(p4, 0) / Largest1, YScale)
		}
	end
	
	local ScaledLeadingColumns = p2.leadingColumns * ((Largest - SideMargin * 2 - p2.carouselPeek + (p2.fractionalItemAmount + 1) * ColumnGap) / (p2.leadingNumColumns + p2.fractionalItemAmount))
	local ScaledTrailingColumns = p2.trailingColumns * ((Largest - SideMargin * 2 - p2.carouselPeek + (p2.fractionalItemAmount + 1) * ColumnGap) / (p2.trailingNumColumns + p2.fractionalItemAmount))
	local NewSideMargin = SideMargin + ScaledLeadingColumns
	local LargestDelta = Largest - SideMargin - ScaledTrailingColumns
	local SlotLayout = if p2.leadingColumns > 0 then getSlotLayout(SideMargin - ColumnGap / 2, NewSideMargin - ColumnGap / 2, SideMargin, ScaledLeadingColumns - ColumnGap, 1) else nil
	local SlotLayout1 = if p2.trailingColumns > 0 then getSlotLayout(LargestDelta + ColumnGap / 2, Largest - SideMargin + ColumnGap / 2, LargestDelta + ColumnGap, ScaledTrailingColumns - ColumnGap, 1) else nil
	
	return {
		leading = SlotLayout,
		content = getSlotLayout(if SlotLayout then NewSideMargin - p2.hoverOverflow else -p2.bleed, if SlotLayout1 then LargestDelta + p2.hoverOverflow else Largest + p2.bleed, NewSideMargin, LargestDelta - NewSideMargin, 0),
		trailing = SlotLayout1
	}
end