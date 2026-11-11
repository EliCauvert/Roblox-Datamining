local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local EventConnection = RoactModule.Component:extend("EventConnection")

function EventConnection.init(p1)
	p1.connection = nil
end

function EventConnection.render(p1)
	-- upvalues: RoactModule (copy)
	return RoactModule.oneChild(p1.props[RoactModule.Children])
end

function EventConnection.didMount(p1)
	p1.connection = p1.props.event:Connect(p1.props.callback)
end

function EventConnection.didUpdate(p1, p2)
	if p1.props.event ~= p2.event or p1.props.callback ~= p2.callback then
		p1.connection:Disconnect()
		p1.connection = p1.props.event:Connect(p1.props.callback)
	end
end

function EventConnection.willUnmount(p1)
	if p1.connection then
		p1.connection:Disconnect()
		p1.connection = nil
	end
end

return EventConnection