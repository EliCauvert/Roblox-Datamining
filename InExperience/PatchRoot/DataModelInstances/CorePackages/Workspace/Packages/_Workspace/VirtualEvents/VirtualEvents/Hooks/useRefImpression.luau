local reactModule = require(script:FindFirstAncestor("VirtualEvents").Parent.React)

return function(p1, p2)
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef(false)
	local var2 = reactModule.useCallback(function(p3, p4)
		-- upvalues: var1 (ref), p2 (ref)
		if p3.AbsolutePosition.Y <= p4.AbsoluteSize.Y then
			var1.current = true
			p2()
		end
	end, { p2 })
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), p1 (ref), var2 (ref)
		if var1.current then return end
		local current = p1.current
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