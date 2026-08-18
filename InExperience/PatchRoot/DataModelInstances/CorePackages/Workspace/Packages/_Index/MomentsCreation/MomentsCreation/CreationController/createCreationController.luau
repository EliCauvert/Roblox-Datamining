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
local getFFlagEnableMomentTextGeneration = momentsCommonModule.Flags.GetFFlagEnableMomentTextGeneration
local getFFlagMomentsAnalyticsProducerPrereqs = momentsCommonModule.Flags.GetFFlagMomentsAnalyticsProducerPrereqs
local getFFlagMomentsCreationSaveDraft = momentsCommonModule.Flags.GetFFlagMomentsCreationSaveDraft
local fFlagMomentsRealtimeSessionTelemetry = momentsCommonModule.Flags.FFlagMomentsRealtimeSessionTelemetry
local fFlagMomentsContentStatsTelemetry = momentsCommonModule.Flags.FFlagMomentsContentStatsTelemetry
local fFlagMomentTextGenerationFilteredSignal = momentsCommonModule.Flags.FFlagMomentTextGenerationFilteredSignal
local createComputed = signalsModule.createComputed
local createSignal = signalsModule.createSignal

return function(p0) --[[ line: 72 | named "createCreationController" ]]
	-- upvalues: creationToolRegistryModule (ref), defaultCreationToolsModule (ref), getFFlagMomentsAnalyticsProducerPrereqs (ref), sessionManager (ref), funnelEventNames (ref), getFFlagMomentsCreationPersistEditSessionModule (ref), createSignal (ref), createComputed (ref), getFFlagEnableMomentTextGeneration (ref), getFFlagMomentsTTSAudioOverlayModule (ref), createCapturePreviewControllerModule (ref), createTTSAudioManagerModule (ref), cryoModule (ref), makeCreationEventFieldsModule (ref), creationFlowStateModule (ref), getFFlagMomentsCreationSaveDraft (ref), momentsDraftStorageModule (ref), fireAnalyticsEventModule (ref), eventNames (ref), fFlagMomentsRealtimeSessionTelemetry (ref), momentsCommonModule (ref), fFlagMomentsContentStatsTelemetry (ref), createEditSessionModule (ref), dialogTypeModule (ref), fFlagMomentTextGenerationFilteredSignal (ref), makeDefaultTextOverlayEditModule (ref)
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
		
		local setActiveSession = function(p1) --[[ line: 101 ]]
			-- upvalues: var22 (write)
			var22(p1)
		end
	end
	local getIsGenerating, setIsGenerating
	var22, var23 = createSignal(nil)
	local var24 = createComputed(function(p2) --[[ line: 110 ]]
		-- upvalues: store (ref), registry (ref)
		local t = {}
		
		for i, v in store.getEditsMap(p2) do
			if v ~= nil then
				local var42 = registry.get(i)
				
				if var42 == nil or var42.toEdits == nil then
					t[i] = v
				else
					for i_1, v_1 in var42.toEdits(v) do
						t[i_1] = v_1
					end
				end
			end
		end
		return t
	end)
	local _ = nil
	local _ = nil
	
	if getFFlagEnableMomentTextGeneration() then
		getIsGenerating = store.getIsGenerating
		setIsGenerating = store.setIsGenerating
	else
		local var25, var26 = createSignal(false)
		getIsGenerating = var25
		setIsGenerating = var26
	end
	local getActiveGeneration, setActiveGeneration
	local _ = nil
	local _ = nil
	
	if getFFlagEnableMomentTextGeneration() then
		getActiveGeneration = store.getActiveGeneration
		setActiveGeneration = store.setActiveGeneration
	else
		local var27, var28 = createSignal(nil)
		getActiveGeneration = var27
		setActiveGeneration = var28
	end
	local function _() --[[ line: 157 | named "cancelActiveGeneration" ]]
		-- upvalues: getActiveGeneration (write), setActiveGeneration (write), setIsGenerating (write)
		local var43 = getActiveGeneration(false)
		
		if var43 == nil then
			return
		end
		var43.promise:cancel()
		setActiveGeneration(nil)
		setIsGenerating(false)
	end
	
	local var29, var30 = createSignal(false)
	local var31 = createComputed(function(p3) --[[ line: 173 ]]
		-- upvalues: store (ref), host (ref), var24 (ref), registry (ref)
		local selectedCapture = store.getSelectedCapture(p3)
		local var45 = if selectedCapture ~= nil then nil else selectedCapture.CaptureType
		local t = {
			canGenerateText = host.generateMomentText ~= nil,
			captureType = var45,
			getComposedEdits = var24
		}
		local t_1 = {}
		
		for i, v in registry.getAll() do
			if (if v.supportedCaptureTypes ~= nil then var45 ~= nil and table.find(v.supportedCaptureTypes, var45) ~= nil else true) and (v.isAvailable == nil or v.isAvailable(t)) then
				table.insert(t_1, v)
			end
		end
		return t_1
	end)
	local var32 = createComputed(function(p4) --[[ line: 195 ]]
		-- upvalues: store (ref), registry (ref)
		local step = store.getStep(p4)
		
		for i, v in registry.getAll() do
			if v.step == step then
				return v
			end
		end
		return nil
	end)
	local var33 = createComputed(function(p5) --[[ line: 240 ]]
		-- upvalues: getFFlagMomentsTTSAudioOverlayModule (copy), var32 (ref), getActiveSession (write), var24 (ref)
		if not getFFlagMomentsTTSAudioOverlayModule then
			return nil
		end
		local var49 = var32(p5)
		
		if var49 ~= nil and var49.kind == "voice" then
			local var50 = getActiveSession(p5)
			local var51 = if var50 ~= nil then nil else var50.getDraft(p5)
			
			return if var51 == nil or var51.text == nil or var51.text == "" then var24(p5).tts else var51
		end
	end)
	local preview = p0.preview or createCapturePreviewControllerModule(store, createComputed(function(p6) --[[ line: 209 ]]
		-- upvalues: var32 (ref), getActiveSession (write), var24 (ref)
		local var52 = var32(p6)
		
		if var52 ~= nil and var52.kind == "trim" then
			local var53 = getActiveSession(p6)
			local var54 = if var53 ~= nil then nil else var53.getDraft(p6)
			
			if var54 ~= nil and var54.startTime ~= nil and var54.endTime ~= nil then
				return { startTime = var54.startTime, endTime = var54.endTime }
			end
		end
		local trim = var24(p6).trim
		
		return if trim == nil or trim.startTime == nil or trim.endTime == nil then nil else { startTime = trim.startTime, endTime = trim.endTime }
	end), createComputed(function(p7) --[[ line: 228 ]]
		-- upvalues: var32 (ref), getActiveSession (write), var24 (ref)
		local var55 = var32(p7)
		
		if var55 ~= nil and var55.kind == "music" then
			local var56 = getActiveSession(p7)
			local var57 = if var56 ~= nil then nil else var56.getDraft(p7)
			
			return if var57 == nil or var57.assetId == nil then var24(p7).music else var57
		end
	end))
	local var35 = nil
	
	if p0.ttsAudio ~= nil then
		var35 = p0.ttsAudio
	elseif getFFlagMomentsTTSAudioOverlayModule then
		var35 = store.getTTSAudio(false)
		
		if var35 == nil then
			var35 = createTTSAudioManagerModule()
			store.setTTSAudio(var35)
		end
	end
	local function showModal(p8) --[[ line: 269 ]]
		-- upvalues: var23 (ref)
		var23(p8)
	end
	
	local function dismissModal() --[[ line: 273 ]]
		-- upvalues: var23 (ref)
		var23(nil)
	end
	
	local function dismissVoiceCoachmark() --[[ line: 277 ]]
		-- upvalues: var30 (ref)
		var30(true)
	end
	
	local function withCreationSession(p9) --[[ line: 285 ]]
		-- upvalues: sessionManager (copy), funnelEventNames (copy), cryoModule (copy), makeCreationEventFieldsModule (copy)
		return cryoModule.Dictionary.join(p9, makeCreationEventFieldsModule.makeCreationBaseFields(sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow)))
	end
	
	local function dismiss() --[[ line: 481 ]]
		-- upvalues: getFFlagEnableMomentTextGeneration (copy), getActiveGeneration (write), setActiveGeneration (write), setIsGenerating (write), host (ref), var23 (ref), p0 (ref), creationFlowStateModule (copy), store (ref), var35 (write), getFFlagMomentsCreationSaveDraft (copy), momentsDraftStorageModule (copy)
		if getFFlagEnableMomentTextGeneration() then
			local var58 = getActiveGeneration(false)
			
			if var58 ~= nil then
				var58.promise:cancel()
				setActiveGeneration(nil)
				setIsGenerating(false)
			end
			if host.dismissGenerationToasts ~= nil then
				host.dismissGenerationToasts()
			end
		end
		var23(nil)
		store.clearEdits(if p0.excludeGallery then creationFlowStateModule.Preview else creationFlowStateModule.Gallery)
		
		if var35 ~= nil then
			var35.destroy()
			store.setTTSAudio(nil)
		end
		if getFFlagMomentsCreationSaveDraft() then
			momentsDraftStorageModule.clear()
		end
		if host.exitCreationFlow ~= nil then
			host.exitCreationFlow()
		end
	end
	
	return {
		getStep = store.getStep,
		navigate = function(p10) --[[ line: 290 ]]
			-- upvalues: store (ref)
			store.navigate(p10)
		end,
		returnToGallery = function() --[[ line: 295 ]]
			-- upvalues: getFFlagEnableMomentTextGeneration (copy), getActiveGeneration (write), setActiveGeneration (write), setIsGenerating (write), store (ref), creationFlowStateModule (copy), setActiveSession (write), var35 (write), getFFlagMomentsCreationSaveDraft (copy), momentsDraftStorageModule (copy), fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (ref)
			if getFFlagEnableMomentTextGeneration() then
				local var59 = getActiveGeneration(false)
				
				if var59 ~= nil then
					var59.promise:cancel()
					setActiveGeneration(nil)
					setIsGenerating(false)
				end
			end
			store.clearEdits(creationFlowStateModule.Gallery)
			setActiveSession(nil)
			
			if var35 ~= nil then
				var35.reset()
			end
			if getFFlagMomentsCreationSaveDraft() then
				momentsDraftStorageModule.clear()
				fireAnalyticsEventModule(eventNames.MomentsReturnToGallery, withCreationSession({}))
			end
		end,
		getSelectedCapture = store.getSelectedCapture,
		selectCapture = function(p11) --[[ line: 317 ]]
			-- upvalues: getActiveGeneration (write), getFFlagEnableMomentTextGeneration (copy), setActiveGeneration (write), setIsGenerating (write), store (ref), fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), fFlagMomentsRealtimeSessionTelemetry (copy), momentsCommonModule (copy)
			local var60 = getActiveGeneration(false)
			
			if getFFlagEnableMomentTextGeneration() and var60 ~= nil and p11 ~= var60.capture then
				local var61 = getActiveGeneration(false)
				
				if var61 ~= nil then
					var61.promise:cancel()
					setActiveGeneration(nil)
					setIsGenerating(false)
				end
			end
			store.onSelectedCaptureUpdated(p11)
			
			if p11 ~= nil then
				fireAnalyticsEventModule(eventNames.EditingFlowGalleryItemSelected, withCreationSession(makeCreationEventFieldsModule.makeToolFieldFromKind("gallery")))
				
				if fFlagMomentsRealtimeSessionTelemetry then
					momentsCommonModule.Analytics.reportMomentsCreationStep("gallery_selected")
				end
			end
		end,
		getDescription = store.getDescription,
		setDescription = function(value) --[[ line: 339 ]]
			-- upvalues: store (ref)
			store.updateDescription(value)
		end,
		getAvailableTools = var31,
		getActiveTool = var32,
		getActiveSession = getActiveSession,
		getComposedEdits = var24,
		getEffectiveTTS = var33,
		beginTool = function(p12) --[[ line: 343 ]]
			-- upvalues: registry (ref), fFlagMomentsContentStatsTelemetry (copy), momentsCommonModule (copy), fireAnalyticsEventModule (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), var19 (write), createEditSessionModule (copy), store (ref), setActiveSession (write)
			local var62 = registry.get(p12)
			
			if var62 == nil then return end
			if fFlagMomentsContentStatsTelemetry then
				momentsCommonModule.Analytics.reportMomentsEditToolOpened(var62.kind)
			end
			if var62.cta.analyticsEvent ~= nil then
				fireAnalyticsEventModule(var62.cta.analyticsEvent, withCreationSession(makeCreationEventFieldsModule.makeToolField(var62)))
			end
			if var62.presentation == "InstantAction" then
				if var62.apply ~= nil then
					var62.apply(var19)
				end
				return
			else
				local _ = nil
				local createSession = var62.createSession
				local var63 = if createSession ~= nil then createEditSessionModule() else createSession()
				
				if var62.step == nil or store.navigate(var62.step) then
					var63.begin(store.getEditsMap(false)[p12])
					setActiveSession(var63)
					
					return
				end
			end
		end,
		commitActiveTool = function() --[[ line: 385 ]]
			-- upvalues: getActiveSession (write), var32 (ref), store (ref), creationFlowStateModule (copy), var19 (write), fireAnalyticsEventModule (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), setActiveSession (write)
			local var64 = getActiveSession(false)
			local var65 = var32(false)
			
			if var64 == nil or var65 == nil then
				store.navigate(creationFlowStateModule.Preview)
				
				return
			end
			local var66 = var64.commit()
			
			if var65.onCommit ~= nil and var65.onCommit(var66, var19) == false then return end
			store.setCommittedEdit(var65.kind, var66)
			
			if var65.cta.commitAnalyticsEvent ~= nil then
				fireAnalyticsEventModule(var65.cta.commitAnalyticsEvent, withCreationSession(makeCreationEventFieldsModule.makeToolField(var65)))
			end
			setActiveSession(nil)
			store.navigate(creationFlowStateModule.Preview)
		end,
		saveActiveTool = function() --[[ line: 412 ]]
			-- upvalues: getActiveSession (write), var32 (ref), store (ref)
			local var67 = getActiveSession(false)
			local var68 = var32(false)
			
			if var67 == nil or var68 == nil then
				return
			end
			store.setCommittedEdit(var68.kind, var67.commit())
		end,
		clearActiveTool = function() --[[ line: 427 ]]
			-- upvalues: getActiveSession (write), var32 (ref), var35 (write)
			local var69 = getActiveSession(false)
			local var70 = var32(false)
			
			if var70 == nil then return end
			if var69 ~= nil then
				var69.update(nil)
			end
			if var70.kind == "voice" and var35 ~= nil then
				var35.reset()
			end
		end,
		discardActiveTool = function() --[[ line: 441 ]]
			-- upvalues: getActiveSession (write), var32 (ref), var35 (write), var24 (ref), fireAnalyticsEventModule (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), fFlagMomentsContentStatsTelemetry (copy), momentsCommonModule (copy), setActiveSession (write), store (ref), creationFlowStateModule (copy)
			local var71 = getActiveSession(false)
			local var72 = var32(false)
			
			if var71 ~= nil then
				var71.discard()
			end
			if var72 ~= nil and var72.kind == "voice" and var35 ~= nil then
				local tts = var24(false).tts
				
				if tts == nil or tts.text == nil or tts.text == "" then
					var35.reset()
				else
					var35.generate(tts.text, tts.voiceId)
				end
			end
			if var72 ~= nil and var72.cta.cancelAnalyticsEvent ~= nil then
				fireAnalyticsEventModule(var72.cta.cancelAnalyticsEvent, withCreationSession(makeCreationEventFieldsModule.makeToolField(var72)))
			end
			if fFlagMomentsContentStatsTelemetry and var72 ~= nil then
				momentsCommonModule.Analytics.reportMomentsEditToolAbandoned(var72.kind)
			end
			setActiveSession(nil)
			store.navigate(creationFlowStateModule.Preview)
		end,
		updateCommittedEdit = function(p13, p14) --[[ line: 477 ]]
			-- upvalues: store (ref)
			store.setCommittedEdit(p13, p14)
		end,
		onDisabledToolActivated = function(p15) --[[ line: 703 ]]
			-- upvalues: getFFlagEnableMomentTextGeneration (copy), getIsGenerating (write), host (ref)
			if getFFlagEnableMomentTextGeneration() and p15 == "text" and (getIsGenerating(false) and host.onGenerateTextManualEditBlocked ~= nil) then
				host.onGenerateTextManualEditBlocked()
			end
		end,
		getActiveModal = var22,
		showModal = showModal,
		dismissModal = dismissModal,
		getVoiceCoachmarkDismissed = var29,
		dismissVoiceCoachmark = dismissVoiceCoachmark,
		publish = function() --[[ line: 510 ]]
			-- upvalues: store (ref), host (ref), var23 (ref), dialogTypeModule (copy), dismissModal (ref), getFFlagMomentsAnalyticsProducerPrereqs (copy), sessionManager (copy), funnelEventNames (copy), preview (ref), var24 (ref), fireAnalyticsEventModule (copy), eventNames (copy), cryoModule (copy), makeCreationEventFieldsModule (copy), fFlagMomentsRealtimeSessionTelemetry (copy), momentsCommonModule (copy), fFlagMomentsContentStatsTelemetry (copy), dismiss (ref)
			local description = store.getDescription(false)
			
			if host.isTextFiltered ~= nil and host.isTextFiltered(description) then
				var23({
					modalType = dialogTypeModule.TextFiltered,
					modalProps = { onConfirm = dismissModal }
				})
				
				return
			end
			local var74 = if getFFlagMomentsAnalyticsProducerPrereqs() then sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow) else nil
			
			if host.createMoment ~= nil then
				host.createMoment(store.getSelectedCapture(false), var24(false), description, var74, preview.playback.getTimeLength(false))
			end
			fireAnalyticsEventModule(eventNames.MomentsEditingFlowPublished, cryoModule.Dictionary.join(makeCreationEventFieldsModule.makeStepField(eventNames.MomentsEditingFlowPublished), makeCreationEventFieldsModule.makeCreationBaseFields(var74)))
			
			if fFlagMomentsRealtimeSessionTelemetry then
				momentsCommonModule.Analytics.reportMomentsCreationStep("published")
			end
			if fFlagMomentsContentStatsTelemetry then
				local analytics = momentsCommonModule.Analytics
				local var75 = var24(false)
				local var76 = 0
				
				if var75.music ~= nil then
					var76 += 1
					analytics.reportMomentsPublishedWithEdit("music")
				end
				if var75.trim ~= nil then
					var76 += 1
					analytics.reportMomentsPublishedWithEdit("trim")
				end
				if var75.textOverlays ~= nil and #var75.textOverlays > 0 then
					var76 += 1
					analytics.reportMomentsPublishedWithEdit("text_overlay")
				end
				if var75.stickerOverlays ~= nil and #var75.stickerOverlays > 0 then
					var76 += 1
					analytics.reportMomentsPublishedWithEdit("sticker")
				end
				if description ~= nil and description ~= "" then
					var76 += 1
					analytics.reportMomentsPublishedWithEdit("description")
				end
				analytics.reportMomentsPublishedEditCount(var76)
				local selectedCapture = store.getSelectedCapture(false)
				
				if selectedCapture ~= nil then
					analytics.reportMomentsPublishedByCaptureType(if selectedCapture.CaptureType == Enum.CaptureType.Video then "video" elseif selectedCapture.CaptureType == Enum.CaptureType.Screenshot then "screenshot" else "unknown")
				end
			end
			dismiss()
		end,
		exit = function() --[[ line: 711 ]]
			-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), dismiss (ref)
			fireAnalyticsEventModule(eventNames.MomentsEditingFlowExited, withCreationSession(makeCreationEventFieldsModule.makeStepField(eventNames.MomentsEditingFlowExited)))
			dismiss()
		end,
		generateText = function() --[[ line: 592 ]]
			-- upvalues: getIsGenerating (write), host (ref), store (ref), getFFlagEnableMomentTextGeneration (copy), setIsGenerating (write), setActiveGeneration (write), fFlagMomentTextGenerationFilteredSignal (copy), fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (ref), fFlagMomentsContentStatsTelemetry (copy), momentsCommonModule (copy), makeDefaultTextOverlayEditModule (copy)
			if getIsGenerating(false) then return end
			if host.generateMomentText == nil then return end
			local selectedCapture = store.getSelectedCapture(false)
			
			if selectedCapture == nil then return end
			if getFFlagEnableMomentTextGeneration() and host.onGenerateTextWillReplaceInput ~= nil then
				local textOverlayEdits = store.getTextOverlayEdits(false)
				
				if textOverlayEdits ~= nil and #textOverlayEdits > 0 then
					host.onGenerateTextWillReplaceInput()
				end
			end
			setIsGenerating(true)
			local var80 = host.generateMomentText(selectedCapture)
			
			if var80 == nil then
				setIsGenerating(false)
				
				return
			elseif getFFlagEnableMomentTextGeneration() then
				setActiveGeneration({ promise = var80, capture = selectedCapture })
			end
			var80:andThen(function(p16) --[[ line: 619 ]]
				-- upvalues: getFFlagEnableMomentTextGeneration (copy), setActiveGeneration (copy), fFlagMomentTextGenerationFilteredSignal (copy), fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (copy), fFlagMomentsContentStatsTelemetry (copy), momentsCommonModule (copy), host (copy), setIsGenerating (copy), store (copy), makeDefaultTextOverlayEditModule (copy)
				if getFFlagEnableMomentTextGeneration() then
					setActiveGeneration(nil)
				end
				if fFlagMomentTextGenerationFilteredSignal and p16 ~= nil and p16.error == "CONTENT_FILTERED" then
					fireAnalyticsEventModule(eventNames.EditingFlowGenerateTextFiltered, withCreationSession({}))
					
					if fFlagMomentsContentStatsTelemetry then
						momentsCommonModule.Analytics.reportMomentsGenerateText("filtered")
					end
					if host.onGenerateTextFiltered ~= nil then
						host.onGenerateTextFiltered()
					end
					setIsGenerating(false)
					
					return
				elseif p16 == nil or p16.error ~= nil then
					fireAnalyticsEventModule(eventNames.EditingFlowGenerateTextFailed, withCreationSession({}))
					
					if fFlagMomentsContentStatsTelemetry then
						momentsCommonModule.Analytics.reportMomentsGenerateText("failed")
					end
					if host.onGenerateTextFailure ~= nil then
						host.onGenerateTextFailure()
					end
					setIsGenerating(false)
					
					return
				elseif p16.summary ~= nil and p16.summary ~= "" then
					local var83
					local textOverlayEdits = store.getTextOverlayEdits(false)
					local var82 = if textOverlayEdits ~= nil then nil else textOverlayEdits[1]
					local _ = nil
					
					if getFFlagEnableMomentTextGeneration() and var82 ~= nil then
						var83 = table.clone(var82)
						var83.text = p16.summary
					else
						var83 = makeDefaultTextOverlayEditModule()
						var83.text = p16.summary
					end
					if textOverlayEdits == nil or #textOverlayEdits == 0 then
						store.updateTextOverlayEdits({ var83 })
					else
						local cloned = table.clone(textOverlayEdits)
						cloned[1] = var83
						store.updateTextOverlayEdits(cloned)
					end
				end
				if p16.description ~= nil and p16.description ~= "" then
					store.updateDescription(p16.description)
					
					if fFlagMomentTextGenerationFilteredSignal then
						store.setGeneratedDescription(p16.description)
					end
				end
				fireAnalyticsEventModule(eventNames.EditingFlowGenerateTextSucceeded, withCreationSession({}))
				
				if fFlagMomentsContentStatsTelemetry then
					momentsCommonModule.Analytics.reportMomentsGenerateText("succeeded")
				end
				if host.onGenerateTextSuccess ~= nil then
					host.onGenerateTextSuccess()
				end
				setIsGenerating(false)
			end):catch(function() --[[ line: 685 ]]
				-- upvalues: getFFlagEnableMomentTextGeneration (copy), setActiveGeneration (copy), fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (copy), fFlagMomentsContentStatsTelemetry (copy), momentsCommonModule (copy), host (copy), setIsGenerating (copy)
				if getFFlagEnableMomentTextGeneration() then
					setActiveGeneration(nil)
				end
				fireAnalyticsEventModule(eventNames.EditingFlowGenerateTextFailed, withCreationSession({}))
				
				if fFlagMomentsContentStatsTelemetry then
					momentsCommonModule.Analytics.reportMomentsGenerateText("failed")
				end
				if host.onGenerateTextFailure ~= nil then
					host.onGenerateTextFailure()
				end
				setIsGenerating(false)
			end)
		end,
		getIsGenerating = getIsGenerating,
		preview = preview,
		ttsAudio = var35
	}
end