return function(p1, CanvasHeight, HistoricalCount)
	local CanvasHeight1 = p1.canvasHeight
	local CanvasHeightDelta = if CanvasHeight1 then CanvasHeight - CanvasHeight1 else 0
	p1.canvasHeight = CanvasHeight
	p1.historicalCount = HistoricalCount
	
	return if p1.historicalCount < HistoricalCount and CanvasHeightDelta > 0 then CanvasHeightDelta else 0
end