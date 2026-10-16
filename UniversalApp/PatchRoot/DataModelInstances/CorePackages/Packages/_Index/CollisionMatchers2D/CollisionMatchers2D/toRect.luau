return function(Frame: Frame) --[[ Line: 11 | Named "toRect" ]]
	local ValueType = typeof(Frame)
	
	if ValueType == "Rect" then
		return Frame
	elseif ValueType ~= "Instance" then return end
	return Rect.new(Frame.AbsolutePosition, Frame.AbsolutePosition + Frame.AbsoluteSize)
end