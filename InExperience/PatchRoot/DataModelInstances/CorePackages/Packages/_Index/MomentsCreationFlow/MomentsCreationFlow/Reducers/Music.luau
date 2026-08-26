local momentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local parent = momentsCreationFlow.Parent
local cryoModule = require(parent.Cryo)
local _ = require(parent.MomentsCommon)

return require(parent.Rodux).createReducer({}, {
	[require(momentsCreationFlow.Actions.CreationFlowMusicInfoRetrieved).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.union(p1, p2.musicInfos)
	end
})