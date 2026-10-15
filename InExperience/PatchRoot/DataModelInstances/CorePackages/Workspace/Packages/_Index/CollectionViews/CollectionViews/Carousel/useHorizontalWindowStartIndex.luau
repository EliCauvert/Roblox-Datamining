local reactModule = require(script:FindFirstAncestor("CollectionViews").Parent.React)

return function(p1, p2, p3, p4)
	-- upvalues: reactModule (ref)
	local var1, var2 = reactModule.useState(1)
	local var3 = reactModule.useCallback(function()
		-- upvalues: p4 (ref), p1 (ref), p2 (ref), p3 (ref), var2 (ref)
		if p4 then
			if p1.current == nil then return end
			local x = p1.current.CanvasPosition.X
			local var4 = p2:getValue().X + p3
			
			if var4 > 0 then
				var2(math.max(1, math.floor(x / var4)))
				
				return
			end
			var2(1)
			
			return
		else
			var2(1)
		end
	end, { p4, p1, p2, p3 })
	reactModule.useEffect(function()
		-- upvalues: var3 (ref)
		var3()
	end, { var3 })
	reactModule.useEffect(function()
		-- upvalues: p4 (ref), p1 (ref), var3 (ref)
		if not p4 then
			return nil
		end
		local t = {}
		
		if p1.current ~= nil then
			var3()
			table.insert(t, p1.current:GetPropertyChangedSignal("CanvasPosition"):Connect(var3))
			table.insert(t, p1.current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(var3))
		end
		return function()
			-- upvalues: t (ref)
			for i, v in t do
				v:Disconnect()
			end
		end
	end, { p1, var3, p4 })
	
	return var1
end