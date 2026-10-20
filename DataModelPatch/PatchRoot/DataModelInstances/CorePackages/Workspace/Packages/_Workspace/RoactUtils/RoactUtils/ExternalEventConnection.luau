local Parent = script:FindFirstAncestor("RoactUtils").Parent
local ReactUtilsModule = require(Parent.ReactUtils)

if require(Parent.SharedFlags).GetFFlagMigrateRoactUtilsToReactUtils() then
	return ReactUtilsModule.EventConnection
else
	local RoactModule = require(Parent.Roact)
	local ExternalEventConnection = RoactModule.Component:extend("ExternalEventConnection")
	
	function ExternalEventConnection.init(p1)
		p1.connection = nil
	end
	
	function ExternalEventConnection.render(p1)
		-- upvalues: RoactModule (copy)
		return RoactModule.oneChild(p1.props[RoactModule.Children])
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
end