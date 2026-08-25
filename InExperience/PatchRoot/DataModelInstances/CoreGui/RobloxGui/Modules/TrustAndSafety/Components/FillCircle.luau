local runService = game:GetService("RunService")
local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local tModule = require(corePackagesService.Packages.t)
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local images = UIBloxModule.App.ImageSet.Images
local color = Color3.fromRGB(98, 98, 99)
local color_1 = Color3.fromRGB(255, 255, 255)
local color_2 = Color3.fromRGB(196, 0, 1)
local circle29 = images["component_assets/circle_29"]
local fillCircle = roactModule.PureComponent:extend("FillCircle")
fillCircle.validateProps = tModule.strictInterface({
	Position = tModule.UDim2,
	AnchorPoint = tModule.Vector2,
	fillFraction = tModule.number,
	largerCircleFraction = tModule.number,
	popCircleFraction = tModule.number,
	shakeCircleFraction = tModule.number,
	BackgroundColor = tModule.Color3
})

local function _(p0)
	return if p0 > 0.75 then 8 elseif p0 > 0.5 then 6 elseif p0 > 0.25 then 4 elseif p0 > 0 then 2 else 0
end

local _ = function(p1, p2, p3)
	return (p1 - p2 / 30) / ((p3 - p2) / 30)
end

local _ = function(p4, p5, p6)
	return p5 / 30 <= p4 and p4 <= p6 / 30
end

local function largerCircleAnimation(p7, p8, p9, p10)
	if p9 then
		p7 = 0.266666666667 - p7
	end
	local var12 = p7
	
	if var12 >= 0 and var12 <= 0.166666666667 then
		local var13 = 16 + 6 * ((p7 - 0) / 0.166666666667)
		p8.size(UDim2.new(0, var13, 0, var13))
		
		return
	end
	local var14 = p7
	
	if var14 >= 0.166666666667 and var14 <= 0.266666666667 then
		local var15 = 22 - 2 * ((p7 - 0.166666666667) / 0.1)
		p8.size(UDim2.new(0, var15, 0, var15))
		
		return
	elseif p7 < 0 then
		p8.size(UDim2.new(0, 16, 0, 16))
		p10()
		
		return
	end
	p8.size(UDim2.new(0, 20, 0, 20))
	p10()
end

local function popCircleAnimation(p11, p12, _, p13)
	if p11 >= 0 and p11 <= 0.1 then
		local var16 = 20 + 4 * ((p11 - 0) / 0.1)
		p12.size(UDim2.new(0, var16, 0, var16))
		
		return
	elseif p11 >= 0.1 and p11 <= 0.2 then
		local var17 = 24 - 4 * ((p11 - 0.1) / 0.1)
		p12.size(UDim2.new(0, var17, 0, var17))
		
		return
	end
	p12.size(UDim2.new(0, 20, 0, 20))
	p13()
end

local function shakeCircleAnimation(p14, p15, _, p16)
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

function fillCircle.init(p17)
	-- upvalues: roactModule (ref)
	local var18, var19 = roactModule.createBinding(UDim2.new(0, 16, 0, 16))
	p17.sizeBinding = var18
	p17.sizeBindingUpdate = var19
	p17.largerSizeBinding = p17.sizeBinding:map(function(p18)
		return p18 + UDim2.new(0, 2, 0, 2)
	end)
	local var20, var21 = roactModule.createBinding(UDim2.new(0, 0, 0, 0))
	p17.positionOffsetBinding = var20
	p17.positionOffsetBindingUpdate = var21
	p17.updateBindings = {
		size = p17.sizeBindingUpdate,
		positionOffset = p17.positionOffsetBindingUpdate
	}
	p17.animationStartTime = nil
	p17.animationFunction = nil
	p17.reverseAnimation = false
	p17.renderSteppedConnection = nil
end

