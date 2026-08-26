local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local eventConnection = roactModule.Component:extend("EventConnection")

function eventConnection.init(p1)
	p1.connection = nil
end

function eventConnection.render(p1)
	-- upvalues: roactModule (ref)
	return roactModule.oneChild(p1.props[roactModule.Children])
end

function eventConnection.didMount(p1)
	p1.connection = p1.props.event:Connect(p1.props.callback)
end

function eventConnection.didUpdate(p1, p2)
	if p1.props.event ~= p2.event or p1.props.callback ~= p2.callback then
		p1.connection:Disconnect()
		p1.connection = p1.props.event:Connect(p1.props.callback)
	end
end

function eventConnection.willUnmount(p1)
	if p1.connection then
		p1.connection:Disconnect()
		p1.connection = nil
	end
end

return eventConnection