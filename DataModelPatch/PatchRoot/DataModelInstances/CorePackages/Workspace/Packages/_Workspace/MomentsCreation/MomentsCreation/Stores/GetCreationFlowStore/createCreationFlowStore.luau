local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local SignalsModule = require(Parent.Signals)
local _ = require(Parent.MomentsTypes)
local CreationFlowStateModule = require(MomentsCreation.Enums.CreationFlowState)
local CreateNavigationMachineModule = require(MomentsCreation.Stores.createNavigationMachine)
local CreateSelectionStoreModule = require(MomentsCreation.Stores.createSelectionStore)
local CreateDescriptionStoreModule = require(MomentsCreation.Stores.createDescriptionStore)
local CreateEditsStoreModule = require(MomentsCreation.Stores.createEditsStore)
local CreateComputedFunction = SignalsModule.createComputed
local CreateSignalFunction = SignalsModule.createSignal

return function()
	-- upvalues: CreateNavigationMachineModule (copy), CreationFlowStateModule (copy), CreateSelectionStoreModule (copy), CreateDescriptionStoreModule (copy), CreateEditsStoreModule (copy), CreateSignalFunction (copy), CreateComputedFunction (copy)
	local NavigationMachineModule = CreateNavigationMachineModule(CreationFlowStateModule.Gallery)
	local SelectionStoreModule = CreateSelectionStoreModule()
	local DescriptionStoreModule = CreateDescriptionStoreModule()
	local EditsStoreModule = CreateEditsStoreModule()
	local Signal, Signal2 = CreateSignalFunction(false)
	local Signal1, Signal2_1 = CreateSignalFunction({})
	
	return {
		getStep = NavigationMachineModule.getStep,
		getCurrentState = NavigationMachineModule.getStep,
		canNavigate = NavigationMachineModule.canNavigate,
		navigate = NavigationMachineModule.navigate,
		getActive = Signal,
		getSelectedCapture = SelectionStoreModule.getSelectedCapture,
		getDescription = DescriptionStoreModule.getDescription,
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
		onMusicSearchRetrieved = function(p1)
			-- upvalues: Signal2_1 (copy)
			Signal2_1(p1)
		end,
		clearEdits = function(p1)
			-- upvalues: Signal2 (copy), SelectionStoreModule (copy), NavigationMachineModule (copy), DescriptionStoreModule (copy), Signal2_1 (copy), EditsStoreModule (copy)
			Signal2(true)
			SelectionStoreModule.setSelectedCapture(nil)
			NavigationMachineModule.reset(p1)
			DescriptionStoreModule.setDescription("")
			Signal2_1({})
			EditsStoreModule.clear()
		end
	}
end