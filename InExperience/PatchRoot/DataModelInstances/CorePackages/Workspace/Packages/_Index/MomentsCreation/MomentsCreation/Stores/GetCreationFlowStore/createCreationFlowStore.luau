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

return function() --[[ line: 85 | named "createCreationFlowStore" ]]
	-- upvalues: createNavigationMachineModule (ref), creationFlowStateModule (ref), createSelectionStoreModule (ref), createDescriptionStoreModule (ref), createEditsStoreModule (ref), createSignal (ref), createComputed (ref)
	local var7 = createNavigationMachineModule(creationFlowStateModule.Gallery)
	local var8 = createSelectionStoreModule()
	local var9 = createDescriptionStoreModule()
	local var10 = createEditsStoreModule()
	local var11, var12 = createSignal(false)
	local var13, var14 = createSignal({})
	local var15, var16 = createSignal(nil)
	local var17, var18 = createSignal(false)
	local var19, var20 = createSignal(nil)
	
	return {
		getStep = var7.getStep,
		getCurrentState = var7.getStep,
		canNavigate = var7.canNavigate,
		navigate = var7.navigate,
		getActive = var11,
		getSelectedCapture = var8.getSelectedCapture,
		getDescription = var9.getDescription,
		getMusicList = var13,
		getMusicEdit = createComputed(function(p0) --[[ line: 113 ]]
			-- upvalues: var10 (ref)
			return var10.getMap(p0).music
		end),
		getTextOverlayEdits = createComputed(function(p1) --[[ line: 116 ]]
			-- upvalues: var10 (ref)
			return var10.getMap(p1).text
		end),
		getTrimEdit = createComputed(function(p2) --[[ line: 110 ]]
			-- upvalues: var10 (ref)
			return var10.getMap(p2).trim
		end),
		getEditsMap = var10.getMap,
		getActiveSession = var15,
		getIsGenerating = var17,
		getActiveGeneration = var19,
		updateCurrentState = function(p3) --[[ line: 122 ]]
			-- upvalues: var7 (ref)
			var7.reset(p3)
		end,
		onSelectedCaptureUpdated = function(p4) --[[ line: 127 ]]
			-- upvalues: var8 (ref)
			var8.setSelectedCapture(p4)
		end,
		updateDescription = function(p5) --[[ line: 132 ]]
			-- upvalues: var9 (ref)
			var9.setDescription(p5)
		end,
		updateTrimEdit = function(p6) --[[ line: 137 ]]
			-- upvalues: var10 (ref)
			var10.setCommitted("trim", p6)
		end,
		updateMusicEdit = function(p7) --[[ line: 142 ]]
			-- upvalues: var10 (ref)
			var10.setCommitted("music", p7)
		end,
		updateTextOverlayEdits = function(p8) --[[ line: 147 ]]
			-- upvalues: var10 (ref)
			var10.setCommitted("text", p8)
		end,
		setCommittedEdit = var10.setCommitted,
		setActiveSession = var16,
		setIsGenerating = var18,
		setActiveGeneration = var20,
		onMusicSearchRetrieved = function(p9) --[[ line: 152 ]]
			-- upvalues: var14 (ref)
			var14(p9)
		end,
		clearEdits = function(p10) --[[ line: 157 ]]
			-- upvalues: var12 (ref), var8 (ref), var7 (ref), var9 (ref), var14 (ref), var10 (ref), var16 (ref)
			var12(true)
			var8.setSelectedCapture(nil)
			var7.reset(p10)
			var9.setDescription("")
			var14({})
			var10.clear()
			var16(nil)
		end
	}
end