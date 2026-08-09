local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local signalsModule = require(parent.Signals)
local _ = require(parent.MomentsTypes)
local creationFlowStateModule = require(momentsCreation.Enums.CreationFlowState)
local createNavigationMachineModule = require(momentsCreation.Stores.createNavigationMachine)
local createSelectionStoreModule = require(momentsCreation.Stores.createSelectionStore)
local createDescriptionStoreModule = require(momentsCreation.Stores.createDescriptionStore)
local createEditsStoreModule = require(momentsCreation.Stores.createEditsStore)
local createComputed = signalsModule.createComputed
local createSignal = signalsModule.createSignal

return function() --[[ line: 69 | named "createCreationFlowStore" ]]
	-- upvalues: createNavigationMachineModule (ref), creationFlowStateModule (ref), createSelectionStoreModule (ref), createDescriptionStoreModule (ref), createEditsStoreModule (ref), createSignal (ref), createComputed (ref)
	local var7 = createNavigationMachineModule(creationFlowStateModule.Gallery)
	local var8 = createSelectionStoreModule()
	local var9 = createDescriptionStoreModule()
	local var10 = createEditsStoreModule()
	local var11, var12 = createSignal(false)
	local var13, var14 = createSignal({})
	
	return {
		getStep = var7.getStep,
		getCurrentState = var7.getStep,
		canNavigate = var7.canNavigate,
		navigate = var7.navigate,
		getActive = var11,
		getSelectedCapture = var8.getSelectedCapture,
		getDescription = var9.getDescription,
		getMusicList = var13,
		getMusicEdit = createComputed(function(p0) --[[ line: 86 ]]
			-- upvalues: var10 (ref)
			return var10.getMap(p0).music
		end),
		getTextOverlayEdits = createComputed(function(p1) --[[ line: 89 ]]
			-- upvalues: var10 (ref)
			return var10.getMap(p1).text
		end),
		getTrimEdit = createComputed(function(p2) --[[ line: 83 ]]
			-- upvalues: var10 (ref)
			return var10.getMap(p2).trim
		end),
		getEditsMap = var10.getMap,
		updateCurrentState = function(p3) --[[ line: 95 ]]
			-- upvalues: var7 (ref)
			var7.reset(p3)
		end,
		onSelectedCaptureUpdated = function(p4) --[[ line: 100 ]]
			-- upvalues: var8 (ref)
			var8.setSelectedCapture(p4)
		end,
		updateDescription = function(p5) --[[ line: 105 ]]
			-- upvalues: var9 (ref)
			var9.setDescription(p5)
		end,
		updateTrimEdit = function(p6) --[[ line: 110 ]]
			-- upvalues: var10 (ref)
			var10.setCommitted("trim", p6)
		end,
		updateMusicEdit = function(p7) --[[ line: 115 ]]
			-- upvalues: var10 (ref)
			var10.setCommitted("music", p7)
		end,
		updateTextOverlayEdits = function(p8) --[[ line: 120 ]]
			-- upvalues: var10 (ref)
			var10.setCommitted("text", p8)
		end,
		setCommittedEdit = var10.setCommitted,
		onMusicSearchRetrieved = function(p9) --[[ line: 125 ]]
			-- upvalues: var14 (ref)
			var14(p9)
		end,
		clearEdits = function(p10) --[[ line: 130 ]]
			-- upvalues: var12 (ref), var8 (ref), var7 (ref), var9 (ref), var14 (ref), var10 (ref)
			var12(true)
			var8.setSelectedCapture(nil)
			var7.reset(p10)
			var9.setDescription("")
			var14({})
			var10.clear()
		end
	}
end