local parent = script:FindFirstAncestor("RoactUtils").Parent
local reactUtilsModule = require(parent.ReactUtils)

if require(parent.SharedFlags).GetFFlagMigrateRoactUtilsToReactUtils() then
	return reactUtilsModule.EventConnection
end
local roactModule = require(parent.Roact)
local externalEventConnection = roactModule.Component:extend("ExternalEventConnection")

function externalEventConnection.init(p0) --[[ line: 17 ]]
	p0.connection = nil
end

function externalEventConnection.render(p1) --[[ line: 34 ]]
	-- upvalues: roactModule (ref)
	return roactModule.oneChild(p1.props[roactModule.Children])
end

function externalEventConnection.didMount(p2) --[[ line: 38 ]]
	p2.connection = p2.props.event:Connect(p2.props.callback)
end

function externalEventConnection.didUpdate(p3, p4) --[[ line: 45 ]]
	if p3.props.event ~= p4.event or p3.props.callback ~= p4.callback then
		p3.connection:Disconnect()
		p3.connection = p3.props.event:Connect(p3.props.callback)
	end
end

function externalEventConnection.willUnmount(p5) --[[ line: 53 ]]
	if p5.connection then
		p5.connection:Disconnect()
		p5.connection = nil
	end
end

return externalEventConnection