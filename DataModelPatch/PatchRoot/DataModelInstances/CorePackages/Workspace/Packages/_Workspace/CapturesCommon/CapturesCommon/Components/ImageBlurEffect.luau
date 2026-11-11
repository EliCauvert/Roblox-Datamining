local Parent = script.Parent.Parent
local ReactModule = require(Parent.Parent.React)
local BlurDirectionModule = require(Parent.Enums.BlurDirection)

local function getImageRect(Direction, ImageSize)
	-- upvalues: BlurDirectionModule (copy)
	local X: number = ImageSize.X
	local Y: number = ImageSize.Y
	
	if Direction == BlurDirectionModule.Up then
		return Vector2.new(0, 0), Vector2.new(X, 1)
	elseif Direction == BlurDirectionModule.Down then
		return Vector2.new(0, Y - 1), Vector2.new(X, 1)
	elseif Direction == BlurDirectionModule.Left then
		return Vector2.new(0, 0), Vector2.new(1, Y)
	elseif Direction == BlurDirectionModule.Right then
		return Vector2.new(X - 1, 0), Vector2.new(1, Y)
	else
		return nil
	end
end

local function _(Down)
	-- upvalues: BlurDirectionModule (copy)
	return if Down == BlurDirectionModule.Up then 270 elseif Down == BlurDirectionModule.Down then 90 elseif Down == BlurDirectionModule.Left then 180 elseif Down == BlurDirectionModule.Right then 0 else nil
end

local function getRadialGradientPosition(Direction)
	-- upvalues: BlurDirectionModule (copy)
	return if Direction == BlurDirectionModule.Up then UDim2.fromScale(0.5, 1) elseif Direction == BlurDirectionModule.Down then UDim2.fromScale(0.5, 0) elseif Direction == BlurDirectionModule.Left then UDim2.fromScale(1, 0.5) elseif Direction == BlurDirectionModule.Right then UDim2.fromScale(0, 0.5) else nil
end

local function getTransparency(p1, TransparencyBinding)
	return if TransparencyBinding then TransparencyBinding:map(function(p2): number
		-- upvalues: p1 (copy)
		return p1 + (1 - p1) * p2
	end) else p1
end

return function(Frame)
	-- upvalues: getImageRect (copy), getRadialGradientPosition (copy), ReactModule (copy), getTransparency (copy), BlurDirectionModule (copy)
	local GradientColor = if Frame.gradientColor then Frame.gradientColor else Color3.new(0, 0, 0)
	local ImageRect, ImageRect2 = getImageRect(Frame.direction, Frame.imageSize)
	local RadialGradientPosition = getRadialGradientPosition(Frame.direction)
	local Direction = Frame.direction
	
	return ReactModule.createElement("ImageLabel", {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		AnchorPoint = Frame.AnchorPoint,
		Image = Frame.image,
		ImageRectOffset = ImageRect,
		ImageRectSize = ImageRect2,
		ImageTransparency = ReactModule.useMemo(function()
			-- upvalues: getTransparency (upval), Frame (copy)
			return getTransparency(0, Frame.transparencyBinding)
		end, { Frame.transparencyBinding }),
		Position = Frame.Position,
		ScaleType = Enum.ScaleType.Crop,
		Size = Frame.Size,
		ZIndex = Frame.ZIndex
	}, {
		UIGradient = ReactModule.createElement("UIGradient", {
			Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
				ColorSequenceKeypoint.new(1, GradientColor)
			}),
			Rotation = if Direction == BlurDirectionModule.Up then 270 elseif Direction == BlurDirectionModule.Down then 90 elseif Direction == BlurDirectionModule.Left then 180 elseif Direction == BlurDirectionModule.Right then 0 else nil,
			Transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0, 0.3),
				NumberSequenceKeypoint.new(0.5, 0.5),
				NumberSequenceKeypoint.new(1, 1)
			})
		}),
		RadialBlur = ReactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/shadowblurmask.png",
			ZIndex = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			ImageTransparency = ReactModule.useMemo(function()
				-- upvalues: getTransparency (upval), Frame (copy)
				return getTransparency(0.9, Frame.transparencyBinding)
			end, { Frame.transparencyBinding }),
			Position = RadialGradientPosition,
			ScaleType = Enum.ScaleType.Crop,
			Size = UDim2.fromScale(2, 2)
		}),
		SoftEdges = ReactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/VR/edgeBlur.png",
			ZIndex = 2,
			AnchorPoint = Vector2.new(0.5, 0.5),
			ImageTransparency = ReactModule.useMemo(function()
				-- upvalues: getTransparency (upval), Frame (copy)
				return getTransparency(0.8, Frame.transparencyBinding)
			end, { Frame.transparencyBinding }),
			Position = RadialGradientPosition,
			ScaleType = Enum.ScaleType.Crop,
			Size = UDim2.fromScale(1.5, 2)
		})
	})
end