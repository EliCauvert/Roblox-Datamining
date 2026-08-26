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

local function _(p1, p2, p3)
	return if p1 == nil or p2 <= 0 then p3 else p1 / p2
end

return function(value, p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: useRef (ref), useBinding (ref), useCallback (ref), validateRefsModule (ref), dragHandleModule (ref), useEffect (ref)
	local var1 = useRef(nil)
	local var2 = useRef(nil)
	local var3 = useRef(nil)
	local var4 = useRef(nil)
	local var5 = useRef(nil)
	local var6 = useRef(nil)
	local var7 = if p5 then p5.startTime else nil
	local var8 = if var7 == nil or p6 <= 0 then 0 else var7 / p6
	var12, var11 = useBinding(var8)
	local var9 = if p5 then p5.endTime else nil
	local var10 = if var9 == nil or p6 <= 0 then 1 else var9 / p6
	var7, var14 = useBinding(var10)
	var9 = useRef(nil)
	local var11 = useRef(nil)
	local var12 = useRef(nil)
	local var13 = useRef(nil)
	local var14 = if p6 > 0 then 1 / p6 else 0
	local var15 = useCallback(function()
		-- upvalues: validateRefsModule (copy), var2 (ref), var13 (ref), dragHandleModule (copy), var9 (ref), var12 (ref), p2 (ref)
		if validateRefsModule({ var2 }) and not var13.current then
			var13.current = dragHandleModule.LeftHandle
			var9.current = var12:getValue()
			p2(dragHandleModule.LeftHandle)
			
			return
		end
	end, { p2 })
	local var16 = useCallback(function()
		-- upvalues: validateRefsModule (copy), var9 (ref), var2 (ref), var7 (ref), var14 (ref), var8 (ref), p7 (ref), dragHandleModule (copy)
		if not validateRefsModule({ var9, var2 }) then return end
		local clampedValue = math.clamp(var9.current + var2.current.DragUDim2.X.Scale, 0, var7:getValue() - var14)
		var8(clampedValue)
		
		if p7 then
			p7(dragHandleModule.LeftHandle, clampedValue, var7:getValue())
		end
	end, { var14, p7 })
	local var17 = useCallback(function()
		-- upvalues: var13 (ref), dragHandleModule (copy), p3 (ref), var12 (ref), p6 (ref), var9 (ref), p1 (ref)
		if var13.current == dragHandleModule.LeftHandle then
			p3(var12:getValue() * p6, nil)
			var13.current = nil
			var9.current = nil
			p1()
			
			return
		end
	end, { p1, p3, p6 })
	local var18 = useCallback(function()
		-- upvalues: validateRefsModule (copy), var3 (ref), var13 (ref), dragHandleModule (copy), var11 (ref), var7 (ref), p2 (ref)
		if validateRefsModule({ var3 }) and not var13.current then
			var13.current = dragHandleModule.RightHandle
			var11.current = var7:getValue()
			p2(dragHandleModule.RightHandle)
			
			return
		end
	end, { p2 })
	local var19 = useCallback(function()
		-- upvalues: validateRefsModule (copy), var11 (ref), var3 (ref), var12 (ref), var14 (ref), var10 (ref), p7 (ref), dragHandleModule (copy)
		if not validateRefsModule({ var11, var3 }) then return end
		local clampedValue = math.clamp(var11.current + var3.current.DragUDim2.X.Scale, var12:getValue() + var14, 1)
		var10(clampedValue)
		
		if p7 then
			p7(dragHandleModule.RightHandle, var12:getValue(), clampedValue)
		end
	end, { var14, p7 })
	local var20 = useCallback(function()
		-- upvalues: var13 (ref), dragHandleModule (copy), p3 (ref), var7 (ref), p6 (ref), var11 (ref), p1 (ref)
		if var13.current == dragHandleModule.RightHandle then
			p3(nil, var7:getValue() * p6)
			var13.current = nil
			var11.current = nil
			p1()
			
			return
		end
	end, { p1, p3, p6 })
	local var21 = useCallback(function()
		-- upvalues: validateRefsModule (copy), var6 (ref), var5 (ref), var13 (ref), dragHandleModule (copy), var12 (ref), p2 (ref)
		if validateRefsModule({ var6, var5 }) and not var13.current then
			var13.current = dragHandleModule.Scrubber
			var12.current = var5.current.Position.X.Scale
			p2(dragHandleModule.Scrubber)
			
			return
		end
	end, { p2 })
	local var22 = useCallback(function()
		-- upvalues: validateRefsModule (copy), var12 (ref), var6 (ref), p4 (ref)
		if validateRefsModule({ var12, var6 }) then
			p4(math.clamp(var12.current + var6.current.DragUDim2.X.Scale, 0, 1))
			
			return
		end
	end, { p4 })
	local var23 = useCallback(function()
		-- upvalues: var13 (ref), dragHandleModule (copy), var12 (ref), p1 (ref)
		if var13.current == dragHandleModule.Scrubber then
			var13.current = nil
			var12.current = nil
			p1()
			
			return
		end
	end, { p1 })
	local var24 = useCallback(function()
		-- upvalues: validateRefsModule (copy), var4 (ref), var13 (ref), dragHandleModule (copy), var9 (ref), var12 (ref), var11 (ref), var7 (ref), p2 (ref)
		if validateRefsModule({ var4 }) and not var13.current then
			var13.current = dragHandleModule.Segment
			var9.current = var12:getValue()
			var11.current = var7:getValue()
			p2(dragHandleModule.Segment)
			
			return
		end
	end, { p2 })
	local var25 = useCallback(function()
		-- upvalues: validateRefsModule (copy), var4 (ref), var9 (ref), var2 (ref), var11 (ref), var3 (ref), var8 (ref), var10 (ref), p3 (ref), p6 (ref)
		if not validateRefsModule({
			var4,
			var9,
			var2,
			var11,
			var3
		}) then return end
		local scale = var4.current.DragUDim2.X.Scale
		local current = var9.current
		local current_1 = var11.current
		
		if current <= 0 and current_1 >= 1 then
			return
		end
		local clampedValue = math.clamp(scale, -current, 1 - current_1)
		local var26 = current + clampedValue
		local var27 = current_1 + clampedValue
		var8(var26)
		var10(var27)
		p3(var26 * p6, var27 * p6)
	end, { p3, p6 })
	local var26 = useCallback(function()
		-- upvalues: var13 (ref), dragHandleModule (copy), var9 (ref), var11 (ref), p1 (ref)
		if var13.current == dragHandleModule.Segment then
			var13.current = nil
			var9.current = nil
			var11.current = nil
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
		leftHandlePosition = var12,
		rightHandlePosition = var7
	}
end