local MomentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local _ = require(MomentsCreationFlow.Enums.CreationFlowState)

return require(MomentsCreationFlow.Parent.Rodux).makeActionCreator(script.Name, function(CurrentState) --[[ Line: 12 ]]
	return { currentState = CurrentState }
end)