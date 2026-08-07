local reactModule = require(script:FindFirstAncestor("AppChat").Parent.React)

return function(p0) --[[ line: 13 | named "useInputConnections" ]]
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef(false)
	local var2 = reactModule.useRef(nil)
	local var3 = reactModule.useRef(nil)
	local var4 = reactModule.useCallback(function() --[[ line: 18 ]]
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
	local var5 = reactModule.useCallback(function(p1) --[[ line: 32 ]]
		-- upvalues: var1 (ref), var2 (ref), p0 (ref), var3 (ref), var4 (ref)
		if p1 and not var1.current then
			var2.current = p0.userInputService.InputBegan:Connect(p0.onInputBegan)
			var3.current = p0.userInputService.InputEnded:Connect(p0.onInputEnded)
			var1.current = true
			
			return
		elseif not p1 and var1.current then
			var4()
			
			if p0.onFocusLost then
				p0.onFocusLost()
			end
		end
	end, { p0.onInputBegan, p0.onInputEnded, var4, p0.onFocusLost })
	reactModule.useEffect(function() --[[ line: 53 ]]
		-- upvalues: var1 (ref), var4 (ref)
		return function() --[[ line: 54 ]]
			-- upvalues: var1 (copy), var4 (copy)
			if var1.current then
				var4()
			end
		end
	end, { var4 })
	
	return { focusChanged = var5, disconnectInputConnection = var4 }
end