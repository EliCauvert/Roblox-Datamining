local Parent = script:FindFirstAncestor("BuildExperience").Parent
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View

local function renderPanel(p1, Hole, Color, Callback, Callback1) --[[ Line: 19 ]]
	-- upvalues: ReactModule (copy), View (copy)
	local _UDim2: UDim2 = if p1 == "Top" then UDim2.fromScale(1, 1) else UDim2.new()
	
	return ReactModule.createElement(View, {
		Position = if Hole == nil then nil else Hole:map(function(p2) --[[ Line: 29 ]]
			-- upvalues: Callback (copy)
			return if p2 == nil then UDim2.new() else Callback(p2)
		end),
		Size = if Hole == nil then _UDim2 else Hole:map(function(p2) --[[ Line: 34 ]]
			-- upvalues: Callback1 (copy), _UDim2 (copy)
			return if p2 == nil then _UDim2 else Callback1(p2)
		end),
		backgroundStyle = { Transparency = 0, Color3 = Color },
		testId = `Library.WorldBackdrop.{p1}`
	})
end

return function(p1) --[[ Line: 46 | Named "LibraryWorldBackdropView" ]]
	-- upvalues: ReactModule (copy), View (copy), renderPanel (copy)
	local Hole = p1.hole
	local MapResult = p1.progress:map(function(Value: number) --[[ Line: 48 ]]
		-- upvalues: p1 (copy)
		return p1.cornerRadius * (1 - math.clamp(Value, 0, 1))
	end)
	
	return ReactModule.createElement(View, {
		tag = "size-full clip",
		testId = "Library.WorldBackdrop",
		Visible = p1.Visible,
		ZIndex = p1.ZIndex,
		GroupTransparency = p1.transparency
	}, {
		Top = renderPanel("Top", Hole, p1.color, function(): UDim2 --[[ Line: 58 ]]
			return UDim2.new()
		end, function(p2): UDim2 --[[ Line: 60 ]]
			return UDim2.new(1, 0, 0, (math.max(0, p2.Min.Y)))
		end),
		Bottom = renderPanel("Bottom", Hole, p1.color, function(p2): UDim2 --[[ Line: 63 ]]
			return UDim2.fromOffset(0, p2.Max.Y)
		end, function(p2): UDim2 --[[ Line: 65 ]]
			return UDim2.new(1, 0, 1, (math.max(0, -p2.Max.Y)))
		end),
		Left = renderPanel("Left", Hole, p1.color, function(p2): UDim2 --[[ Line: 68 ]]
			return UDim2.fromOffset(0, p2.Min.Y)
		end, function(p2): UDim2 --[[ Line: 70 ]]
			return UDim2.fromOffset(math.max(0, p2.Min.X), (math.max(0, p2.Height)))
		end),
		Right = renderPanel("Right", Hole, p1.color, function(p2): UDim2 --[[ Line: 73 ]]
			return UDim2.fromOffset(p2.Max.X, p2.Min.Y)
		end, function(p2): UDim2 --[[ Line: 75 ]]
			return UDim2.new(1, math.max(0, -p2.Max.X), 0, (math.max(0, p2.Height)))
		end),
		Corners = if Hole == nil then nil else ReactModule.createElement(View, {
			testId = "Library.WorldBackdrop.Corners",
			Visible = Hole:map(function(p2): boolean --[[ Line: 80 ]]
				return p2 ~= nil
			end),
			Position = Hole:map(function(p2): UDim2 --[[ Line: 83 ]]
				return if p2 == nil then UDim2.new() else UDim2.fromOffset(p2.Min.X, p2.Min.Y)
			end),
			Size = Hole:map(function(p2): UDim2 --[[ Line: 86 ]]
				return if p2 == nil then UDim2.new() else UDim2.fromOffset(p2.Width, p2.Height)
			end),
			backgroundStyle = { Transparency = 1 },
			cornerRadius = MapResult:map(function(Offset): UDim --[[ Line: 90 ]]
				return UDim.new(0, Offset)
			end),
			stroke = {
				Transparency = 0,
				Color = p1.color,
				Thickness = MapResult,
				BorderStrokePosition = Enum.BorderStrokePosition.Outer
			}
		})
	})
end