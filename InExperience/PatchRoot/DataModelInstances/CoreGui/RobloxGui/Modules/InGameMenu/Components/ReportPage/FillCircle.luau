local runService = game:GetService("RunService")
local corePackagesService = game:GetService("CorePackages")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local t = inGameMenuDependenciesModule.t
local assetsModule = require(script.Parent.Parent.Parent.Resources.Assets)
local imageSetLabel = inGameMenuDependenciesModule.UIBlox.Core.ImageSet.ImageSetLabel
local image = require(corePackagesService.Packages.Foundation).Image
local fFlagCoreUiMigrateUIBloxToFoundation = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
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

local function _(p1)
	return if p1 > 0.75 then 8 elseif p1 > 0.5 then 6 elseif p1 > 0.25 then 4 elseif p1 > 0 then 2 else 0
end

local _ = function(p1, p2, p3)
	return (p1 - p2 / 30) / ((p3 - p2) / 30)
end

local _ = function(p1, p2, p3)
	return p2 / 30 <= p1 and p1 <= p3 / 30
end

local function largerCircleAnimation(p1, p2, p3, p4)
	if p3 then
		p1 = 0.266666666667 - p1
	end
	local var1 = p1
	
	if var1 >= 0 and var1 <= 0.166666666667 then
		local var2 = 16 + 6 * ((p1 - 0) / 0.166666666667)
		p2.size(UDim2.new(0, var2, 0, var2))
		
		return
	end
	local var3 = p1
	
	if var3 >= 0.166666666667 and var3 <= 0.266666666667 then
		local var4 = 22 - 2 * ((p1 - 0.166666666667) / 0.1)
		p2.size(UDim2.new(0, var4, 0, var4))
		
		return
	elseif p1 < 0 then
		p2.size(UDim2.new(0, 16, 0, 16))
		p4()
		
		return
	end
	p2.size(UDim2.new(0, 20, 0, 20))
	p4()
end

local function popCircleAnimation(p1, p2, _, p3)
	if p1 >= 0 and p1 <= 0.1 then
		local var1 = 20 + 4 * ((p1 - 0) / 0.1)
		p2.size(UDim2.new(0, var1, 0, var1))
		
		return
	elseif p1 >= 0.1 and p1 <= 0.2 then
		local var2 = 24 - 4 * ((p1 - 0.1) / 0.1)
		p2.size(UDim2.new(0, var2, 0, var2))
		
		return
	end
	p2.size(UDim2.new(0, 20, 0, 20))
	p3()
end

local function shakeCircleAnimation(p1, p2, _, p3)
	if p1 >= 0 and p1 <= 0.1 then
		p2.positionOffset(UDim2.new(0, -4 * ((p1 - 0) / 0.1), 0, 0))
		
		return
	elseif p1 >= 0.1 and p1 <= 0.2 then
		p2.positionOffset(UDim2.new(0, -4 + 12 * ((p1 - 0.1) / 0.1), 0, 0))
		
		return
	elseif p1 >= 0.2 and p1 <= 0.266666666667 then
		p2.positionOffset(UDim2.new(0, 8 - 16 * ((p1 - 0.2) / 0.066666666667), 0, 0))
		
		return
	elseif p1 >= 0.266666666667 and p1 <= 0.333333333333 then
		p2.positionOffset(UDim2.new(0, -8 + 16 * ((p1 - 0.266666666667) / 0.066666666667), 0, 0))
		
		return
	elseif p1 >= 0.333333333333 and p1 <= 0.4 then
		p2.positionOffset(UDim2.new(0, 8 - 16 * ((p1 - 0.333333333333) / 0.066666666667), 0, 0))
		
		return
	elseif p1 >= 0.4 and p1 <= 0.466666666667 then
		p2.positionOffset(UDim2.new(0, -8 + 8 * ((p1 - 0.4) / 0.066666666667), 0, 0))
		
		return
	end
	p2.positionOffset(UDim2.new(0, 0, 0, 0))
	p3()
end

function fillCircle.init(p1)
	-- upvalues: roact (ref)
	local var1, var2 = roact.createBinding(UDim2.new(0, 16, 0, 16))
	p1.sizeBinding = var1
	p1.sizeBindingUpdate = var2
	p1.largerSizeBinding = p1.sizeBinding:map(function(p2)
		return p2 + UDim2.new(0, 2, 0, 2)
	end)
	local var3, var4 = roact.createBinding(UDim2.new(0, 0, 0, 0))
	p1.positionOffsetBinding = var3
	p1.positionOffsetBindingUpdate = var4
	p1.updateBindings = {
		size = p1.sizeBindingUpdate,
		positionOffset = p1.positionOffsetBindingUpdate
	}
	p1.animationStartTime = nil
	p1.animationFunction = nil
	p1.reverseAnimation = false
	p1.renderSteppedConnection = nil
end