function fillCircle.render(p19)
	-- upvalues: color_2 (ref), color_1 (ref), roactModule (ref), color (ref), imageSetLabel (ref), circle29 (ref)
	local props = p19.props
	local var22 = if props.fillFraction >= 1 then color_2 else color_1
	local createElement = roactModule.createElement
	local var23 = "Frame"
	local t = {
		BackgroundTransparency = 1,
		Size = p19.sizeBinding,
		Position = props.Position,
		AnchorPoint = props.AnchorPoint
	}
	local t_1 = {}
	local createElement_1 = roactModule.createElement
	local var26 = "Frame"
	local t_2 = {
		BorderSizePixel = 0,
		Position = p19.positionOffsetBinding,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = color
	}
	local t_3 = {
		OuterRing = roactModule.createElement(imageSetLabel, {
			Image = "rbxasset://textures/ui/InGameMenu/CircleCutout.png",
			BackgroundTransparency = 1,
			ZIndex = 10,
			Size = UDim2.new(1, 0, 1, 0),
			ImageColor3 = props.BackgroundColor
		}),
		InnerRing = roactModule.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			ZIndex = 10,
			Image = circle29,
			Size = UDim2.new(1, -4, 1, -4),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			ImageColor3 = props.BackgroundColor
		})
	}
	local createElement_2 = roactModule.createElement
	local var29 = "Frame"
	local t_4 = {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 0, 0, 0),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Rotation = props.fillFraction * 360
	}
	local fillFraction = props.fillFraction
	t_4.ZIndex = if fillFraction > 0.75 then 8 elseif fillFraction > 0.5 then 6 elseif fillFraction > 0.25 then 4 elseif fillFraction > 0 then 2 else 0
	t_3.FillRingRotationFrame = createElement_2(var29, t_4, {
		FillRing = roactModule.createElement(imageSetLabel, {
			Image = "rbxasset://textures/ui/InGameMenu/QuarterCircle.png",
			BackgroundTransparency = 1,
			Size = p19.largerSizeBinding,
			AnchorPoint = Vector2.new(0.5, 0.5),
			ImageColor3 = var22
		})
	})
	t_3.EdgeBlockers = roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ZIndex = 10,
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		Top = roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(0.5, 1),
			Position = UDim2.new(0.5, 0, 0, 0),
			Size = UDim2.new(1, 4, 0, 2),
			BackgroundColor3 = props.BackgroundColor
		}),
		Right = roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(1, 0, 0.5, 0),
			Size = UDim2.new(0, 2, 1, 4),
			BackgroundColor3 = props.BackgroundColor
		}),
		Bottom = roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.new(0.5, 0, 1, 0),
			Size = UDim2.new(1, 4, 0, 2),
			BackgroundColor3 = props.BackgroundColor
		}),
		Left = roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(0, 0, 0.5, 0),
			Size = UDim2.new(0, 2, 1, 4),
			BackgroundColor3 = props.BackgroundColor
		})
	})
	t_3.TopLeftFill = roactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(0.5, 0, 0.5, 0),
		BackgroundColor3 = if props.fillFraction >= 1 then var22 else color,
		ZIndex = if props.fillFraction >= 1 then 9 else 7
	})
	t_3.BottomLeftFill = roactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(0.5, 0, 0.5, 0),
		Position = UDim2.new(0, 0, 0.5, 0),
		BackgroundColor3 = if props.fillFraction >= 0.75 then var22 else color,
		ZIndex = if props.fillFraction >= 0.75 then 9 else 5
	})
	t_3.BottomRightFill = roactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(0.5, 0, 0.5, 0),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		BackgroundColor3 = if props.fillFraction >= 0.5 then var22 else color,
		ZIndex = if props.fillFraction >= 0.5 then 9 else 3
	})
	t_3.TopRightFill = roactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(0.5, 0, 0.5, 0),
		Position = UDim2.new(0.5, 0, 0, 0),
		BackgroundColor3 = if props.fillFraction >= 0.25 then var22 else color,
		ZIndex = if props.fillFraction >= 0.25 then 9 else 1
	})
	t_1.PositionOffsetFrame = createElement_1(var26, t_2, t_3)
	
	return createElement(var23, t, t_1)
end

function fillCircle.didUpdate(p20, p21, _)
	-- upvalues: largerCircleAnimation (ref), popCircleAnimation (ref), shakeCircleAnimation (ref)
	local var31 = p20.props.largerCircleFraction <= p20.props.fillFraction
	
	if p21.largerCircleFraction <= p21.fillFraction ~= var31 then
		p20:playAnimation(largerCircleAnimation, not var31)
	end
	if p20.props.popCircleFraction <= p20.props.fillFraction and not (p21.popCircleFraction <= p21.fillFraction) then
		p20:playAnimation(popCircleAnimation, false)
	end
	if p20.props.shakeCircleFraction <= p20.props.fillFraction and not (p21.shakeCircleFraction <= p21.fillFraction) then
		p20:playAnimation(shakeCircleAnimation, false)
	end
end

function fillCircle.playAnimation(p22, p23, p24)
	-- upvalues: runService (ref)
	if p22.animationFunction then
		p22.animationFunction(100, p22.updateBindings, p22.reverseAnimation, function() end)
	end
	p22.animationStartTime = tick()
	p22.animationFunction = p23
	p22.reverseAnimation = p24
	
	if not p22.renderSteppedConnection then
		p22.renderSteppedConnection = runService.RenderStepped:Connect(function()
			-- upvalues: p22 (ref)
			p22.animationFunction(tick() - p22.animationStartTime, p22.updateBindings, p22.reverseAnimation, function()
				-- upvalues: p22 (copy)
				p22:stopAnimation()
			end)
		end)
	end
end

function fillCircle.stopAnimation(p25)
	if p25.renderSteppedConnection then
		p25.renderSteppedConnection:Disconnect()
		p25.renderSteppedConnection = nil
	end
end

function fillCircle.willUnmount(p26)
	p26:stopAnimation()
end

return fillCircle