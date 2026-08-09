local runService = game:GetService("RunService")
local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local t = inGameMenuDependenciesModule.t
local assetsModule = require(script.Parent.Parent.Parent.Resources.Assets)
local imageSetLabel = inGameMenuDependenciesModule.UIBlox.Core.ImageSet.ImageSetLabel
local color = Color3.fromRGB(98, 98, 99)
local color_1 = Color3.fromRGB(255, 255, 255)
local color_2 = Color3.fromRGB(196, 0, 1)
local fillCircle = roact.PureComponent:extend("FillCircle")
fillCircle.validateProps = t.strictInterface({
	Position = t.UDim2,
	AnchorPoint = t.Vector2,
	fillFraction = t.number,
	largerCircleFraction = t.number,
	popCircleFraction = t.number,
	shakeCircleFraction = t.number,
	BackgroundColor = t.Color3
})

local function _(p0) --[[ line: 37 | named "getFillRingZIndex" ]]
	return if p0 > 0.75 then 8 elseif p0 > 0.5 then 6 elseif p0 > 0.25 then 4 elseif p0 > 0 then 2 else 0
end

local _ = function(p1, p2, p3) --[[ line: 50 | named "linearTween" ]]
	return (p1 - p2 / 30) / ((p3 - p2) / 30)
end

local _ = function(p4, p5, p6) --[[ line: 55 | named "isBetweenFrames" ]]
	return p5 / 30 <= p4 and p4 <= p6 / 30
end

local function largerCircleAnimation(p7, p8, p9, p10) --[[ line: 59 ]]
	if p9 then
		p7 = 0.266666666667 - p7
	end
	local var10 = p7
	
	if var10 >= 0 and var10 <= 0.166666666667 then
		local var11 = 16 + 6 * ((p7 - 0) / 0.166666666667)
		p8.size(UDim2.new(0, var11, 0, var11))
		
		return
	end
	local var12 = p7
	
	if var12 >= 0.166666666667 and var12 <= 0.266666666667 then
		local var13 = 22 - 2 * ((p7 - 0.166666666667) / 0.1)
		p8.size(UDim2.new(0, var13, 0, var13))
		
		return
	elseif p7 < 0 then
		p8.size(UDim2.new(0, 16, 0, 16))
		p10()
		
		return
	end
	p8.size(UDim2.new(0, 20, 0, 20))
	p10()
end

local function popCircleAnimation(p11, p12, _, p13) --[[ line: 87 ]]
	if p11 >= 0 and p11 <= 0.1 then
		local var14 = 20 + 4 * ((p11 - 0) / 0.1)
		p12.size(UDim2.new(0, var14, 0, var14))
		
		return
	elseif p11 >= 0.1 and p11 <= 0.2 then
		local var15 = 24 - 4 * ((p11 - 0.1) / 0.1)
		p12.size(UDim2.new(0, var15, 0, var15))
		
		return
	end
	p12.size(UDim2.new(0, 20, 0, 20))
	p13()
end

local function shakeCircleAnimation(p14, p15, _, p16) --[[ line: 108 ]]
	if p14 >= 0 and p14 <= 0.1 then
		p15.positionOffset(UDim2.new(0, -4 * ((p14 - 0) / 0.1), 0, 0))
		
		return
	elseif p14 >= 0.1 and p14 <= 0.2 then
		p15.positionOffset(UDim2.new(0, -4 + 12 * ((p14 - 0.1) / 0.1), 0, 0))
		
		return
	elseif p14 >= 0.2 and p14 <= 0.266666666667 then
		p15.positionOffset(UDim2.new(0, 8 - 16 * ((p14 - 0.2) / 0.066666666667), 0, 0))
		
		return
	elseif p14 >= 0.266666666667 and p14 <= 0.333333333333 then
		p15.positionOffset(UDim2.new(0, -8 + 16 * ((p14 - 0.266666666667) / 0.066666666667), 0, 0))
		
		return
	elseif p14 >= 0.333333333333 and p14 <= 0.4 then
		p15.positionOffset(UDim2.new(0, 8 - 16 * ((p14 - 0.333333333333) / 0.066666666667), 0, 0))
		
		return
	elseif p14 >= 0.4 and p14 <= 0.466666666667 then
		p15.positionOffset(UDim2.new(0, -8 + 8 * ((p14 - 0.4) / 0.066666666667), 0, 0))
		
		return
	end
	p15.positionOffset(UDim2.new(0, 0, 0, 0))
	p16()
