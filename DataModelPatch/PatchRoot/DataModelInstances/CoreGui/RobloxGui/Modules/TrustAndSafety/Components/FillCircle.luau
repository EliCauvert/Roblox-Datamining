local RunService = game:GetService("RunService")
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local TModule = require(CorePackages.Packages.t)
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local _Color3 = Color3.fromRGB(98, 98, 99)
local _Color3_1 = Color3.fromRGB(255, 255, 255)
local _Color3_2 = Color3.fromRGB(196, 0, 1)
local ComponentAssetsCircle29 = UIBloxModule.App.ImageSet.Images["component_assets/circle_29"]
local FillCircle = RoactModule.PureComponent:extend("FillCircle")
FillCircle.validateProps = TModule.strictInterface({
	Position = TModule.UDim2,
	AnchorPoint = TModule.Vector2,
	fillFraction = TModule.number,
	largerCircleFraction = TModule.number,
	popCircleFraction = TModule.number,
	shakeCircleFraction = TModule.number,
	BackgroundColor = TModule.Color3
})

local function _(p1: number): number
	return if p1 > 0.75 then 8 elseif p1 > 0.5 then 6 elseif p1 > 0.25 then 4 elseif p1 > 0 then 2 else 0
end

local _ = function(p1, p2: number, p3: number): number
	return (p1 - p2 / 30) / ((p3 - p2) / 30)
end

local _ = function(p1, p2: number, p3: number): boolean
	return p2 / 30 <= p1 and p1 <= p3 / 30
end

local function largerCircleAnimation(p1: number, p2, p3, Callback: () -> ())
	if p3 then
		p1 = 0.26666666666666666 - p1
	end
	if p1 >= 0 and p1 <= 0.16666666666666666 then
		local XOffset = 16 + 6 * ((p1 - 0) / 0.16666666666666666)
		p2.size(UDim2.new(0, XOffset, 0, XOffset))
		
		return
	end
	if p1 >= 0.16666666666666666 and p1 <= 0.26666666666666666 then
		local XOffset1 = 22 - 2 * ((p1 - 0.16666666666666666) / 0.1)
		p2.size(UDim2.new(0, XOffset1, 0, XOffset1))
		
		return
	end
	if p1 < 0 then
		p2.size(UDim2.new(0, 16, 0, 16))
		Callback()
		
		return
	else
		p2.size(UDim2.new(0, 20, 0, 20))
		Callback()
	end
end

local function popCircleAnimation(p1: number, p2, _, Callback: () -> ())
	if p1 >= 0 and p1 <= 0.1 then
		local XOffset = 20 + 4 * ((p1 - 0) / 0.1)
		p2.size(UDim2.new(0, XOffset, 0, XOffset))
		
		return
	end
	if p1 >= 0.1 and p1 <= 0.2 then
		local XOffset1 = 24 - 4 * ((p1 - 0.1) / 0.1)
		p2.size(UDim2.new(0, XOffset1, 0, XOffset1))
		
		return
	else
		p2.size(UDim2.new(0, 20, 0, 20))
		Callback()
	end
end

local function shakeCircleAnimation(p1: number, p2, _, Callback: () -> ())
	if p1 >= 0 and p1 <= 0.1 then
		p2.positionOffset(UDim2.new(0, -4 * ((p1 - 0) / 0.1), 0, 0))
		
		return
	end
	if p1 >= 0.1 and p1 <= 0.2 then
		p2.positionOffset(UDim2.new(0, -4 + 12 * ((p1 - 0.1) / 0.1), 0, 0))
		
		return
	end
	if p1 >= 0.2 and p1 <= 0.26666666666666666 then
		p2.positionOffset(UDim2.new(0, 8 - 16 * ((p1 - 0.2) / 0.06666666666666667), 0, 0))
		
		return
	end
	if p1 >= 0.26666666666666666 and p1 <= 0.3333333333333333 then
		p2.positionOffset(UDim2.new(0, -8 + 16 * ((p1 - 0.26666666666666666) / 0.06666666666666667), 0, 0))
		
		return
	end
	if p1 >= 0.3333333333333333 and p1 <= 0.4 then
		p2.positionOffset(UDim2.new(0, 8 - 16 * ((p1 - 0.3333333333333333) / 0.06666666666666667), 0, 0))
		
		return
	end
	if p1 >= 0.4 and p1 <= 0.4666666666666667 then
		p2.positionOffset(UDim2.new(0, -8 + 8 * ((p1 - 0.4) / 0.06666666666666667), 0, 0))
		
		return
	else
		p2.positionOffset(UDim2.new(0, 0, 0, 0))
		Callback()
	end
