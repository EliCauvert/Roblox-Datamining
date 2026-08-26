local momentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local _ = require(momentsCreationFlow.Enums.CreationFlowState)

return require(momentsCreationFlow.Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return { currentState = p1 }
end)