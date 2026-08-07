local momentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local _ = require(momentsCreationFlow.Enums.CreationFlowState)

return require(momentsCreationFlow.Parent.Rodux).makeActionCreator(script.Name, function(p0) --[[ line: 12 ]]
	return { currentState = p0 }
end)