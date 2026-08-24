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
local getFFlagMomentsGenerateTextInTextOverlayModule = require(momentsCreation.Flags.GetFFlagMomentsGenerateTextInTextOverlay)
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

return function(p0) --[[ line: 73 | named "createCreationController" ]]
	-- upvalues: creationToolRegistryModule (ref), defaultCreationToolsModule (ref), getFFlagMomentsAnalyticsProducerPrereqs (ref), sessionManager (ref), funnelEventNames (ref), getFFlagMomentsCreationPersistEditSessionModule (ref), createSignal (ref), createComputed (ref), getFFlagEnableMomentTextGeneration (ref), getFFlagMomentsTTSAudioOverlayModule (ref), createCapturePreviewControllerModule (ref), createTTSAudioManagerModule (ref), cryoModule (ref), makeCreationEventFieldsModule (ref), creationFlowStateModule (ref), getFFlagMomentsCreationSaveDraft (ref), momentsDraftStorageModule (ref), fireAnalyticsEventModule (ref), eventNames (ref), fFlagMomentsRealtimeSessionTelemetry (ref), momentsCommonModule (ref), fFlagMomentsContentStatsTelemetry (ref), createEditSessionModule (ref), fFlagMomentTextGenerationFilteredSignal (ref), dialogTypeModule (ref), makeDefaultTextOverlayEditModule (ref), getFFlagMomentsGenerateTextInTextOverlayModule (ref)
	local store = p0.store
	local host = p0.host or {}
	local registry = p0.registry or creationToolRegistryModule(defaultCreationToolsModule)
	
	if getFFlagMomentsAnalyticsProducerPrereqs() and sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow) == nil then
		sessionManager.startSession(funnelEventNames.FunnelTypes.CreationFlow)
	end
	local getActiveSession, var23
	local var20 = nil
	local _ = nil
	local _ = nil
	
	if getFFlagMomentsCreationPersistEditSessionModule() then
		getActiveSession = store.getActiveSession
		local setActiveSession = store.setActiveSession
	else
		local _ = nil
		local var21, var22 = createSignal(nil)
		getActiveSession = var21
		var23 = var22
		
		local setActiveSession = function(p1) --[[ line: 102 ]]
			-- upvalues: var23 (write)
			var23(p1)
		end
	end
	local getIsGenerating, setIsGenerating
	var23, var24 = createSignal(nil)
	local var25 = createComputed(function(p2) --[[ line: 111 ]]
		-- upvalues: store (ref), registry (ref)
		local t = {}
		
		for i, v in store.getEditsMap(p2) do
			if v ~= nil then
				local var54 = registry.get(i)
				
				if var54 == nil or var54.toEdits == nil then
					t[i] = v
				else
					for i_1, v_1 in var54.toEdits(v) do
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
		local var26, var27 = createSignal(false)
		getIsGenerating = var26
		setIsGenerating = var27
	end
	local getActiveGeneration, setActiveGeneration
	local _ = nil
	local _ = nil
	
	if getFFlagEnableMomentTextGeneration() then
		getActiveGeneration = store.getActiveGeneration
		setActiveGeneration = store.setActiveGeneration
	else
		local var28, var29 = createSignal(nil)
		getActiveGeneration = var28
		setActiveGeneration = var29
	end
	local function _() --[[ line: 158 | named "cancelActiveGeneration" ]]
		-- upvalues: getActiveGeneration (write), setActiveGeneration (write), setIsGenerating (write)
		local var55 = getActiveGeneration(false)
		
		if var55 == nil then
			return
		end
		var55.promise:cancel()
		setActiveGeneration(nil)
		setIsGenerating(false)
	end
	
	local var30, var31 = createSignal(false)
	local var32 = createComputed(function(p3) --[[ line: 174 ]]
		-- upvalues: store (ref), host (ref), var25 (ref), registry (ref)
		local selectedCapture = store.getSelectedCapture(p3)
		local var57 = if selectedCapture ~= nil then nil else selectedCapture.CaptureType
		local t = {
			canGenerateText = host.generateMomentText ~= nil,
			captureType = var57,
			getComposedEdits = var25
		}
		local t_1 = {}
		
		for i, v in registry.getAll() do
			if (if v.supportedCaptureTypes ~= nil then var57 ~= nil and table.find(v.supportedCaptureTypes, var57) ~= nil else true) and (v.isAvailable == nil or v.isAvailable(t)) then
				table.insert(t_1, v)
			end
		end
		return t_1
	end)
	local var33 = createComputed(function(p4) --[[ line: 196 ]]
		-- upvalues: store (ref), registry (ref)
		local step = store.getStep(p4)
		
		for i, v in registry.getAll() do
			if v.step == step then
				return v
			end
		end
		return nil
	end)
	local var34 = createComputed(function(p5) --[[ line: 241 ]]
		-- upvalues: getFFlagMomentsTTSAudioOverlayModule (copy), var33 (ref), getActiveSession (write), var25 (ref)
		if not getFFlagMomentsTTSAudioOverlayModule then
			return nil
		end
		local var61 = var33(p5)
		
		if var61 ~= nil and var61.kind == "voice" then
			local var62 = getActiveSession(p5)
			local var63 = if var62 ~= nil then nil else var62.getDraft(p5)
			
			return if var63 == nil or var63.text == nil or var63.text == "" then var25(p5).tts else var63
		end
	end)
	local preview = p0.preview or createCapturePreviewControllerModule(store, createComputed(function(p6) --[[ line: 210 ]]
		-- upvalues: var33 (ref), getActiveSession (write), var25 (ref)
		local var64 = var33(p6)
		
		if var64 ~= nil and var64.kind == "trim" then
			local var65 = getActiveSession(p6)
			local var66 = if var65 ~= nil then nil else var65.getDraft(p6)
			
			if var66 ~= nil and var66.startTime ~= nil and var66.endTime ~= nil then
				return { startTime = var66.startTime, endTime = var66.endTime }
			end
		end
		local trim = var25(p6).trim
		
		return if trim == nil or trim.startTime == nil or trim.endTime == nil then nil else { startTime = trim.startTime, endTime = trim.endTime }
	end), createComputed(function(p7) --[[ line: 229 ]]
		-- upvalues: var33 (ref), getActiveSession (write), var25 (ref)
		local var67 = var33(p7)
		
		if var67 ~= nil and var67.kind == "music" then
			local var68 = getActiveSession(p7)
			local var69 = if var68 ~= nil then nil else var68.getDraft(p7)
			
			return if var69 == nil or var69.assetId == nil then var25(p7).music else var69
		end
	end))
	local var36 = nil
	
	if p0.ttsAudio ~= nil then
		var36 = p0.ttsAudio
	elseif getFFlagMomentsTTSAudioOverlayModule then
		var36 = store.getTTSAudio(false)
		
		if var36 == nil then
			var36 = createTTSAudioManagerModule()
			store.setTTSAudio(var36)
		end
	end
	local function showModal(p8) --[[ line: 270 ]]
		-- upvalues: var24 (ref)
		var24(p8)
	end
	
	local function dismissModal() --[[ line: 274 ]]
		-- upvalues: var24 (ref)
		var24(nil)
	end
	
	local function dismissVoiceCoachmark() --[[ line: 278 ]]
		-- upvalues: var31 (ref)
		var31(true)
	end
	
	local function withCreationSession(p9) --[[ line: 286 ]]
		-- upvalues: sessionManager (copy), funnelEventNames (copy), cryoModule (copy), makeCreationEventFieldsModule (copy)
		return cryoModule.Dictionary.join(p9, makeCreationEventFieldsModule.makeCreationBaseFields(sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow)))
	end
	
	local function navigate(p10) --[[ line: 291 ]]
		-- upvalues: store (ref)
		store.navigate(p10)
	end
	
	local function returnToGallery() --[[ line: 296 ]]
		-- upvalues: getFFlagEnableMomentTextGeneration (copy), getActiveGeneration (write), setActiveGeneration (write), setIsGenerating (write), store (ref), creationFlowStateModule (copy), setActiveSession (write), var36 (write), getFFlagMomentsCreationSaveDraft (copy), momentsDraftStorageModule (copy), fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (ref)
		if getFFlagEnableMomentTextGeneration() then
			local var70 = getActiveGeneration(false)
			
			if var70 ~= nil then
				var70.promise:cancel()
				setActiveGeneration(nil)
				setIsGenerating(false)
			end
		end
		store.clearEdits(creationFlowStateModule.Gallery)
		setActiveSession(nil)
		
		if var36 ~= nil then
			var36.reset()
		end
		if getFFlagMomentsCreationSaveDraft() then
			momentsDraftStorageModule.clear()
			fireAnalyticsEventModule(eventNames.MomentsReturnToGallery, withCreationSession({}))
		end
	end
	
	local function selectCapture(p11) --[[ line: 318 ]]
		-- upvalues: getActiveGeneration (write), getFFlagEnableMomentTextGeneration (copy), setActiveGeneration (write), setIsGenerating (write), store (ref), fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), fFlagMomentsRealtimeSessionTelemetry (copy), momentsCommonModule (copy)
		local var71 = getActiveGeneration(false)
		
		if getFFlagEnableMomentTextGeneration() and var71 ~= nil and p11 ~= var71.capture then
			local var72 = getActiveGeneration(false)
			
			if var72 ~= nil then
				var72.promise:cancel()
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
	end
	
	local function setDescription(value) --[[ line: 340 ]]
		-- upvalues: store (ref)
		store.updateDescription(value)
	end
	
	local function beginTool(p12) --[[ line: 344 ]]
		-- upvalues: registry (ref), fFlagMomentsContentStatsTelemetry (copy), momentsCommonModule (copy), fireAnalyticsEventModule (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), var20 (write), createEditSessionModule (copy), store (ref), setActiveSession (write)
		local var73 = registry.get(p12)
		
		if var73 == nil then return end
		if fFlagMomentsContentStatsTelemetry then
			momentsCommonModule.Analytics.reportMomentsEditToolOpened(var73.kind)
		end
		if var73.cta.analyticsEvent ~= nil then
			fireAnalyticsEventModule(var73.cta.analyticsEvent, withCreationSession(makeCreationEventFieldsModule.makeToolField(var73)))
		end
		if var73.presentation == "InstantAction" then
			if var73.apply ~= nil then
				var73.apply(var20)
			end
			return
		else
			local _ = nil
			local createSession = var73.createSession
			local var74 = if createSession ~= nil then createEditSessionModule() else createSession()
			
			if var73.step == nil or store.navigate(var73.step) then
				var74.begin(store.getEditsMap(false)[p12])
				setActiveSession(var74)
				
				return
			end
		end
	end
	
	local function commitActiveTool() --[[ line: 386 ]]
		-- upvalues: getActiveSession (write), var33 (ref), store (ref), creationFlowStateModule (copy), var20 (write), fireAnalyticsEventModule (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), setActiveSession (write)
		local var75 = getActiveSession(false)
		local var76 = var33(false)
		
		if var75 == nil or var76 == nil then
			store.navigate(creationFlowStateModule.Preview)
			
			return
		end
		local var77 = var75.commit()
		
		if var76.onCommit ~= nil and var76.onCommit(var77, var20) == false then return end
		store.setCommittedEdit(var76.kind, var77)
		
		if var76.cta.commitAnalyticsEvent ~= nil then
			fireAnalyticsEventModule(var76.cta.commitAnalyticsEvent, withCreationSession(makeCreationEventFieldsModule.makeToolField(var76)))
		end
		setActiveSession(nil)
		store.navigate(creationFlowStateModule.Preview)
	end
	
	local function saveActiveTool() --[[ line: 413 ]]
		-- upvalues: getActiveSession (write), var33 (ref), store (ref)
		local var78 = getActiveSession(false)
		local var79 = var33(false)
		
		if var78 == nil or var79 == nil then
			return
		end
		store.setCommittedEdit(var79.kind, var78.commit())
	end
	
	local function clearActiveTool() --[[ line: 428 ]]
		-- upvalues: getActiveSession (write), var33 (ref), var36 (write)
		local var80 = getActiveSession(false)
		local var81 = var33(false)
		
		if var81 == nil then return end
		if var80 ~= nil then
			var80.update(nil)
		end
		if var81.kind == "voice" and var36 ~= nil then
			var36.reset()
		end
	end
	
	local function discardActiveTool() --[[ line: 442 ]]
		-- upvalues: getActiveSession (write), var33 (ref), var36 (write), var25 (ref), fireAnalyticsEventModule (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), fFlagMomentsContentStatsTelemetry (copy), momentsCommonModule (copy), setActiveSession (write), store (ref), creationFlowStateModule (copy)
		local var82 = getActiveSession(false)
		local var83 = var33(false)
		
		if var82 ~= nil then
			var82.discard()
		end
		if var83 ~= nil and var83.kind == "voice" and var36 ~= nil then
			local tts = var25(false).tts
			
			if tts == nil or tts.text == nil or tts.text == "" then
				var36.reset()
			else
				var36.generate(tts.text, tts.voiceId)
			end
		end
		if var83 ~= nil and var83.cta.cancelAnalyticsEvent ~= nil then
			fireAnalyticsEventModule(var83.cta.cancelAnalyticsEvent, withCreationSession(makeCreationEventFieldsModule.makeToolField(var83)))
		end
		if fFlagMomentsContentStatsTelemetry and var83 ~= nil then
			momentsCommonModule.Analytics.reportMomentsEditToolAbandoned(var83.kind)
		end
		setActiveSession(nil)
		store.navigate(creationFlowStateModule.Preview)
	end
	
	local function updateCommittedEdit(p13, p14) --[[ line: 478 ]]
		-- upvalues: store (ref)
		store.setCommittedEdit(p13, p14)
	end
	
	local function dismiss() --[[ line: 482 ]]
		-- upvalues: getFFlagEnableMomentTextGeneration (copy), getActiveGeneration (write), setActiveGeneration (write), setIsGenerating (write), host (ref), var24 (ref), p0 (ref), creationFlowStateModule (copy), store (ref), var36 (write), getFFlagMomentsCreationSaveDraft (copy), momentsDraftStorageModule (copy)
		if getFFlagEnableMomentTextGeneration() then
			local var84 = getActiveGeneration(false)
			
			if var84 ~= nil then
				var84.promise:cancel()
				setActiveGeneration(nil)
				setIsGenerating(false)
			end
			if host.dismissGenerationToasts ~= nil then
				host.dismissGenerationToasts()
			end
		end
		var24(nil)
		store.clearEdits(if p0.excludeGallery then creationFlowStateModule.Preview else creationFlowStateModule.Gallery)
		
		if var36 ~= nil then
			var36.destroy()
			store.setTTSAudio(nil)
		end
		if getFFlagMomentsCreationSaveDraft() then
			momentsDraftStorageModule.clear()
		end
		if host.exitCreationFlow ~= nil then
			host.exitCreationFlow()
		end
	end
	
	local function emitGeneratedTextFeedback(p15) --[[ line: 513 ]]
		-- upvalues: fFlagMomentTextGenerationFilteredSignal (copy), host (ref), store (ref)
		if not fFlagMomentTextGenerationFilteredSignal or host.momentGeneratedTextFeedback == nil then return end
		local generationToken = store.getGenerationToken(false)
		
		if generationToken == nil or generationToken == "" then
			return
		end
		host.momentGeneratedTextFeedback(generationToken, p15):catch(function() --[[ line: 521 ]] end)
	end
	
	return {
		getStep = store.getStep,
		navigate = navigate,
		returnToGallery = returnToGallery,
		getSelectedCapture = store.getSelectedCapture,
		selectCapture = selectCapture,
		getDescription = store.getDescription,
		setDescription = setDescription,
		getAvailableTools = var32,
		getActiveTool = var33,
		getActiveSession = getActiveSession,
		getComposedEdits = var25,
		getEffectiveTTS = var34,
		beginTool = beginTool,
		commitActiveTool = commitActiveTool,
		saveActiveTool = saveActiveTool,
		clearActiveTool = clearActiveTool,
		discardActiveTool = discardActiveTool,
		updateCommittedEdit = updateCommittedEdit,
		onDisabledToolActivated = function(p16) --[[ line: 791 ]]
			-- upvalues: getFFlagEnableMomentTextGeneration (copy), getIsGenerating (write), host (ref)
			if getFFlagEnableMomentTextGeneration() and p16 == "text" and (getIsGenerating(false) and host.onGenerateTextManualEditBlocked ~= nil) then
				host.onGenerateTextManualEditBlocked()
			end
		end,
		getActiveModal = var23,
		showModal = showModal,
		dismissModal = dismissModal,
		getVoiceCoachmarkDismissed = var30,
		dismissVoiceCoachmark = dismissVoiceCoachmark,
		publish = function() --[[ line: 539 ]]
			-- upvalues: store (ref), host (ref), var24 (ref), dialogTypeModule (copy), dismissModal (ref), fFlagMomentTextGenerationFilteredSignal (copy), emitGeneratedTextFeedback (ref), getFFlagMomentsAnalyticsProducerPrereqs (copy), sessionManager (copy), funnelEventNames (copy), preview (ref), var25 (ref), cryoModule (copy), makeCreationEventFieldsModule (copy), eventNames (copy), getFFlagEnableMomentTextGeneration (copy), fireAnalyticsEventModule (copy), fFlagMomentsRealtimeSessionTelemetry (copy), momentsCommonModule (copy), fFlagMomentsContentStatsTelemetry (copy), dismiss (ref)
			local description = store.getDescription(false)
			
			if host.isTextFiltered ~= nil and host.isTextFiltered(description) then
				var24({
					modalType = dialogTypeModule.TextFiltered,
					modalProps = { onConfirm = dismissModal }
				})
				
				return
			elseif fFlagMomentTextGenerationFilteredSignal then
				local generatedTextFeedback = store.getGeneratedTextFeedback(false)
				
				if generatedTextFeedback ~= nil then
					emitGeneratedTextFeedback(generatedTextFeedback)
				end
			end
			local var88 = if getFFlagMomentsAnalyticsProducerPrereqs() then sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow) else nil
			
			if host.createMoment ~= nil then
				host.createMoment(store.getSelectedCapture(false), var25(false), description, var88, preview.playback.getTimeLength(false))
			end
			local textOverlayEdits
			local var89 = cryoModule.Dictionary.join(makeCreationEventFieldsModule.makeStepField(eventNames.MomentsEditingFlowPublished), makeCreationEventFieldsModule.makeCreationBaseFields(var88))
			
			if getFFlagEnableMomentTextGeneration() then
				textOverlayEdits = store.getTextOverlayEdits(false)
				var89 = cryoModule.Dictionary.join(var89, makeCreationEventFieldsModule.makeGeneratedTextOutcomeFields(store.getGeneratedDescription(false), description, store.getGeneratedSummary(false), if textOverlayEdits == nil or textOverlayEdits[1] == nil then nil else textOverlayEdits[1].text))
			end
			fireAnalyticsEventModule(eventNames.MomentsEditingFlowPublished, var89)
			
			if fFlagMomentsRealtimeSessionTelemetry then
				momentsCommonModule.Analytics.reportMomentsCreationStep("published")
			end
			if fFlagMomentsContentStatsTelemetry then
				textOverlayEdits = momentsCommonModule.Analytics
				local var91 = var25(false)
				local var92 = 0
				
				if var91.music ~= nil then
					var92 += 1
					textOverlayEdits.reportMomentsPublishedWithEdit("music")
				end
				if var91.trim ~= nil then
					var92 += 1
					textOverlayEdits.reportMomentsPublishedWithEdit("trim")
				end
				if var91.textOverlays ~= nil and #var91.textOverlays > 0 then
					var92 += 1
					textOverlayEdits.reportMomentsPublishedWithEdit("text_overlay")
				end
				if var91.stickerOverlays ~= nil and #var91.stickerOverlays > 0 then
					var92 += 1
					textOverlayEdits.reportMomentsPublishedWithEdit("sticker")
				end
				if description ~= nil and description ~= "" then
					var92 += 1
					textOverlayEdits.reportMomentsPublishedWithEdit("description")
				end
				textOverlayEdits.reportMomentsPublishedEditCount(var92)
				local selectedCapture = store.getSelectedCapture(false)
				
				if selectedCapture ~= nil then
					textOverlayEdits.reportMomentsPublishedByCaptureType(if selectedCapture.CaptureType == Enum.CaptureType.Video then "video" elseif selectedCapture.CaptureType == Enum.CaptureType.Screenshot then "screenshot" else "unknown")
				end
			end
			dismiss()
		end,
		exit = function() --[[ line: 799 ]]
			-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), dismiss (ref)
			fireAnalyticsEventModule(eventNames.MomentsEditingFlowExited, withCreationSession(makeCreationEventFieldsModule.makeStepField(eventNames.MomentsEditingFlowExited)))
			dismiss()
		end,
		generateText = function(p17) --[[ line: 649 ]]
			-- upvalues: getIsGenerating (write), host (ref), store (ref), getFFlagEnableMomentTextGeneration (copy), setIsGenerating (write), setActiveGeneration (write), fFlagMomentTextGenerationFilteredSignal (copy), fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (ref), fFlagMomentsContentStatsTelemetry (copy), momentsCommonModule (copy), makeDefaultTextOverlayEditModule (copy), getFFlagMomentsGenerateTextInTextOverlayModule (copy), getActiveSession (write), var33 (ref)
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
			local var96 = host.generateMomentText(selectedCapture, p17)
			
			if var96 == nil then
				setIsGenerating(false)
				
				return
			elseif getFFlagEnableMomentTextGeneration() then
				setActiveGeneration({ promise = var96, capture = selectedCapture })
			end
			var96:andThen(function(p18) --[[ line: 676 ]]
				-- upvalues: getFFlagEnableMomentTextGeneration (copy), setActiveGeneration (copy), fFlagMomentTextGenerationFilteredSignal (copy), fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (copy), fFlagMomentsContentStatsTelemetry (copy), momentsCommonModule (copy), host (copy), setIsGenerating (copy), store (copy), makeDefaultTextOverlayEditModule (copy), getFFlagMomentsGenerateTextInTextOverlayModule (copy), getActiveSession (copy), var33 (copy)
				if getFFlagEnableMomentTextGeneration() then
					setActiveGeneration(nil)
				end
				if fFlagMomentTextGenerationFilteredSignal and p18 ~= nil and p18.error == "CONTENT_FILTERED" then
					fireAnalyticsEventModule(eventNames.EditingFlowGenerateTextFiltered, withCreationSession({}))
					
					if fFlagMomentsContentStatsTelemetry then
						momentsCommonModule.Analytics.reportMomentsGenerateText("filtered")
					end
					if host.onGenerateTextFiltered ~= nil then
						host.onGenerateTextFiltered()
					end
					setIsGenerating(false)
					
					return
				elseif p18 == nil or p18.error ~= nil then
					fireAnalyticsEventModule(eventNames.EditingFlowGenerateTextFailed, withCreationSession({}))
					
					if fFlagMomentsContentStatsTelemetry then
						momentsCommonModule.Analytics.reportMomentsGenerateText("failed")
					end
					if host.onGenerateTextFailure ~= nil then
						host.onGenerateTextFailure()
					end
					setIsGenerating(false)
					
					return
				elseif p18.summary ~= nil and p18.summary ~= "" then
					local var99
					local textOverlayEdits = store.getTextOverlayEdits(false)
					local var98 = if textOverlayEdits ~= nil then nil else textOverlayEdits[1]
					local _ = nil
					
					if getFFlagEnableMomentTextGeneration() and var98 ~= nil then
						var99 = table.clone(var98)
						var99.text = p18.summary
					else
						var99 = makeDefaultTextOverlayEditModule()
						var99.text = p18.summary
					end
					local cloned
					local _ = nil
					
					if textOverlayEdits == nil or #textOverlayEdits == 0 then
						cloned = { var99 }
					else
						cloned = table.clone(textOverlayEdits)
						cloned[1] = var99
					end
					store.updateTextOverlayEdits(cloned)
					
					if getFFlagMomentsGenerateTextInTextOverlayModule() then
						local var101 = getActiveSession(false)
						local var102 = var33(false)
						
						if var101 ~= nil and var102 ~= nil and var102.kind == "text" then
							local draft = var101.getDraft(false)
							local var104 = draft and draft[1]
							
							if var104 == nil then
								var101.update(cloned)
							else
								local cloned_1 = table.clone(var104)
								cloned_1.text = p18.summary
								var101.update({ cloned_1 })
							end
						end
					end
					if getFFlagEnableMomentTextGeneration() then
						store.setGeneratedSummary(p18.summary)
					end
				end
				if p18.description ~= nil and p18.description ~= "" then
					store.updateDescription(p18.description)
					
					if fFlagMomentTextGenerationFilteredSignal or getFFlagEnableMomentTextGeneration() then
						store.setGeneratedDescription(p18.description)
						store.setGenerationToken(p18.generationToken)
						store.setGeneratedTextFeedback(nil)
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
			end):catch(function() --[[ line: 773 ]]
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
		getCanGenerateText = function(_) --[[ line: 645 ]]
			-- upvalues: host (ref)
			return host.generateMomentText ~= nil
		end,
		submitGeneratedTextFeedback = function(p19) --[[ line: 526 ]]
			-- upvalues: fFlagMomentTextGenerationFilteredSignal (copy), store (ref), emitGeneratedTextFeedback (ref)
			if not fFlagMomentTextGenerationFilteredSignal then return end
			if p19 == "policy_violation" then
				store.setGeneratedTextFeedback(nil)
				emitGeneratedTextFeedback(p19)
				
				return
			end
			store.setGeneratedTextFeedback(p19)
		end,
		preview = preview,
		ttsAudio = var36
	}
end