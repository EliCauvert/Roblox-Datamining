local reactModule = require(script.Parent.Parent.Parent.Parent.React)

local function calculateBounds(p1, p2, p3)
	local maxValue = math.max(p3, 0)
	maxValue = 0
	local var1 = 0
	local var2 = 0
	
	for i, v in p1 do
		if maxValue <= maxValue then
			var1 = i
		end
		maxValue += v.height
		
		if maxValue <= maxValue then
			var2 = i
		end
		if maxValue + p2 <= maxValue then break end
	end
	return Vector3.new(var1, var2)
end

return function(p4)
	-- upvalues: reactModule (ref), calculateBounds (ref)
	local var3, var4 = reactModule.useState(0)
	local var5, var6 = reactModule.useState(function()
		-- upvalues: calculateBounds (copy), p4 (ref), var3 (ref)
		return calculateBounds(p4.virtualizedItems, var3, 0)
	end)
	local var7 = reactModule.useRef(0)
	local var8 = reactModule.useCallback(function(p5)
		-- upvalues: var7 (ref), var6 (ref), calculateBounds (copy), p4 (ref), var3 (ref)
		if var7.current == p5 then
			return
		end
		var7.current = p5
		var6(calculateBounds(p4.virtualizedItems, var3, p5))
	end, { var3, p4.virtualizedItems })
	reactModule.useEffect(function()
		-- upvalues: p4 (ref), var4 (ref), var8 (ref)
		local current = p4.scrollingFrameRef.current
		
		if current == nil then
			return
		end
		local var9 = current:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function()
			-- upvalues: var4 (copy), current (ref)
			var4(current.AbsoluteWindowSize.Y)
		end)
		local var10 = current:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
			-- upvalues: var8 (copy), current (ref)
			var8(current.CanvasPosition.Y)
		end)
		
		return function()
			-- upvalues: var9 (ref), var10 (ref)
			var9:Disconnect()
			var10:Disconnect()
		end
	end, { var8 })
	local var9 = reactModule.useMemo(function()
		-- upvalues: p4 (ref)
		local var10 = 0
		
		for i, v in p4.virtualizedItems do
			var10 += v.height
		end
		return var10
	end, { p4.virtualizedItems })
	reactModule.useEffect(function()
		-- upvalues: p4 (ref), var9 (ref)
		local current = p4.scrollingFrameRef.current
		
		if current then
			current.CanvasSize = UDim2.new(1, 0, 0, var9)
		end
	end, { var9 })
	reactModule.useLayoutEffect(function()
		-- upvalues: var6 (ref), calculateBounds (copy), p4 (ref), var3 (ref), var7 (ref)
		var6(calculateBounds(p4.virtualizedItems, var3, var7.current))
	end, { var3, p4.virtualizedItems })
	local var11 = reactModule.useCallback(function(p5)
		-- upvalues: p4 (ref)
		local current = p4.scrollingFrameRef.current
		assert(current ~= nil, "VirtualizedList has not been mounted yet")
		local var12 = 0
		
		for i, v in p4.virtualizedItems do
			if v.key ~= p5 then
				var12 += v.height
				continue
			end
			current.CanvasPosition = Vector2.new(0, var12)
			
			return
		end
	end, { p4.virtualizedItems })
	local t = {}
	local var13 = 0
	
	for i = 1, var5.X - 1 do
		local var14 = p4.virtualizedItems[i]
		
		if var14 == nil then break end
		var13 += var14.height
	end
	for i_1 = var5.X, var5.Y do
		local var15 = p4.virtualizedItems[i_1]
		
		if var15 == nil then break end
		t[var15.key] = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.fromOffset(0, var13),
			Size = UDim2.new(1, 0, 0, var15.height)
		}, p4.renderItem(var15))
		var13 += var15.height
	end
	return t, var11
end