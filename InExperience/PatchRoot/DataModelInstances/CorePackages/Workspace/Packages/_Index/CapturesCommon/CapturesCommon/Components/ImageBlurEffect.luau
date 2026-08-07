local parent = script.Parent.Parent
local reactModule = require(parent.Parent.React)
local blurDirectionModule = require(parent.Enums.BlurDirection)

local function getImageRect(p0, p1) --[[ line: 24 ]]
	-- upvalues: blurDirectionModule (ref)
	local x = p1.X
	local y = p1.Y
	
	if p0 == blurDirectionModule.Up then
		return Vector2.new(0, 0), Vector2.new(x, 1)
	elseif p0 == blurDirectionModule.Down then
		return Vector2.new(0, y - 1), Vector2.new(x, 1)
	elseif p0 == blurDirectionModule.Left then
		return Vector2.new(0, 0), Vector2.new(1, y)
	elseif p0 == blurDirectionModule.Right then
		return Vector2.new(x - 1, 0), Vector2.new(1, y)
	end
	return nil
end

local function _(p2) --[[ line: 40 | named "getGradientRotation" ]]
	-- upvalues: blurDirectionModule (ref)
	return if p2 == blurDirectionModule.Up then 270 elseif p2 == blurDirectionModule.Down then 90 elseif p2 == blurDirectionModule.Left then 180 elseif p2 == blurDirectionModule.Right then 0 else nil
end

local function getRadialGradientPosition(p3) --[[ line: 54 ]]
	-- upvalues: blurDirectionModule (ref)
	return if p3 == blurDirectionModule.Up then UDim2.fromScale(0.5, 1) elseif p3 == blurDirectionModule.Down then UDim2.fromScale(0.5, 0) elseif p3 == blurDirectionModule.Left then UDim2.fromScale(1, 0.5) elseif p3 == blurDirectionModule.Right then UDim2.fromScale(0, 0.5) else nil
end

local function getTransparency(p4, p5) --[[ line: 68 ]]
	return if p5 then p5:map(function(p6) --[[ line: 76 ]]
		-- upvalues: p4 (ref)
		return p4 + (1 - p4) * p6
	end) else p4
end

return function(p7) --[[ line: 81 | named "ImageBlurEffect" ]]
	-- upvalues: getImageRect (ref), getRadialGradientPosition (ref), reactModule (ref), getTransparency (ref), blurDirectionModule (ref)
	local var5 = if p7.gradientColor then p7.gradientColor else Color3.new(0, 0, 0)
	local var6, var7 = getImageRect(p7.direction, p7.imageSize)
	local var8 = getRadialGradientPosition(p7.direction)
	local var9 = reactModule.useMemo(function() --[[ line: 86 ]]
		-- upvalues: getTransparency (copy), p7 (ref)
		return getTransparency(0, p7.transparencyBinding)
	end, { p7.transparencyBinding })
	local var10 = reactModule.useMemo(function() --[[ line: 90 ]]
		-- upvalues: getTransparency (copy), p7 (ref)
		return getTransparency(0.9, p7.transparencyBinding)
	end, { p7.transparencyBinding })
	local var11 = reactModule.useMemo(function() --[[ line: 94 ]]
		-- upvalues: getTransparency (copy), p7 (ref)
		return getTransparency(0.8, p7.transparencyBinding)
	end, { p7.transparencyBinding })
	local createElement = reactModule.createElement
	local var12 = "ImageLabel"
	local t = {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		AnchorPoint = p7.AnchorPoint,
		Image = p7.image,
		ImageRectOffset = var6,
		ImageRectSize = var7,
		ImageTransparency = var9,
		Position = p7.Position,
		ScaleType = Enum.ScaleType.Crop,
		Size = p7.Size,
		ZIndex = p7.ZIndex
	}
	local t_1 = {}
	local createElement_1 = reactModule.createElement
	local var15 = "UIGradient"
	local t_2 = {
		Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
			ColorSequenceKeypoint.new(1, var5)
		})
	}
	local direction = p7.direction
	t_2.Rotation = if direction == blurDirectionModule.Up then 270 elseif direction == blurDirectionModule.Down then 90 elseif direction == blurDirectionModule.Left then 180 elseif direction == blurDirectionModule.Right then 0 else nil
	t_2.Transparency = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 0.3),
		NumberSequenceKeypoint.new(0.5, 0.5),
		NumberSequenceKeypoint.new(1, 1)
	})
	t_1.UIGradient = createElement_1(var15, t_2)
	t_1.RadialBlur = reactModule.createElement("ImageLabel", {
		BackgroundTransparency = 1,
		Image = "rbxasset://textures/shadowblurmask.png",
		ZIndex = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		ImageTransparency = var10,
		Position = var8,
		ScaleType = Enum.ScaleType.Crop,
		Size = UDim2.fromScale(2, 2)
	})
	t_1.SoftEdges = reactModule.createElement("ImageLabel", {
		BackgroundTransparency = 1,
		Image = "rbxasset://textures/ui/VR/edgeBlur.png",
		ZIndex = 2,
		AnchorPoint = Vector2.new(0.5, 0.5),
		ImageTransparency = var11,
		Position = var8,
		ScaleType = Enum.ScaleType.Crop,
		Size = UDim2.fromScale(1.5, 2)
	})
	
	return createElement(var12, t, t_1)
end