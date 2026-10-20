local MomentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local Parent = MomentsCreationFlow.Parent
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local UseAnimatedBindingFunction = ReactOtterModule.useAnimatedBinding
local UseCallbackFunction = ReactModule.useCallback
local UseEffectFunction = ReactModule.useEffect
local UseRefFunction = ReactModule.useRef
local ValidateRefsModule = require(MomentsCreationFlow.Utils.validateRefs)
local DragHandleModule = require(MomentsCreationFlow.Enums.DragHandle)

return function(p1, Callback2, Callback, Callback1, Callback3, p2, p3)
	-- upvalues: UseRefFunction (copy), UseAnimatedBindingFunction (copy), UseCallbackFunction (copy), ValidateRefsModule (copy), DragHandleModule (copy), MomentsCommonModule (copy), ReactOtterModule (copy), UseEffectFunction (copy)
	local UseRefResult = UseRefFunction(nil)
	local UseRefResult1 = UseRefFunction(nil)
	local UseRefResult2 = UseRefFunction(nil)
	local UseRefResult3 = UseRefFunction(nil)
	local UseRefResult4 = UseRefFunction(nil)
	local UseRefResult5 = UseRefFunction(nil)
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = UseAnimatedBindingFunction(p2 and p2.startTime / p3 or 0)
	local UseAnimatedBindingResult1, UseAnimatedBindingResult2_1 = UseAnimatedBindingFunction(p2 and p2.endTime / p3 or 1)
	local UseRefResult6 = UseRefFunction(nil)
	local UseRefResult7 = UseRefFunction(nil)
	local UseRefResult8 = UseRefFunction(nil)
	local UseRefResult9 = UseRefFunction(nil)
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: ValidateRefsModule (upval), UseRefResult1 (copy), UseRefResult9 (copy), DragHandleModule (upval), UseRefResult6 (copy), UseAnimatedBindingResult (copy), Callback (copy)
		if ValidateRefsModule({ UseRefResult1 }) and not UseRefResult9.current then
			assert(UseRefResult1.current ~= nil, "Left handle ref is nil")
			UseRefResult9.current = DragHandleModule.LeftHandle
			UseRefResult6.current = UseAnimatedBindingResult:getValue()
			Callback(DragHandleModule.LeftHandle)
			
			return
		end
	end, { Callback })
	local UseCallbackResult1 = UseCallbackFunction(function()
		-- upvalues: ValidateRefsModule (upval), UseRefResult6 (copy), UseRefResult1 (copy), UseAnimatedBindingResult1 (copy), MomentsCommonModule (upval), p3 (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval)
		if ValidateRefsModule({ UseRefResult6, UseRefResult1 }) then
			assert(UseRefResult6.current ~= nil, "Left handle initial position ref is nil")
			assert(UseRefResult1.current ~= nil, "Left handle ref is nil")
			UseAnimatedBindingResult2(ReactOtterModule.instant((math.clamp(UseRefResult6.current + UseRefResult1.current.DragUDim2.X.Scale, 0, UseAnimatedBindingResult1:getValue() - MomentsCommonModule.Constants.MinimumVideoLength / p3))))
			
			return
		end
	end, { p3 })
	local UseCallbackResult2 = UseCallbackFunction(function()
		-- upvalues: UseRefResult9 (copy), DragHandleModule (upval), Callback1 (copy), UseAnimatedBindingResult (copy), p3 (copy), UseRefResult6 (copy), Callback2 (copy)
		if UseRefResult9.current == DragHandleModule.LeftHandle then
			Callback1(UseAnimatedBindingResult:getValue() * p3, nil)
			UseRefResult9.current = nil
			UseRefResult6.current = nil
			Callback2()
			
			return
		end
	end, { Callback2, Callback1, p3 })
	local UseCallbackResult3 = UseCallbackFunction(function()
		-- upvalues: ValidateRefsModule (upval), UseRefResult2 (copy), UseRefResult9 (copy), DragHandleModule (upval), UseRefResult7 (copy), UseAnimatedBindingResult1 (copy), Callback (copy)
		if ValidateRefsModule({ UseRefResult2 }) and not UseRefResult9.current then
			assert(UseRefResult2.current ~= nil, "Right handle ref is nil")
			UseRefResult9.current = DragHandleModule.RightHandle
			UseRefResult7.current = UseAnimatedBindingResult1:getValue()
			Callback(DragHandleModule.RightHandle)
			
			return
		end
	end, { Callback })
	local UseCallbackResult4 = UseCallbackFunction(function()
		-- upvalues: ValidateRefsModule (upval), UseRefResult7 (copy), UseRefResult2 (copy), UseAnimatedBindingResult (copy), MomentsCommonModule (upval), p3 (copy), UseAnimatedBindingResult2_1 (copy), ReactOtterModule (upval)
		if ValidateRefsModule({ UseRefResult7, UseRefResult2 }) then
			assert(UseRefResult2.current ~= nil, "Right handle ref is nil")
			UseAnimatedBindingResult2_1(ReactOtterModule.instant((math.clamp(UseRefResult7.current + UseRefResult2.current.DragUDim2.X.Scale, UseAnimatedBindingResult:getValue() + MomentsCommonModule.Constants.MinimumVideoLength / p3, 1))))
			
			return
		end
	end, { p3 })
	local UseCallbackResult5 = UseCallbackFunction(function()
		-- upvalues: UseRefResult9 (copy), DragHandleModule (upval), Callback1 (copy), UseAnimatedBindingResult1 (copy), p3 (copy), UseRefResult7 (copy), Callback2 (copy)
		if UseRefResult9.current == DragHandleModule.RightHandle then
			Callback1(nil, UseAnimatedBindingResult1:getValue() * p3)
			UseRefResult9.current = nil
			UseRefResult7.current = nil
			Callback2()
			
			return
		end
	end, { Callback2, Callback1, p3 })
	local UseCallbackResult6 = UseCallbackFunction(function()
		-- upvalues: ValidateRefsModule (upval), UseRefResult5 (copy), UseRefResult4 (copy), UseRefResult9 (copy), DragHandleModule (upval), UseRefResult8 (copy), Callback (copy)
		if ValidateRefsModule({ UseRefResult5, UseRefResult4 }) and not UseRefResult9.current then
			assert(UseRefResult5.current ~= nil, "Scrubber ref is nil")
			assert(UseRefResult4.current ~= nil, "Scrubber display ref is nil")
			UseRefResult9.current = DragHandleModule.Scrubber
			UseRefResult8.current = UseRefResult4.current.Position.X.Scale
			Callback(DragHandleModule.Scrubber)
			
			return
		end
	end, { Callback })
	local UseCallbackResult7 = UseCallbackFunction(function()
		-- upvalues: ValidateRefsModule (upval), UseRefResult8 (copy), UseRefResult5 (copy), Callback3 (copy)
		if ValidateRefsModule({ UseRefResult8, UseRefResult5 }) then
			assert(UseRefResult8.current ~= nil, "Scrubber initial position ref is nil")
			assert(UseRefResult5.current ~= nil, "Scrubber ref is nil")
			Callback3((math.clamp(UseRefResult8.current + UseRefResult5.current.DragUDim2.X.Scale, 0, 1)))
			
			return
		end
	end, { Callback3 })
	local UseCallbackResult8 = UseCallbackFunction(function()
		-- upvalues: UseRefResult9 (copy), DragHandleModule (upval), UseRefResult8 (copy), Callback2 (copy)
		if UseRefResult9.current == DragHandleModule.Scrubber then
			UseRefResult9.current = nil
			UseRefResult8.current = nil
			Callback2()
			
			return
		end
	end, { Callback2 })
	local UseCallbackResult9 = UseCallbackFunction(function()
		-- upvalues: ValidateRefsModule (upval), UseRefResult3 (copy), UseRefResult9 (copy), DragHandleModule (upval), UseRefResult6 (copy), UseAnimatedBindingResult (copy), UseRefResult7 (copy), UseAnimatedBindingResult1 (copy), Callback (copy)
		if ValidateRefsModule({ UseRefResult3 }) and not UseRefResult9.current then
			assert(UseRefResult3.current ~= nil, "Selected outline ref is nil")
			UseRefResult9.current = DragHandleModule.Segment
			UseRefResult6.current = UseAnimatedBindingResult:getValue()
			UseRefResult7.current = UseAnimatedBindingResult1:getValue()
			Callback(DragHandleModule.Segment)
			
			return
		end
	end, { Callback })
	local UseCallbackResult10 = UseCallbackFunction(function()
		-- upvalues: ValidateRefsModule (upval), UseRefResult3 (copy), UseRefResult6 (copy), UseRefResult1 (copy), UseRefResult7 (copy), UseRefResult2 (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), UseAnimatedBindingResult2_1 (copy), Callback1 (copy), p3 (copy)
		if not ValidateRefsModule({
			UseRefResult3,
			UseRefResult6,
			UseRefResult1,
			UseRefResult7,
			UseRefResult2
		}) then return end
		assert(UseRefResult3.current ~= nil, "Selected outline ref is nil")
		assert(UseRefResult6.current ~= nil, "Left handle initial position ref is nil")
		assert(UseRefResult1.current ~= nil, "Left handle ref is nil")
		assert(UseRefResult7.current ~= nil, "Right handle initial position ref is nil")
		assert(UseRefResult2.current ~= nil, "Right handle ref is nil")
		local Scale: number = UseRefResult3.current.DragUDim2.X.Scale
		local Current: number = UseRefResult6.current
		local Current1: number = UseRefResult7.current
		
		if Current > 0 or Current1 < 1 then
			local ClampedValue = math.clamp(Scale, -Current, 1 - Current1)
			local NewCurrent = Current + ClampedValue
			local NewCurrent1 = Current1 + ClampedValue
			UseAnimatedBindingResult2(ReactOtterModule.instant(NewCurrent))
			UseAnimatedBindingResult2_1(ReactOtterModule.instant(NewCurrent1))
			Callback1(NewCurrent * p3, NewCurrent1 * p3)
			
			return
		end
	end, { Callback1, p3 })
	local UseCallbackResult11 = UseCallbackFunction(function()
		-- upvalues: UseRefResult9 (copy), DragHandleModule (upval), UseRefResult6 (copy), UseRefResult7 (copy), Callback2 (copy)
		if UseRefResult9.current == DragHandleModule.Segment then
			UseRefResult9.current = nil
			UseRefResult6.current = nil
			UseRefResult7.current = nil
			Callback2()
			
			return
		end
	end, { Callback2 })
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
		leftHandlePosition = UseAnimatedBindingResult,
		rightHandlePosition = UseAnimatedBindingResult1
	}
end