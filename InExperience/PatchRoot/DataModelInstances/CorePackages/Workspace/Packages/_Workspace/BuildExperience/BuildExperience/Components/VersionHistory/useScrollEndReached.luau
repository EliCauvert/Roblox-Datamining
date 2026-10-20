local ReactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)

return function(p1, p2, Callback)
	-- upvalues: ReactModule (copy)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), p2 (copy), Callback (copy)
		local Current = p1.current
		
		if Current == nil then return end
		local function checkDistanceToEnd()
			-- upvalues: Current (copy), p2 (upval), Callback (upval)
			local Y = Current.AbsoluteWindowSize.Y
			
			if Current.AbsoluteCanvasSize.Y - Y - Current.CanvasPosition.Y <= Y * p2 then
				Callback()
			end
		end
		
		local List = {}
		
		for _, PropertyName in {
			"CanvasPosition",
			"AbsoluteCanvasSize",
			"AbsoluteWindowSize"
		} do
			table.insert(List, Current:GetPropertyChangedSignal(PropertyName):Connect(checkDistanceToEnd))
		end
		local Y = Current.AbsoluteWindowSize.Y
		
		if Current.AbsoluteCanvasSize.Y - Y - Current.CanvasPosition.Y <= Y * p2 then
			Callback()
		end
		return function()
			-- upvalues: List (copy)
			for _, Connection in List do
				Connection:Disconnect()
			end
		end
	end, { p1, p2, Callback })
end