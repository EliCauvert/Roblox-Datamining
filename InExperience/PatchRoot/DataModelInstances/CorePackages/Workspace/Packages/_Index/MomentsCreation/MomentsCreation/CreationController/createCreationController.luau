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
local createTTSAudioManagerModule = require(momentsCreation.Audio.createTTSAudioManager)
local createEditSessionModule = require(momentsCreation.Stores.createEditSession)
local fireAnalyticsEventModule = require(momentsCreation.Analytics.fireAnalyticsEvent)
local makeDefaultTextOverlayEditModule = require(momentsCreation.Utils.makeDefaultTextOverlayEdit)
local getFFlagMomentsCreationPersistEditSessionModule = require(momentsCreation.Flags.GetFFlagMomentsCreationPersistEditSession)
local getFFlagMomentsTTSAudioOverlayModule = require(momentsCreation.Flags.GetFFlagMomentsTTSAudioOverlay)
local momentsDraftStorageModule = require(momentsCreation.Storage.MomentsDraftStorage)
local makeCreationEventFieldsModule = require(momentsCreation.Analytics.makeCreationEventFields)
local momentsCommonModule = require(parent.MomentsCommon)
local eventNames = momentsCommonModule.Analytics.EventNames
local sessionManager = momentsCommonModule.Analytics.SessionManager
local funnelEventNames = momentsCommonModule.Analytics.FunnelEventNames
local getFFlagMomentsAnalyticsProducerPrereqs = momentsCommonModule.Flags.GetFFlagMomentsAnalyticsProducerPrereqs
local getFFlagMomentsCreationSaveDraft = momentsCommonModule.Flags.GetFFlagMomentsCreationSaveDraft
local fFlagMomentsRealtimeSessionTelemetry = momentsCommonModule.Flags.FFlagMomentsRealtimeSessionTelemetry
local fFlagMomentsContentStatsTelemetry = momentsCommonModule.Flags.FFlagMomentsContentStatsTelemetry
local createComputed = signalsModule.createComputed
local createSignal = signalsModule.createSignal