end

function fillCircle.init(p17) --[[ line: 143 ]]
	-- upvalues: roact (ref)
	local var16, var17 = roact.createBinding(UDim2.new(0, 16, 0, 16))
	p17.sizeBinding = var16
	p17.sizeBindingUpdate = var17
	p17.largerSizeBinding = p17.sizeBinding:map(function(p18) --[[ line: 146 ]]
		return p18 + UDim2.new(0, 2, 0, 2)
	end)
	local var18, var19 = roact.createBinding(UDim2.new(0, 0, 0, 0))
	p17.positionOffsetBinding = var18
	p17.positionOffsetBindingUpdate = var19
	p17.updateBindings = {
		size = p17.sizeBindingUpdate,
		positionOffset = p17.positionOffsetBindingUpdate
	}
	p17.animationStartTime = nil
	p17.animationFunction = nil
	p17.reverseAnimation = false
	p17.renderSteppedConnection = nil
end

function fillCircle.render(p19) --[[ line: 162 ]]
	-- upvalues: color_2 (ref), color_1 (ref), roact (ref), color (ref), imageSetLabel (ref), assetsModule (ref)
	local props = p19.props
	local var20 = if props.fillFraction >= 1 then color_2 else color_1
	local createElement = roact.createElement
	local var21 = "Frame"
	local t = {
		BackgroundTransparency = 1,
		Size = p19.sizeBinding,
		Position = props.Position,
		AnchorPoint = props.AnchorPoint
	}
	local t_1 = {}
	local createElement_1 = roact.createElement
	local var24 = "Frame"
	local t_2 = {
		BorderSizePixel = 0,
		Position = p19.positionOffsetBinding,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = color
	}
	local t_3 = {
		OuterRing = roact.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			ZIndex = 10,
			Image = assetsModule.Images.CircleCutout,
			Size = UDim2.new(1, 0, 1, 0),
			ImageColor3 = props.BackgroundColor
		}),
		InnerRing = roact.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			ZIndex = 10,
			Image = assetsModule.Images.Circle,
			Size = UDim2.new(1, -4, 1, -4),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			ImageColor3 = props.BackgroundColor
		})
	}
	local createElement_2 = roact.createElement
	local var27 = "Frame"
	local t_4 = {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 0, 0, 0),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Rotation = props.fillFraction * 360
	}
	local fillFraction = props.fillFraction
	t_4.ZIndex = if fillFraction > 0.75 then 8 elseif fillFraction > 0.5 then 6 elseif fillFraction > 0.25 then 4 elseif fillFraction > 0 then 2 else 0
	t_3.FillRingRotationFrame = createElement_2(var27, t_4, {
		FillRing = roact.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			Image = assetsModule.Images.QuarterCircle,
			Size = p19.largerSizeBinding,
			AnchorPoint = Vector2.new(0.5, 0.5),
			ImageColor3 = var20
		})
	})
	t_3.EdgeBlockers = roact.createElement("Frame", {
		BackgroundTransparency = 1,
		ZIndex = 10,
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		Top = roact.createElement("Frame", {
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(0.5, 1),
			Position = UDim2.new(0.5, 0, 0, 0),
			Size = UDim2.new(1, 4, 0, 2),
			BackgroundColor3 = props.BackgroundColor
		}),
		Right = roact.createElement("Frame", {
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(1, 0, 0.5, 0),
			Size = UDim2.new(0, 2, 1, 4),
			BackgroundColor3 = props.BackgroundColor
		}),
		Bottom = roact.createElement("Frame", {
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.new(0.5, 0, 1, 0),
			Size = UDim2.new(1, 4, 0, 2),
			BackgroundColor3 = props.BackgroundColor
		}),
		Left = roact.createElement("Frame", {
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(0, 0, 0.5, 0),
			Size = UDim2.new(0, 2, 1, 4),
			BackgroundColor3 = props.BackgroundColor
		})
	})
	t_3.TopLeftFill = roact.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(0.5, 0, 0.5, 0),
		BackgroundColor3 = if props.fillFraction >= 1 then var20 else color,
		ZIndex = if props.fillFraction >= 1 then 9 else 7
	})
	t_3.BottomLeftFill = roact.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(0.5, 0, 0.5, 0),
		Position = UDim2.new(0, 0, 0.5, 0),
		BackgroundColor3 = if props.fillFraction >= 0.75 then var20 else color,
		ZIndex = if props.fillFraction >= 0.75 then 9 else 5
	})
	t_3.BottomRightFill = roact.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(0.5, 0, 0.5, 0),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		BackgroundColor3 = if props.fillFraction >= 0.5 then var20 else color,
		ZIndex = if props.fillFraction >= 0.5 then 9 else 3
	})
	t_3.TopRightFill = roact.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(0.5, 0, 0.5, 0),
		Position = UDim2.new(0.5, 0, 0, 0),
		BackgroundColor3 = if props.fillFraction >= 0.25 then var20 else color,
		ZIndex = if props.fillFraction >= 0.25 then 9 else 1
	})
	t_1.PositionOffsetFrame = createElement_1(var24, t_2, t_3)
	
	return createElement(var21, t, t_1)
