local momentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local parent = momentsCreationFlow.Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local creationFlowContextModule = require(momentsCreationFlow.Context.CreationFlowContext)

return function(p0)
	-- upvalues: reactModule (ref), creationFlowContextModule (ref), dashModule (ref)
	return reactModule.createElement(creationFlowContextModule.Provider, {
		value = dashModule.join(p0.value, {
			captures = p0.captures,
			exitCreationFlow = p0.exitCreationFlow
		})
	}, p0.children)
end