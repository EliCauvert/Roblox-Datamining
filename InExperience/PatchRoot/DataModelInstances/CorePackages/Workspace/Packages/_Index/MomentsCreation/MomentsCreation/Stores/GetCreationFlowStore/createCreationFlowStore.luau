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

return function()
	-- upvalues: createNavigationMachineModule (ref), creationFlowStateModule (ref), createSelectionStoreModule (ref), createDescriptionStoreModule (ref), createEditsStoreModule (ref), createSignal (ref), createComputed (ref), fFlagMomentTextGenerationFilteredSignal (ref), getFFlagEnableMomentTextGeneration (ref)
	local var1 = createNavigationMachineModule(creationFlowStateModule.Gallery)
	local var2 = createSelectionStoreModule()
	local var3 = createDescriptionStoreModule()
	local var4 = createEditsStoreModule()
	local var5, var6 = createSignal(false)
	local var7, var8 = createSignal({})
	local var9, var10 = createSignal(nil)
	local var11, var12 = createSignal(false)
	local var13, var14 = createSignal(nil)
	local var15, var16 = createSignal(nil)
	
	return {
		getStep = var1.getStep,
		getCurrentState = var1.getStep,
		canNavigate = var1.canNavigate,
		navigate = var1.navigate,
		getActive = var5,
		getSelectedCapture = var2.getSelectedCapture,
		getDescription = var3.getDescription,
		getGeneratedDescription = var3.getGeneratedDescription,
		getGenerationToken = var3.getGenerationToken,
		getGeneratedTextFeedback = var3.getGeneratedTextFeedback,
		getGeneratedSummary = var3.getGeneratedSummary,
		getMusicList = var7,
		getMusicEdit = createComputed(function(p1)
			-- upvalues: var4 (ref)
			return var4.getMap(p1).music
		end),
		getTextOverlayEdits = createComputed(function(p1)
			-- upvalues: var4 (ref)
			return var4.getMap(p1).text
		end),
		getTrimEdit = createComputed(function(p1)
			-- upvalues: var4 (ref)
			return var4.getMap(p1).trim
		end),
		getEditsMap = var4.getMap,
		getActiveSession = var9,
		getIsGenerating = var11,
		getActiveGeneration = var13,
		getTTSAudio = var15,
		updateCurrentState = function(p1)
			-- upvalues: var1 (ref)
			var1.reset(p1)
		end,
		onSelectedCaptureUpdated = function(p1)
			-- upvalues: var2 (ref)
			var2.setSelectedCapture(p1)
		end,
		updateDescription = function(p1)
			-- upvalues: var3 (ref)
			var3.setDescription(p1)
		end,
		setGeneratedDescription = function(value)
			-- upvalues: var3 (ref)
			var3.setGeneratedDescription(value)
		end,
		setGenerationToken = function(value)
			-- upvalues: var3 (ref)
			var3.setGenerationToken(value)
		end,
		setGeneratedTextFeedback = function(value)
			-- upvalues: var3 (ref)
			var3.setGeneratedTextFeedback(value)
		end,
		setGeneratedSummary = function(value)
			-- upvalues: var3 (ref)
			var3.setGeneratedSummary(value)
		end,
		updateTrimEdit = function(p1)
			-- upvalues: var4 (ref)
			var4.setCommitted("trim", p1)
		end,
		updateMusicEdit = function(p1)
			-- upvalues: var4 (ref)
			var4.setCommitted("music", p1)
		end,
		updateTextOverlayEdits = function(p1)
			-- upvalues: var4 (ref)
			var4.setCommitted("text", p1)
		end,
		setCommittedEdit = var4.setCommitted,
		setActiveSession = var10,
		setIsGenerating = var12,
		setActiveGeneration = var14,
		setTTSAudio = var16,
		onMusicSearchRetrieved = function(p1)
			-- upvalues: var8 (ref)
			var8(p1)
		end,
		clearEdits = function(p1)
			-- upvalues: var6 (ref), var2 (ref), var1 (ref), var3 (ref), fFlagMomentTextGenerationFilteredSignal (copy), getFFlagEnableMomentTextGeneration (copy), var8 (ref), var4 (ref), var10 (ref)
			var6(true)
			var2.setSelectedCapture(nil)
			var1.reset(p1)
			var3.setDescription("")
			
			if fFlagMomentTextGenerationFilteredSignal or getFFlagEnableMomentTextGeneration() then
				var3.setGeneratedDescription(nil)
				var3.setGenerationToken(nil)
				var3.setGeneratedTextFeedback(nil)
				var3.setGeneratedSummary(nil)
			end
			var8({})
			var4.clear()
			var10(nil)
		end
	}
end