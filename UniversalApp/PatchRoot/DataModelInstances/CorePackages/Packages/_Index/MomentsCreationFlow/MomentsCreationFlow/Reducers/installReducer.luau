local momentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local roduxModule = require(momentsCreationFlow.Parent.Rodux)
local creationFlowModule = require(momentsCreationFlow.Reducers.CreationFlow)
local musicModule = require(momentsCreationFlow.Reducers.Music)

return function() --[[ line: 14 ]]
	-- upvalues: roduxModule (ref), creationFlowModule (ref), musicModule (ref)
	return roduxModule.combineReducers({ CreationFlow = creationFlowModule, Music = musicModule })
end