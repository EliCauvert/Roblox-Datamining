return function(p1)
	local ScaledFontSize = p1.FontSize * p1.LineHeight
	
	return p1.FontSize + 2 * UDim.new(0, (ScaledFontSize - p1.FontSize) / 2).Offset, (math.round(ScaledFontSize))
end