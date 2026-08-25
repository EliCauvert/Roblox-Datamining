local roact = require(script:FindFirstAncestor("PurchasePrompt").Parent.PurchasePromptDeps).Roact
local externalEventConnection = roact.Component:extend("ExternalEventConnection")

function externalEventConnection.init(p0)
	p0.connection = nil
end

function externalEventConnection.render(p1)
	-- upvalues: roact (ref)
	return roact.oneChild(p1.props[roact.Children])
end

function externalEventConnection.didMount(p2)
	p2.connection = p2.props.event:Connect(p2.props.callback)
end

function externalEventConnection.didUpdate(p3, p4)
	if p3.props.event ~= p4.event or p3.props.callback ~= p4.callback then
		p3.connection:Disconnect()
		p3.connection = p3.props.event:Connect(p3.props.callback)
	end
end

function externalEventConnection.willUnmount(p5)
	if p5.connection then
		p5.connection:Disconnect()
		p5.connection = nil
	end
end

return externalEventConnection