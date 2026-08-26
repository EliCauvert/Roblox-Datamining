local contextActionService = game:GetService("ContextActionService")
local contextActionEvent = require(game:GetService("CorePackages").Packages.Roact).Component:extend("ContextActionEvent")

function contextActionEvent.render(_)
	return nil
end

function contextActionEvent.didMount(p1)
	-- upvalues: contextActionService (ref)
	if p1.props.actionPriority then
		contextActionService:BindCoreActionAtPriority(p1.props.name, p1.props.callback, false, 2000 + p1.props.actionPriority, unpack(p1.props.binds))
		
		return
	end
	contextActionService:BindCoreAction(p1.props.name, p1.props.callback, false, unpack(p1.props.binds))
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

function contextActionEvent.willUnmount(p1)
	-- upvalues: contextActionService (ref)
	contextActionService:UnbindCoreAction(p1.props.name)
end

return contextActionEvent