return function(Vector, Frame: Frame): boolean --[[ Line: 1 | Named "isInputInsideObject" ]]
	if Frame then
		local AbsolutePosition = Frame.AbsolutePosition
		local _Rect = Rect.new(AbsolutePosition, AbsolutePosition + Frame.AbsoluteSize)
		
		return _Rect.Min.X <= Vector.X and (_Rect.Min.Y <= Vector.Y and Vector.X <= _Rect.Max.X) and Vector.Y <= _Rect.Max.Y
	else
		return false
	end
end