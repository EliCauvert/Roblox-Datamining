local MomentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local _ = require(MomentsCreationFlow.Enums.CreationFlowState)

return require(MomentsCreationFlow.Parent.Rodux).makeActionCreator(script.Name, function(CurrentState)
	return { currentState = CurrentState }
end)