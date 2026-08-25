local reactModule = require(script:FindFirstAncestor("VirtualEvents").Parent.React)

return function(p0, p1)
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef(false)
	local var2 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var1 (ref), p1 (ref)
		if p2.AbsolutePosition.Y <= p3.AbsoluteSize.Y then
			var1.current = true
			p1()
		end
	end, { p1 })
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), p0 (ref), var2 (ref)
		if var1.current then return end
		local current = p0.current
		local var3 = nil
		
		if current then
			local screenGui = current:FindFirstAncestorWhichIsA("ScreenGui")
			
			if screenGui then
				var2(current, screenGui)
				var3 = current:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
					-- upvalues: var1 (copy), var2 (copy), current (ref), screenGui (ref)
					if var1.current then
						return
					end
					var2(current, screenGui)
				end)
			end
		end
		return function()
			-- upvalues: var3 (write)
			if var3 then
				var3:Disconnect()
			end
		end
	end)
end