end

function FillCircle.init(p1)
	-- upvalues: RoactModule (copy)
	p1.sizeBinding, p1.sizeBindingUpdate = RoactModule.createBinding(UDim2.new(0, 16, 0, 16))
	p1.largerSizeBinding = p1.sizeBinding:map(function(p2): UDim2
		return p2 + UDim2.new(0, 2, 0, 2)
	end)
	p1.positionOffsetBinding, p1.positionOffsetBindingUpdate = RoactModule.createBinding(UDim2.new(0, 0, 0, 0))
	p1.updateBindings = {
		size = p1.sizeBindingUpdate,
		positionOffset = p1.positionOffsetBindingUpdate
	}
	p1.animationStartTime = nil
	p1.animationFunction = nil
	p1.reverseAnimation = false
	p1.renderSteppedConnection = nil
end

function FillCircle.render(p1)
	-- upvalues: _Color3_2 (copy), _Color3_1 (copy), RoactModule (copy), _Color3 (copy), ImageSetLabel (copy), ComponentAssetsCircle29 (copy)
	local Props = p1.props
	local _Color3_2_1 = Props.fillFraction >= 1 and _Color3_2 or _Color3_1
	local FillFraction: number = Props.fillFraction
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = p1.sizeBinding,
		Position = Props.Position,
		AnchorPoint = Props.AnchorPoint
	}, {
		PositionOffsetFrame = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Position = p1.positionOffsetBinding,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = _Color3
		}, {
			OuterRing = RoactModule.createElement(ImageSetLabel, {
				Image = "rbxasset://textures/ui/InGameMenu/CircleCutout.png",
				BackgroundTransparency = 1,
				ZIndex = 10,
				Size = UDim2.new(1, 0, 1, 0),
				ImageColor3 = Props.BackgroundColor
			}),
			InnerRing = RoactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				ZIndex = 10,
				Image = ComponentAssetsCircle29,
				Size = UDim2.new(1, -4, 1, -4),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				ImageColor3 = Props.BackgroundColor
			}),
			FillRingRotationFrame = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0, 0, 0, 0),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				Rotation = Props.fillFraction * 360,
				ZIndex = if FillFraction > 0.75 then 8 elseif FillFraction > 0.5 then 6 elseif FillFraction > 0.25 then 4 elseif FillFraction > 0 then 2 else 0
			}, {
				FillRing = RoactModule.createElement(ImageSetLabel, {
					Image = "rbxasset://textures/ui/InGameMenu/QuarterCircle.png",
					BackgroundTransparency = 1,
					Size = p1.largerSizeBinding,
					AnchorPoint = Vector2.new(0.5, 0.5),
					ImageColor3 = _Color3_2_1
				})
			}),
			EdgeBlockers = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 10,
				Size = UDim2.new(1, 0, 1, 0)
			}, {
				Top = RoactModule.createElement("Frame", {
					BorderSizePixel = 0,
					AnchorPoint = Vector2.new(0.5, 1),
					Position = UDim2.new(0.5, 0, 0, 0),
					Size = UDim2.new(1, 4, 0, 2),
					BackgroundColor3 = Props.BackgroundColor
				}),
				Right = RoactModule.createElement("Frame", {
					BorderSizePixel = 0,
					AnchorPoint = Vector2.new(0, 0.5),
					Position = UDim2.new(1, 0, 0.5, 0),
					Size = UDim2.new(0, 2, 1, 4),
					BackgroundColor3 = Props.BackgroundColor
				}),
				Bottom = RoactModule.createElement("Frame", {
					BorderSizePixel = 0,
					AnchorPoint = Vector2.new(0.5, 0),
					Position = UDim2.new(0.5, 0, 1, 0),
					Size = UDim2.new(1, 4, 0, 2),
					BackgroundColor3 = Props.BackgroundColor
				}),
				Left = RoactModule.createElement("Frame", {
					BorderSizePixel = 0,
					AnchorPoint = Vector2.new(1, 0.5),
					Position = UDim2.new(0, 0, 0.5, 0),
					Size = UDim2.new(0, 2, 1, 4),
					BackgroundColor3 = Props.BackgroundColor
				})
			}),
			TopLeftFill = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(0.5, 0, 0.5, 0),
				BackgroundColor3 = Props.fillFraction >= 1 and _Color3_2_1 or _Color3,
				ZIndex = if Props.fillFraction >= 1 then 9 else 7
			}),
			BottomLeftFill = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(0.5, 0, 0.5, 0),
				Position = UDim2.new(0, 0, 0.5, 0),
				BackgroundColor3 = Props.fillFraction >= 0.75 and _Color3_2_1 or _Color3,
				ZIndex = if Props.fillFraction >= 0.75 then 9 else 5
			}),
			BottomRightFill = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(0.5, 0, 0.5, 0),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				BackgroundColor3 = Props.fillFraction >= 0.5 and _Color3_2_1 or _Color3,
				ZIndex = if Props.fillFraction >= 0.5 then 9 else 3
			}),
			TopRightFill = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(0.5, 0, 0.5, 0),
				Position = UDim2.new(0.5, 0, 0, 0),
				BackgroundColor3 = Props.fillFraction >= 0.25 and _Color3_2_1 or _Color3,
				ZIndex = if Props.fillFraction >= 0.25 then 9 else 1
			})
		})
	})
