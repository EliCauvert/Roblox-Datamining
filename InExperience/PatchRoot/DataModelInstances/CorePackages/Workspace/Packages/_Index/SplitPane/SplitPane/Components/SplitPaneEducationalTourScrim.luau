local Parent = script:FindFirstAncestor("SplitPane").Parent
local ReactModule = require(Parent.React)
local UseDeviceInsetsFunction = require(Parent.Responsive).useDeviceInsets

local function dimPanel(Name, Position, Size, p1)
	-- upvalues: ReactModule (copy)
	return ReactModule.createElement("TextButton", {
		BorderSizePixel = 0,
		Active = true,
		AutoButtonColor = false,
		Selectable = false,
		Text = "",
		Name = Name,
		Position = Position,
		Size = Size,
		BackgroundColor3 = Color3.new(0, 0, 0),
		BackgroundTransparency = p1 or 0.5
	})
end

local function spotlightRing(XOffset, YOffset, X, Y, Offset)
	-- upvalues: ReactModule (copy)
	return ReactModule.createElement("Frame", {
		Name = "SpotlightRing",
		BackgroundTransparency = 1,
		ZIndex = 2,
		Position = UDim2.fromOffset(XOffset, YOffset),
		Size = UDim2.fromOffset(X - XOffset, Y - YOffset)
	}, {
		Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, Offset) }),
		Stroke = ReactModule.createElement("UIStroke", {
			Transparency = 0.7,
			Thickness = 1,
			Color = Color3.new(1, 1, 1)
		})
	})
end

local function cornerDim(Name, Position, Position1, XOffset: number)
	-- upvalues: ReactModule (copy)
	return ReactModule.createElement("TextButton", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Active = true,
		AutoButtonColor = false,
		Selectable = false,
		Text = "",
		Name = Name,
		Position = Position,
		Size = UDim2.fromOffset(XOffset, XOffset)
	}, {
		Mask = ReactModule.createElement("ImageLabel", {
			Image = "rbxasset://textures/ui/AvatarExperience/CircleCutoutLargeNoBorder.png",
			ImageTransparency = 0.5,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ImageColor3 = Color3.new(0, 0, 0),
			Position = Position1,
			Size = UDim2.fromOffset(XOffset * 2, XOffset * 2)
		})
	})
end

return function(p1)
	-- upvalues: UseDeviceInsetsFunction (copy), dimPanel (copy), cornerDim (copy), spotlightRing (copy), ReactModule (copy)
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local _Rect = if p1.targetRect == nil then nil else Rect.new(p1.targetRect.Min.X + UseDeviceInsetsResult.left, p1.targetRect.Min.Y + UseDeviceInsetsResult.top, p1.targetRect.Max.X + UseDeviceInsetsResult.left, p1.targetRect.Max.Y + UseDeviceInsetsResult.top)
	local config = nil
	
	if _Rect == nil and p1.dimEndX ~= nil then
		config = {
			HomeDim = dimPanel("HomeDim", UDim2.fromScale(0, 0), UDim2.new(0, p1.dimEndX + UseDeviceInsetsResult.left, 1, 0))
		}
	elseif _Rect == nil then
		config = {
			Dim = dimPanel("Dim", UDim2.fromScale(0, 0), UDim2.fromScale(1, 1), if p1.isTransparent then 1 else nil)
		}
	else
		local X = _Rect.Min.X
		local Y = _Rect.Min.Y
		local X1 = _Rect.Max.X
		local Y1 = _Rect.Max.Y
		local SmallestRatio = math.min(X1 - X, Y1 - Y) / 2
		config = {
			Top = dimPanel("Top", UDim2.fromOffset(0, 0), UDim2.new(1, 0, 0, Y)),
			Bottom = dimPanel("Bottom", UDim2.new(0, 0, 0, Y1), UDim2.new(1, 0, 1, -Y1)),
			Left = dimPanel("Left", UDim2.new(0, 0, 0, Y), UDim2.new(0, X, 0, Y1 - Y)),
			Right = dimPanel("Right", UDim2.new(0, X1, 0, Y), UDim2.new(1, -X1, 0, Y1 - Y)),
			TopLeftCorner = cornerDim("TopLeftCorner", UDim2.fromOffset(X, Y), UDim2.fromOffset(0, 0), SmallestRatio),
			TopRightCorner = cornerDim("TopRightCorner", UDim2.fromOffset(X1 - SmallestRatio, Y), UDim2.fromOffset(-SmallestRatio, 0), SmallestRatio),
			BottomLeftCorner = cornerDim("BottomLeftCorner", UDim2.fromOffset(X, Y1 - SmallestRatio), UDim2.fromOffset(0, -SmallestRatio), SmallestRatio),
			BottomRightCorner = cornerDim("BottomRightCorner", UDim2.fromOffset(X1 - SmallestRatio, Y1 - SmallestRatio), UDim2.fromOffset(-SmallestRatio, -SmallestRatio), SmallestRatio),
			SpotlightRing = spotlightRing(X, Y, X1, Y1, SmallestRatio)
		}
	end
	return ReactModule.createElement("Frame", {
		Name = "SplitPaneEducationalTourScrim",
		BackgroundTransparency = 1,
		Position = UDim2.fromOffset(-UseDeviceInsetsResult.left, -UseDeviceInsetsResult.top),
		Size = UDim2.new(1, UseDeviceInsetsResult.left + UseDeviceInsetsResult.right, 1, UseDeviceInsetsResult.top + UseDeviceInsetsResult.bottom)
	}, config)
end