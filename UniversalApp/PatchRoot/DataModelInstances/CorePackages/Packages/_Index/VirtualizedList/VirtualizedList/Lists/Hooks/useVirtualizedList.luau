local ReactModule = require(script.Parent.Parent.Parent.Parent.React)

local function calculateBounds(VirtualizedItems, p1: number, Current: number): Vector3
	local Largest = math.max(Current, 0)
	local NewHeight = 0
	local X = 0
	local Y = 0
	
	for i, virtualizedItem in VirtualizedItems do
		if NewHeight <= Largest then
			X = i
		end
		NewHeight += virtualizedItem.height
		
		if Largest <= NewHeight then
			Y = i
		end
		if Largest + p1 <= NewHeight then break end
	end
	return (Vector3.new(X, Y))
end

return function(p2)
	-- upvalues: ReactModule (copy), calculateBounds (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(function()
		-- upvalues: calculateBounds (upval), p2 (copy), UseStateResult (copy)
		return (calculateBounds(p2.virtualizedItems, UseStateResult, 0))
	end)
	local UseRefResult = ReactModule.useRef(0)
	local UseResult = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult (copy), UseStateResult2_1 (copy), calculateBounds (upval), p2 (copy), UseStateResult (copy)
		if UseRefResult.current ~= Current then
			UseRefResult.current = Current
			UseStateResult2_1((calculateBounds(p2.virtualizedItems, UseStateResult, Current)))
			
			return
		end
	end, { UseStateResult, p2.virtualizedItems })
	ReactModule.useEffect(function()
		-- upvalues: p2 (copy), UseStateResult2 (copy), UseResult (copy)
		local Current = p2.scrollingFrameRef.current
		
		if Current == nil then return end
		UseStateResult2(Current.AbsoluteWindowSize.Y)
		UseResult(Current.CanvasPosition.Y)
		local Connection = Current:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function()
			-- upvalues: UseStateResult2 (upval), Current (copy)
			UseStateResult2(Current.AbsoluteWindowSize.Y)
		end)
		local Connection1 = Current:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
			-- upvalues: UseResult (upval), Current (copy)
			UseResult(Current.CanvasPosition.Y)
		end)
		
		return function()
			-- upvalues: Connection (copy), Connection1 (copy)
			Connection:Disconnect()
			Connection1:Disconnect()
		end
	end, { UseResult })
	local UseMemoResult = ReactModule.useMemo(function(): number
		-- upvalues: p2 (copy)
		local NewHeight = 0
		
		for _, virtualizedItem in p2.virtualizedItems do
			NewHeight += virtualizedItem.height
		end
		return NewHeight
	end, { p2.virtualizedItems })
	ReactModule.useEffect(function()
		-- upvalues: p2 (copy), UseMemoResult (copy)
		local Current = p2.scrollingFrameRef.current
		
		if Current then
			Current.CanvasSize = UDim2.new(1, 0, 0, UseMemoResult)
		end
	end, { UseMemoResult })
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseStateResult2_1 (copy), calculateBounds (upval), p2 (copy), UseStateResult (copy), UseRefResult (copy)
		UseStateResult2_1((calculateBounds(p2.virtualizedItems, UseStateResult, UseRefResult.current)))
	end, { UseStateResult, p2.virtualizedItems })
	local UseResult1 = ReactModule.useCallback(function(Key)
		-- upvalues: p2 (copy)
		local Current = p2.scrollingFrameRef.current
		assert(Current ~= nil, "VirtualizedList has not been mounted yet")
		local Y = 0
		
		for _, virtualizedItem in p2.virtualizedItems do
			if virtualizedItem.key == Key then
				Current.CanvasPosition = Vector2.new(0, Y)
				break
			end
			Y += virtualizedItem.height
		end
	end, { p2.virtualizedItems })
	local Frames = {}
	local YOffset = 0
	
	for i = 1, UseStateResult1.X - 1 do
		local VirtualizedItem = p2.virtualizedItems[i]
		
		if VirtualizedItem == nil then break end
		YOffset += VirtualizedItem.height
	end
	for i1 = UseStateResult1.X, UseStateResult1.Y do
		local VirtualizedItem = p2.virtualizedItems[i1]
		
		if VirtualizedItem == nil then break end
		Frames[VirtualizedItem.key] = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.fromOffset(0, YOffset),
			Size = UDim2.new(1, 0, 0, VirtualizedItem.height)
		}, p2.renderItem(VirtualizedItem))
		YOffset += VirtualizedItem.height
	end
	return Frames, UseResult1
end