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

function spinningImage.init(p0) --[[ line: 25 ]]
	-- upvalues: roactModule (ref)
	local var4, var5 = roactModule.createBinding(0)
	p0.angle = var4
	p0.updateAngle = var5
end

function spinningImage.didMount(p1) --[[ line: 29 ]]
	-- upvalues: runService (ref)
	p1.heartbeatConnection = runService.Heartbeat:Connect(function(p2) --[[ line: 30 ]]
		-- upvalues: p1 (ref)
		local var6 = p1.angle:getValue() + p1.props.rotationRate * p2
		
		if var6 > 360 then
			var6 -= 360
		elseif var6 < 0 then
			var6 += 360
		end
		p1.updateAngle(var6)
	end)
end

function spinningImage.willUnmount(p3) --[[ line: 41 ]]
	p3.heartbeatConnection:Disconnect()
end

function spinningImage.getDerivedStateFromProps(p4, _) --[[ line: 45 ]]
	local imageRectSize = p4.image.ImageRectSize
	
	return {
		size = p4.size or UDim2.fromOffset(imageRectSize.X, imageRectSize.Y)
	}
end

function spinningImage.render(p5) --[[ line: 52 ]]
	-- upvalues: roactModule (ref), label (ref)
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = p5.state.size,
		AnchorPoint = p5.props.anchorPoint,
		Position = p5.props.position
	}, {
		inner = roactModule.createElement(label, {
			BackgroundTransparency = 1,
			Size = p5.state.size,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Image = p5.props.image,
			Rotation = p5.angle
		})
	})
end

return spinningImage