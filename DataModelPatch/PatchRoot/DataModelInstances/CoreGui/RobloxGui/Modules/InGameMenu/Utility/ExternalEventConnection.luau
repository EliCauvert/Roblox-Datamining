local Roact = require(game:GetService("CorePackages").Packages.InGameMenuDependencies).Roact
local ExternalEventConnection = Roact.Component:extend("ExternalEventConnection")

function ExternalEventConnection.init(p1)
	p1.connection = nil
end

function ExternalEventConnection.render(p1)
	-- upvalues: Roact (copy)
	return Roact.oneChild(p1.props[Roact.Children])
end

function ExternalEventConnection.didMount(p1)
	p1.connection = p1.props.event:Connect(p1.props.callback)
end

function ExternalEventConnection.didUpdate(p1, p2)
	if p1.props.event ~= p2.event or p1.props.callback ~= p2.callback then
		p1.connection:Disconnect()
		p1.connection = p1.props.event:Connect(p1.props.callback)
	end
end

function ExternalEventConnection.willUnmount(p1)
	if p1.connection then
		p1.connection:Disconnect()
		p1.connection = nil
	end
end

return ExternalEventConnection