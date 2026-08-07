local momentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local parent = momentsCreationFlow.Parent
local _ = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local useAnimatedBinding = reactOtterModule.useAnimatedBinding
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local useRef = reactModule.useRef
local segmentSelectorWidth = require(momentsCreationFlow.Constants).AudioWaveform.SegmentSelectorWidth

return function(p0, p1, p2, p3, p4, p5) --[[ line: 19 | named "useMusicEditorController" ]]
	-- upvalues: useRef (ref), useAnimatedBinding (ref), useCallback (ref), segmentSelectorWidth (ref), reactOtterModule (ref), useEffect (ref)
	local var3 = useRef(nil)
	local var4 = useRef(nil)
	local var5, var6 = useAnimatedBinding(0)
	local var7 = useRef(nil)
	local var8 = useCallback(function() --[[ line: 33 ]]
		-- upvalues: var7 (ref), var5 (ref), p2 (ref)
		var7.current = var5:getValue()
		p2()
	end, { p2 })
	local var9 = useCallback(function() --[[ line: 38 ]]
		-- upvalues: var3 (ref), var4 (ref), var7 (ref), segmentSelectorWidth (copy), p3 (ref), p5 (ref), var6 (ref), reactOtterModule (copy)
		local current = var3.current
		local current_1 = var4.current
		
		if not current or not current_1 then return end
		local current_2 = var7.current
		local var11 = current.DragUDim2.X.Offset / segmentSelectorWidth
		local var12 = current_1.AbsoluteSize.X / segmentSelectorWidth
		
		if 1 - var12 > 0 then
			return
		end
		local clampedValue = math.clamp(current_2 + var11, 1 - var12, 0)
		p3(p5 * (-clampedValue / var12))
		var6(reactOtterModule.instant(clampedValue))
	end, { p5, p3 })
	local var10 = useCallback(function() --[[ line: 60 ]]
		-- upvalues: var7 (ref), p1 (ref)
		var7.current = nil
		p1()
	end, { p1 })
	useEffect(function() --[[ line: 65 ]]
		-- upvalues: p0 (ref), var3 (ref), var8 (ref), var9 (ref), var10 (ref)
		if not p0 then return end
		local t = {}
		
		if var3.current then
			table.insert(t, var3.current.DragStart:Connect(var8))
			table.insert(t, var3.current.DragContinue:Connect(var9))
			table.insert(t, var3.current.DragEnd:Connect(var10))
		end
		return function() --[[ line: 78 ]]
			-- upvalues: t (ref)
			for i, v in t do
				v:Disconnect()
			end
		end
	end, { p0, var8, var9, var10 })
	useEffect(function() --[[ line: 85 ]]
		-- upvalues: var4 (ref), segmentSelectorWidth (copy), var6 (ref), reactOtterModule (copy), p4 (ref), p5 (ref)
		local current = var4.current
		
		if current then
			var6(reactOtterModule.instant(-p4.startTime / p5 * (current.AbsoluteSize.X / segmentSelectorWidth)))
			
			return
		end
	end, { p4.startTime, p5 })
	
	return {
		waveformRef = var3,
		waveformPosition = var5,
		waveformDisplayRef = var4
	}
end