return function(p0) --[[ line: 70 | named "createCreationController" ]]
	-- upvalues: creationToolRegistryModule (ref), defaultCreationToolsModule (ref), getFFlagMomentsAnalyticsProducerPrereqs (ref), sessionManager (ref), funnelEventNames (ref), getFFlagMomentsCreationPersistEditSessionModule (ref), createSignal (ref), createComputed (ref), getFFlagMomentsTTSAudioOverlayModule (ref), createCapturePreviewControllerModule (ref), createTTSAudioManagerModule (ref), cryoModule (ref), makeCreationEventFieldsModule (ref), creationFlowStateModule (ref), getFFlagMomentsCreationSaveDraft (ref), momentsDraftStorageModule (ref), fireAnalyticsEventModule (ref), eventNames (ref), fFlagMomentsRealtimeSessionTelemetry (ref), momentsCommonModule (ref), fFlagMomentsContentStatsTelemetry (ref), createEditSessionModule (ref), dialogTypeModule (ref), makeDefaultTextOverlayEditModule (ref)
	local store = p0.store
	local host = p0.host or {}
	local registry = p0.registry or creationToolRegistryModule(defaultCreationToolsModule)
	
	if getFFlagMomentsAnalyticsProducerPrereqs() and sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow) == nil then
		sessionManager.startSession(funnelEventNames.FunnelTypes.CreationFlow)
	end
	local getActiveSession, var22
	local var19 = nil
	local _ = nil
	local _ = nil
	
	if getFFlagMomentsCreationPersistEditSessionModule() then
		getActiveSession = store.getActiveSession
		local setActiveSession = store.setActiveSession
	else
		local _ = nil
		local var20, var21 = createSignal(nil)
		getActiveSession = var20
		var22 = var21
		
		local setActiveSession = function(p1) --[[ line: 99 ]]
			-- upvalues: var22 (write)
			var22(p1)
		end
	end
	var22, var23 = createSignal(nil)
	local var24 = createComputed(function(p2) --[[ line: 108 ]]
		-- upvalues: store (ref), registry (ref)
		local t = {}
		
		for i, v in store.getEditsMap(p2) do
			if v ~= nil then
				local var37 = registry.get(i)
				
				if var37 == nil or var37.toEdits == nil then
					t[i] = v
				else
					for i_1, v_1 in var37.toEdits(v) do
						t[i_1] = v_1
					end
				end
			end
		end
		return t
	end)
	local var25, var26 = createSignal(false)
	local var27 = createComputed(function(p3) --[[ line: 130 ]]
		-- upvalues: store (ref), host (ref), var24 (ref), registry (ref)
		local selectedCapture = store.getSelectedCapture(p3)
		local var39 = if selectedCapture ~= nil then nil else selectedCapture.CaptureType
		local t = {
			canGenerateText = host.generateMomentText ~= nil,
			captureType = var39,
			getComposedEdits = var24
		}
		local t_1 = {}
		
		for i, v in registry.getAll() do
			if (if v.supportedCaptureTypes ~= nil then var39 ~= nil and table.find(v.supportedCaptureTypes, var39) ~= nil else true) and (v.isAvailable == nil or v.isAvailable(t)) then
				table.insert(t_1, v)
			end
		end
		return t_1
	end)
	local var28 = createComputed(function(p4) --[[ line: 152 ]]
		-- upvalues: store (ref), registry (ref)
		local step = store.getStep(p4)
		
		for i, v in registry.getAll() do
			if v.step == step then
				return v
			end
		end
		return nil
	end)
	local var29 = createComputed(function(p5) --[[ line: 197 ]]
		-- upvalues: getFFlagMomentsTTSAudioOverlayModule (copy), var28 (ref), getActiveSession (write), var24 (ref)
		if not getFFlagMomentsTTSAudioOverlayModule then
			return nil
		end
		local var43 = var28(p5)
		
		if var43 ~= nil and var43.kind == "voice" then
			local var44 = getActiveSession(p5)
			local var45 = if var44 ~= nil then nil else var44.getDraft(p5)
			
			return if var45 == nil or var45.text == nil or var45.text == "" then var24(p5).tts else var45
		end
	end)
	local preview = p0.preview or createCapturePreviewControllerModule(store, createComputed(function(p6) --[[ line: 166 ]]
		-- upvalues: var28 (ref), getActiveSession (write), var24 (ref)
		local var46 = var28(p6)
		
		if var46 ~= nil and var46.kind == "trim" then
			local var47 = getActiveSession(p6)
			local var48 = if var47 ~= nil then nil else var47.getDraft(p6)
			
			if var48 ~= nil and var48.startTime ~= nil and var48.endTime ~= nil then
				return { startTime = var48.startTime, endTime = var48.endTime }
			end
		end
		local trim = var24(p6).trim
		
		return if trim == nil or trim.startTime == nil or trim.endTime == nil then nil else { startTime = trim.startTime, endTime = trim.endTime }
	end), createComputed(function(p7) --[[ line: 185 ]]
		-- upvalues: var28 (ref), getActiveSession (write), var24 (ref)
		local var49 = var28(p7)
		
		if var49 ~= nil and var49.kind == "music" then
			local var50 = getActiveSession(p7)
			local var51 = if var50 ~= nil then nil else var50.getDraft(p7)
			
			return if var51 == nil or var51.assetId == nil then var24(p7).music else var51
		end
	end))
	local ttsAudio = p0.ttsAudio or (if getFFlagMomentsTTSAudioOverlayModule then createTTSAudioManagerModule() else nil)
	
	local function showModal(p8) --[[ line: 217 ]]
		-- upvalues: var23 (ref)
		var23(p8)
	end
	
	local function dismissModal() --[[ line: 221 ]]
		-- upvalues: var23 (ref)
		var23(nil)
	end
	
	local function withCreationSession(p9) --[[ line: 229 ]]
		-- upvalues: sessionManager (copy), funnelEventNames (copy), cryoModule (copy), makeCreationEventFieldsModule (copy)
		return cryoModule.Dictionary.join(p9, makeCreationEventFieldsModule.makeCreationBaseFields(sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow)))
	end
	
	local function dismiss() --[[ line: 415 ]]
		-- upvalues: var23 (ref), p0 (ref), creationFlowStateModule (copy), store (ref), getFFlagMomentsCreationSaveDraft (copy), momentsDraftStorageModule (copy), host (ref)
		var23(nil)
		store.clearEdits(if p0.excludeGallery then creationFlowStateModule.Preview else creationFlowStateModule.Gallery)
		
		if getFFlagMomentsCreationSaveDraft() then
			momentsDraftStorageModule.clear()
		end
		if host.exitCreationFlow ~= nil then
			host.exitCreationFlow()
		end
	end
	
	return {
		getStep = store.getStep,
		navigate = function(p10) --[[ line: 234 ]]
			-- upvalues: store (ref)
			store.navigate(p10)
		end,
		returnToGallery = function() --[[ line: 239 ]]
			-- upvalues: store (ref), creationFlowStateModule (copy), setActiveSession (write), ttsAudio (ref), getFFlagMomentsCreationSaveDraft (copy), momentsDraftStorageModule (copy), fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (ref)
			store.clearEdits(creationFlowStateModule.Gallery)
			setActiveSession(nil)
			
			if ttsAudio ~= nil then
				ttsAudio.reset()
			end
			if getFFlagMomentsCreationSaveDraft() then
				momentsDraftStorageModule.clear()
				fireAnalyticsEventModule(eventNames.MomentsReturnToGallery, withCreationSession({}))
			end
		end,
		getSelectedCapture = store.getSelectedCapture,
		selectCapture = function(p11) --[[ line: 255 ]]
			-- upvalues: store (ref), fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), fFlagMomentsRealtimeSessionTelemetry (copy), momentsCommonModule (copy)
			store.onSelectedCaptureUpdated(p11)
			
			if p11 ~= nil then
				fireAnalyticsEventModule(eventNames.EditingFlowGalleryItemSelected, withCreationSession(makeCreationEventFieldsModule.makeToolFieldFromKind("gallery")))
				
				if fFlagMomentsRealtimeSessionTelemetry then
					momentsCommonModule.Analytics.reportMomentsCreationStep("gallery_selected")
				end
			end
		end,
		getDescription = store.getDescription,
		setDescription = function(value) --[[ line: 271 ]]
			-- upvalues: store (ref)
			store.updateDescription(value)
		end,
		getAvailableTools = var27,
		getActiveTool = var28,
		getActiveSession = getActiveSession,
		getComposedEdits = var24,
		getEffectiveTTS = var29,
		beginTool = function(p12) --[[ line: 275 ]]
			-- upvalues: registry (ref), fFlagMomentsContentStatsTelemetry (copy), momentsCommonModule (copy), fireAnalyticsEventModule (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), var19 (write), createEditSessionModule (copy), store (ref), setActiveSession (write)
			local var52 = registry.get(p12)
			
			if var52 == nil then return end
			if fFlagMomentsContentStatsTelemetry then
				momentsCommonModule.Analytics.reportMomentsEditToolOpened(var52.kind)
			end
			if var52.cta.analyticsEvent ~= nil then
				fireAnalyticsEventModule(var52.cta.analyticsEvent, withCreationSession(makeCreationEventFieldsModule.makeToolField(var52)))
			end
			if var52.presentation == "InstantAction" then
				if var52.apply ~= nil then
					var52.apply(var19)
				end
				return
			else
				local _ = nil
				local createSession = var52.createSession
				local var53 = if createSession ~= nil then createEditSessionModule() else createSession()
				
				if var52.step == nil or store.navigate(var52.step) then
					var53.begin(store.getEditsMap(false)[p12])
					setActiveSession(var53)
					
					return
				end
			end
		end,
		commitActiveTool = function() --[[ line: 317 ]]
			-- upvalues: getActiveSession (write), var28 (ref), store (ref), creationFlowStateModule (copy), var19 (write), fireAnalyticsEventModule (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), setActiveSession (write)
			local var54 = getActiveSession(false)
			local var55 = var28(false)
			
			if var54 == nil or var55 == nil then
				store.navigate(creationFlowStateModule.Preview)
				
				return
			end
			local var56 = var54.commit()
			
			if var55.onCommit ~= nil and var55.onCommit(var56, var19) == false then return end
			store.setCommittedEdit(var55.kind, var56)
			
			if var55.cta.commitAnalyticsEvent ~= nil then
				fireAnalyticsEventModule(var55.cta.commitAnalyticsEvent, withCreationSession(makeCreationEventFieldsModule.makeToolField(var55)))
			end
			setActiveSession(nil)
			store.navigate(creationFlowStateModule.Preview)
		end,
		saveActiveTool = function() --[[ line: 346 ]]
			-- upvalues: getActiveSession (write), var28 (ref), store (ref)
			local var57 = getActiveSession(false)
			local var58 = var28(false)
			
			if var57 == nil or var58 == nil then
				return
			end
			store.setCommittedEdit(var58.kind, var57.commit())
		end,
		clearActiveTool = function() --[[ line: 361 ]]
			-- upvalues: getActiveSession (write), var28 (ref), ttsAudio (ref)
			local var59 = getActiveSession(false)
			local var60 = var28(false)
			
			if var60 == nil then return end
			if var59 ~= nil then
				var59.update(nil)
			end
			if var60.kind == "voice" and ttsAudio ~= nil then
				ttsAudio.reset()
			end
		end,
		discardActiveTool = function() --[[ line: 375 ]]
			-- upvalues: getActiveSession (write), var28 (ref), ttsAudio (ref), var24 (ref), fireAnalyticsEventModule (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), fFlagMomentsContentStatsTelemetry (copy), momentsCommonModule (copy), setActiveSession (write), store (ref), creationFlowStateModule (copy)
			local var61 = getActiveSession(false)
			local var62 = var28(false)
			
			if var61 ~= nil then
				var61.discard()
			end
			if var62 ~= nil and var62.kind == "voice" and ttsAudio ~= nil then
				local tts = var24(false).tts
				
				if tts == nil or tts.text == nil or tts.text == "" then
					ttsAudio.reset()
				else
					ttsAudio.generate(tts.text, tts.voiceId)
				end
			end
			if var62 ~= nil and var62.cta.cancelAnalyticsEvent ~= nil then
				fireAnalyticsEventModule(var62.cta.cancelAnalyticsEvent, withCreationSession(makeCreationEventFieldsModule.makeToolField(var62)))
			end
			if fFlagMomentsContentStatsTelemetry and var62 ~= nil then
				momentsCommonModule.Analytics.reportMomentsEditToolAbandoned(var62.kind)
			end
			setActiveSession(nil)
			store.navigate(creationFlowStateModule.Preview)
		end,
		updateCommittedEdit = function(p13, p14) --[[ line: 411 ]]
			-- upvalues: store (ref)
			store.setCommittedEdit(p13, p14)
		end,
		getActiveModal = var22,
		showModal = showModal,
		dismissModal = dismissModal,
		publish = function() --[[ line: 427 ]]
			-- upvalues: store (ref), host (ref), var23 (ref), dialogTypeModule (copy), dismissModal (ref), getFFlagMomentsAnalyticsProducerPrereqs (copy), sessionManager (copy), funnelEventNames (copy), preview (ref), var24 (ref), fireAnalyticsEventModule (copy), eventNames (copy), cryoModule (copy), makeCreationEventFieldsModule (copy), fFlagMomentsRealtimeSessionTelemetry (copy), momentsCommonModule (copy), fFlagMomentsContentStatsTelemetry (copy), dismiss (ref)
			local description = store.getDescription(false)
			
			if host.isTextFiltered ~= nil and host.isTextFiltered(description) then
				var23({
					modalType = dialogTypeModule.TextFiltered,
					modalProps = { onConfirm = dismissModal }
				})
				
				return
			end
			local var64 = if getFFlagMomentsAnalyticsProducerPrereqs() then sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow) else nil
			
			if host.createMoment ~= nil then
				host.createMoment(store.getSelectedCapture(false), var24(false), description, var64, preview.playback.getTimeLength(false))
			end
			fireAnalyticsEventModule(eventNames.MomentsEditingFlowPublished, cryoModule.Dictionary.join(makeCreationEventFieldsModule.makeStepField(eventNames.MomentsEditingFlowPublished), makeCreationEventFieldsModule.makeCreationBaseFields(var64)))
			
			if fFlagMomentsRealtimeSessionTelemetry then
				momentsCommonModule.Analytics.reportMomentsCreationStep("published")
			end
			if fFlagMomentsContentStatsTelemetry then
				local analytics = momentsCommonModule.Analytics
				local var65 = var24(false)
				local var66 = 0
				
				if var65.music ~= nil then
					var66 += 1
					analytics.reportMomentsPublishedWithEdit("music")
				end
				if var65.trim ~= nil then
					var66 += 1
					analytics.reportMomentsPublishedWithEdit("trim")
				end
				if var65.textOverlays ~= nil and #var65.textOverlays > 0 then
					var66 += 1
					analytics.reportMomentsPublishedWithEdit("text_overlay")
				end
				if var65.stickerOverlays ~= nil and #var65.stickerOverlays > 0 then
					var66 += 1
					analytics.reportMomentsPublishedWithEdit("sticker")
				end
				if description ~= nil and description ~= "" then
					var66 += 1
					analytics.reportMomentsPublishedWithEdit("description")
				end
				analytics.reportMomentsPublishedEditCount(var66)
				local selectedCapture = store.getSelectedCapture(false)
				
				if selectedCapture ~= nil then
					analytics.reportMomentsPublishedByCaptureType(if selectedCapture.CaptureType == Enum.CaptureType.Video then "video" elseif selectedCapture.CaptureType == Enum.CaptureType.Screenshot then "screenshot" else "unknown")
				end
			end
			dismiss()
		end,
		exit = function() --[[ line: 575 ]]
			-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), dismiss (ref)
			fireAnalyticsEventModule(eventNames.MomentsEditingFlowExited, withCreationSession(makeCreationEventFieldsModule.makeStepField(eventNames.MomentsEditingFlowExited)))
			dismiss()
		end,
		generateText = function() --[[ line: 509 ]]
			-- upvalues: var25 (ref), host (ref), store (ref), var26 (ref), fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (ref), fFlagMomentsContentStatsTelemetry (copy), momentsCommonModule (copy), makeDefaultTextOverlayEditModule (copy)
			if var25(false) then return end
			if host.generateMomentText == nil then return end
			local selectedCapture = store.getSelectedCapture(false)
			
			if selectedCapture == nil then return end
			var26(true)
			local var69 = host.generateMomentText(selectedCapture)
			
			if var69 == nil then
				var26(false)
				
				return
			end
			var69:andThen(function(p15) --[[ line: 527 ]]
				-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (copy), fFlagMomentsContentStatsTelemetry (copy), momentsCommonModule (copy), host (copy), var26 (copy), makeDefaultTextOverlayEditModule (copy), store (copy)
				if p15 == nil or p15.error ~= nil then
					fireAnalyticsEventModule(eventNames.EditingFlowGenerateTextFailed, withCreationSession({}))
					
					if fFlagMomentsContentStatsTelemetry then
						momentsCommonModule.Analytics.reportMomentsGenerateText("failed")
					end
					if host.onGenerateTextFailure ~= nil then
						host.onGenerateTextFailure()
					end
					var26(false)
					
					return
				elseif p15.summary ~= nil and p15.summary ~= "" then
					local var70 = makeDefaultTextOverlayEditModule()
					var70.text = p15.summary
					local textOverlayEdits = store.getTextOverlayEdits(false)
					
					if textOverlayEdits == nil or #textOverlayEdits == 0 then
						store.updateTextOverlayEdits({ var70 })
					else
						local cloned = table.clone(textOverlayEdits)
						cloned[1] = var70
						store.updateTextOverlayEdits(cloned)
					end
				end
				if p15.description ~= nil and p15.description ~= "" then
					store.updateDescription(p15.description)
				end
				fireAnalyticsEventModule(eventNames.EditingFlowGenerateTextSucceeded, withCreationSession({}))
				
				if fFlagMomentsContentStatsTelemetry then
					momentsCommonModule.Analytics.reportMomentsGenerateText("succeeded")
				end
				if host.onGenerateTextSuccess ~= nil then
					host.onGenerateTextSuccess()
				end
				var26(false)
			end):catch(function() --[[ line: 563 ]]
				-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (copy), fFlagMomentsContentStatsTelemetry (copy), momentsCommonModule (copy), host (copy), var26 (copy)
				fireAnalyticsEventModule(eventNames.EditingFlowGenerateTextFailed, withCreationSession({}))
				
				if fFlagMomentsContentStatsTelemetry then
					momentsCommonModule.Analytics.reportMomentsGenerateText("failed")
				end
				if host.onGenerateTextFailure ~= nil then
					host.onGenerateTextFailure()
				end
				var26(false)
			end)
		end,
		getIsGenerating = var25,
		preview = preview,
		ttsAudio = ttsAudio
	}
end