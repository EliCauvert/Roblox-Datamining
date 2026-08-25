local contextActionService = game:GetService("ContextActionService")
local contextActionEvent = require(game:GetService("CorePackages").Packages.Roact).Component:extend("ContextActionEvent")

function contextActionEvent.render(_)
	return nil
end

function contextActionEvent.didMount(p0)
	-- upvalues: contextActionService (ref)
	if p0.props.actionPriority then
		contextActionService:BindCoreActionAtPriority(p0.props.name, p0.props.callback, false, 2000 + p0.props.actionPriority, unpack(p0.props.binds))
		
		return
	end
	contextActionService:BindCoreAction(p0.props.name, p0.props.callback, false, unpack(p0.props.binds))
end

function contextActionEvent.didUpdate(p1, p2)
	-- upvalues: contextActionService (ref)
	if p1.props.callback ~= p2.callback or p1.props.name ~= p2.name then
		contextActionService:UnbindCoreAction(p2.name)
		
		if p1.props.actionPriority then
			contextActionService:BindCoreActionAtPriority(p1.props.name, p1.props.callback, false, 2000 + p1.props.actionPriority, unpack(p1.props.binds))
			
			return
		end
		contextActionService:BindCoreAction(p1.props.name, p1.props.callback, false, unpack(p1.props.binds))
	end
end

function contextActionEvent.willUnmount(p3)
	-- upvalues: contextActionService (ref)
	contextActionService:UnbindCoreAction(p3.props.name)
end

return contextActionEvent