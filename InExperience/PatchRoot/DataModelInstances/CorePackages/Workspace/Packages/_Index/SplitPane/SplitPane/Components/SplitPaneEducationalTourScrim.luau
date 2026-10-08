local parent = script:FindFirstAncestor("SplitPane").Parent
local reactModule = require(parent.React)
local useDeviceInsets = require(parent.Responsive).useDeviceInsets

local function dimPanel(p1, p2, p3)
	-- upvalues: reactModule (ref)
	return reactModule.createElement("TextButton", {
		BackgroundTransparency = 0.5,
		BorderSizePixel = 0,
		Active = true,
		AutoButtonColor = false,
		Selectable = false,
		Text = "",
		Name = p1,
		Position = p2,
		Size = p3,
		BackgroundColor3 = Color3.new(0, 0, 0)
	})
end

local function spotlightRing(p1, p2, p3, p4, p5)
	-- upvalues: reactModule (ref)
	return reactModule.createElement("Frame", {
		Name = "SpotlightRing",
		BackgroundTransparency = 1,
		ZIndex = 2,
		Position = UDim2.fromOffset(p1, p2),
		Size = UDim2.fromOffset(p3 - p1, p4 - p2)
	}, {
		Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p5) }),
		Stroke = reactModule.createElement("UIStroke", {
			Transparency = 0.7,
			Thickness = 1,
			Color = Color3.new(1, 1, 1)
		})
	})
end

local function cornerDim(p1, p2, p3, p4)
	-- upvalues: reactModule (ref)
	return reactModule.createElement("TextButton", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Active = true,
		AutoButtonColor = false,
		Selectable = false,
		Text = "",
		Name = p1,
		Position = p2,
		Size = UDim2.fromOffset(p4, p4)
	}, {
		Mask = reactModule.createElement("ImageLabel", {
			Image = "rbxasset://textures/ui/AvatarExperience/CircleCutoutLargeNoBorder.png",
			ImageTransparency = 0.5,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ImageColor3 = Color3.new(0, 0, 0),
			Position = p3,
			Size = UDim2.fromOffset(p4 * 2, p4 * 2)
		})
	})
end

return function(p1)
	-- upvalues: useDeviceInsets (ref), dimPanel (ref), cornerDim (ref), spotlightRing (ref), reactModule (ref)
	local t
	local var1 = useDeviceInsets()
	local var2 = if p1.targetRect ~= nil then nil else Rect.new(p1.targetRect.Min.X + var1.left, p1.targetRect.Min.Y + var1.top, p1.targetRect.Max.X + var1.left, p1.targetRect.Max.Y + var1.top)
	local _ = nil
	
	if var2 == nil and p1.dimEndX ~= nil then
		t = {
			HomeDim = dimPanel("HomeDim", UDim2.fromScale(0, 0), UDim2.new(0, p1.dimEndX + var1.left, 1, 0))
		}
	elseif var2 == nil then
		t = {
			Dim = dimPanel("Dim", UDim2.fromScale(0, 0), UDim2.fromScale(1, 1))
		}
	else
		local x = var2.Min.X
		local y = var2.Min.Y
		local x_1 = var2.Max.X
		local y_1 = var2.Max.Y
		local var3 = math.min(x_1 - x, y_1 - y) / 2
		t = {
			Top = dimPanel("Top", UDim2.fromOffset(0, 0), UDim2.new(1, 0, 0, y)),
			Bottom = dimPanel("Bottom", UDim2.new(0, 0, 0, y_1), UDim2.new(1, 0, 1, -y_1)),
			Left = dimPanel("Left", UDim2.new(0, 0, 0, y), UDim2.new(0, x, 0, y_1 - y)),
			Right = dimPanel("Right", UDim2.new(0, x_1, 0, y), UDim2.new(1, -x_1, 0, y_1 - y)),
			TopLeftCorner = cornerDim("TopLeftCorner", UDim2.fromOffset(x, y), UDim2.fromOffset(0, 0), var3),
			TopRightCorner = cornerDim("TopRightCorner", UDim2.fromOffset(x_1 - var3, y), UDim2.fromOffset(-var3, 0), var3),
			BottomLeftCorner = cornerDim("BottomLeftCorner", UDim2.fromOffset(x, y_1 - var3), UDim2.fromOffset(0, -var3), var3),
			BottomRightCorner = cornerDim("BottomRightCorner", UDim2.fromOffset(x_1 - var3, y_1 - var3), UDim2.fromOffset(-var3, -var3), var3),
			SpotlightRing = spotlightRing(x, y, x_1, y_1, var3)
		}
	end
	return reactModule.createElement("Frame", {
		Name = "SplitPaneEducationalTourScrim",
		BackgroundTransparency = 1,
		Position = UDim2.fromOffset(-var1.left, -var1.top),
		Size = UDim2.new(1, var1.left + var1.right, 1, var1.top + var1.bottom)
	}, t)
end