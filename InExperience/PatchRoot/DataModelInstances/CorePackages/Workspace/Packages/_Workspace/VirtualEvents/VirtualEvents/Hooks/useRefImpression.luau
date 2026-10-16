local ReactModule = require(script:FindFirstAncestor("VirtualEvents").Parent.React)

return function(p1, Callback) --[[ Line: 5 | Named "useRefImpression" ]]
	-- upvalues: ReactModule (copy)
	local UseRefResult = ReactModule.useRef(false)
	local UseResult = ReactModule.useCallback(function(Frame, Frame1) --[[ Line: 8 ]]
		-- upvalues: UseRefResult (copy), Callback (copy)
		if Frame.AbsolutePosition.Y <= Frame1.AbsoluteSize.Y then
			UseRefResult.current = true
			Callback()
		end
	end, { Callback })
	ReactModule.useEffect(function() --[[ Line: 15 ]]
		-- upvalues: UseRefResult (copy), p1 (copy), UseResult (copy)
		if UseRefResult.current then return end
		local Current = p1.current
		local Connection = nil
		
		if Current then
			local ScreenGui = Current:FindFirstAncestorWhichIsA("ScreenGui")
			
			if ScreenGui then
				UseResult(Current, ScreenGui)
				Connection = Current:GetPropertyChangedSignal("AbsolutePosition"):Connect(function() --[[ Line: 29 ]]
					-- upvalues: UseRefResult (upval), UseResult (upval), Current (copy), ScreenGui (copy)
					if not UseRefResult.current then
						UseResult(Current, ScreenGui)
						
						return
					end
				end)
			end
		end
		return function() --[[ Line: 39 ]]
			-- upvalues: Connection (ref)
			if Connection then
				Connection:Disconnect()
			end
		end
	end)
end