function fillCircle.render(p1)
	-- upvalues: color_2 (ref), color_1 (ref), roact (ref), color (ref), fFlagCoreUiMigrateUIBloxToFoundation (ref), image (ref), assetsModule (ref), imageSetLabel (ref)
	local props = p1.props
	local var1 = if props.fillFraction >= 1 then color_2 else color_1
	local createElement = roact.createElement
	local var2 = "Frame"
	local t = {
		BackgroundTransparency = 1,
		Size = p1.sizeBinding,
		Position = props.Position,
		AnchorPoint = props.AnchorPoint
	}
	local t_1 = {}
	local createElement_1 = roact.createElement
	local var3 = "Frame"
	local t_2 = {
		BorderSizePixel = 0,
		Position = p1.positionOffsetBinding,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = color
	}
	local t_3 = {
		OuterRing = if fFlagCoreUiMigrateUIBloxToFoundation then roact.createElement(image, {
			ZIndex = 10,
			Image = assetsModule.Images.CircleCutout,
			Size = UDim2.new(1, 0, 1, 0),
			imageStyle = { Transparency = 0, Color3 = props.BackgroundColor }
		}) else roact.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			ZIndex = 10,
			Image = assetsModule.Images.CircleCutout,
			Size = UDim2.new(1, 0, 1, 0),
			ImageColor3 = props.BackgroundColor
		}),
		InnerRing = if fFlagCoreUiMigrateUIBloxToFoundation then roact.createElement(image, {
			ZIndex = 10,
			Image = assetsModule.Images.Circle,
			Size = UDim2.new(1, -4, 1, -4),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			imageStyle = { Transparency = 0, Color3 = props.BackgroundColor }
		}) else roact.createElement(imageSetLabel, {
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
	local var4 = "Frame"
	local t_4 = {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 0, 0, 0),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Rotation = props.fillFraction * 360
	}
	local fillFraction = props.fillFraction
	t_4.ZIndex = if fillFraction > 0.75 then 8 elseif fillFraction > 0.5 then 6 elseif fillFraction > 0.25 then 4 elseif fillFraction > 0 then 2 else 0
	t_3.FillRingRotationFrame = createElement_2(var4, t_4, {
		FillRing = if fFlagCoreUiMigrateUIBloxToFoundation then roact.createElement(image, {
			Image = assetsModule.Images.QuarterCircle,
			Size = p1.largerSizeBinding,
			AnchorPoint = Vector2.new(0.5, 0.5),
			imageStyle = { Transparency = 0, Color3 = var1 }
		}) else roact.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			Image = assetsModule.Images.QuarterCircle,
			Size = p1.largerSizeBinding,
			AnchorPoint = Vector2.new(0.5, 0.5),
			ImageColor3 = var1
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
		BackgroundColor3 = if props.fillFraction >= 1 then var1 else color,
		ZIndex = if props.fillFraction >= 1 then 9 else 7
	})
	t_3.BottomLeftFill = roact.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(0.5, 0, 0.5, 0),
		Position = UDim2.new(0, 0, 0.5, 0),
		BackgroundColor3 = if props.fillFraction >= 0.75 then var1 else color,
		ZIndex = if props.fillFraction >= 0.75 then 9 else 5
	})
	t_3.BottomRightFill = roact.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(0.5, 0, 0.5, 0),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		BackgroundColor3 = if props.fillFraction >= 0.5 then var1 else color,
		ZIndex = if props.fillFraction >= 0.5 then 9 else 3
	})
	t_3.TopRightFill = roact.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(0.5, 0, 0.5, 0),
		Position = UDim2.new(0.5, 0, 0, 0),
		BackgroundColor3 = if props.fillFraction >= 0.25 then var1 else color,
		ZIndex = if props.fillFraction >= 0.25 then 9 else 1
	})
	t_1.PositionOffsetFrame = createElement_1(var3, t_2, t_3)
	
	return createElement(var2, t, t_1)
end

function fillCircle.didUpdate(p1, p2, _)
	-- upvalues: largerCircleAnimation (ref), popCircleAnimation (ref), shakeCircleAnimation (ref)
	local var1 = p1.props.largerCircleFraction <= p1.props.fillFraction
	
	if p2.largerCircleFraction <= p2.fillFraction ~= var1 then
		p1:playAnimation(largerCircleAnimation, not var1)
	end
	if p1.props.popCircleFraction <= p1.props.fillFraction and not (p2.popCircleFraction <= p2.fillFraction) then
		p1:playAnimation(popCircleAnimation, false)
	end
	if p1.props.shakeCircleFraction <= p1.props.fillFraction and not (p2.shakeCircleFraction <= p2.fillFraction) then
		p1:playAnimation(shakeCircleAnimation, false)
	end
end

function fillCircle.playAnimation(p1, p2, p3)
	-- upvalues: runService (ref)
	if p1.animationFunction then
		p1.animationFunction(100, p1.updateBindings, p1.reverseAnimation, function() end)
	end
	p1.animationStartTime = tick()
	p1.animationFunction = p2
	p1.reverseAnimation = p3
	
	if not p1.renderSteppedConnection then
		p1.renderSteppedConnection = runService.RenderStepped:Connect(function()
			-- upvalues: p1 (ref)
			p1.animationFunction(tick() - p1.animationStartTime, p1.updateBindings, p1.reverseAnimation, function()
				-- upvalues: p1 (copy)
				p1:stopAnimation()
			end)
		end)
	end
end

function fillCircle.stopAnimation(p1)
	if p1.renderSteppedConnection then
		p1.renderSteppedConnection:Disconnect()
		p1.renderSteppedConnection = nil
	end
end

function fillCircle.willUnmount(p1)
	p1:stopAnimation()
end

return fillCircle