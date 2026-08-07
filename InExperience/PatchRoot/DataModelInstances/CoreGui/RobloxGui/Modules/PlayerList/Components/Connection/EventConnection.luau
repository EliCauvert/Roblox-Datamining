local eventConnection = require(game:GetService("CorePackages").Packages.Roact).Component:extend("EventConnection")

function eventConnection.init(p0) --[[ line: 7 ]]
	p0.connection = nil
end

function eventConnection.didMount(p1) --[[ line: 11 ]]
	p1.connection = p1.props.event:Connect(p1.props.callback)
end

function eventConnection.render(_) --[[ line: 15 ]]
	return nil
end

function eventConnection.didUpdate(p2, p3) --[[ line: 19 ]]
	if p2.props.event ~= p3.event or p2.props.callback ~= p3.callback then
		p2.connection:Disconnect()
		p2.connection = p2.props.event:Connect(p2.props.callback)
	end
end

function eventConnection.willUnmount(p4) --[[ line: 27 ]]
	if p4.connection then
		p4.connection:Disconnect()
		p4.connection = nil
	end
end

return eventConnection