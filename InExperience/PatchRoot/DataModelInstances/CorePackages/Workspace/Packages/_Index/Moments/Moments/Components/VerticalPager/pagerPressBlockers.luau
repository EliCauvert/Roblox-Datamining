local Frames = {}

return {
	register = function(Key)
		-- upvalues: Frames (copy)
		Frames[Key] = true
		
		return function()
			-- upvalues: Frames (upval), Key (copy)
			Frames[Key] = nil
		end
	end,
	isBlocked = function(Vector): boolean
		-- upvalues: Frames (copy)
		for frame in Frames do
			local AbsolutePosition = frame.AbsolutePosition
			local AbsoluteSize = frame.AbsoluteSize
			
			if AbsolutePosition.X <= Vector.X and Vector.X <= AbsolutePosition.X + AbsoluteSize.X and AbsolutePosition.Y <= Vector.Y and Vector.Y <= AbsolutePosition.Y + AbsoluteSize.Y then
				return true
			end
		end
		return false
	end
}