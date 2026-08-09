local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local signalsModule = require(parent.Signals)
local creationFlowStateModule = require(momentsCreation.Enums.CreationFlowState)
local dialogTypeModule = require(momentsCreation.Enums.DialogType)
local _ = require(momentsCreation.Types.CreationFlowTypes)
local _ = require(parent.MomentsTypes)
local creationToolRegistryModule = require(momentsCreation.Tools.creationToolRegistry)
local defaultCreationToolsModule = require(momentsCreation.Tools.defaultCreationTools)
local createCapturePreviewControllerModule = require(momentsCreation.Preview.createCapturePreviewController)
local createEditSessionModule = require(momentsCreation.Stores.createEditSession)
local fireAnalyticsEventModule = require(momentsCreation.Analytics.fireAnalyticsEvent)
local eventNames = require(parent.MomentsCommon).Analytics.EventNames
local createComputed = signalsModule.createComputed
local createSignal = signalsModule.createSignal

return function(p0) --[[ line: 53 | named "createCreationController" ]]
	-- upvalues: creationToolRegistryModule (ref), defaultCreationToolsModule (ref), createSignal (ref), createComputed (ref), createCapturePreviewControllerModule (ref), creationFlowStateModule (ref), fireAnalyticsEventModule (ref), eventNames (ref), createEditSessionModule (ref), dialogTypeModule (ref)
	local store = p0.store
	local host = p0.host or {}
	local registry = p0.registry or creationToolRegistryModule(defaultCreationToolsModule)
	local var11 = nil
	local var12, var13 = createSignal(nil)
	
	local function _(value) --[[ line: 62 | named "setActiveSession" ]]
		-- upvalues: var13 (ref)
		var13(value)
	end
	
	local var14, var15 = createSignal(nil)
	local var16 = createComputed(function(p1) --[[ line: 70 ]]
		-- upvalues: store (ref), registry (ref)
		local t = {}
		
		for i, v in store.getEditsMap(p1) do
			if v ~= nil then
				local var23 = registry.get(i)
				
				if var23 == nil or var23.toEdits == nil then
					t[i] = v
				else
					for i_1, v_1 in var23.toEdits(v) do
						t[i_1] = v_1
					end
				end
			end
		end
		return t
	end)
	local var17 = createComputed(function(p2) --[[ line: 89 ]]
		-- upvalues: store (ref), var16 (ref), registry (ref)
		local selectedCapture = store.getSelectedCapture(p2)
		local var25 = if selectedCapture ~= nil then nil else selectedCapture.CaptureType
		local t = { captureType = var25, getComposedEdits = var16 }
		local t_1 = {}
		
		for i, v in registry.getAll() do
			if (if v.supportedCaptureTypes ~= nil then var25 ~= nil and table.find(v.supportedCaptureTypes, var25) ~= nil else true) and (v.isAvailable == nil or v.isAvailable(t)) then
				table.insert(t_1, v)
			end
		end
		return t_1
	end)
	local var18 = createComputed(function(p3) --[[ line: 110 ]]
		-- upvalues: store (ref), registry (ref)
		local step = store.getStep(p3)
		
		for i, v in registry.getAll() do
			if v.step == step then
				return v
			end
		end
		return nil
	end)
	local preview = p0.preview or createCapturePreviewControllerModule(store, createComputed(function(p4) --[[ line: 124 ]]
		-- upvalues: var18 (ref), var12 (ref), var16 (ref)
		local var29 = var18(p4)
		
		if var29 ~= nil and var29.kind == "trim" then
			local var30 = var12(p4)
			local var31 = if var30 ~= nil then nil else var30.getDraft(p4)
			
			if var31 ~= nil and var31.startTime ~= nil and var31.endTime ~= nil then
				return { startTime = var31.startTime, endTime = var31.endTime }
			end
		end
		local trim = var16(p4).trim
		
		return if trim == nil or trim.startTime == nil or trim.endTime == nil then nil else { startTime = trim.startTime, endTime = trim.endTime }
	end), createComputed(function(p5) --[[ line: 143 ]]
		-- upvalues: var18 (ref), var12 (ref), var16 (ref)
		local var32 = var18(p5)
		
		if var32 ~= nil and var32.kind == "music" then
			local var33 = var12(p5)
			local var34 = if var33 ~= nil then nil else var33.getDraft(p5)
			
			return if var34 == nil or var34.assetId == nil then var16(p5).music else var34
		end
	end))
	
	local function showModal(p6) --[[ line: 157 ]]
		-- upvalues: var15 (ref)
		var15(p6)
	end
	
	local function dismissModal() --[[ line: 161 ]]
		-- upvalues: var15 (ref)
		var15(nil)
	end
	
	local _ = function() --[[ line: 258 | named "dismiss" ]]
		-- upvalues: var15 (ref), store (ref), p0 (ref), creationFlowStateModule (copy), host (ref)
		var15(nil)
		store.clearEdits(if p0.excludeGallery then creationFlowStateModule.Preview else creationFlowStateModule.Gallery)
		
		if host.exitCreationFlow ~= nil then
			host.exitCreationFlow()
		end
	end
	
	return {
		getStep = store.getStep,
		navigate = function(p7) --[[ line: 165 ]]
			-- upvalues: store (ref)
			store.navigate(p7)
		end,
		returnToGallery = function() --[[ line: 170 ]]
			-- upvalues: store (ref), creationFlowStateModule (copy), var13 (ref)
			store.clearEdits(creationFlowStateModule.Gallery)
			var13(nil)
		end,
		getSelectedCapture = store.getSelectedCapture,
		selectCapture = function(p8) --[[ line: 175 ]]
			-- upvalues: store (ref), fireAnalyticsEventModule (copy), eventNames (copy)
			store.onSelectedCaptureUpdated(p8)
			
			if p8 ~= nil then
				fireAnalyticsEventModule(eventNames.EditingFlowGalleryItemSelected)
			end
		end,
		getDescription = store.getDescription,
		setDescription = function(value) --[[ line: 182 ]]
			-- upvalues: store (ref)
			store.updateDescription(value)
		end,
		getAvailableTools = var17,
		getActiveTool = var18,
		getActiveSession = var12,
		getComposedEdits = var16,
		beginTool = function(p9) --[[ line: 186 ]]
			-- upvalues: registry (ref), fireAnalyticsEventModule (copy), var11 (write), createEditSessionModule (copy), store (ref), var13 (ref)
			local var35 = registry.get(p9)
			
			if var35 == nil then return end
			if var35.cta.analyticsEvent ~= nil then
				fireAnalyticsEventModule(var35.cta.analyticsEvent)
			end
			if var35.presentation == "InstantAction" then
				if var35.apply ~= nil then
					var35.apply(var11)
				end
				return
			else
				local _ = nil
				local createSession = var35.createSession
				local var36 = if createSession ~= nil then createEditSessionModule() else createSession()
				
				if var35.step == nil or store.navigate(var35.step) then
					var36.begin(store.getEditsMap(false)[p9])
					var13(var36)
					
					return
				end
			end
		end,
		commitActiveTool = function() --[[ line: 219 ]]
			-- upvalues: var12 (ref), var18 (ref), store (ref), creationFlowStateModule (copy), var11 (write), fireAnalyticsEventModule (copy), var13 (ref)
			local var37 = var12(false)
			local var38 = var18(false)
			
			if var37 == nil or var38 == nil then
				store.navigate(creationFlowStateModule.Preview)
				
				return
			end
			local var39 = var37.commit()
			
			if var38.onCommit ~= nil and var38.onCommit(var39, var11) == false then return end
			store.setCommittedEdit(var38.kind, var39)
			
			if var38.cta.commitAnalyticsEvent ~= nil then
				fireAnalyticsEventModule(var38.cta.commitAnalyticsEvent)
			end
			var13(nil)
			store.navigate(creationFlowStateModule.Preview)
		end,
		discardActiveTool = function() --[[ line: 239 ]]
			-- upvalues: var12 (ref), var18 (ref), fireAnalyticsEventModule (copy), var13 (ref), store (ref), creationFlowStateModule (copy)
			local var40 = var12(false)
			local var41 = var18(false)
			
			if var40 ~= nil then
				var40.discard()
			end
			if var41 ~= nil and var41.cta.cancelAnalyticsEvent ~= nil then
				fireAnalyticsEventModule(var41.cta.cancelAnalyticsEvent)
			end
			var13(nil)
			store.navigate(creationFlowStateModule.Preview)
		end,
		updateCommittedEdit = function(p10, p11) --[[ line: 254 ]]
			-- upvalues: store (ref)
			store.setCommittedEdit(p10, p11)
		end,
		getActiveModal = var14,
		showModal = showModal,
		dismissModal = dismissModal,
		publish = function() --[[ line: 266 ]]
			-- upvalues: store (ref), host (ref), var15 (ref), dialogTypeModule (copy), dismissModal (ref), var16 (ref), fireAnalyticsEventModule (copy), eventNames (copy), p0 (ref), creationFlowStateModule (copy)
			local description = store.getDescription(false)
			
			if host.isTextFiltered ~= nil and host.isTextFiltered(description) then
				var15({
					modalType = dialogTypeModule.TextFiltered,
					modalProps = { onConfirm = dismissModal }
				})
				
				return
			elseif host.createMoment ~= nil then
				host.createMoment(store.getSelectedCapture(false), var16(false), description)
			end
			fireAnalyticsEventModule(eventNames.MomentsEditingFlowPublished)
			var15(nil)
			store.clearEdits(if p0.excludeGallery then creationFlowStateModule.Preview else creationFlowStateModule.Gallery)
			
			if host.exitCreationFlow ~= nil then
				host.exitCreationFlow()
			end
		end,
		exit = function() --[[ line: 284 ]]
			-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), var15 (ref), store (ref), p0 (ref), creationFlowStateModule (copy), host (ref)
			fireAnalyticsEventModule(eventNames.MomentsEditingFlowExited)
			var15(nil)
			store.clearEdits(if p0.excludeGallery then creationFlowStateModule.Preview else creationFlowStateModule.Gallery)
			
			if host.exitCreationFlow ~= nil then
				host.exitCreationFlow()
			end
		end,
		preview = preview
	}
end