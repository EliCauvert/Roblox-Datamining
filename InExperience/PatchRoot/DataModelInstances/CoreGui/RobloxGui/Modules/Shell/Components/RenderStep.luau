local runService = game:GetService("RunService")
local renderStep = require(game:GetService("CorePackages").Packages.Roact).Component:extend("RenderStep")

function renderStep.render(_)
	return nil
end

function renderStep.didMount(p1)
	-- upvalues: runService (ref)
	runService:BindToRenderStep(p1.props.name, p1.props.priority, p1.props.callback)
end

function renderStep.didUpdate(p1, p2)
	-- upvalues: runService (ref)
	if p1.props.callback ~= p2.callback or p1.props.name ~= p2.name then
		runService:UnbindFromRenderStep(p2.name)
		runService:BindToRenderStep(p1.props.name, p1.props.priority, p1.props.callback)
	end
end

function renderStep.willUnmount(p1)
	-- upvalues: runService (ref)
	runService:UnbindFromRenderStep(p1.props.name)
end

return renderStep