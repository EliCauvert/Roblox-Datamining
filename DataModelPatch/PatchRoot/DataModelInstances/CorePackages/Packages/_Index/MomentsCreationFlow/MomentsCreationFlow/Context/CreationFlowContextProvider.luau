local MomentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local Parent = MomentsCreationFlow.Parent
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local CreationFlowContextModule = require(MomentsCreationFlow.Context.CreationFlowContext)

return function(p1)
	-- upvalues: ReactModule (copy), CreationFlowContextModule (copy), DashModule (copy)
	return ReactModule.createElement(CreationFlowContextModule.Provider, {
		value = DashModule.join(p1.value, {
			captures = p1.captures,
			exitCreationFlow = p1.exitCreationFlow
		})
	}, p1.children)
end