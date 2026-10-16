local RunService = game:GetService("RunService")
local Parent = script.Parent.Parent.Parent
local RoactModule = require(Parent.Parent.Roact)
local TModule = require(Parent.Parent.t)
local Label = require(Parent.Core.ImageSet.ImageSetComponent).Label
local SpinningImage = RoactModule.PureComponent:extend("SpinningImage")
SpinningImage.validateProps = TModule.strictInterface({
	image = TModule.table,
	size = TModule.optional(TModule.UDim2),
	anchorPoint = TModule.optional(TModule.Vector2),
	position = TModule.optional(TModule.union(TModule.UDim2, TModule.table)),
	rotationRate = TModule.optional(TModule.number)
})
SpinningImage.defaultProps = { rotationRate = 360 }

function SpinningImage.init(p1) --[[ Line: 25 ]]
	-- upvalues: RoactModule (copy)
	p1.angle, p1.updateAngle = RoactModule.createBinding(0)
end

function SpinningImage.didMount(p1) --[[ Line: 29 ]]
	-- upvalues: RunService (copy)
	p1.heartbeatConnection = RunService.Heartbeat:Connect(function(DeltaTime) --[[ Line: 30 ]]
		-- upvalues: p1 (copy)
		local NewValue = p1.angle:getValue() + p1.props.rotationRate * DeltaTime
		
		if NewValue > 360 then
			NewValue -= 360
		elseif NewValue < 0 then
			NewValue += 360
		end
		p1.updateAngle(NewValue)
	end)
end

function SpinningImage.willUnmount(p1) --[[ Line: 41 ]]
	p1.heartbeatConnection:Disconnect()
end

function SpinningImage.getDerivedStateFromProps(p1, _) --[[ Line: 45 ]]
	local ImageRectSize = p1.image.ImageRectSize
	
	return {
		size = p1.size or UDim2.fromOffset(ImageRectSize.X, ImageRectSize.Y)
	}
end

function SpinningImage.render(p1) --[[ Line: 52 ]]
	-- upvalues: RoactModule (copy), Label (copy)
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = p1.state.size,
		AnchorPoint = p1.props.anchorPoint,
		Position = p1.props.position
	}, {
		inner = RoactModule.createElement(Label, {
			BackgroundTransparency = 1,
			Size = p1.state.size,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Image = p1.props.image,
			Rotation = p1.angle
		})
	})
end

return SpinningImage