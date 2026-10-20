local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local ReactModule = require(Parent.React)
local UseBindingFunction = ReactModule.useBinding
local UseCallbackFunction = ReactModule.useCallback
local UseEffectFunction = ReactModule.useEffect
local UseRefFunction = ReactModule.useRef
local ValidateRefsModule = require(MomentsCreation.Utils.validateRefs)
local DragHandleModule = require(MomentsCreation.Enums.DragHandle)
local _ = require(Parent.MomentsTypes)

local function _(p1, p2: number, p3)
	return if p1 == nil or p2 <= 0 then p3 else p1 / p2
end

return function(p1, Callback3, Callback, Callback2, Callback4, p2, p3: number, Callback1)
	-- upvalues: UseRefFunction (copy), UseBindingFunction (copy), UseCallbackFunction (copy), ValidateRefsModule (copy), DragHandleModule (copy), UseEffectFunction (copy)
	local UseRefResult = UseRefFunction(nil)
	local UseRefResult1 = UseRefFunction(nil)
	local UseRefResult2 = UseRefFunction(nil)
	local UseRefResult3 = UseRefFunction(nil)
	local UseRefResult4 = UseRefFunction(nil)
	local UseRefResult5 = UseRefFunction(nil)
	local StartTime = if p2 then p2.startTime else nil
	local UseBindingResult, UseBindingResult2 = UseBindingFunction(if StartTime == nil or p3 <= 0 then 0 else StartTime / p3)
	local EndTime = if p2 then p2.endTime else nil
	local UseBindingResult1, UseBindingResult2_1 = UseBindingFunction(if EndTime == nil or p3 <= 0 then 1 else EndTime / p3)
	local UseRefResult6 = UseRefFunction(nil)
	local UseRefResult7 = UseRefFunction(nil)
	local UseRefResult8 = UseRefFunction(nil)
	local UseRefResult9 = UseRefFunction(nil)
	local v1: number = if p3 > 0 then 1 / p3 else 0
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: ValidateRefsModule (upval), UseRefResult1 (copy), UseRefResult9 (copy), DragHandleModule (upval), UseRefResult6 (copy), UseBindingResult (copy), Callback (copy)
		if ValidateRefsModule({ UseRefResult1 }) and not UseRefResult9.current then
			UseRefResult9.current = DragHandleModule.LeftHandle
			UseRefResult6.current = UseBindingResult:getValue()
			Callback(DragHandleModule.LeftHandle)
			
			return
		end
	end, { Callback })
	local UseCallbackResult1 = UseCallbackFunction(function()
		-- upvalues: ValidateRefsModule (upval), UseRefResult6 (copy), UseRefResult1 (copy), UseBindingResult1 (copy), v1 (copy), UseBindingResult2 (copy), Callback1 (copy), DragHandleModule (upval)
		if not ValidateRefsModule({ UseRefResult6, UseRefResult1 }) then return end
		local ClampedValue = math.clamp(UseRefResult6.current + UseRefResult1.current.DragUDim2.X.Scale, 0, UseBindingResult1:getValue() - v1)
		UseBindingResult2(ClampedValue)
		
		if Callback1 then
			Callback1(DragHandleModule.LeftHandle, ClampedValue, UseBindingResult1:getValue())
		end
	end, { v1, Callback1 })
	local UseCallbackResult2 = UseCallbackFunction(function()
		-- upvalues: UseRefResult9 (copy), DragHandleModule (upval), Callback2 (copy), UseBindingResult (copy), p3 (copy), UseRefResult6 (copy), Callback3 (copy)
		if UseRefResult9.current == DragHandleModule.LeftHandle then
			Callback2(UseBindingResult:getValue() * p3, nil)
			UseRefResult9.current = nil
			UseRefResult6.current = nil
			Callback3()
			
			return
		end
	end, { Callback3, Callback2, p3 })
	local UseCallbackResult3 = UseCallbackFunction(function()
		-- upvalues: ValidateRefsModule (upval), UseRefResult2 (copy), UseRefResult9 (copy), DragHandleModule (upval), UseRefResult7 (copy), UseBindingResult1 (copy), Callback (copy)
		if ValidateRefsModule({ UseRefResult2 }) and not UseRefResult9.current then
			UseRefResult9.current = DragHandleModule.RightHandle
			UseRefResult7.current = UseBindingResult1:getValue()
			Callback(DragHandleModule.RightHandle)
			
			return
		end
	end, { Callback })
	local UseCallbackResult4 = UseCallbackFunction(function()
		-- upvalues: ValidateRefsModule (upval), UseRefResult7 (copy), UseRefResult2 (copy), UseBindingResult (copy), v1 (copy), UseBindingResult2_1 (copy), Callback1 (copy), DragHandleModule (upval)
		if not ValidateRefsModule({ UseRefResult7, UseRefResult2 }) then return end
		local ClampedValue = math.clamp(UseRefResult7.current + UseRefResult2.current.DragUDim2.X.Scale, UseBindingResult:getValue() + v1, 1)
		UseBindingResult2_1(ClampedValue)
		
		if Callback1 then
			Callback1(DragHandleModule.RightHandle, UseBindingResult:getValue(), ClampedValue)
		end
	end, { v1, Callback1 })
	local UseCallbackResult5 = UseCallbackFunction(function()
		-- upvalues: UseRefResult9 (copy), DragHandleModule (upval), Callback2 (copy), UseBindingResult1 (copy), p3 (copy), UseRefResult7 (copy), Callback3 (copy)
		if UseRefResult9.current == DragHandleModule.RightHandle then
			Callback2(nil, UseBindingResult1:getValue() * p3)
			UseRefResult9.current = nil
			UseRefResult7.current = nil
			Callback3()
			
			return
		end
	end, { Callback3, Callback2, p3 })
	local UseCallbackResult6 = UseCallbackFunction(function()
		-- upvalues: ValidateRefsModule (upval), UseRefResult5 (copy), UseRefResult4 (copy), UseRefResult9 (copy), DragHandleModule (upval), UseRefResult8 (copy), Callback (copy)
		if ValidateRefsModule({ UseRefResult5, UseRefResult4 }) and not UseRefResult9.current then
			UseRefResult9.current = DragHandleModule.Scrubber
			UseRefResult8.current = UseRefResult4.current.Position.X.Scale
			Callback(DragHandleModule.Scrubber)
			
			return
		end
	end, { Callback })
	local UseCallbackResult7 = UseCallbackFunction(function()
		-- upvalues: ValidateRefsModule (upval), UseRefResult8 (copy), UseRefResult5 (copy), Callback4 (copy)
		if ValidateRefsModule({ UseRefResult8, UseRefResult5 }) then
			Callback4((math.clamp(UseRefResult8.current + UseRefResult5.current.DragUDim2.X.Scale, 0, 1)))
			
			return
		end
	end, { Callback4 })
	local UseCallbackResult8 = UseCallbackFunction(function()
		-- upvalues: UseRefResult9 (copy), DragHandleModule (upval), UseRefResult8 (copy), Callback3 (copy)
		if UseRefResult9.current == DragHandleModule.Scrubber then
			UseRefResult9.current = nil
			UseRefResult8.current = nil
			Callback3()
			
			return
		end
	end, { Callback3 })
	local UseCallbackResult9 = UseCallbackFunction(function()
		-- upvalues: ValidateRefsModule (upval), UseRefResult3 (copy), UseRefResult9 (copy), DragHandleModule (upval), UseRefResult6 (copy), UseBindingResult (copy), UseRefResult7 (copy), UseBindingResult1 (copy), Callback (copy)
		if ValidateRefsModule({ UseRefResult3 }) and not UseRefResult9.current then
			UseRefResult9.current = DragHandleModule.Segment
			UseRefResult6.current = UseBindingResult:getValue()
			UseRefResult7.current = UseBindingResult1:getValue()
			Callback(DragHandleModule.Segment)
			
			return
		end
	end, { Callback })
	local UseCallbackResult10 = UseCallbackFunction(function()
		-- upvalues: ValidateRefsModule (upval), UseRefResult3 (copy), UseRefResult6 (copy), UseRefResult1 (copy), UseRefResult7 (copy), UseRefResult2 (copy), UseBindingResult2 (copy), UseBindingResult2_1 (copy), Callback2 (copy), p3 (copy)
		if not ValidateRefsModule({
			UseRefResult3,
			UseRefResult6,
			UseRefResult1,
			UseRefResult7,
			UseRefResult2
		}) then return end
		local Scale: number = UseRefResult3.current.DragUDim2.X.Scale
		local Current: number = UseRefResult6.current
		local Current1: number = UseRefResult7.current
		
		if Current > 0 or Current1 < 1 then
			local ClampedValue = math.clamp(Scale, -Current, 1 - Current1)
			local NewCurrent = Current + ClampedValue
			local NewCurrent1 = Current1 + ClampedValue
			UseBindingResult2(NewCurrent)
			UseBindingResult2_1(NewCurrent1)
			Callback2(NewCurrent * p3, NewCurrent1 * p3)
			
			return
		end
	end, { Callback2, p3 })
	local UseCallbackResult11 = UseCallbackFunction(function()
		-- upvalues: UseRefResult9 (copy), DragHandleModule (upval), UseRefResult6 (copy), UseRefResult7 (copy), Callback3 (copy)
		if UseRefResult9.current == DragHandleModule.Segment then
			UseRefResult9.current = nil
			UseRefResult6.current = nil
			UseRefResult7.current = nil
			Callback3()
			
			return
		end
	end, { Callback3 })
	UseEffectFunction(function()
		-- upvalues: p1 (copy), UseRefResult1 (copy), UseCallbackResult (copy), UseCallbackResult1 (copy), UseCallbackResult2 (copy), UseRefResult2 (copy), UseCallbackResult3 (copy), UseCallbackResult4 (copy), UseCallbackResult5 (copy), UseRefResult5 (copy), UseCallbackResult6 (copy), UseCallbackResult7 (copy), UseCallbackResult8 (copy), UseRefResult3 (copy), UseCallbackResult9 (copy), UseCallbackResult10 (copy), UseCallbackResult11 (copy)
		if not p1 then return end
		local List = {}
		
		if UseRefResult1.current then
			table.insert(List, UseRefResult1.current.DragStart:Connect(UseCallbackResult))
			table.insert(List, UseRefResult1.current.DragContinue:Connect(UseCallbackResult1))
			table.insert(List, UseRefResult1.current.DragEnd:Connect(UseCallbackResult2))
		end
		if UseRefResult2.current then
			table.insert(List, UseRefResult2.current.DragStart:Connect(UseCallbackResult3))
			table.insert(List, UseRefResult2.current.DragContinue:Connect(UseCallbackResult4))
			table.insert(List, UseRefResult2.current.DragEnd:Connect(UseCallbackResult5))
		end
		if UseRefResult5.current then
			table.insert(List, UseRefResult5.current.DragStart:Connect(UseCallbackResult6))
			table.insert(List, UseRefResult5.current.DragContinue:Connect(UseCallbackResult7))
			table.insert(List, UseRefResult5.current.DragEnd:Connect(UseCallbackResult8))
		end
		if UseRefResult3.current then
			table.insert(List, UseRefResult3.current.DragStart:Connect(UseCallbackResult9))
			table.insert(List, UseRefResult3.current.DragContinue:Connect(UseCallbackResult10))
			table.insert(List, UseRefResult3.current.DragEnd:Connect(UseCallbackResult11))
		end
		return function()
			-- upvalues: List (copy)
			for _, Connection in List do
				Connection:Disconnect()
			end
		end
	end, {
		p1, UseCallbackResult, UseCallbackResult1, UseCallbackResult2,
		UseCallbackResult3, UseCallbackResult4, UseCallbackResult5, UseCallbackResult6,
		UseCallbackResult7, UseCallbackResult8, UseCallbackResult9,
		UseCallbackResult10, UseCallbackResult11
	})
	
	return {
		dragContainerRef = UseRefResult,
		leftHandleRef = UseRefResult1,
		rightHandleRef = UseRefResult2,
		scrubberDisplayRef = UseRefResult4,
		scrubberRef = UseRefResult5,
		segmentRef = UseRefResult3,
		leftHandlePosition = UseBindingResult,
		rightHandlePosition = UseBindingResult1
	}
end