local reactModule = require(script:FindFirstAncestor("SduiSharedContent").Parent.React)

return function(p1, p2, p3)
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef(false)
	local var2 = reactModule.useRef(p3)
	var2.current = p3
	
	if p3 == nil then
		p2 = nil
	end
	reactModule.useEffect(function()
		-- upvalues: p2 (write), p1 (ref), var1 (ref), var2 (ref)
		if p2 == nil or p1.current == nil then
			return nil
		end
		local t = {}
		local current = p1.current
		
		local function checkThreshold()
			-- upvalues: current (ref), p2 (copy), var1 (copy), var2 (copy)
			local var3 = current.AbsoluteCanvasSize.Y - current.AbsoluteWindowSize.Y - p2
			local y = current.CanvasPosition.Y
			
			if y < var3 and var1.current then
				var1.current = false
				
				return
			elseif var3 < y and not var1.current then
				var1.current = true
				
				if var2.current then
					var2.current()
				end
			end
		end
		
		table.insert(t, current:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(checkThreshold))
		table.insert(t, current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(checkThreshold))
		table.insert(t, current:GetPropertyChangedSignal("CanvasPosition"):Connect(checkThreshold))
		local var3 = false
		task.defer(function()
			-- upvalues: var3 (write), current (ref), p2 (copy), var1 (copy), var2 (copy)
			if not var3 then
				local var4 = current.AbsoluteCanvasSize.Y - current.AbsoluteWindowSize.Y - p2
				local y = current.CanvasPosition.Y
				
				if y < var4 and var1.current then
					var1.current = false
					
					return
				elseif var4 < y and not var1.current then
					var1.current = true
					
					if var2.current then
						var2.current()
					end
				end
			end
		end)
		
		return function()
			-- upvalues: var3 (write), t (ref)
			var3 = true
			
			for i, v in t do
				v:Disconnect()
			end
		end
	end, { p1, p2 })
end