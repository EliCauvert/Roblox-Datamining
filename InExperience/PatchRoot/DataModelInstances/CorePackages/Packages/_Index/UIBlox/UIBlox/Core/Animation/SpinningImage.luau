local runService = game:GetService("RunService")
local parent = script.Parent.Parent.Parent
local roactModule = require(parent.Parent.Roact)
local tModule = require(parent.Parent.t)
local label = require(parent.Core.ImageSet.ImageSetComponent).Label
local spinningImage = roactModule.PureComponent:extend("SpinningImage")
spinningImage.validateProps = tModule.strictInterface({
	image = tModule.table,
	size = tModule.optional(tModule.UDim2),
	anchorPoint = tModule.optional(tModule.Vector2),
	position = tModule.optional(tModule.union(tModule.UDim2, tModule.table)),
	rotationRate = tModule.optional(tModule.number)
})
spinningImage.defaultProps = { rotationRate = 360 }

function spinningImage.init(p1)
	-- upvalues: roactModule (ref)
	local var1, var2 = roactModule.createBinding(0)
	p1.angle = var1
	p1.updateAngle = var2
end

function spinningImage.didMount(p1)
	-- upvalues: runService (ref)
	p1.heartbeatConnection = runService.Heartbeat:Connect(function(p2)
		-- upvalues: p1 (ref)
		local var1 = p1.angle:getValue() + p1.props.rotationRate * p2
		
		if var1 > 360 then
			var1 -= 360
		elseif var1 < 0 then
			var1 += 360
		end
		p1.updateAngle(var1)
	end)
end

function spinningImage.willUnmount(p1)
	p1.heartbeatConnection:Disconnect()
end

function spinningImage.getDerivedStateFromProps(p1, _)
	local imageRectSize = p1.image.ImageRectSize
	
	return {
		size = p1.size or UDim2.fromOffset(imageRectSize.X, imageRectSize.Y)
	}
end

function spinningImage.render(p1)
	-- upvalues: roactModule (ref), label (ref)
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = p1.state.size,
		AnchorPoint = p1.props.anchorPoint,
		Position = p1.props.position
	}, {
		inner = roactModule.createElement(label, {
			BackgroundTransparency = 1,
			Size = p1.state.size,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Image = p1.props.image,
			Rotation = p1.angle
		})
	})
end

return spinningImage