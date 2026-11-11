local MomentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local Parent = MomentsCreationFlow.Parent
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.MomentsCommon)

return require(Parent.Rodux).createReducer({
	active = false,
	capture = nil,
	description = "",
	musicEdit = nil,
	textOverlayEdits = nil,
	trimEdit = nil,
	currentState = require(MomentsCreationFlow.Enums.CreationFlowState).Gallery,
	musicList = {}
}, {
	[require(MomentsCreationFlow.Actions.CreationFlowStateUpdated).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.union(p1, { currentState = p2.currentState })
	end,
	[require(MomentsCreationFlow.Actions.MusicSearchRetrieved).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.union(p1, { musicList = p2.musics })
	end,
	[require(MomentsCreationFlow.Actions.SelectedCaptureUpdated).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.union(p1, { capture = p2.capture })
	end,
	[require(MomentsCreationFlow.Actions.TextOverlayEditsUpdated).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.union(p1, { textOverlayEdits = p2.textOverlayEdits })
	end,
	[require(MomentsCreationFlow.Actions.TrimEditUpdated).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.union(p1, { trimEdit = p2.trimEdit })
	end,
	[require(MomentsCreationFlow.Actions.MusicEditUpdated).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.union(p1, { musicEdit = p2.musicEdit })
	end,
	[require(MomentsCreationFlow.Actions.DescriptionUpdated).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.union(p1, { description = p2.description })
	end,
	[require(MomentsCreationFlow.Actions.ClearEdits).name] = function(_, p1)
		return {
			active = true,
			capture = nil,
			description = "",
			musicEdit = nil,
			textOverlayEdits = nil,
			trimEdit = nil,
			currentState = p1.newState,
			musicList = {}
		}
	end
})