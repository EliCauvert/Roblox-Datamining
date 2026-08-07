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

return function(value, p0, p1, p2, p3, p4, p5) --[[ line: 20 | named "useTrimDragController" ]]
	-- upvalues: useRef (ref), useAnimatedBinding (ref), useCallback (ref), validateRefsModule (ref), dragHandleModule (ref), momentsCommonModule (ref), reactOtterModule (ref), useEffect (ref)
	local var6 = useRef(nil)
	local var7 = useRef(nil)
	local var8 = useRef(nil)
	local var9 = useRef(nil)
	local var10 = useRef(nil)
	local var11 = useRef(nil)
	local var12, var13 = useAnimatedBinding(if p4 then p4.startTime / p5 else 0)
	local var14, var15 = useAnimatedBinding(if p4 then p4.endTime / p5 else 1)
	local var16 = useRef(nil)
	local var17 = useRef(nil)
	local var18 = useRef(nil)
	local var19 = useRef(nil)
	local var20 = useCallback(function() --[[ line: 47 ]]
		-- upvalues: validateRefsModule (copy), var7 (ref), var19 (ref), dragHandleModule (copy), var16 (ref), var12 (ref), p1 (ref)
		if validateRefsModule({ var7 }) and not var19.current then
			assert(var7.current ~= nil, "Left handle ref is nil")
			var19.current = dragHandleModule.LeftHandle
			var16.current = var12:getValue()
			p1(dragHandleModule.LeftHandle)
			
			return
		end
	end, { p1 })
	local var21 = useCallback(function() --[[ line: 58 ]]
		-- upvalues: validateRefsModule (copy), var16 (ref), var7 (ref), var14 (ref), momentsCommonModule (copy), p5 (ref), var13 (ref), reactOtterModule (copy)
		if validateRefsModule({ var16, var7 }) then
			assert(var16.current ~= nil, "Left handle initial position ref is nil")
			assert(var7.current ~= nil, "Left handle ref is nil")
			var13(reactOtterModule.instant(math.clamp(var16.current + var7.current.DragUDim2.X.Scale, 0, var14:getValue() - momentsCommonModule.Constants.MinimumVideoLength / p5)))
			
			return
		end
	end, { p5 })
	local var22 = useCallback(function() --[[ line: 75 ]]
		-- upvalues: var19 (ref), dragHandleModule (copy), p2 (ref), var12 (ref), p5 (ref), var16 (ref), p0 (ref)
		if var19.current == dragHandleModule.LeftHandle then
			p2(var12:getValue() * p5, nil)
			var19.current = nil
			var16.current = nil
			p0()
			
			return
		end
	end, { p0, p2, p5 })
	local var23 = useCallback(function() --[[ line: 86 ]]
		-- upvalues: validateRefsModule (copy), var8 (ref), var19 (ref), dragHandleModule (copy), var17 (ref), var14 (ref), p1 (ref)
		if validateRefsModule({ var8 }) and not var19.current then
			assert(var8.current ~= nil, "Right handle ref is nil")
			var19.current = dragHandleModule.RightHandle
			var17.current = var14:getValue()
			p1(dragHandleModule.RightHandle)
			
			return
		end
	end, { p1 })
	local var24 = useCallback(function() --[[ line: 97 ]]
		-- upvalues: validateRefsModule (copy), var17 (ref), var8 (ref), var12 (ref), momentsCommonModule (copy), p5 (ref), var15 (ref), reactOtterModule (copy)
		if validateRefsModule({ var17, var8 }) then
			assert(var8.current ~= nil, "Right handle ref is nil")
			var15(reactOtterModule.instant(math.clamp(var17.current + var8.current.DragUDim2.X.Scale, var12:getValue() + momentsCommonModule.Constants.MinimumVideoLength / p5, 1)))
			
			return
		end
	end, { p5 })
	local var25 = useCallback(function() --[[ line: 113 ]]
		-- upvalues: var19 (ref), dragHandleModule (copy), p2 (ref), var14 (ref), p5 (ref), var17 (ref), p0 (ref)
		if var19.current == dragHandleModule.RightHandle then
			p2(nil, var14:getValue() * p5)
			var19.current = nil
			var17.current = nil
			p0()
			
			return
		end
	end, { p0, p2, p5 })
	local var26 = useCallback(function() --[[ line: 124 ]]
		-- upvalues: validateRefsModule (copy), var11 (ref), var10 (ref), var19 (ref), dragHandleModule (copy), var18 (ref), p1 (ref)
		if validateRefsModule({ var11, var10 }) and not var19.current then
			assert(var11.current ~= nil, "Scrubber ref is nil")
			assert(var10.current ~= nil, "Scrubber display ref is nil")
			var19.current = dragHandleModule.Scrubber
			var18.current = var10.current.Position.X.Scale
			p1(dragHandleModule.Scrubber)
			
			return
		end
	end, { p1 })
	local var27 = useCallback(function() --[[ line: 136 ]]
		-- upvalues: validateRefsModule (copy), var18 (ref), var11 (ref), p3 (ref)
		if validateRefsModule({ var18, var11 }) then
			assert(var18.current ~= nil, "Scrubber initial position ref is nil")
			assert(var11.current ~= nil, "Scrubber ref is nil")
			p3(math.clamp(var18.current + var11.current.DragUDim2.X.Scale, 0, 1))
			
			return
		end
	end, { p3 })
	local var28 = useCallback(function() --[[ line: 149 ]]
		-- upvalues: var19 (ref), dragHandleModule (copy), var18 (ref), p0 (ref)
		if var19.current == dragHandleModule.Scrubber then
			var19.current = nil
			var18.current = nil
			p0()
			
			return
		end
	end, { p0 })
	local var29 = useCallback(function() --[[ line: 159 ]]
		-- upvalues: validateRefsModule (copy), var9 (ref), var19 (ref), dragHandleModule (copy), var16 (ref), var12 (ref), var17 (ref), var14 (ref), p1 (ref)
		if validateRefsModule({ var9 }) and not var19.current then
			assert(var9.current ~= nil, "Selected outline ref is nil")
			var19.current = dragHandleModule.Segment
			var16.current = var12:getValue()
			var17.current = var14:getValue()
			p1(dragHandleModule.Segment)
			
			return
		end
	end, { p1 })
	local var30 = useCallback(function() --[[ line: 171 ]]
		-- upvalues: validateRefsModule (copy), var9 (ref), var16 (ref), var7 (ref), var17 (ref), var8 (ref), var13 (ref), reactOtterModule (copy), var15 (ref), p2 (ref), p5 (ref)
		if not validateRefsModule({
			var9,
			var16,
			var7,
			var17,
			var8
		}) then return end
		assert(var9.current ~= nil, "Selected outline ref is nil")
		assert(var16.current ~= nil, "Left handle initial position ref is nil")
		assert(var7.current ~= nil, "Left handle ref is nil")
		assert(var17.current ~= nil, "Right handle initial position ref is nil")
		assert(var8.current ~= nil, "Right handle ref is nil")
		local scale = var9.current.DragUDim2.X.Scale
		local current = var16.current
		local current_1 = var17.current
		
		if current <= 0 and current_1 >= 1 then
			return
		end
		local clampedValue = math.clamp(scale, -current, 1 - current_1)
		local var33 = current + clampedValue
		local var34 = current_1 + clampedValue
		var13(reactOtterModule.instant(var33))
		var15(reactOtterModule.instant(var34))
		p2(var33 * p5, var34 * p5)
	end, { p2, p5 })
	local var31 = useCallback(function() --[[ line: 209 ]]
		-- upvalues: var19 (ref), dragHandleModule (copy), var16 (ref), var17 (ref), p0 (ref)
		if var19.current == dragHandleModule.Segment then
			var19.current = nil
			var16.current = nil
			var17.current = nil
			p0()
			
			return
		end
	end, { p0 })
	useEffect(function() --[[ line: 220 ]]
		-- upvalues: value (ref), var7 (ref), var20 (ref), var21 (ref), var22 (ref), var8 (ref), var23 (ref), var24 (ref), var25 (ref), var11 (ref), var26 (ref), var27 (ref), var28 (ref), var9 (ref), var29 (ref), var30 (ref), var31 (ref)
		if not value then return end
		local t = {}
		
		if var7.current then
			table.insert(t, var7.current.DragStart:Connect(var20))
			table.insert(t, var7.current.DragContinue:Connect(var21))
			table.insert(t, var7.current.DragEnd:Connect(var22))
		end
		if var8.current then
			table.insert(t, var8.current.DragStart:Connect(var23))
			table.insert(t, var8.current.DragContinue:Connect(var24))
			table.insert(t, var8.current.DragEnd:Connect(var25))
		end
		if var11.current then
			table.insert(t, var11.current.DragStart:Connect(var26))
			table.insert(t, var11.current.DragContinue:Connect(var27))
			table.insert(t, var11.current.DragEnd:Connect(var28))
		end
		if var9.current then
			table.insert(t, var9.current.DragStart:Connect(var29))
			table.insert(t, var9.current.DragContinue:Connect(var30))
			table.insert(t, var9.current.DragEnd:Connect(var31))
		end
		return function() --[[ line: 251 ]]
			-- upvalues: t (ref)
			for i, v in t do
				v:Disconnect()
			end
		end
	end, {
		value, var20, var21, var22, var23, var24, var25, var26, var27, var28, var29,
		var30, var31
	})
	
	return {
		dragContainerRef = var6,
		leftHandleRef = var7,
		rightHandleRef = var8,
		scrubberDisplayRef = var10,
		scrubberRef = var11,
		segmentRef = var9,
		leftHandlePosition = var12,
		rightHandlePosition = var14
	}
end