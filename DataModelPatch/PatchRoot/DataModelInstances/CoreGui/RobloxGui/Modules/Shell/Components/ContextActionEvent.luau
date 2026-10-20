local ContextActionService = game:GetService("ContextActionService")
local ContextActionEvent = require(game:GetService("CorePackages").Packages.Roact).Component:extend("ContextActionEvent")

function ContextActionEvent:render()
	return nil
end

function ContextActionEvent.didMount(p1)
	-- upvalues: ContextActionService (copy)
	if p1.props.actionPriority then
		ContextActionService:BindCoreActionAtPriority(p1.props.name, p1.props.callback, false, 2000 + p1.props.actionPriority, unpack(p1.props.binds))
		
		return
	else
		ContextActionService:BindCoreAction(p1.props.name, p1.props.callback, false, unpack(p1.props.binds))
	end
end

function ContextActionEvent.didUpdate(p1, p2)
	-- upvalues: ContextActionService (copy)
	if p1.props.callback ~= p2.callback or p1.props.name ~= p2.name then
		ContextActionService:UnbindCoreAction(p2.name)
		
		if p1.props.actionPriority then
			ContextActionService:BindCoreActionAtPriority(p1.props.name, p1.props.callback, false, 2000 + p1.props.actionPriority, unpack(p1.props.binds))
			
			return
		end
		ContextActionService:BindCoreAction(p1.props.name, p1.props.callback, false, unpack(p1.props.binds))
	end
end

function ContextActionEvent.willUnmount(p1)
	-- upvalues: ContextActionService (copy)
	ContextActionService:UnbindCoreAction(p1.props.name)
end

return ContextActionEvent