local MomentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local RoduxModule = require(MomentsCreationFlow.Parent.Rodux)
local CreationFlowModule = require(MomentsCreationFlow.Reducers.CreationFlow)
local MusicModule = require(MomentsCreationFlow.Reducers.Music)

return function()
	-- upvalues: RoduxModule (copy), CreationFlowModule (copy), MusicModule (copy)
	return RoduxModule.combineReducers({ CreationFlow = CreationFlowModule, Music = MusicModule })
end