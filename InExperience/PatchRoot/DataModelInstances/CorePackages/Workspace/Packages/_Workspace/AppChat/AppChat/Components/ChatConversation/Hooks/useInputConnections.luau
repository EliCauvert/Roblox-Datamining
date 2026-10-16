local ReactModule = require(script:FindFirstAncestor("AppChat").Parent.React)

return function(p1) --[[ Line: 13 | Named "useInputConnections" ]]
	-- upvalues: ReactModule (copy)
	local UseRefResult = ReactModule.useRef(false)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function() --[[ Line: 18 ]]
		-- upvalues: UseRefResult1 (copy), UseRefResult2 (copy), UseRefResult (copy)
		if UseRefResult1.current then
			UseRefResult1.current:Disconnect()
			UseRefResult1.current = nil
		end
		if UseRefResult2.current then
			UseRefResult2.current:Disconnect()
			UseRefResult2.current = nil
		end
		UseRefResult.current = false
	end, {})
	local UseResult1 = ReactModule.useCallback(function(p2) --[[ Line: 32 ]]
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy), p1 (copy), UseRefResult2 (copy), UseResult (copy)
		if p2 and not UseRefResult.current then
			UseRefResult1.current = p1.userInputService.InputBegan:Connect(p1.onInputBegan)
			UseRefResult2.current = p1.userInputService.InputEnded:Connect(p1.onInputEnded)
			UseRefResult.current = true
			
			return
		end
		if not p2 and UseRefResult.current then
			UseResult()
			
			if p1.onFocusLost then
				p1.onFocusLost()
			end
		end
	end, {
		p1.onInputBegan,
		p1.onInputEnded,
		UseResult,
		p1.onFocusLost
	})
	ReactModule.useEffect(function() --[[ Line: 53 ]]
		-- upvalues: UseRefResult (copy), UseResult (copy)
		return function() --[[ Line: 54 ]]
			-- upvalues: UseRefResult (upval), UseResult (upval)
			if UseRefResult.current then
				UseResult()
			end
		end
	end, { UseResult })
	
	return {
		focusChanged = UseResult1,
		disconnectInputConnection = UseResult
	}
end