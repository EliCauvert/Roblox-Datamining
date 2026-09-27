local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)

return function(p1, p2, p3)
	-- upvalues: reactModule (ref)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), p2 (ref), p3 (ref)
		local current = p1.current
		
		if current == nil then return end
		local function checkDistanceToEnd()
			-- upvalues: current (ref), p2 (copy), p3 (copy)
			local y = current.AbsoluteWindowSize.Y
			
			if current.AbsoluteCanvasSize.Y - y - current.CanvasPosition.Y <= y * p2 then
				p3()
			end
		end
		
		local t = {}
		
		for i, v in {
			"CanvasPosition",
			"AbsoluteCanvasSize",
			"AbsoluteWindowSize"
		} do
			table.insert(t, current:GetPropertyChangedSignal(v):Connect(checkDistanceToEnd))
		end
		local y = current.AbsoluteWindowSize.Y
		
		if current.AbsoluteCanvasSize.Y - y - current.CanvasPosition.Y <= y * p2 then
			p3()
		end
		return function()
			-- upvalues: t (ref)
			for i, v in t do
				v:Disconnect()
			end
		end
	end, { p1, p2, p3 })
end