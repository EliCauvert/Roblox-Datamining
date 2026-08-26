local momentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local parent = momentsCreationFlow.Parent
local cryoModule = require(parent.Cryo)
local _ = require(parent.MomentsCommon)

return require(parent.Rodux).createReducer({
	active = false,
	capture = nil,
	description = "",
	musicEdit = nil,
	textOverlayEdits = nil,
	trimEdit = nil,
	currentState = require(momentsCreationFlow.Enums.CreationFlowState).Gallery,
	musicList = {}
}, {
	[require(momentsCreationFlow.Actions.CreationFlowStateUpdated).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.union(p1, { currentState = p2.currentState })
	end,
	[require(momentsCreationFlow.Actions.MusicSearchRetrieved).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.union(p1, { musicList = p2.musics })
	end,
	[require(momentsCreationFlow.Actions.SelectedCaptureUpdated).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.union(p1, { capture = p2.capture })
	end,
	[require(momentsCreationFlow.Actions.TextOverlayEditsUpdated).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.union(p1, { textOverlayEdits = p2.textOverlayEdits })
	end,
	[require(momentsCreationFlow.Actions.TrimEditUpdated).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.union(p1, { trimEdit = p2.trimEdit })
	end,
	[require(momentsCreationFlow.Actions.MusicEditUpdated).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.union(p1, { musicEdit = p2.musicEdit })
	end,
	[require(momentsCreationFlow.Actions.DescriptionUpdated).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.union(p1, { description = p2.description })
	end,
	[require(momentsCreationFlow.Actions.ClearEdits).name] = function(_, p1)
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