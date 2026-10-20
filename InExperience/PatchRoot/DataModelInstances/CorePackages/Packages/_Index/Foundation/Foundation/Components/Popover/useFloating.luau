local Foundation = script:FindFirstAncestor("Foundation")
local _ = require(Foundation.Enums.PopoverAlign)
local _ = require(Foundation.Enums.PopoverSide)
local ReactModule = require(Foundation.Parent.React)
local PositioningModule = require(script.Parent.positioning)
local _ = require(Foundation.Components.Types)

local function useConnectSignals(Frame, PropertyNames, UseRefResult)
	-- upvalues: ReactModule (copy)
	local UseRefResult1 = ReactModule.useRef({})
	ReactModule.useLayoutEffect(function()
		-- upvalues: Frame (copy), PropertyNames (copy), UseRefResult1 (copy), UseRefResult (copy)
		if Frame ~= nil then
			for _, propertyName in PropertyNames do
				UseRefResult1.current[propertyName] = (if typeof(Frame) == "Instance" then Frame:GetPropertyChangedSignal(propertyName) else Frame:GetPropertyChangedSignal(propertyName)):Connect(if type(UseRefResult) == "table" then function()
					-- upvalues: UseRefResult (upval)
					UseRefResult.current()
				end else UseRefResult)
			end
		end
		return function()
			-- upvalues: UseRefResult1 (upval)
			for _, Connection in UseRefResult1.current do
				Connection:Disconnect()
			end
		end
	end, { Frame, UseRefResult })
end

