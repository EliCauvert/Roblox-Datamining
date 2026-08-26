local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local _ = require(parent.MomentsTypes)
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local useAnimatedBinding = reactOtterModule.useAnimatedBinding
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local useRef = reactModule.useRef
local segmentSelectorWidth = require(momentsCreation.Constants).AudioWaveform.SegmentSelectorWidth

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: useRef (ref), useAnimatedBinding (ref), useCallback (ref), segmentSelectorWidth (ref), reactOtterModule (ref), useEffect (ref)
	local var1 = useRef(nil)
	local var2 = useRef(nil)
	local var3, var4 = useAnimatedBinding(0)
	local var5 = useRef(nil)
	local var6 = useCallback(function()
		-- upvalues: var5 (ref), var3 (ref), p3 (ref)
		var5.current = var3:getValue()
		p3()
	end, { p3 })
	local var7 = useCallback(function()
		-- upvalues: var1 (ref), var2 (ref), var5 (ref), segmentSelectorWidth (copy), p4 (ref), p6 (ref), var4 (ref), reactOtterModule (copy)
		local current = var1.current
		local current_1 = var2.current
		
		if current == nil or current_1 == nil then return end
		local current_2 = var5.current or 0
		local var8 = current.DragUDim2.X.Offset / segmentSelectorWidth
		local var9 = current_1.AbsoluteSize.X / segmentSelectorWidth
		
		if 1 - var9 > 0 then
			return
		end
		local clampedValue = math.clamp(current_2 + var8, 1 - var9, 0)
		p4(p6 * (-clampedValue / var9))
		var4(reactOtterModule.instant(clampedValue))
	end, { p6, p4 })
	local var8 = useCallback(function()
		-- upvalues: var5 (ref), p2 (ref)
		var5.current = nil
		p2()
	end, { p2 })
	useEffect(function()
		-- upvalues: p1 (ref), var1 (ref), var6 (ref), var7 (ref), var8 (ref)
		if not p1 then return end
		local t = {}
		local current = var1.current
		
		if current ~= nil then
			table.insert(t, current.DragStart:Connect(var6))
			table.insert(t, current.DragContinue:Connect(var7))
			table.insert(t, current.DragEnd:Connect(var8))
		end
		return function()
			-- upvalues: t (ref)
			for i, v in t do
				v:Disconnect()
			end
		end
	end, { p1, var6, var7, var8 })
	useEffect(function()
		-- upvalues: var2 (ref), p6 (ref), segmentSelectorWidth (copy), var4 (ref), reactOtterModule (copy), p5 (ref)
		local current = var2.current
		
		if current == nil or p6 <= 0 then
			return
		end
		var4(reactOtterModule.instant(-p5.startTime / p6 * (current.AbsoluteSize.X / segmentSelectorWidth)))
	end, { p5.startTime, p6 })
	
	return {
		waveformRef = var1,
		waveformPosition = var3,
		waveformDisplayRef = var2
	}
end