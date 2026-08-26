local reactModule = require(script:FindFirstAncestor("AppChat").Parent.React)

return function(p1)
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef(false)
	local var2 = reactModule.useRef(nil)
	local var3 = reactModule.useRef(nil)
	local var4 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), var3 (ref), var1 (ref)
		if var2.current then
			var2.current:Disconnect()
			var2.current = nil
		end
		if var3.current then
			var3.current:Disconnect()
			var3.current = nil
		end
		var1.current = false
	end, {})
	local var5 = reactModule.useCallback(function(p2)
		-- upvalues: var1 (ref), var2 (ref), p1 (ref), var3 (ref), var4 (ref)
		if p2 and not var1.current then
			var2.current = p1.userInputService.InputBegan:Connect(p1.onInputBegan)
			var3.current = p1.userInputService.InputEnded:Connect(p1.onInputEnded)
			var1.current = true
			
			return
		elseif not p2 and var1.current then
			var4()
			
			if p1.onFocusLost then
				p1.onFocusLost()
			end
		end
	end, { p1.onInputBegan, p1.onInputEnded, var4, p1.onFocusLost })
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var4 (ref)
		return function()
			-- upvalues: var1 (copy), var4 (copy)
			if var1.current then
				var4()
			end
		end
	end, { var4 })
	
	return { focusChanged = var5, disconnectInputConnection = var4 }
end