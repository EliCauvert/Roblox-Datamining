local MomentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local Parent = MomentsCreationFlow.Parent
local _ = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local UseAnimatedBindingFunction = ReactOtterModule.useAnimatedBinding
local UseCallbackFunction = ReactModule.useCallback
local UseEffectFunction = ReactModule.useEffect
local UseRefFunction = ReactModule.useRef
local SegmentSelectorWidth = require(MomentsCreationFlow.Constants).AudioWaveform.SegmentSelectorWidth

return function(p1, Callback2, Callback1, Callback, p2, p3)
	-- upvalues: UseRefFunction (copy), UseAnimatedBindingFunction (copy), UseCallbackFunction (copy), SegmentSelectorWidth (copy), ReactOtterModule (copy), UseEffectFunction (copy)
	local UseRefResult = UseRefFunction(nil)
	local UseRefResult1 = UseRefFunction(nil)
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = UseAnimatedBindingFunction(0)
	local UseRefResult2 = UseRefFunction(nil)
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: UseRefResult2 (copy), UseAnimatedBindingResult (copy), Callback1 (copy)
		UseRefResult2.current = UseAnimatedBindingResult:getValue()
		Callback1()
	end, { Callback1 })
	local UseCallbackResult1 = UseCallbackFunction(function()
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy), UseRefResult2 (copy), SegmentSelectorWidth (upval), Callback (copy), p3 (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval)
		local Current = UseRefResult.current
		local Current1 = UseRefResult1.current
		
		if not Current or not Current1 then return end
		local Current2 = UseRefResult2.current
		local OffsetRatio = Current.DragUDim2.X.Offset / SegmentSelectorWidth
		local XRatio = Current1.AbsoluteSize.X / SegmentSelectorWidth
		
		if 1 - XRatio <= 0 then
			local ClampedValue = math.clamp(Current2 + OffsetRatio, 1 - XRatio, 0)
			Callback(p3 * (-ClampedValue / XRatio))
			UseAnimatedBindingResult2(ReactOtterModule.instant(ClampedValue))
			
			return
		end
	end, { p3, Callback })
	local UseCallbackResult2 = UseCallbackFunction(function()
		-- upvalues: UseRefResult2 (copy), Callback2 (copy)
		UseRefResult2.current = nil
		Callback2()
	end, { Callback2 })
	UseEffectFunction(function()
		-- upvalues: p1 (copy), UseRefResult (copy), UseCallbackResult (copy), UseCallbackResult1 (copy), UseCallbackResult2 (copy)
		if not p1 then return end
		local List = {}
		
		if UseRefResult.current then
			table.insert(List, UseRefResult.current.DragStart:Connect(UseCallbackResult))
			table.insert(List, UseRefResult.current.DragContinue:Connect(UseCallbackResult1))
			table.insert(List, UseRefResult.current.DragEnd:Connect(UseCallbackResult2))
		end
		return function()
			-- upvalues: List (copy)
			for _, Connection in List do
				Connection:Disconnect()
			end
		end
	end, {
		p1,
		UseCallbackResult,
		UseCallbackResult1,
		UseCallbackResult2
	})
	UseEffectFunction(function()
		-- upvalues: UseRefResult1 (copy), SegmentSelectorWidth (upval), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), p2 (copy), p3 (copy)
		local Current = UseRefResult1.current
		
		if Current then
			UseAnimatedBindingResult2(ReactOtterModule.instant(-p2.startTime / p3 * (Current.AbsoluteSize.X / SegmentSelectorWidth)))
			
			return
		end
	end, { p2.startTime, p3 })
	
	return {
		waveformRef = UseRefResult,
		waveformPosition = UseAnimatedBindingResult,
		waveformDisplayRef = UseRefResult1
	}
end