local momentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local parent = momentsCreationFlow.Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local creationFlowContextModule = require(momentsCreationFlow.Context.CreationFlowContext)

return function(p1)
	-- upvalues: reactModule (ref), creationFlowContextModule (ref), dashModule (ref)
	return reactModule.createElement(creationFlowContextModule.Provider, {
		value = dashModule.join(p1.value, {
			captures = p1.captures,
			exitCreationFlow = p1.exitCreationFlow
		})
	}, p1.children)
end