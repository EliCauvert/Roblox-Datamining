local RunService = game:GetService("RunService")
local RenderStep = require(game:GetService("CorePackages").Packages.Roact).Component:extend("RenderStep")

function RenderStep:render()
	return nil
end

function RenderStep.didMount(p1)
	-- upvalues: RunService (copy)
	RunService:BindToRenderStep(p1.props.name, p1.props.priority, p1.props.callback)
end

function RenderStep.didUpdate(p1, p2)
	-- upvalues: RunService (copy)
	if p1.props.callback ~= p2.callback or p1.props.name ~= p2.name then
		RunService:UnbindFromRenderStep(p2.name)
		RunService:BindToRenderStep(p1.props.name, p1.props.priority, p1.props.callback)
	end
end

function RenderStep.willUnmount(p1)
	-- upvalues: RunService (copy)
	RunService:UnbindFromRenderStep(p1.props.name)
end

return RenderStep