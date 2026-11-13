local AmbientModule = require("./ambient")
local _ = require("../vendor/compose/core")
local _ = require("./engine_types")

return function(p1, p2, p3, Object, p4, p5)
	-- upvalues: AmbientModule (copy)
	if Object == nil then
		return p4
	end
	local P5 = p5 or {}
	local Constructors = p2.constructors
	local _UDim2 = p3.UDim2
	local Config = if P5.immediate or not AmbientModule() then nil else { frame = true }
	local Config1 = if Config then { frame = true, poll = true } else nil
	
	if Object:FindFirstChildWhichIsA("UIPadding") == nil then
		p2.mount(function()
			-- upvalues: Constructors (copy)
			return Constructors.UIPadding({})
		end, Object)
	end
	local v1 = Constructors.Frame(p4.Name .. "Bounds")({
		Size = _UDim2.fromOffset(0, 0),
		AnchorPoint = p3.Vector2.new(1, 1),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = false,
		ZIndex = p4.ZIndex,
		p4
	})
	local v2 = Constructors.Frame(p4.Name .. "Boundary")({
		Size = _UDim2.fromOffset(1, 1),
		Position = _UDim2.fromScale(1, 1),
		AnchorPoint = p3.Vector2.new(1, 1),
		AutomaticSize = p3.Enum.AutomaticSize.None,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = false,
		ZIndex = p4.ZIndex,
		v1
	})
	local AbsoluteSize = p2.observe(v2, "AbsoluteSize", Config1)
	local AbsoluteSize1 = p2.observe(Object, "AbsoluteSize", Config1)
	local AbsolutePosition = p2.observe(Object, "AbsolutePosition", Config)
	local AbsoluteRotation = p2.observe(Object, "AbsoluteRotation", Config)
	local AbsolutePosition1 = p2.observe(v2, "AbsolutePosition", Config)
	local CellResult = p1.cell({})
	local CellResult1 = p1.cell(Object:FindFirstChildWhichIsA("UIPadding"))
	
	local function childChanged(UIPadding)
		-- upvalues: CellResult1 (copy), Object (copy)
		if UIPadding:IsA("UIPadding") then
			CellResult1:set(Object:FindFirstChildWhichIsA("UIPadding"))
		end
	end
	
	p2.connect(Object, "ChildAdded", childChanged)
	p2.connect(Object, "ChildRemoved", childChanged)
	p1.watch(function(Callback)
		-- upvalues: CellResult1 (copy), CellResult (copy), p2 (copy)
		local CallbackResult = Callback(CellResult1)
		
		if CallbackResult == nil then
			CellResult:set({})
			
			return
		else
			local function refresh()
				-- upvalues: CallbackResult (copy), CellResult (upval)
				local t = {}
				
				for _, value in { "Left", "Right", "Top", "Bottom" } do
					t[value] = CallbackResult:GetStyled("Padding" .. value)
				end
				CellResult:set(t)
			end
			
			p2.connect(CallbackResult, "StyledPropertiesChanged", refresh)
			p2.connect(CallbackResult, "Changed", refresh)
			refresh()
		end
	end)
	local FormulaResult = p1.formula(function(Callback)
		-- upvalues: AbsoluteSize1 (copy), AbsoluteSize (copy), CellResult (copy), p3 (copy), AbsolutePosition (copy), AbsolutePosition1 (copy), AbsoluteRotation (copy), P5 (copy)
		local CallbackResult: number = Callback(AbsoluteSize1)
		local CallbackResult1: number = Callback(AbsoluteSize)
		local CallbackResult2 = Callback(CellResult)
		
		if CallbackResult1.X <= 0 or CallbackResult1.Y <= 0 then
			return { x = 0, y = 0, width = 0, height = 0 }
		else
			local NewResult = p3.Vector2.new(CallbackResult.X / CallbackResult1.X, CallbackResult.Y / CallbackResult1.Y)
			local CallbackResultDelta = Callback(AbsolutePosition) + CallbackResult / 2 - Callback(AbsolutePosition1) - CallbackResult1 / 2
			local Radians = math.rad((Callback(AbsoluteRotation)))
			local Cosine = math.cos(Radians)
			local Sine = math.sin(Radians)
			local NewResult1 = p3.Vector2.new((CallbackResultDelta.X * Cosine + CallbackResultDelta.Y * Sine) / CallbackResult1.X - NewResult.X / 2 + 0.5, (CallbackResultDelta.Y * Cosine - CallbackResultDelta.X * Sine) / CallbackResult1.Y - NewResult.Y / 2 + 0.5)
			
			local function _(p6, p7)
				-- upvalues: CallbackResult2 (copy)
				local CallbackResultEntry = CallbackResult2[p6]
				
				return if CallbackResultEntry then CallbackResultEntry.Scale * p7 + CallbackResultEntry.Offset else 0
			end
			
			local X = NewResult.X
			local Left = CallbackResult2.Left
			local NewScale = if Left then Left.Scale * X + Left.Offset else 0
			local Y = NewResult.Y
			local Top = CallbackResult2.Top
			local NewScale1 = if Top then Top.Scale * Y + Top.Offset else 0
			local X1 = NewResult.X
			local Right = CallbackResult2.Right
			local NewScale2 = if Right then Right.Scale * X1 + Right.Offset else 0
			local Y1 = NewResult.Y
			local Bottom = CallbackResult2.Bottom
			local NewScale3 = if Bottom then Bottom.Scale * Y1 + Bottom.Offset else 0
			
			return if P5.inset then {
				x = NewResult1.X + NewResult.X - NewScale2,
				y = NewResult1.Y + NewResult.Y - NewScale3,
				width = math.max(0, NewResult.X - NewScale - NewScale2),
				height = math.max(0, NewResult.Y - NewScale1 - NewScale3)
			} else {
				x = NewResult1.X + NewResult.X,
				y = NewResult1.Y + NewResult.Y,
				width = NewResult.X,
				height = NewResult.Y
			}
		end
	end)
	
	if Object:IsA("ScrollingFrame") then
		local CanvasPosition = p2.observe(Object, "CanvasPosition")
		p2.decorate(v2, {
			Position = function(Callback)
				-- upvalues: AbsoluteSize1 (copy), AbsoluteSize (copy), CanvasPosition (copy), CellResult (copy), _UDim2 (copy)
				local CallbackResult = Callback(AbsoluteSize1)
				local CallbackResult1 = Callback(AbsoluteSize)
				local CallbackResult2 = Callback(CanvasPosition)
				local CallbackResult3 = Callback(CellResult)
				
				if CallbackResult1.X <= 0 or CallbackResult1.Y <= 0 then
					return _UDim2.fromScale(1, 1)
				else
					local XRatio = CallbackResult.X / CallbackResult1.X
					local YRatio = CallbackResult.Y / CallbackResult1.Y
					
					local function _(p6, p7)
						-- upvalues: CallbackResult3 (copy)
						local CallbackResultEntry = CallbackResult3[p6]
						
						return if CallbackResultEntry then CallbackResultEntry.Scale * p7 + CallbackResultEntry.Offset else 0
					end
					
					local Left = CallbackResult3.Left
					local Right = CallbackResult3.Right
					local Top = CallbackResult3.Top
					local Bottom = CallbackResult3.Bottom
					
					return _UDim2.fromOffset(CallbackResult2.X + XRatio - (if Left then Left.Scale * XRatio + Left.Offset else 0) - (if Right then Right.Scale * XRatio + Right.Offset else 0), CallbackResult2.Y + YRatio - (if Top then Top.Scale * YRatio + Top.Offset else 0) - (if Bottom then Bottom.Scale * YRatio + Bottom.Offset else 0))
				end
			end
		})
	end
	p2.decorate(v1, {
		Size = function(Callback)
			-- upvalues: FormulaResult (copy), P5 (copy), _UDim2 (copy)
			local CallbackResult = Callback(FormulaResult)
			
			return if P5.inset then _UDim2.fromOffset(math.ceil(CallbackResult.width - 0.001), (math.ceil(CallbackResult.height - 0.001))) else _UDim2.fromOffset(CallbackResult.width, CallbackResult.height)
		end,
		Position = function(Callback)
			-- upvalues: FormulaResult (copy), _UDim2 (copy)
			local CallbackResult = Callback(FormulaResult)
			
			return _UDim2.fromOffset(CallbackResult.x, CallbackResult.y)
		end
	})
	
	return v2
end