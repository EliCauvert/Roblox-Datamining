local parent = script:FindFirstAncestor("BuildExperience").Parent
local reactModule = require(parent.React)
local view = require(parent.Foundation).View

local function renderPanel(p1, p2, p3, p4, p5)
	-- upvalues: reactModule (ref), view (ref)
	local var1 = if p1 == "Top" then UDim2.fromScale(1, 1) else UDim2.new()
	
	return reactModule.createElement(view, {
		Position = if p2 ~= nil then nil else p2:map(function(p6)
			-- upvalues: p4 (ref)
			return if p6 == nil then UDim2.new() else p4(p6)
		end),
		Size = if p2 ~= nil then var1 else p2:map(function(p6)
			-- upvalues: p5 (ref), var1 (ref)
			return if p6 == nil then var1 else p5(p6)
		end),
		backgroundStyle = { Transparency = 0, Color3 = p3 },
		testId = `Library.WorldBackdrop.{p1}`
	})
end

return function(p1)
	-- upvalues: reactModule (ref), view (ref), renderPanel (ref)
	local hole = p1.hole
	local var1 = p1.progress:map(function(p2)
		-- upvalues: p1 (ref)
		return p1.cornerRadius * (1 - math.clamp(p2, 0, 1))
	end)
	
	return reactModule.createElement(view, {
		tag = "size-full clip",
		testId = "Library.WorldBackdrop",
		Visible = p1.Visible,
		ZIndex = p1.ZIndex,
		GroupTransparency = p1.transparency
	}, {
		Top = renderPanel("Top", hole, p1.color, function()
			return UDim2.new()
		end, function(p2)
			return UDim2.new(1, 0, 0, math.max(0, p2.Min.Y))
		end),
		Bottom = renderPanel("Bottom", hole, p1.color, function(p2)
			return UDim2.fromOffset(0, p2.Max.Y)
		end, function(p2)
			return UDim2.new(1, 0, 1, math.max(0, -p2.Max.Y))
		end),
		Left = renderPanel("Left", hole, p1.color, function(p2)
			return UDim2.fromOffset(0, p2.Min.Y)
		end, function(p2)
			return UDim2.fromOffset(math.max(0, p2.Min.X), math.max(0, p2.Height))
		end),
		Right = renderPanel("Right", hole, p1.color, function(p2)
			return UDim2.fromOffset(p2.Max.X, p2.Min.Y)
		end, function(p2)
			return UDim2.new(1, math.max(0, -p2.Max.X), 0, math.max(0, p2.Height))
		end),
		Corners = if hole ~= nil then nil else reactModule.createElement(view, {
			testId = "Library.WorldBackdrop.Corners",
			Visible = hole:map(function(p2)
				return p2 ~= nil
			end),
			Position = hole:map(function(p2)
				return if p2 == nil then UDim2.new() else UDim2.fromOffset(p2.Min.X, p2.Min.Y)
			end),
			Size = hole:map(function(p2)
				return if p2 == nil then UDim2.new() else UDim2.fromOffset(p2.Width, p2.Height)
			end),
			backgroundStyle = { Transparency = 1 },
			cornerRadius = var1:map(function(p2)
				return UDim.new(0, p2)
			end),
			stroke = {
				Transparency = 0,
				Color = p1.color,
				Thickness = var1,
				BorderStrokePosition = Enum.BorderStrokePosition.Outer
			}
		})
	})
end