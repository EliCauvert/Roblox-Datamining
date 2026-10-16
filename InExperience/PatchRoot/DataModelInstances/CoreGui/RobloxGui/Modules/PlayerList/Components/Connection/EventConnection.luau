local EventConnection = require(game:GetService("CorePackages").Packages.Roact).Component:extend("EventConnection")

function EventConnection.init(p1) --[[ Line: 7 ]]
	p1.connection = nil
end

function EventConnection.didMount(p1) --[[ Line: 11 ]]
	p1.connection = p1.props.event:Connect(p1.props.callback)
end

function EventConnection:render() --[[ Line: 15 ]]
	return nil
end

function EventConnection.didUpdate(p1, p2) --[[ Line: 19 ]]
	if p1.props.event ~= p2.event or p1.props.callback ~= p2.callback then
		p1.connection:Disconnect()
		p1.connection = p1.props.event:Connect(p1.props.callback)
	end
end

function EventConnection.willUnmount(p1) --[[ Line: 27 ]]
	if p1.connection then
		p1.connection:Disconnect()
		p1.connection = nil
	end
end

return EventConnection