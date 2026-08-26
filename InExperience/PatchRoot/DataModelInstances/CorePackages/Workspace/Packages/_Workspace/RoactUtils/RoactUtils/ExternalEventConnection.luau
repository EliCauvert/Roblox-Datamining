local parent = script:FindFirstAncestor("RoactUtils").Parent
local reactUtilsModule = require(parent.ReactUtils)

if require(parent.SharedFlags).GetFFlagMigrateRoactUtilsToReactUtils() then
	return reactUtilsModule.EventConnection
end
local roactModule = require(parent.Roact)
local externalEventConnection = roactModule.Component:extend("ExternalEventConnection")

function externalEventConnection.init(p1)
	p1.connection = nil
end

function externalEventConnection.render(p1)
	-- upvalues: roactModule (ref)
	return roactModule.oneChild(p1.props[roactModule.Children])
end

function externalEventConnection.didMount(p1)
	p1.connection = p1.props.event:Connect(p1.props.callback)
end

function externalEventConnection.didUpdate(p1, p2)
	if p1.props.event ~= p2.event or p1.props.callback ~= p2.callback then
		p1.connection:Disconnect()
		p1.connection = p1.props.event:Connect(p1.props.callback)
	end
end

function externalEventConnection.willUnmount(p1)
	if p1.connection then
		p1.connection:Disconnect()
		p1.connection = nil
	end
end

return externalEventConnection