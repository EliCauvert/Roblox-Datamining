return {
	getCenterOffsetX = function(p1): number --[[ Line: 42 ]]
		local NewContainerPosition = p1.containerPosition + p1.ratio * p1.containerWidth
		local NewInsetLeft = p1.insetLeft + p1.margin
		local ScreenWidthDelta = p1.screenWidth - p1.insetRight - p1.margin
		local ScreenWidthDeltaDelta = ScreenWidthDelta - NewInsetLeft
		
		if ScreenWidthDeltaDelta <= 0 or p1.popoverWidth <= 0 then
			return NewContainerPosition - p1.containerPosition
		else
			local NewNewInsetLeft = NewInsetLeft + p1.popoverWidth / 2
			local MaxValue = ScreenWidthDelta - p1.popoverWidth / 2
			
			return (if MaxValue < NewNewInsetLeft then NewInsetLeft + ScreenWidthDeltaDelta / 2 else math.clamp(NewContainerPosition, NewNewInsetLeft, MaxValue)) - p1.containerPosition
		end
	end
}