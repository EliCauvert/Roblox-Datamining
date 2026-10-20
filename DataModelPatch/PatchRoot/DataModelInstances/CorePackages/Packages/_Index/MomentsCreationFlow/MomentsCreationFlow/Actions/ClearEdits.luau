local MomentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local _ = require(MomentsCreationFlow.Enums.CreationFlowState)

return require(MomentsCreationFlow.Parent.Rodux).makeActionCreator(script.Name, function(NewState)
	return { newState = NewState }
end)