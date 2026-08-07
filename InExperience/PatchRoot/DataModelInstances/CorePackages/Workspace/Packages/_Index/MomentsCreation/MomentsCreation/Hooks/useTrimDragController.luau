local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local reactModule = require(parent.React)
local useBinding = reactModule.useBinding
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local useRef = reactModule.useRef
local validateRefsModule = require(momentsCreation.Utils.validateRefs)
local dragHandleModule = require(momentsCreation.Enums.DragHandle)
local _ = require(parent.MomentsTypes)

local function _(p0, p1, p2) --[[ line: 38 | named "initialFraction" ]]
	return if p0 == nil or p1 <= 0 then p2 else p0 / p1
end

return function(value, p3, p4, p5, p6, p7, p8, p9) --[[ line: 45 | named "useTrimDragController" ]]
	-- upvalues: useRef (ref), useBinding (ref), useCallback (ref), validateRefsModule (ref), dragHandleModule (ref), useEffect (ref)
	local var4 = useRef(nil)
	local var5 = useRef(nil)
	local var6 = useRef(nil)
	local var7 = useRef(nil)
	local var8 = useRef(nil)
	local var9 = useRef(nil)
	local var10 = if p7 then p7.startTime else nil
	local var11 = if var10 == nil or p8 <= 0 then 0 else var10 / p8
	var12, var11 = useBinding(var11)
	local var13 = if p7 then p7.endTime else nil
	local var14 = if var13 == nil or p8 <= 0 then 1 else var13 / p8
	var10, var14 = useBinding(var14)
	var13 = useRef(nil)
	local var15 = useRef(nil)
	local var16 = useRef(nil)
	local var17 = useRef(nil)
	local var18 = if p8 > 0 then 1 / p8 else 0
	local var19 = useCallback(function() --[[ line: 78 ]]
		-- upvalues: validateRefsModule (copy), var5 (ref), var17 (ref), dragHandleModule (copy), var13 (ref), var12 (ref), p4 (ref)
		if validateRefsModule({ var5 }) and not var17.current then
			var17.current = dragHandleModule.LeftHandle
			var13.current = var12:getValue()
			p4(dragHandleModule.LeftHandle)
			
			return
		end
	end, { p4 })
	local var20 = useCallback(function() --[[ line: 87 ]]
		-- upvalues: validateRefsModule (copy), var13 (ref), var5 (ref), var10 (ref), var18 (ref), var11 (ref), p9 (ref), dragHandleModule (copy)
		if not validateRefsModule({ var13, var5 }) then return end
		local clampedValue = math.clamp(var13.current + var5.current.DragUDim2.X.Scale, 0, var10:getValue() - var18)
		var11(clampedValue)
		
		if p9 then
			p9(dragHandleModule.LeftHandle, clampedValue, var10:getValue())
		end
	end, { var18, p9 })
	local var21 = useCallback(function() --[[ line: 102 ]]
		-- upvalues: var17 (ref), dragHandleModule (copy), p5 (ref), var12 (ref), p8 (ref), var13 (ref), p3 (ref)
		if var17.current == dragHandleModule.LeftHandle then
			p5(var12:getValue() * p8, nil)
			var17.current = nil
			var13.current = nil
			p3()
			
			return
		end
	end, { p3, p5, p8 })
	local var22 = useCallback(function() --[[ line: 112 ]]
		-- upvalues: validateRefsModule (copy), var6 (ref), var17 (ref), dragHandleModule (copy), var15 (ref), var10 (ref), p4 (ref)
		if validateRefsModule({ var6 }) and not var17.current then
			var17.current = dragHandleModule.RightHandle
			var15.current = var10:getValue()
			p4(dragHandleModule.RightHandle)
			
			return
		end
	end, { p4 })
	local var23 = useCallback(function() --[[ line: 121 ]]
		-- upvalues: validateRefsModule (copy), var15 (ref), var6 (ref), var12 (ref), var18 (ref), var14 (ref), p9 (ref), dragHandleModule (copy)
		if not validateRefsModule({ var15, var6 }) then return end
		local clampedValue = math.clamp(var15.current + var6.current.DragUDim2.X.Scale, var12:getValue() + var18, 1)
		var14(clampedValue)
		
		if p9 then
			p9(dragHandleModule.RightHandle, var12:getValue(), clampedValue)
		end
	end, { var18, p9 })
	local var24 = useCallback(function() --[[ line: 135 ]]
		-- upvalues: var17 (ref), dragHandleModule (copy), p5 (ref), var10 (ref), p8 (ref), var15 (ref), p3 (ref)
		if var17.current == dragHandleModule.RightHandle then
			p5(nil, var10:getValue() * p8)
			var17.current = nil
			var15.current = nil
			p3()
			
			return
		end
	end, { p3, p5, p8 })
	local var25 = useCallback(function() --[[ line: 145 ]]
		-- upvalues: validateRefsModule (copy), var9 (ref), var8 (ref), var17 (ref), dragHandleModule (copy), var16 (ref), p4 (ref)
		if validateRefsModule({ var9, var8 }) and not var17.current then
			var17.current = dragHandleModule.Scrubber
			var16.current = var8.current.Position.X.Scale
			p4(dragHandleModule.Scrubber)
			
			return
		end
	end, { p4 })
	local var26 = useCallback(function() --[[ line: 154 ]]
		-- upvalues: validateRefsModule (copy), var16 (ref), var9 (ref), p6 (ref)
		if validateRefsModule({ var16, var9 }) then
			p6(math.clamp(var16.current + var9.current.DragUDim2.X.Scale, 0, 1))
			
			return
		end
	end, { p6 })
	local var27 = useCallback(function() --[[ line: 164 ]]
		-- upvalues: var17 (ref), dragHandleModule (copy), var16 (ref), p3 (ref)
		if var17.current == dragHandleModule.Scrubber then
			var17.current = nil
			var16.current = nil
			p3()
			
			return
		end
	end, { p3 })
	local var28 = useCallback(function() --[[ line: 173 ]]
		-- upvalues: validateRefsModule (copy), var7 (ref), var17 (ref), dragHandleModule (copy), var13 (ref), var12 (ref), var15 (ref), var10 (ref), p4 (ref)
		if validateRefsModule({ var7 }) and not var17.current then
			var17.current = dragHandleModule.Segment
			var13.current = var12:getValue()
			var15.current = var10:getValue()
			p4(dragHandleModule.Segment)
			
			return
		end
	end, { p4 })
	local var29 = useCallback(function() --[[ line: 183 ]]
		-- upvalues: validateRefsModule (copy), var7 (ref), var13 (ref), var5 (ref), var15 (ref), var6 (ref), var11 (ref), var14 (ref), p5 (ref), p8 (ref)
		if not validateRefsModule({
			var7,
			var13,
			var5,
			var15,
			var6
		}) then return end
		local scale = var7.current.DragUDim2.X.Scale
		local current = var13.current
		local current_1 = var15.current
		
		if current <= 0 and current_1 >= 1 then
			return
		end
		local clampedValue = math.clamp(scale, -current, 1 - current_1)
		local var34 = current + clampedValue
		local var35 = current_1 + clampedValue
		var11(var34)
		var14(var35)
		p5(var34 * p8, var35 * p8)
	end, { p5, p8 })
	local var30 = useCallback(function() --[[ line: 214 ]]
		-- upvalues: var17 (ref), dragHandleModule (copy), var13 (ref), var15 (ref), p3 (ref)
		if var17.current == dragHandleModule.Segment then
			var17.current = nil
			var13.current = nil
			var15.current = nil
			p3()
			
			return
		end
	end, { p3 })
	useEffect(function() --[[ line: 225 ]]
		-- upvalues: value (ref), var5 (ref), var19 (ref), var20 (ref), var21 (ref), var6 (ref), var22 (ref), var23 (ref), var24 (ref), var9 (ref), var25 (ref), var26 (ref), var27 (ref), var7 (ref), var28 (ref), var29 (ref), var30 (ref)
		if not value then return end
		local t = {}
		
		if var5.current then
			table.insert(t, var5.current.DragStart:Connect(var19))
			table.insert(t, var5.current.DragContinue:Connect(var20))
			table.insert(t, var5.current.DragEnd:Connect(var21))
		end
		if var6.current then
			table.insert(t, var6.current.DragStart:Connect(var22))
			table.insert(t, var6.current.DragContinue:Connect(var23))
			table.insert(t, var6.current.DragEnd:Connect(var24))
		end
		if var9.current then
			table.insert(t, var9.current.DragStart:Connect(var25))
			table.insert(t, var9.current.DragContinue:Connect(var26))
			table.insert(t, var9.current.DragEnd:Connect(var27))
		end
		if var7.current then
			table.insert(t, var7.current.DragStart:Connect(var28))
			table.insert(t, var7.current.DragContinue:Connect(var29))
			table.insert(t, var7.current.DragEnd:Connect(var30))
		end
		return function() --[[ line: 256 ]]
			-- upvalues: t (ref)
			for i, v in t do
				v:Disconnect()
			end
		end
	end, {
		value, var19, var20, var21, var22, var23, var24, var25, var26, var27, var28,
		var29, var30
	})
	
	return {
		dragContainerRef = var4,
		leftHandleRef = var5,
		rightHandleRef = var6,
		scrubberDisplayRef = var8,
		scrubberRef = var9,
		segmentRef = var7,
		leftHandlePosition = var12,
		rightHandlePosition = var10
	}
end