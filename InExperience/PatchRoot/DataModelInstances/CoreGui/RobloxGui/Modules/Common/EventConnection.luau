local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local eventConnection = roactModule.Component:extend("EventConnection")

function eventConnection.init(p0)
	p0.connection = nil
end

function eventConnection.render(p1)
	-- upvalues: roactModule (ref)
	return roactModule.oneChild(p1.props[roactModule.Children])
end

function eventConnection.didMount(p2)
	p2.connection = p2.props.event:Connect(p2.props.callback)
end

function eventConnection.didUpdate(p3, p4)
	if p3.props.event ~= p4.event or p3.props.callback ~= p4.callback then
		p3.connection:Disconnect()
		p3.connection = p3.props.event:Connect(p3.props.callback)
	end
end

function eventConnection.willUnmount(p5)
	if p5.connection then
		p5.connection:Disconnect()
		p5.connection = nil
	end
end

return eventConnection