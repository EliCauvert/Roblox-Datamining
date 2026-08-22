local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local signalsModule = require(parent.Signals)
local _ = require(parent.MomentsTypes)
local momentsCommonModule = require(parent.MomentsCommon)
local creationFlowStateModule = require(momentsCreation.Enums.CreationFlowState)
local createNavigationMachineModule = require(momentsCreation.Stores.createNavigationMachine)
local createSelectionStoreModule = require(momentsCreation.Stores.createSelectionStore)
local createDescriptionStoreModule = require(momentsCreation.Stores.createDescriptionStore)
local createEditsStoreModule = require(momentsCreation.Stores.createEditsStore)
local createComputed = signalsModule.createComputed
local createSignal = signalsModule.createSignal
local fFlagMomentTextGenerationFilteredSignal = momentsCommonModule.Flags.FFlagMomentTextGenerationFilteredSignal
local getFFlagEnableMomentTextGeneration = momentsCommonModule.Flags.GetFFlagEnableMomentTextGeneration

return function() --[[ line: 100 | named "createCreationFlowStore" ]]
	-- upvalues: createNavigationMachineModule (ref), creationFlowStateModule (ref), createSelectionStoreModule (ref), createDescriptionStoreModule (ref), createEditsStoreModule (ref), createSignal (ref), createComputed (ref), fFlagMomentTextGenerationFilteredSignal (ref), getFFlagEnableMomentTextGeneration (ref)
	local var8 = createNavigationMachineModule(creationFlowStateModule.Gallery)
	local var9 = createSelectionStoreModule()
	local var10 = createDescriptionStoreModule()
	local var11 = createEditsStoreModule()
	local var12, var13 = createSignal(false)
	local var14, var15 = createSignal({})
	local var16, var17 = createSignal(nil)
	local var18, var19 = createSignal(false)
	local var20, var21 = createSignal(nil)
	local var22, var23 = createSignal(nil)
	
	return {
		getStep = var8.getStep,
		getCurrentState = var8.getStep,
		canNavigate = var8.canNavigate,
		navigate = var8.navigate,
		getActive = var12,
		getSelectedCapture = var9.getSelectedCapture,
		getDescription = var10.getDescription,
		getGeneratedDescription = var10.getGeneratedDescription,
		getGenerationToken = var10.getGenerationToken,
		getGeneratedTextFeedback = var10.getGeneratedTextFeedback,
		getGeneratedSummary = var10.getGeneratedSummary,
		getMusicList = var14,
		getMusicEdit = createComputed(function(p0) --[[ line: 131 ]]
			-- upvalues: var11 (ref)
			return var11.getMap(p0).music
		end),
		getTextOverlayEdits = createComputed(function(p1) --[[ line: 134 ]]
			-- upvalues: var11 (ref)
			return var11.getMap(p1).text
		end),
		getTrimEdit = createComputed(function(p2) --[[ line: 128 ]]
			-- upvalues: var11 (ref)
			return var11.getMap(p2).trim
		end),
		getEditsMap = var11.getMap,
		getActiveSession = var16,
		getIsGenerating = var18,
		getActiveGeneration = var20,
		getTTSAudio = var22,
		updateCurrentState = function(p3) --[[ line: 140 ]]
			-- upvalues: var8 (ref)
			var8.reset(p3)
		end,
		onSelectedCaptureUpdated = function(p4) --[[ line: 145 ]]
			-- upvalues: var9 (ref)
			var9.setSelectedCapture(p4)
		end,
		updateDescription = function(p5) --[[ line: 150 ]]
			-- upvalues: var10 (ref)
			var10.setDescription(p5)
		end,
		setGeneratedDescription = function(value) --[[ line: 154 ]]
			-- upvalues: var10 (ref)
			var10.setGeneratedDescription(value)
		end,
		setGenerationToken = function(value) --[[ line: 162 ]]
			-- upvalues: var10 (ref)
			var10.setGenerationToken(value)
		end,
		setGeneratedTextFeedback = function(value) --[[ line: 166 ]]
			-- upvalues: var10 (ref)
			var10.setGeneratedTextFeedback(value)
		end,
		setGeneratedSummary = function(value) --[[ line: 158 ]]
			-- upvalues: var10 (ref)
			var10.setGeneratedSummary(value)
		end,
		updateTrimEdit = function(p6) --[[ line: 171 ]]
			-- upvalues: var11 (ref)
			var11.setCommitted("trim", p6)
		end,
		updateMusicEdit = function(p7) --[[ line: 176 ]]
			-- upvalues: var11 (ref)
			var11.setCommitted("music", p7)
		end,
		updateTextOverlayEdits = function(p8) --[[ line: 181 ]]
			-- upvalues: var11 (ref)
			var11.setCommitted("text", p8)
		end,
		setCommittedEdit = var11.setCommitted,
		setActiveSession = var17,
		setIsGenerating = var19,
		setActiveGeneration = var21,
		setTTSAudio = var23,
		onMusicSearchRetrieved = function(p9) --[[ line: 186 ]]
			-- upvalues: var15 (ref)
			var15(p9)
		end,
		clearEdits = function(p10) --[[ line: 191 ]]
			-- upvalues: var13 (ref), var9 (ref), var8 (ref), var10 (ref), fFlagMomentTextGenerationFilteredSignal (copy), getFFlagEnableMomentTextGeneration (copy), var15 (ref), var11 (ref), var17 (ref)
			var13(true)
			var9.setSelectedCapture(nil)
			var8.reset(p10)
			var10.setDescription("")
			
			if fFlagMomentTextGenerationFilteredSignal or getFFlagEnableMomentTextGeneration() then
				var10.setGeneratedDescription(nil)
				var10.setGenerationToken(nil)
				var10.setGeneratedTextFeedback(nil)
				var10.setGeneratedSummary(nil)
			end
			var15({})
			var11.clear()
			var17(nil)
		end
	}
end