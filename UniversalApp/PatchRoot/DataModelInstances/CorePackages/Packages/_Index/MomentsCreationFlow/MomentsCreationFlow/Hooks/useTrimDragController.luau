local momentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local parent = momentsCreationFlow.Parent
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local useAnimatedBinding = reactOtterModule.useAnimatedBinding
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local useRef = reactModule.useRef
local validateRefsModule = require(momentsCreationFlow.Utils.validateRefs)
local dragHandleModule = require(momentsCreationFlow.Enums.DragHandle)

return function(value, p1, p2, p3, p4, p5, p6)
	-- upvalues: useRef (ref), useAnimatedBinding (ref), useCallback (ref), validateRefsModule (ref), dragHandleModule (ref), momentsCommonModule (ref), reactOtterModule (ref), useEffect (ref)
	local var1 = useRef(nil)
	local var2 = useRef(nil)
	local var3 = useRef(nil)
	local var4 = useRef(nil)
	local var5 = useRef(nil)
	local var6 = useRef(nil)
	local var7, var8 = useAnimatedBinding(if p5 then p5.startTime / p6 else 0)
	local var9, var10 = useAnimatedBinding(if p5 then p5.endTime / p6 else 1)
	local var11 = useRef(nil)
	local var12 = useRef(nil)
	local var13 = useRef(nil)
	local var14 = useRef(nil)
	local var15 = useCallback(function()
		-- upvalues: validateRefsModule (copy), var2 (ref), var14 (ref), dragHandleModule (copy), var11 (ref), var7 (ref), p2 (ref)
		if validateRefsModule({ var2 }) and not var14.current then
			assert(var2.current ~= nil, "Left handle ref is nil")
			var14.current = dragHandleModule.LeftHandle
			var11.current = var7:getValue()
			p2(dragHandleModule.LeftHandle)
			
			return
		end
	end, { p2 })
	local var16 = useCallback(function()
		-- upvalues: validateRefsModule (copy), var11 (ref), var2 (ref), var9 (ref), momentsCommonModule (copy), p6 (ref), var8 (ref), reactOtterModule (copy)
		if validateRefsModule({ var11, var2 }) then
			assert(var11.current ~= nil, "Left handle initial position ref is nil")
			assert(var2.current ~= nil, "Left handle ref is nil")
			var8(reactOtterModule.instant(math.clamp(var11.current + var2.current.DragUDim2.X.Scale, 0, var9:getValue() - momentsCommonModule.Constants.MinimumVideoLength / p6)))
			
			return
		end
	end, { p6 })
	local var17 = useCallback(function()
		-- upvalues: var14 (ref), dragHandleModule (copy), p3 (ref), var7 (ref), p6 (ref), var11 (ref), p1 (ref)
		if var14.current == dragHandleModule.LeftHandle then
			p3(var7:getValue() * p6, nil)
			var14.current = nil
			var11.current = nil
			p1()
			
			return
		end
	end, { p1, p3, p6 })
	local var18 = useCallback(function()
		-- upvalues: validateRefsModule (copy), var3 (ref), var14 (ref), dragHandleModule (copy), var12 (ref), var9 (ref), p2 (ref)
		if validateRefsModule({ var3 }) and not var14.current then
			assert(var3.current ~= nil, "Right handle ref is nil")
			var14.current = dragHandleModule.RightHandle
			var12.current = var9:getValue()
			p2(dragHandleModule.RightHandle)
			
			return
		end
	end, { p2 })
	local var19 = useCallback(function()
		-- upvalues: validateRefsModule (copy), var12 (ref), var3 (ref), var7 (ref), momentsCommonModule (copy), p6 (ref), var10 (ref), reactOtterModule (copy)
		if validateRefsModule({ var12, var3 }) then
			assert(var3.current ~= nil, "Right handle ref is nil")
			var10(reactOtterModule.instant(math.clamp(var12.current + var3.current.DragUDim2.X.Scale, var7:getValue() + momentsCommonModule.Constants.MinimumVideoLength / p6, 1)))
			
			return
		end
	end, { p6 })
	local var20 = useCallback(function()
		-- upvalues: var14 (ref), dragHandleModule (copy), p3 (ref), var9 (ref), p6 (ref), var12 (ref), p1 (ref)
		if var14.current == dragHandleModule.RightHandle then
			p3(nil, var9:getValue() * p6)
			var14.current = nil
			var12.current = nil
			p1()
			
			return
		end
	end, { p1, p3, p6 })
	local var21 = useCallback(function()
		-- upvalues: validateRefsModule (copy), var6 (ref), var5 (ref), var14 (ref), dragHandleModule (copy), var13 (ref), p2 (ref)
		if validateRefsModule({ var6, var5 }) and not var14.current then
			assert(var6.current ~= nil, "Scrubber ref is nil")
			assert(var5.current ~= nil, "Scrubber display ref is nil")
			var14.current = dragHandleModule.Scrubber
			var13.current = var5.current.Position.X.Scale
			p2(dragHandleModule.Scrubber)
			
			return
		end
	end, { p2 })
	local var22 = useCallback(function()
		-- upvalues: validateRefsModule (copy), var13 (ref), var6 (ref), p4 (ref)
		if validateRefsModule({ var13, var6 }) then
			assert(var13.current ~= nil, "Scrubber initial position ref is nil")
			assert(var6.current ~= nil, "Scrubber ref is nil")
			p4(math.clamp(var13.current + var6.current.DragUDim2.X.Scale, 0, 1))
			
			return
		end
	end, { p4 })
	local var23 = useCallback(function()
		-- upvalues: var14 (ref), dragHandleModule (copy), var13 (ref), p1 (ref)
		if var14.current == dragHandleModule.Scrubber then
			var14.current = nil
			var13.current = nil
			p1()
			
			return
		end
	end, { p1 })
	local var24 = useCallback(function()
		-- upvalues: validateRefsModule (copy), var4 (ref), var14 (ref), dragHandleModule (copy), var11 (ref), var7 (ref), var12 (ref), var9 (ref), p2 (ref)
		if validateRefsModule({ var4 }) and not var14.current then
			assert(var4.current ~= nil, "Selected outline ref is nil")
			var14.current = dragHandleModule.Segment
			var11.current = var7:getValue()
			var12.current = var9:getValue()
			p2(dragHandleModule.Segment)
			
			return
		end
	end, { p2 })
	local var25 = useCallback(function()
		-- upvalues: validateRefsModule (copy), var4 (ref), var11 (ref), var2 (ref), var12 (ref), var3 (ref), var8 (ref), reactOtterModule (copy), var10 (ref), p3 (ref), p6 (ref)
		if not validateRefsModule({
			var4,
			var11,
			var2,
			var12,
			var3
		}) then return end
		assert(var4.current ~= nil, "Selected outline ref is nil")
		assert(var11.current ~= nil, "Left handle initial position ref is nil")
		assert(var2.current ~= nil, "Left handle ref is nil")
		assert(var12.current ~= nil, "Right handle initial position ref is nil")
		assert(var3.current ~= nil, "Right handle ref is nil")
		local scale = var4.current.DragUDim2.X.Scale
		local current = var11.current
		local current_1 = var12.current
		
		if current <= 0 and current_1 >= 1 then
			return
		end
		local clampedValue = math.clamp(scale, -current, 1 - current_1)
		local var26 = current + clampedValue
		local var27 = current_1 + clampedValue
		var8(reactOtterModule.instant(var26))
		var10(reactOtterModule.instant(var27))
		p3(var26 * p6, var27 * p6)
	end, { p3, p6 })
	local var26 = useCallback(function()
		-- upvalues: var14 (ref), dragHandleModule (copy), var11 (ref), var12 (ref), p1 (ref)
		if var14.current == dragHandleModule.Segment then
			var14.current = nil
			var11.current = nil
			var12.current = nil
			p1()
			
			return
		end
	end, { p1 })
	useEffect(function()
		-- upvalues: value (ref), var2 (ref), var15 (ref), var16 (ref), var17 (ref), var3 (ref), var18 (ref), var19 (ref), var20 (ref), var6 (ref), var21 (ref), var22 (ref), var23 (ref), var4 (ref), var24 (ref), var25 (ref), var26 (ref)
		if not value then return end
		local t = {}
		
		if var2.current then
			table.insert(t, var2.current.DragStart:Connect(var15))
			table.insert(t, var2.current.DragContinue:Connect(var16))
			table.insert(t, var2.current.DragEnd:Connect(var17))
		end
		if var3.current then
			table.insert(t, var3.current.DragStart:Connect(var18))
			table.insert(t, var3.current.DragContinue:Connect(var19))
			table.insert(t, var3.current.DragEnd:Connect(var20))
		end
		if var6.current then
			table.insert(t, var6.current.DragStart:Connect(var21))
			table.insert(t, var6.current.DragContinue:Connect(var22))
			table.insert(t, var6.current.DragEnd:Connect(var23))
		end
		if var4.current then
			table.insert(t, var4.current.DragStart:Connect(var24))
			table.insert(t, var4.current.DragContinue:Connect(var25))
			table.insert(t, var4.current.DragEnd:Connect(var26))
		end
		return function()
			-- upvalues: t (ref)
			for i, v in t do
				v:Disconnect()
			end
		end
	end, {
		value, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24,
		var25, var26
	})
	
	return {
		dragContainerRef = var1,
		leftHandleRef = var2,
		rightHandleRef = var3,
		scrubberDisplayRef = var5,
		scrubberRef = var6,
		segmentRef = var4,
		leftHandlePosition = var7,
		rightHandlePosition = var9
	}
end