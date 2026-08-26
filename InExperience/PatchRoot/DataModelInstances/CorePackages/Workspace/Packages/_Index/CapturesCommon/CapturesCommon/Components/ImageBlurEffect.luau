local parent = script.Parent.Parent
local reactModule = require(parent.Parent.React)
local blurDirectionModule = require(parent.Enums.BlurDirection)

local function getImageRect(p1, p2)
	-- upvalues: blurDirectionModule (ref)
	local x = p2.X
	local y = p2.Y
	
	if p1 == blurDirectionModule.Up then
		return Vector2.new(0, 0), Vector2.new(x, 1)
	elseif p1 == blurDirectionModule.Down then
		return Vector2.new(0, y - 1), Vector2.new(x, 1)
	elseif p1 == blurDirectionModule.Left then
		return Vector2.new(0, 0), Vector2.new(1, y)
	elseif p1 == blurDirectionModule.Right then
		return Vector2.new(x - 1, 0), Vector2.new(1, y)
	end
	return nil
end

local function _(p1)
	-- upvalues: blurDirectionModule (ref)
	return if p1 == blurDirectionModule.Up then 270 elseif p1 == blurDirectionModule.Down then 90 elseif p1 == blurDirectionModule.Left then 180 elseif p1 == blurDirectionModule.Right then 0 else nil
end

local function getRadialGradientPosition(p1)
	-- upvalues: blurDirectionModule (ref)
	return if p1 == blurDirectionModule.Up then UDim2.fromScale(0.5, 1) elseif p1 == blurDirectionModule.Down then UDim2.fromScale(0.5, 0) elseif p1 == blurDirectionModule.Left then UDim2.fromScale(1, 0.5) elseif p1 == blurDirectionModule.Right then UDim2.fromScale(0, 0.5) else nil
end

local function getTransparency(p1, p2)
	return if p2 then p2:map(function(p3)
		-- upvalues: p1 (ref)
		return p1 + (1 - p1) * p3
	end) else p1
end

return function(p1)
	-- upvalues: getImageRect (ref), getRadialGradientPosition (ref), reactModule (ref), getTransparency (ref), blurDirectionModule (ref)
	local var1 = if p1.gradientColor then p1.gradientColor else Color3.new(0, 0, 0)
	local var2, var3 = getImageRect(p1.direction, p1.imageSize)
	local var4 = getRadialGradientPosition(p1.direction)
	local var5 = reactModule.useMemo(function()
		-- upvalues: getTransparency (copy), p1 (ref)
		return getTransparency(0, p1.transparencyBinding)
	end, { p1.transparencyBinding })
	local var6 = reactModule.useMemo(function()
		-- upvalues: getTransparency (copy), p1 (ref)
		return getTransparency(0.9, p1.transparencyBinding)
	end, { p1.transparencyBinding })
	local var7 = reactModule.useMemo(function()
		-- upvalues: getTransparency (copy), p1 (ref)
		return getTransparency(0.8, p1.transparencyBinding)
	end, { p1.transparencyBinding })
	local createElement = reactModule.createElement
	local var8 = "ImageLabel"
	local t = {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		AnchorPoint = p1.AnchorPoint,
		Image = p1.image,
		ImageRectOffset = var2,
		ImageRectSize = var3,
		ImageTransparency = var5,
		Position = p1.Position,
		ScaleType = Enum.ScaleType.Crop,
		Size = p1.Size,
		ZIndex = p1.ZIndex
	}
	local t_1 = {}
	local createElement_1 = reactModule.createElement
	local var9 = "UIGradient"
	local t_2 = {
		Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
			ColorSequenceKeypoint.new(1, var1)
		})
	}
	local direction = p1.direction
	t_2.Rotation = if direction == blurDirectionModule.Up then 270 elseif direction == blurDirectionModule.Down then 90 elseif direction == blurDirectionModule.Left then 180 elseif direction == blurDirectionModule.Right then 0 else nil
	t_2.Transparency = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 0.3),
		NumberSequenceKeypoint.new(0.5, 0.5),
		NumberSequenceKeypoint.new(1, 1)
	})
	t_1.UIGradient = createElement_1(var9, t_2)
	t_1.RadialBlur = reactModule.createElement("ImageLabel", {
		BackgroundTransparency = 1,
		Image = "rbxasset://textures/shadowblurmask.png",
		ZIndex = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		ImageTransparency = var6,
		Position = var4,
		ScaleType = Enum.ScaleType.Crop,
		Size = UDim2.fromScale(2, 2)
	})
	t_1.SoftEdges = reactModule.createElement("ImageLabel", {
		BackgroundTransparency = 1,
		Image = "rbxasset://textures/ui/VR/edgeBlur.png",
		ZIndex = 2,
		AnchorPoint = Vector2.new(0.5, 0.5),
		ImageTransparency = var7,
		Position = var4,
		ScaleType = Enum.ScaleType.Crop,
		Size = UDim2.fromScale(1.5, 2)
	})
	
	return createElement(var8, t, t_1)
end