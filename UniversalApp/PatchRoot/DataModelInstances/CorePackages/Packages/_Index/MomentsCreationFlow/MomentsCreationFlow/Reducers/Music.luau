local MomentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local Parent = MomentsCreationFlow.Parent
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.MomentsCommon)

return require(Parent.Rodux).createReducer({}, {
	[require(MomentsCreationFlow.Actions.CreationFlowMusicInfoRetrieved).name] = function(p1, p2) --[[ Line: 19 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.union(p1, p2.musicInfos)
	end
})