return function(p1, Frame: Frame, Frame1: Frame, Frame2: Frame, p2, Position, p3)
	-- upvalues: ReactModule (copy), PositioningModule (copy), useConnectSignals (copy)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(Vector2.new())
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(true)
	local UseBindingResult3, UseBindingResult2_2 = ReactModule.useBinding(UDim2.new())
	local UseBindingResult4, UseBindingResult2_3 = ReactModule.useBinding(Vector2.new())
	local UseBindingResult5, UseBindingResult2_4 = ReactModule.useBinding(Vector2.new())
	local UseBindingResult6, UseBindingResult2_5 = ReactModule.useBinding(Vector2.new(0, 0))
	local UseRefResult = ReactModule.useRef(function() end)
	local UseRefResult1 = ReactModule.useRef({})
	local UseRefResult2 = ReactModule.useRef(false)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), Frame (copy), Frame1 (copy), Frame2 (copy), UseBindingResult2_1 (copy), PositioningModule (upval), UseRefResult1 (copy), p2 (copy), Position (copy), p3 (copy), UseBindingResult2_2 (copy), UseBindingResult2_3 (copy), UseBindingResult2_4 (copy), UseBindingResult2 (copy), UseBindingResult2_5 (copy)
		if not p1 or not Frame or not Frame1 or not Frame2 then
			UseBindingResult2_1(false)
			
			return
		end
		local AbsolutePosition = Frame.AbsolutePosition
		local AbsoluteSize = Frame1.AbsoluteSize
		local AbsoluteSize1 = Frame2.AbsoluteSize
		local AbsolutePosition1 = Frame2.AbsolutePosition
		local _Rect = Rect.new(AbsolutePosition, AbsolutePosition + Frame.AbsoluteSize)
		local _Rect1 = Rect.new(AbsolutePosition1, AbsolutePosition1 + AbsoluteSize1)
		
		if not PositioningModule.isOnScreen(_Rect, _Rect1) then
			UseBindingResult2_1(false)
			
			return
		end
		local v1: Rect? = nil
		
		for _, Frame3 in UseRefResult1.current do
			local _Rect2 = Rect.new(Frame3.AbsolutePosition, Frame3.AbsolutePosition + Frame3.AbsoluteSize)
			
			if v1 == nil then
				v1 = _Rect2
			else
				v1 = Rect.new(Vector2.new(math.max(v1.Min.X, _Rect2.Min.X), (math.max(v1.Min.Y, _Rect2.Min.Y))), Vector2.new(math.min(v1.Max.X, _Rect2.Max.X), (math.min(v1.Max.Y, _Rect2.Max.Y))))
			end
		end
		if v1 and not PositioningModule.isOnScreen(_Rect, v1) then
			UseBindingResult2_1(false)
			
			return
		end
		local Position1 = if type(p2) == "table" then p2.position else p2
		local Offset = if type(p2) == "table" then p2.offset else 0
		local Position2 = Position
		local Offset1 = 0
		
		if type(Position) == "table" then
			Position2 = Position.position
			Offset1 = Position.offset
		end
		local P9 = p3 or 0
		local Positions, Positions2, Positions3 = PositioningModule.calculatePositions(PositioningModule.calculateSide(Position1, _Rect, _Rect1, (PositioningModule.calculatePopoverBounds(Position1, Offset, Offset1, P9, AbsoluteSize))), Offset, Position2, Offset1, _Rect, _Rect1, P9, AbsoluteSize)
		UseBindingResult2_2(UDim2.fromOffset(AbsoluteSize.X, AbsoluteSize.Y))
		UseBindingResult2_3(AbsoluteSize1)
		UseBindingResult2_4(Positions2 + Positions)
		UseBindingResult2(Positions)
		UseBindingResult2_5(Positions3)
		UseBindingResult2_1(true)
		local _ = Frame1.AbsolutePosition
	end, {
		p1, Frame, Frame1, Frame2, p2, Position, p3
	})
	
	function UseRefResult.current()
		-- upvalues: UseRefResult2 (copy), UseResult (copy)
		if not UseRefResult2.current then
			UseRefResult2.current = true
			task.defer(function()
				-- upvalues: UseRefResult2 (upval), UseResult (upval)
				UseRefResult2.current = false
				UseResult()
			end)
			
			return
		end
	end
	
	useConnectSignals(Frame, { "AbsolutePosition", "AbsoluteSize" }, UseRefResult)
	useConnectSignals(Frame1, { "AbsoluteSize" }, UseRefResult)
	useConnectSignals(Frame2, { "AbsoluteSize" }, UseRefResult)
	ReactModule.useLayoutEffect(function()
		-- upvalues: p1 (copy), Frame (copy), UseRefResult1 (copy), UseRefResult (copy)
		if not p1 then return end
		if typeof(Frame) ~= "Instance" or not Frame:IsA("GuiObject") then return end
		local List = {}
		
		local function rebuild()
			-- upvalues: List (copy), Frame (copy), UseRefResult (upval), UseRefResult1 (copy)
			for _, Connection in List do
				Connection:Disconnect()
			end
			table.clear(List)
			local Current = {}
			local Parent = Frame.Parent
			while Parent and Parent:IsA("GuiObject") do
				if Parent.ClipsDescendants then
					table.insert(Current, Parent)
					table.insert(List, Parent:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
						-- upvalues: UseRefResult (upval)
						UseRefResult.current()
					end))
					table.insert(List, Parent:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
						-- upvalues: UseRefResult (upval)
						UseRefResult.current()
					end))
				end
				Parent = Parent.Parent
			end
			UseRefResult1.current = Current
			
			if #Current > 0 then
				UseRefResult.current()
			end
		end
		
		rebuild()
		local AncestryChangedConnection = Frame.AncestryChanged:Connect(rebuild)
		
		return function()
			-- upvalues: AncestryChangedConnection (copy), List (copy), UseRefResult1 (copy)
			AncestryChangedConnection:Disconnect()
			
			for _, Connection in List do
				Connection:Disconnect()
			end
			UseRefResult1.current = {}
		end
	end, { Frame, p1 })
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseResult (copy)
		UseResult()
	end, { UseResult })
	
	return UseBindingResult, UseBindingResult1, UseBindingResult3, UseBindingResult5, UseBindingResult4, UseBindingResult6
end