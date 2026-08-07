-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:51 2026 Pacific Standard Time.

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
	[require(momentsCreationFlow.Actions.CreationFlowStateUpdated).name] = function(p0, p1) --[[ line: 45 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.union(p0, { currentState = p1.currentState })
	end,
	[require(momentsCreationFlow.Actions.MusicSearchRetrieved).name] = function(p2, p3) --[[ line: 51 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.union(p2, { musicList = p3.musics })
	end,
	[require(momentsCreationFlow.Actions.SelectedCaptureUpdated).name] = function(p4, p5) --[[ line: 57 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.union(p4, { capture = p5.capture })
	end,
	[require(momentsCreationFlow.Actions.TextOverlayEditsUpdated).name] = function(p6, p7) --[[ line: 63 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.union(p6, { textOverlayEdits = p7.textOverlayEdits })
	end,
	[require(momentsCreationFlow.Actions.TrimEditUpdated).name] = function(p8, p9) --[[ line: 69 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.union(p8, { trimEdit = p9.trimEdit })
	end,
	[require(momentsCreationFlow.Actions.MusicEditUpdated).name] = function(p10, p11) --[[ line: 75 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.union(p10, { musicEdit = p11.musicEdit })
	end,
	[require(momentsCreationFlow.Actions.DescriptionUpdated).name] = function(p12, p13) --[[ line: 81 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.union(p12, { description = p13.description })
	end,
	[require(momentsCreationFlow.Actions.ClearEdits).name] = function(_, p14) --[[ line: 87 ]]
		return {
			active = true,
			capture = nil,
			description = "",
			musicEdit = nil,
			textOverlayEdits = nil,
			trimEdit = nil,
			currentState = p14.newState,
			musicList = {}
		}
	end
})