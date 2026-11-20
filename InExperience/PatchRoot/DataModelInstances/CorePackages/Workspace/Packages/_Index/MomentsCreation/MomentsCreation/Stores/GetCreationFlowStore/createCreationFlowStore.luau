local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local SignalsModule = require(Parent.Signals)
local _ = require(Parent.MomentsTypes)
local MomentsCommonModule = require(Parent.MomentsCommon)
local CreationFlowStateModule = require(MomentsCreation.Enums.CreationFlowState)
local CreateNavigationMachineModule = require(MomentsCreation.Stores.createNavigationMachine)
local CreateSelectionStoreModule = require(MomentsCreation.Stores.createSelectionStore)
local CreateDescriptionStoreModule = require(MomentsCreation.Stores.createDescriptionStore)
local CreateEditsStoreModule = require(MomentsCreation.Stores.createEditsStore)
local FFlagMomentsTTSDraftRestoreModule = require(MomentsCreation.Flags.FFlagMomentsTTSDraftRestore)
local CreateComputedFunction = SignalsModule.createComputed
local CreateSignalFunction = SignalsModule.createSignal
local FFlagMomentTextGenerationFilteredSignal = MomentsCommonModule.Flags.FFlagMomentTextGenerationFilteredSignal
local GetFFlagEnableMomentTextGenerationFunction = MomentsCommonModule.Flags.GetFFlagEnableMomentTextGeneration