end

function fillCircle.didUpdate(p20, p21, _) --[[ line: 285 ]]
	-- upvalues: largerCircleAnimation (ref), popCircleAnimation (ref), shakeCircleAnimation (ref)
	local var29 = p20.props.largerCircleFraction <= p20.props.fillFraction
	
	if p21.largerCircleFraction <= p21.fillFraction ~= var29 then
		p20:playAnimation(largerCircleAnimation, not var29)
	end
	if p20.props.popCircleFraction <= p20.props.fillFraction and not (p21.popCircleFraction <= p21.fillFraction) then
		p20:playAnimation(popCircleAnimation, false)
	end
	if p20.props.shakeCircleFraction <= p20.props.fillFraction and not (p21.shakeCircleFraction <= p21.fillFraction) then
		p20:playAnimation(shakeCircleAnimation, false)
	end
end

function fillCircle.playAnimation(p22, p23, p24) --[[ line: 305 ]]
	-- upvalues: runService (ref)
	if p22.animationFunction then
		p22.animationFunction(100, p22.updateBindings, p22.reverseAnimation, function() --[[ line: 308 ]] end)
	end
	p22.animationStartTime = tick()
	p22.animationFunction = p23
	p22.reverseAnimation = p24
	
	if not p22.renderSteppedConnection then
		p22.renderSteppedConnection = runService.RenderStepped:Connect(function() --[[ line: 314 ]]
			-- upvalues: p22 (ref)
			p22.animationFunction(tick() - p22.animationStartTime, p22.updateBindings, p22.reverseAnimation, function() --[[ line: 319 ]]
				-- upvalues: p22 (copy)
				p22:stopAnimation()
			end)
		end)
	end
end

function fillCircle.stopAnimation(p25) --[[ line: 327 ]]
	if p25.renderSteppedConnection then
		p25.renderSteppedConnection:Disconnect()
		p25.renderSteppedConnection = nil
	end
end

function fillCircle.willUnmount(p26) --[[ line: 334 ]]
	p26:stopAnimation()
end

return fillCircle