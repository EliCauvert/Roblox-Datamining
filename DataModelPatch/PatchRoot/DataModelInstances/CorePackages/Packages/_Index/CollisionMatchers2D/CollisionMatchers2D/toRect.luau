return function(Frame: Frame)
	local ValueType = typeof(Frame)
	
	if ValueType == "Rect" then
		return Frame
	elseif ValueType ~= "Instance" then return end
	return Rect.new(Frame.AbsolutePosition, Frame.AbsolutePosition + Frame.AbsoluteSize)
end