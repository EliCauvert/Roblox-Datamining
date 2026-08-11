local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local cryoModule = require(parent.Cryo)
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
local makeDefaultTextOverlayEditModule = require(momentsCreation.Utils.makeDefaultTextOverlayEdit)
local getFFlagMomentsCreationPersistEditSessionModule = require(momentsCreation.Flags.GetFFlagMomentsCreationPersistEditSession)
local makeCreationEventFieldsModule = require(momentsCreation.Analytics.makeCreationEventFields)
local momentsCommonModule = require(parent.MomentsCommon)
local eventNames = momentsCommonModule.Analytics.EventNames
local sessionManager = momentsCommonModule.Analytics.SessionManager
local funnelEventNames = momentsCommonModule.Analytics.FunnelEventNames
local getFFlagMomentsAnalyticsProducerPrereqs = momentsCommonModule.Flags.GetFFlagMomentsAnalyticsProducerPrereqs
local createComputed = signalsModule.createComputed
local createSignal = signalsModule.createSignal

return function(p0) --[[ line: 62 | named "createCreationController" ]]
	-- upvalues: creationToolRegistryModule (ref), defaultCreationToolsModule (ref), getFFlagMomentsAnalyticsProducerPrereqs (ref), sessionManager (ref), funnelEventNames (ref), getFFlagMomentsCreationPersistEditSessionModule (ref), createSignal (ref), createComputed (ref), createCapturePreviewControllerModule (ref), cryoModule (ref), makeCreationEventFieldsModule (ref), creationFlowStateModule (ref), fireAnalyticsEventModule (ref), eventNames (ref), createEditSessionModule (ref), dialogTypeModule (ref), makeDefaultTextOverlayEditModule (ref)
	local store = p0.store
	local host = p0.host or {}
	local registry = p0.registry or creationToolRegistryModule(defaultCreationToolsModule)
	
	if getFFlagMomentsAnalyticsProducerPrereqs() and sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow) == nil then
		sessionManager.startSession(funnelEventNames.FunnelTypes.CreationFlow)
	end
	local getActiveSession, var19
	local var16 = nil
	local _ = nil
	local _ = nil
	
	if getFFlagMomentsCreationPersistEditSessionModule() then
		getActiveSession = store.getActiveSession
		local setActiveSession = store.setActiveSession
	else
		local _ = nil
		local var17, var18 = createSignal(nil)
		getActiveSession = var17
		var19 = var18
		
		local setActiveSession = function(p1) --[[ line: 91 ]]
			-- upvalues: var19 (write)
			var19(p1)
		end
	end
	var19, var20 = createSignal(nil)
	local var21 = createComputed(function(p2) --[[ line: 100 ]]
		-- upvalues: store (ref), registry (ref)
		local t = {}
		
		for i, v in store.getEditsMap(p2) do
			if v ~= nil then
				local var31 = registry.get(i)
				
				if var31 == nil or var31.toEdits == nil then
					t[i] = v
				else
					for i_1, v_1 in var31.toEdits(v) do
						t[i_1] = v_1
					end
				end
			end
		end
		return t
	end)
	local var22, var23 = createSignal(false)
	local var24 = createComputed(function(p3) --[[ line: 122 ]]
		-- upvalues: store (ref), host (ref), var21 (ref), registry (ref)
		local selectedCapture = store.getSelectedCapture(p3)
		local var33 = if selectedCapture ~= nil then nil else selectedCapture.CaptureType
		local t = {
			canGenerateText = host.generateMomentText ~= nil,
			captureType = var33,
			getComposedEdits = var21
		}
		local t_1 = {}
		
		for i, v in registry.getAll() do
			if (if v.supportedCaptureTypes ~= nil then var33 ~= nil and table.find(v.supportedCaptureTypes, var33) ~= nil else true) and (v.isAvailable == nil or v.isAvailable(t)) then
				table.insert(t_1, v)
			end
		end
		return t_1
	end)
	local var25 = createComputed(function(p4) --[[ line: 144 ]]
		-- upvalues: store (ref), registry (ref)
		local step = store.getStep(p4)
		
		for i, v in registry.getAll() do
			if v.step == step then
				return v
			end
		end
		return nil
	end)
	local preview = p0.preview or createCapturePreviewControllerModule(store, createComputed(function(p5) --[[ line: 158 ]]
		-- upvalues: var25 (ref), getActiveSession (write), var21 (ref)
		local var37 = var25(p5)
		
		if var37 ~= nil and var37.kind == "trim" then
			local var38 = getActiveSession(p5)
			local var39 = if var38 ~= nil then nil else var38.getDraft(p5)
			
			if var39 ~= nil and var39.startTime ~= nil and var39.endTime ~= nil then
				return { startTime = var39.startTime, endTime = var39.endTime }
			end
		end
		local trim = var21(p5).trim
		
		return if trim == nil or trim.startTime == nil or trim.endTime == nil then nil else { startTime = trim.startTime, endTime = trim.endTime }
	end), createComputed(function(p6) --[[ line: 177 ]]
		-- upvalues: var25 (ref), getActiveSession (write), var21 (ref)
		local var40 = var25(p6)
		
		if var40 ~= nil and var40.kind == "music" then
			local var41 = getActiveSession(p6)
			local var42 = if var41 ~= nil then nil else var41.getDraft(p6)
			
			return if var42 == nil or var42.assetId == nil then var21(p6).music else var42
		end
	end))
	
	local function showModal(p7) --[[ line: 191 ]]
		-- upvalues: var20 (ref)
		var20(p7)
	end
	
	local function dismissModal() --[[ line: 195 ]]
		-- upvalues: var20 (ref)
		var20(nil)
	end
	
	local function withCreationSession(p8) --[[ line: 203 ]]
		-- upvalues: sessionManager (copy), funnelEventNames (copy), cryoModule (copy), makeCreationEventFieldsModule (copy)
		return cryoModule.Dictionary.join(p8, makeCreationEventFieldsModule.makeCreationBaseFields(sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow)))
	end
	
	local function _() --[[ line: 322 | named "dismiss" ]]
		-- upvalues: var20 (ref), store (ref), p0 (ref), creationFlowStateModule (copy), host (ref)
		var20(nil)
		store.clearEdits(if p0.excludeGallery then creationFlowStateModule.Preview else creationFlowStateModule.Gallery)
		
		if host.exitCreationFlow ~= nil then
			host.exitCreationFlow()
		end
	end
	
	return {
		getStep = store.getStep,
		navigate = function(p9) --[[ line: 208 ]]
			-- upvalues: store (ref)
			store.navigate(p9)
		end,
		returnToGallery = function() --[[ line: 213 ]]
			-- upvalues: store (ref), creationFlowStateModule (copy), setActiveSession (write)
			store.clearEdits(creationFlowStateModule.Gallery)
			setActiveSession(nil)
		end,
		getSelectedCapture = store.getSelectedCapture,
		selectCapture = function(p10) --[[ line: 218 ]]
			-- upvalues: store (ref), fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy)
			store.onSelectedCaptureUpdated(p10)
			
			if p10 ~= nil then
				fireAnalyticsEventModule(eventNames.EditingFlowGalleryItemSelected, withCreationSession(makeCreationEventFieldsModule.makeToolFieldFromKind("gallery")))
			end
		end,
		getDescription = store.getDescription,
		setDescription = function(value) --[[ line: 231 ]]
			-- upvalues: store (ref)
			store.updateDescription(value)
		end,
		getAvailableTools = var24,
		getActiveTool = var25,
		getActiveSession = getActiveSession,
		getComposedEdits = var21,
		beginTool = function(p11) --[[ line: 235 ]]
			-- upvalues: registry (ref), fireAnalyticsEventModule (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), var16 (write), createEditSessionModule (copy), store (ref), setActiveSession (write)
			local var43 = registry.get(p11)
			
			if var43 == nil then return end
			if var43.cta.analyticsEvent ~= nil then
				fireAnalyticsEventModule(var43.cta.analyticsEvent, withCreationSession(makeCreationEventFieldsModule.makeToolField(var43)))
			end
			if var43.presentation == "InstantAction" then
				if var43.apply ~= nil then
					var43.apply(var16)
				end
				return
			else
				local _ = nil
				local createSession = var43.createSession
				local var44 = if createSession ~= nil then createEditSessionModule() else createSession()
				
				if var43.step == nil or store.navigate(var43.step) then
					var44.begin(store.getEditsMap(false)[p11])
					setActiveSession(var44)
					
					return
				end
			end
		end,
		commitActiveTool = function() --[[ line: 273 ]]
			-- upvalues: getActiveSession (write), var25 (ref), store (ref), creationFlowStateModule (copy), var16 (write), fireAnalyticsEventModule (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), setActiveSession (write)
			local var45 = getActiveSession(false)
			local var46 = var25(false)
			
			if var45 == nil or var46 == nil then
				store.navigate(creationFlowStateModule.Preview)
				
				return
			end
			local var47 = var45.commit()
			
			if var46.onCommit ~= nil and var46.onCommit(var47, var16) == false then return end
			store.setCommittedEdit(var46.kind, var47)
			
			if var46.cta.commitAnalyticsEvent ~= nil then
				fireAnalyticsEventModule(var46.cta.commitAnalyticsEvent, withCreationSession(makeCreationEventFieldsModule.makeToolField(var46)))
			end
			setActiveSession(nil)
			store.navigate(creationFlowStateModule.Preview)
		end,
		discardActiveTool = function() --[[ line: 298 ]]
			-- upvalues: getActiveSession (write), var25 (ref), fireAnalyticsEventModule (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), setActiveSession (write), store (ref), creationFlowStateModule (copy)
			local var48 = getActiveSession(false)
			local var49 = var25(false)
			
			if var48 ~= nil then
				var48.discard()
			end
			if var49 ~= nil and var49.cta.cancelAnalyticsEvent ~= nil then
				fireAnalyticsEventModule(var49.cta.cancelAnalyticsEvent, withCreationSession(makeCreationEventFieldsModule.makeToolField(var49)))
			end
			setActiveSession(nil)
			store.navigate(creationFlowStateModule.Preview)
		end,
		updateCommittedEdit = function(p12, p13) --[[ line: 318 ]]
			-- upvalues: store (ref)
			store.setCommittedEdit(p12, p13)
		end,
		getActiveModal = var19,
		showModal = showModal,
		dismissModal = dismissModal,
		publish = function() --[[ line: 330 ]]
			-- upvalues: store (ref), host (ref), var20 (ref), dialogTypeModule (copy), dismissModal (ref), getFFlagMomentsAnalyticsProducerPrereqs (copy), sessionManager (copy), funnelEventNames (copy), preview (ref), var21 (ref), fireAnalyticsEventModule (copy), eventNames (copy), cryoModule (copy), makeCreationEventFieldsModule (copy), p0 (ref), creationFlowStateModule (copy)
			local description = store.getDescription(false)
			
			if host.isTextFiltered ~= nil and host.isTextFiltered(description) then
				var20({
					modalType = dialogTypeModule.TextFiltered,
					modalProps = { onConfirm = dismissModal }
				})
				
				return
			end
			local var51 = if getFFlagMomentsAnalyticsProducerPrereqs() then sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow) else nil
			
			if host.createMoment ~= nil then
				host.createMoment(store.getSelectedCapture(false), var21(false), description, var51, preview.playback.getTimeLength(false))
			end
			fireAnalyticsEventModule(eventNames.MomentsEditingFlowPublished, cryoModule.Dictionary.join(makeCreationEventFieldsModule.makeStepField(eventNames.MomentsEditingFlowPublished), makeCreationEventFieldsModule.makeCreationBaseFields(var51)))
			var20(nil)
			store.clearEdits(if p0.excludeGallery then creationFlowStateModule.Preview else creationFlowStateModule.Gallery)
			
			if host.exitCreationFlow ~= nil then
				host.exitCreationFlow()
			end
		end,
		exit = function() --[[ line: 428 ]]
			-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), var20 (ref), store (ref), p0 (ref), creationFlowStateModule (copy), host (ref)
			fireAnalyticsEventModule(eventNames.MomentsEditingFlowExited, withCreationSession(makeCreationEventFieldsModule.makeStepField(eventNames.MomentsEditingFlowExited)))
			var20(nil)
			store.clearEdits(if p0.excludeGallery then creationFlowStateModule.Preview else creationFlowStateModule.Gallery)
			
			if host.exitCreationFlow ~= nil then
				host.exitCreationFlow()
			end
		end,
		generateText = function() --[[ line: 371 ]]
			-- upvalues: var22 (ref), host (ref), store (ref), var23 (ref), fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (ref), makeDefaultTextOverlayEditModule (copy)
			if var22(false) then return end
			if host.generateMomentText == nil then return end
			local selectedCapture = store.getSelectedCapture(false)
			
			if selectedCapture == nil then return end
			var23(true)
			local var53 = host.generateMomentText(selectedCapture)
			
			if var53 == nil then
				var23(false)
				
				return
			end
			var53:andThen(function(p14) --[[ line: 389 ]]
				-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (copy), host (copy), var23 (copy), makeDefaultTextOverlayEditModule (copy), store (copy)
				if p14 == nil or p14.error ~= nil then
					fireAnalyticsEventModule(eventNames.EditingFlowGenerateTextFailed, withCreationSession({}))
					
					if host.onGenerateTextFailure ~= nil then
						host.onGenerateTextFailure()
					end
					var23(false)
					
					return
				elseif p14.summary ~= nil and p14.summary ~= "" then
					local var54 = makeDefaultTextOverlayEditModule()
					var54.text = p14.summary
					local textOverlayEdits = store.getTextOverlayEdits(false)
					
					if textOverlayEdits == nil or #textOverlayEdits == 0 then
						store.updateTextOverlayEdits({ var54 })
					else
						local cloned = table.clone(textOverlayEdits)
						cloned[1] = var54
						store.updateTextOverlayEdits(cloned)
					end
				end
				if p14.description ~= nil and p14.description ~= "" then
					store.updateDescription(p14.description)
				end
				fireAnalyticsEventModule(eventNames.EditingFlowGenerateTextSucceeded, withCreationSession({}))
				
				if host.onGenerateTextSuccess ~= nil then
					host.onGenerateTextSuccess()
				end
				var23(false)
			end):catch(function() --[[ line: 419 ]]
				-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (copy), host (copy), var23 (copy)
				fireAnalyticsEventModule(eventNames.EditingFlowGenerateTextFailed, withCreationSession({}))
				
				if host.onGenerateTextFailure ~= nil then
					host.onGenerateTextFailure()
				end
				var23(false)
			end)
		end,
		getIsGenerating = var22,
		preview = preview
	}
end