end

function FillCircle.didUpdate(p1, p2, _)
	-- upvalues: largerCircleAnimation (copy), popCircleAnimation (copy), shakeCircleAnimation (copy)
	local IsFillFractionAbove = p1.props.fillFraction >= p1.props.largerCircleFraction
	
	if p2.largerCircleFraction <= p2.fillFraction ~= IsFillFractionAbove then
		p1:playAnimation(largerCircleAnimation, not IsFillFractionAbove)
	end
	local IsPopCircleFractionBelow = p2.popCircleFraction <= p2.fillFraction
	
	if p1.props.fillFraction >= p1.props.popCircleFraction and not IsPopCircleFractionBelow then
		p1:playAnimation(popCircleAnimation, false)
	end
	local IsShakeCircleFractionBelow = p2.shakeCircleFraction <= p2.fillFraction
	
	if p1.props.fillFraction >= p1.props.shakeCircleFraction and not IsShakeCircleFractionBelow then
		p1:playAnimation(shakeCircleAnimation, false)
	end
end

function FillCircle.playAnimation(p1, AnimationFunction, ReverseAnimation)
	-- upvalues: RunService (copy)
	if p1.animationFunction then
		p1.animationFunction(100, p1.updateBindings, p1.reverseAnimation, function() end)
	end
	p1.animationStartTime = tick()
	p1.animationFunction = AnimationFunction
	p1.reverseAnimation = ReverseAnimation
	
	if not p1.renderSteppedConnection then
		p1.renderSteppedConnection = RunService.RenderStepped:Connect(function()
			-- upvalues: p1 (copy)
			p1.animationFunction(tick() - p1.animationStartTime, p1.updateBindings, p1.reverseAnimation, function()
				-- upvalues: p1 (upval)
				p1:stopAnimation()
			end)
		end)
	end
end

function FillCircle.stopAnimation(p1)
	if p1.renderSteppedConnection then
		p1.renderSteppedConnection:Disconnect()
		p1.renderSteppedConnection = nil
	end
end

function FillCircle.willUnmount(p1)
	p1:stopAnimation()
end

return FillCircle