return function(Frame: Frame, Vector): boolean --[[ Line: 1 | Named "isPointInGuiObjectBounds" ]]
	if Frame then
		local AbsolutePosition = Frame.AbsolutePosition
		local AbsoluteSize = Frame.AbsoluteSize
		local Y = AbsolutePosition.Y
		local NewX = AbsolutePosition.X + AbsoluteSize.X
		local NewY = AbsolutePosition.Y + AbsoluteSize.Y
		
		return AbsolutePosition.X <= Vector.X and (Vector.X <= NewX and Y <= Vector.Y) and Vector.Y <= NewY
	else
		return false
	end
end