return function()
	-- upvalues: CreateNavigationMachineModule (copy), CreationFlowStateModule (copy), CreateSelectionStoreModule (copy), CreateDescriptionStoreModule (copy), CreateEditsStoreModule (copy), CreateSignalFunction (copy), CreateComputedFunction (copy), FFlagMomentTextGenerationFilteredSignal (copy), GetFFlagEnableMomentTextGenerationFunction (copy), FFlagMomentsTTSDraftRestoreModule (copy)
	local NavigationMachineModule = CreateNavigationMachineModule(CreationFlowStateModule.Gallery)
	local SelectionStoreModule = CreateSelectionStoreModule()
	local DescriptionStoreModule = CreateDescriptionStoreModule()
	local EditsStoreModule = CreateEditsStoreModule()
	local Signal, Signal2 = CreateSignalFunction(false)
	local Signal1, Signal2_1 = CreateSignalFunction({})
	local Signal3, Signal2_2 = CreateSignalFunction(nil)
	local Signal4, Signal2_3 = CreateSignalFunction(false)
	local Signal5, Signal2_4 = CreateSignalFunction(nil)
	local Signal6, Signal2_5 = CreateSignalFunction(nil)
	local Signal7, Signal2_6 = CreateSignalFunction(nil)
	
	return {
		getStep = NavigationMachineModule.getStep,
		getCurrentState = NavigationMachineModule.getStep,
		canNavigate = NavigationMachineModule.canNavigate,
		navigate = NavigationMachineModule.navigate,
		getActive = Signal,
		getSelectedCapture = SelectionStoreModule.getSelectedCapture,
		getDescription = DescriptionStoreModule.getDescription,
		getGeneratedDescription = DescriptionStoreModule.getGeneratedDescription,
		getGenerationToken = DescriptionStoreModule.getGenerationToken,
		getGeneratedTextFeedback = DescriptionStoreModule.getGeneratedTextFeedback,
		getGeneratedSummary = DescriptionStoreModule.getGeneratedSummary,
		getCommentsEnabled = DescriptionStoreModule.getCommentsEnabled,
		getMusicList = Signal1,
		getMusicEdit = CreateComputedFunction(function(p1)
			-- upvalues: EditsStoreModule (copy)
			return EditsStoreModule.getMap(p1).music
		end),
		getTextOverlayEdits = CreateComputedFunction(function(p1)
			-- upvalues: EditsStoreModule (copy)
			return EditsStoreModule.getMap(p1).text
		end),
		getTrimEdit = CreateComputedFunction(function(p1)
			-- upvalues: EditsStoreModule (copy)
			return EditsStoreModule.getMap(p1).trim
		end),
		getEditsMap = EditsStoreModule.getMap,
		getActiveSession = Signal3,
		getIsGenerating = Signal4,
		getActiveGeneration = Signal5,
		getTTSAudio = Signal6,
		getPendingRestoredVoice = Signal7,
		updateCurrentState = function(p1)
			-- upvalues: NavigationMachineModule (copy)
			NavigationMachineModule.reset(p1)
		end,
		onSelectedCaptureUpdated = function(p1)
			-- upvalues: SelectionStoreModule (copy)
			SelectionStoreModule.setSelectedCapture(p1)
		end,
		updateDescription = function(p1)
			-- upvalues: DescriptionStoreModule (copy)
			DescriptionStoreModule.setDescription(p1)
		end,
		setGeneratedDescription = function(p1)
			-- upvalues: DescriptionStoreModule (copy)
			DescriptionStoreModule.setGeneratedDescription(p1)
		end,
		setGenerationToken = function(p1)
			-- upvalues: DescriptionStoreModule (copy)
			DescriptionStoreModule.setGenerationToken(p1)
		end,
		setGeneratedTextFeedback = function(p1)
			-- upvalues: DescriptionStoreModule (copy)
			DescriptionStoreModule.setGeneratedTextFeedback(p1)
		end,
		setGeneratedSummary = function(p1)
			-- upvalues: DescriptionStoreModule (copy)
			DescriptionStoreModule.setGeneratedSummary(p1)
		end,
		updateCommentsEnabled = function(p1)
			-- upvalues: DescriptionStoreModule (copy)
			DescriptionStoreModule.setCommentsEnabled(p1)
		end,
		updateTrimEdit = function(p1)
			-- upvalues: EditsStoreModule (copy)
			EditsStoreModule.setCommitted("trim", p1)
		end,
		updateMusicEdit = function(p1)
			-- upvalues: EditsStoreModule (copy)
			EditsStoreModule.setCommitted("music", p1)
		end,
		updateTextOverlayEdits = function(p1)
			-- upvalues: EditsStoreModule (copy)
			EditsStoreModule.setCommitted("text", p1)
		end,
		setCommittedEdit = EditsStoreModule.setCommitted,
		setActiveSession = Signal2_2,
		setIsGenerating = Signal2_3,
		setActiveGeneration = Signal2_4,
		setTTSAudio = Signal2_5,
		setPendingRestoredVoice = function(p1)
			-- upvalues: Signal2_6 (copy)
			Signal2_6(p1)
		end,
		onMusicSearchRetrieved = function(p1)
			-- upvalues: Signal2_1 (copy)
			Signal2_1(p1)
		end,
		clearEdits = function(p1)
			-- upvalues: Signal2 (copy), SelectionStoreModule (copy), NavigationMachineModule (copy), DescriptionStoreModule (copy), FFlagMomentTextGenerationFilteredSignal (upval), GetFFlagEnableMomentTextGenerationFunction (upval), Signal2_1 (copy), EditsStoreModule (copy), Signal2_2 (copy), FFlagMomentsTTSDraftRestoreModule (upval), Signal2_6 (copy)
			Signal2(true)
			SelectionStoreModule.setSelectedCapture(nil)
			NavigationMachineModule.reset(p1)
			DescriptionStoreModule.setDescription("")
			DescriptionStoreModule.setCommentsEnabled(true)
			
			if FFlagMomentTextGenerationFilteredSignal or GetFFlagEnableMomentTextGenerationFunction() then
				DescriptionStoreModule.setGeneratedDescription(nil)
				DescriptionStoreModule.setGenerationToken(nil)
				DescriptionStoreModule.setGeneratedTextFeedback(nil)
				DescriptionStoreModule.setGeneratedSummary(nil)
			end
			Signal2_1({})
			EditsStoreModule.clear()
			Signal2_2(nil)
			
			if FFlagMomentsTTSDraftRestoreModule then
				Signal2_6(nil)
			end
		end
	}
end