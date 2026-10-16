local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local ReactModule = require(MomentsCreation.Parent.React)
local UseCallbackFunction = ReactModule.useCallback
local UseEffectFunction = ReactModule.useEffect
local UseRefFunction = ReactModule.useRef
local UseStateFunction = ReactModule.useState
local ClampTtsStartTimeModule = require(MomentsCreation.Utils.clampTtsStartTime)

return function(p1, p2, Current, Callback1, Callback, Callback2) --[[ Line: 31 | Named "useTtsStartTimeDrag" ]]
	-- upvalues: UseRefFunction (copy), UseStateFunction (copy), UseEffectFunction (copy), UseCallbackFunction (copy), ClampTtsStartTimeModule (copy)
	local UseRefResult = UseRefFunction(nil)
	local UseRefResult1 = UseRefFunction(false)
	local UseStateResult, UseStateResult2 = UseStateFunction(false)
	local UseRefResult2 = UseRefFunction(Current)
	local UseRefResult3 = UseRefFunction(0)
	UseEffectFunction(function() --[[ Line: 50 ]]
		-- upvalues: UseRefResult2 (copy), Current (copy)
		UseRefResult2.current = Current
	end, { Current })
	local UseCallbackResult = UseCallbackFunction(function() --[[ Line: 54 ]]
		-- upvalues: UseRefResult1 (copy), UseRefResult3 (copy), UseRefResult2 (copy), UseStateResult2 (copy), Callback (copy)
		if UseRefResult1.current then return end
		UseRefResult1.current = true
		UseRefResult3.current = UseRefResult2.current
		UseStateResult2(true)
		
		if Callback ~= nil then
			Callback()
		end
	end, { Callback })
	local UseCallbackResult1 = UseCallbackFunction(function() --[[ Line: 66 ]]
		-- upvalues: UseRefResult1 (copy), UseRefResult (copy), p2 (copy), Callback1 (copy), ClampTtsStartTimeModule (upval), UseRefResult3 (copy)
		if not UseRefResult1.current then return end
		local Current = UseRefResult.current
		
		if Current ~= nil and p2 > 0 then
			Callback1(ClampTtsStartTimeModule(UseRefResult3.current + Current.DragUDim2.X.Scale * p2, p2))
			
			return
		end
	end, { p2, Callback1 })
	local UseCallbackResult2 = UseCallbackFunction(function() --[[ Line: 78 ]]
		-- upvalues: UseRefResult1 (copy), UseStateResult2 (copy), Callback2 (copy)
		if not UseRefResult1.current then return end
		UseRefResult1.current = false
		UseStateResult2(false)
		
		if Callback2 ~= nil then
			Callback2(false)
		end
	end, { Callback2 })
	UseEffectFunction(function() --[[ Line: 89 ]]
		-- upvalues: p1 (copy), UseRefResult (copy), UseCallbackResult (copy), UseCallbackResult1 (copy), UseCallbackResult2 (copy), UseRefResult1 (copy), UseStateResult2 (copy), Callback2 (copy)
		if not p1 then return end
		local Current = UseRefResult.current
		
		if Current == nil then return end
		local Connections = {
			Current.DragStart:Connect(UseCallbackResult),
			Current.DragContinue:Connect(UseCallbackResult1),
			Current.DragEnd:Connect(UseCallbackResult2)
		}
		
		return function() --[[ Line: 102 ]]
			-- upvalues: Connections (copy), UseRefResult1 (upval), UseStateResult2 (upval), Callback2 (upval)
			for _, connection in Connections do
				connection:Disconnect()
			end
			if UseRefResult1.current then
				UseRefResult1.current = false
				UseStateResult2(false)
				
				if Callback2 ~= nil then
					Callback2(true)
				end
			end
		end
	end, {
		p1,
		UseCallbackResult,
		UseCallbackResult1,
		UseCallbackResult2,
		Callback2
	})
	
	return {
		dragDetectorRef = UseRefResult,
		isSelected = UseStateResult
	}
end