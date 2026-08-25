local reactModule = require(script.Parent.Parent.Parent.Parent.React)

local function calculateBounds(p0, p1, p2)
	local maxValue = math.max(p2, 0)
	maxValue = 0
	local var3 = 0
	local var4 = 0
	
	for i, v in p0 do
		if maxValue <= maxValue then
			var3 = i
		end
		maxValue += v.height
		
		if maxValue <= maxValue then
			var4 = i
		end
		if maxValue + p1 <= maxValue then break end
	end
	return Vector3.new(var3, var4)
end

return function(p3)
	-- upvalues: reactModule (ref), calculateBounds (ref)
	local var5, var6 = reactModule.useState(0)
	local var7, var8 = reactModule.useState(function()
		-- upvalues: calculateBounds (copy), p3 (ref), var5 (ref)
		return calculateBounds(p3.virtualizedItems, var5, 0)
	end)
	local var9 = reactModule.useRef(0)
	local var10 = reactModule.useCallback(function(p4)
		-- upvalues: var9 (ref), var8 (ref), calculateBounds (copy), p3 (ref), var5 (ref)
		if var9.current == p4 then
			return
		end
		var9.current = p4
		var8(calculateBounds(p3.virtualizedItems, var5, p4))
	end, { var5, p3.virtualizedItems })
	reactModule.useEffect(function()
		-- upvalues: p3 (ref), var6 (ref), var10 (ref)
		local current = p3.scrollingFrameRef.current
		
		if current == nil then
			return
		end
		local var17 = current:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function()
			-- upvalues: var6 (copy), current (ref)
			var6(current.AbsoluteWindowSize.Y)
		end)
		local var18 = current:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
			-- upvalues: var10 (copy), current (ref)
			var10(current.CanvasPosition.Y)
		end)
		
		return function()
			-- upvalues: var17 (ref), var18 (ref)
			var17:Disconnect()
			var18:Disconnect()
		end
	end, { var10 })
	local var11 = reactModule.useMemo(function()
		-- upvalues: p3 (ref)
		local var19 = 0
		
		for i, v in p3.virtualizedItems do
			var19 += v.height
		end
		return var19
	end, { p3.virtualizedItems })
	reactModule.useEffect(function()
		-- upvalues: p3 (ref), var11 (ref)
		local current = p3.scrollingFrameRef.current
		
		if current then
			current.CanvasSize = UDim2.new(1, 0, 0, var11)
		end
	end, { var11 })
	reactModule.useLayoutEffect(function()
		-- upvalues: var8 (ref), calculateBounds (copy), p3 (ref), var5 (ref), var9 (ref)
		var8(calculateBounds(p3.virtualizedItems, var5, var9.current))
	end, { var5, p3.virtualizedItems })
	local var12 = reactModule.useCallback(function(p5)
		-- upvalues: p3 (ref)
		local current = p3.scrollingFrameRef.current
		assert(current ~= nil, "VirtualizedList has not been mounted yet")
		local var20 = 0
		
		for i, v in p3.virtualizedItems do
			if v.key ~= p5 then
				var20 += v.height
				continue
			end
			current.CanvasPosition = Vector2.new(0, var20)
			
			return
		end
	end, { p3.virtualizedItems })
	local t = {}
	local var14 = 0
	
	for i = 1, var7.X - 1 do
		local var15 = p3.virtualizedItems[i]
		
		if var15 == nil then break end
		var14 += var15.height
	end
	for i_1 = var7.X, var7.Y do
		local var16 = p3.virtualizedItems[i_1]
		
		if var16 == nil then break end
		t[var16.key] = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.fromOffset(0, var14),
			Size = UDim2.new(1, 0, 0, var16.height)
		}, p3.renderItem(var16))
		var14 += var16.height
	end
	return t, var12
end