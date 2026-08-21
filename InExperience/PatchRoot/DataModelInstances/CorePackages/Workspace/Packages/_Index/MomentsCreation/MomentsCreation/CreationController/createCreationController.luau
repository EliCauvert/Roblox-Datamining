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
	-- upvalues: creationToolRegistryModule (ref), defaultCreationToolsModule (ref), getFFlagMomentsAnalyticsProducerPrereqs (ref), sessionManager (ref), funnelEventNames (ref), getFFlagMomentsCreationPersistEditSessionModule (ref), createSignal (ref), createComputed (ref), getFFlagEnableMomentTextGeneration (ref), getFFlagMomentsTTSAudioOverlayModule (ref), createCapturePreviewControllerModule (ref), createTTSAudioManagerModule (ref), cryoModule (ref), makeCreationEventFieldsModule (ref), creationFlowStateModule (ref), getFFlagMomentsCreationSaveDraft (ref), momentsDraftStorageModule (ref), fireAnalyticsEventModule (ref), eventNames (ref), fFlagMomentsRealtimeSessionTelemetry (ref), momentsCommonModule (ref), fFlagMomentsContentStatsTelemetry (ref), createEditSessionModule (ref), fFlagMomentTextGenerationFilteredSignal (ref), dialogTypeModule (ref), makeDefaultTextOverlayEditModule (ref)
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
				local var53 = registry.get(i)
				
				if var53 == nil or var53.toEdits == nil then
					t[i] = v
				else
					for i_1, v_1 in var53.toEdits(v) do
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
		local var54 = getActiveGeneration(false)
		
		if var54 == nil then
			return
		end
		var54.promise:cancel()
		setActiveGeneration(nil)
		setIsGenerating(false)
	end
	
	local var29, var30 = createSignal(false)
	local var31 = createComputed(function(p3) --[[ line: 173 ]]
		-- upvalues: store (ref), host (ref), var24 (ref), registry (ref)
		local selectedCapture = store.getSelectedCapture(p3)
		local var56 = if selectedCapture ~= nil then nil else selectedCapture.CaptureType
		local t = {
			canGenerateText = host.generateMomentText ~= nil,
			captureType = var56,
			getComposedEdits = var24
		}
		local t_1 = {}
		
		for i, v in registry.getAll() do
			if (if v.supportedCaptureTypes ~= nil then var56 ~= nil and table.find(v.supportedCaptureTypes, var56) ~= nil else true) and (v.isAvailable == nil or v.isAvailable(t)) then
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
		local var60 = var32(p5)
		
		if var60 ~= nil and var60.kind == "voice" then
			local var61 = getActiveSession(p5)
			local var62 = if var61 ~= nil then nil else var61.getDraft(p5)
			
			return if var62 == nil or var62.text == nil or var62.text == "" then var24(p5).tts else var62
		end
	end)
	local preview = p0.preview or createCapturePreviewControllerModule(store, createComputed(function(p6) --[[ line: 209 ]]
		-- upvalues: var32 (ref), getActiveSession (write), var24 (ref)
		local var63 = var32(p6)
		
		if var63 ~= nil and var63.kind == "trim" then
			local var64 = getActiveSession(p6)
			local var65 = if var64 ~= nil then nil else var64.getDraft(p6)
			
			if var65 ~= nil and var65.startTime ~= nil and var65.endTime ~= nil then
				return { startTime = var65.startTime, endTime = var65.endTime }
			end
		end
		local trim = var24(p6).trim
		
		return if trim == nil or trim.startTime == nil or trim.endTime == nil then nil else { startTime = trim.startTime, endTime = trim.endTime }
	end), createComputed(function(p7) --[[ line: 228 ]]
		-- upvalues: var32 (ref), getActiveSession (write), var24 (ref)
		local var66 = var32(p7)
		
		if var66 ~= nil and var66.kind == "music" then
			local var67 = getActiveSession(p7)
			local var68 = if var67 ~= nil then nil else var67.getDraft(p7)
			
			return if var68 == nil or var68.assetId == nil then var24(p7).music else var68
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
	
	local function navigate(p10) --[[ line: 290 ]]
		-- upvalues: store (ref)
		store.navigate(p10)
	end
	
	local function returnToGallery() --[[ line: 295 ]]
		-- upvalues: getFFlagEnableMomentTextGeneration (copy), getActiveGeneration (write), setActiveGeneration (write), setIsGenerating (write), store (ref), creationFlowStateModule (copy), setActiveSession (write), var35 (write), getFFlagMomentsCreationSaveDraft (copy), momentsDraftStorageModule (copy), fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (ref)
		if getFFlagEnableMomentTextGeneration() then
			local var69 = getActiveGeneration(false)
			
			if var69 ~= nil then
				var69.promise:cancel()
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
	end
	
	local function selectCapture(p11) --[[ line: 317 ]]
		-- upvalues: getActiveGeneration (write), getFFlagEnableMomentTextGeneration (copy), setActiveGeneration (write), setIsGenerating (write), store (ref), fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), fFlagMomentsRealtimeSessionTelemetry (copy), momentsCommonModule (copy)
		local var70 = getActiveGeneration(false)
		
		if getFFlagEnableMomentTextGeneration() and var70 ~= nil and p11 ~= var70.capture then
			local var71 = getActiveGeneration(false)
			
			if var71 ~= nil then
				var71.promise:cancel()
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
	
	local function setDescription(value) --[[ line: 339 ]]
		-- upvalues: store (ref)
		store.updateDescription(value)
	end
	
	local function beginTool(p12) --[[ line: 343 ]]
		-- upvalues: registry (ref), fFlagMomentsContentStatsTelemetry (copy), momentsCommonModule (copy), fireAnalyticsEventModule (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), var19 (write), createEditSessionModule (copy), store (ref), setActiveSession (write)
		local var72 = registry.get(p12)
		
		if var72 == nil then return end
		if fFlagMomentsContentStatsTelemetry then
			momentsCommonModule.Analytics.reportMomentsEditToolOpened(var72.kind)
		end
		if var72.cta.analyticsEvent ~= nil then
			fireAnalyticsEventModule(var72.cta.analyticsEvent, withCreationSession(makeCreationEventFieldsModule.makeToolField(var72)))
		end
		if var72.presentation == "InstantAction" then
			if var72.apply ~= nil then
				var72.apply(var19)
			end
			return
		else
			local _ = nil
			local createSession = var72.createSession
			local var73 = if createSession ~= nil then createEditSessionModule() else createSession()
			
			if var72.step == nil or store.navigate(var72.step) then
				var73.begin(store.getEditsMap(false)[p12])
				setActiveSession(var73)
				
				return
			end
		end
	end
	
	local function commitActiveTool() --[[ line: 385 ]]
		-- upvalues: getActiveSession (write), var32 (ref), store (ref), creationFlowStateModule (copy), var19 (write), fireAnalyticsEventModule (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), setActiveSession (write)
		local var74 = getActiveSession(false)
		local var75 = var32(false)
		
		if var74 == nil or var75 == nil then
			store.navigate(creationFlowStateModule.Preview)
			
			return
		end
		local var76 = var74.commit()
		
		if var75.onCommit ~= nil and var75.onCommit(var76, var19) == false then return end
		store.setCommittedEdit(var75.kind, var76)
		
		if var75.cta.commitAnalyticsEvent ~= nil then
			fireAnalyticsEventModule(var75.cta.commitAnalyticsEvent, withCreationSession(makeCreationEventFieldsModule.makeToolField(var75)))
		end
		setActiveSession(nil)
		store.navigate(creationFlowStateModule.Preview)
	end
	
	local function saveActiveTool() --[[ line: 412 ]]
		-- upvalues: getActiveSession (write), var32 (ref), store (ref)
		local var77 = getActiveSession(false)
		local var78 = var32(false)
		
		if var77 == nil or var78 == nil then
			return
		end
		store.setCommittedEdit(var78.kind, var77.commit())
	end
	
	local function clearActiveTool() --[[ line: 427 ]]
		-- upvalues: getActiveSession (write), var32 (ref), var35 (write)
		local var79 = getActiveSession(false)
		local var80 = var32(false)
		
		if var80 == nil then return end
		if var79 ~= nil then
			var79.update(nil)
		end
		if var80.kind == "voice" and var35 ~= nil then
			var35.reset()
		end
	end
	
	local function discardActiveTool() --[[ line: 441 ]]
		-- upvalues: getActiveSession (write), var32 (ref), var35 (write), var24 (ref), fireAnalyticsEventModule (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), fFlagMomentsContentStatsTelemetry (copy), momentsCommonModule (copy), setActiveSession (write), store (ref), creationFlowStateModule (copy)
		local var81 = getActiveSession(false)
		local var82 = var32(false)
		
		if var81 ~= nil then
			var81.discard()
		end
		if var82 ~= nil and var82.kind == "voice" and var35 ~= nil then
			local tts = var24(false).tts
			
			if tts == nil or tts.text == nil or tts.text == "" then
				var35.reset()
			else
				var35.generate(tts.text, tts.voiceId)
			end
		end
		if var82 ~= nil and var82.cta.cancelAnalyticsEvent ~= nil then
			fireAnalyticsEventModule(var82.cta.cancelAnalyticsEvent, withCreationSession(makeCreationEventFieldsModule.makeToolField(var82)))
		end
		if fFlagMomentsContentStatsTelemetry and var82 ~= nil then
			momentsCommonModule.Analytics.reportMomentsEditToolAbandoned(var82.kind)
		end
		setActiveSession(nil)
		store.navigate(creationFlowStateModule.Preview)
	end
	
	local function updateCommittedEdit(p13, p14) --[[ line: 477 ]]
		-- upvalues: store (ref)
		store.setCommittedEdit(p13, p14)
	end
	
	local function dismiss() --[[ line: 481 ]]
		-- upvalues: getFFlagEnableMomentTextGeneration (copy), getActiveGeneration (write), setActiveGeneration (write), setIsGenerating (write), host (ref), var23 (ref), p0 (ref), creationFlowStateModule (copy), store (ref), var35 (write), getFFlagMomentsCreationSaveDraft (copy), momentsDraftStorageModule (copy)
		if getFFlagEnableMomentTextGeneration() then
			local var83 = getActiveGeneration(false)
			
			if var83 ~= nil then
				var83.promise:cancel()
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
	
	local function emitGeneratedTextFeedback(p15) --[[ line: 512 ]]
		-- upvalues: fFlagMomentTextGenerationFilteredSignal (copy), host (ref), store (ref)
		if not fFlagMomentTextGenerationFilteredSignal or host.momentGeneratedTextFeedback == nil then return end
		local generationToken = store.getGenerationToken(false)
		
		if generationToken == nil or generationToken == "" then
			return
		end
		host.momentGeneratedTextFeedback(generationToken, p15):catch(function() --[[ line: 520 ]] end)
	end
	
	return {
		getStep = store.getStep,
		navigate = navigate,
		returnToGallery = returnToGallery,
		getSelectedCapture = store.getSelectedCapture,
		selectCapture = selectCapture,
		getDescription = store.getDescription,
		setDescription = setDescription,
		getAvailableTools = var31,
		getActiveTool = var32,
		getActiveSession = getActiveSession,
		getComposedEdits = var24,
		getEffectiveTTS = var33,
		beginTool = beginTool,
		commitActiveTool = commitActiveTool,
		saveActiveTool = saveActiveTool,
		clearActiveTool = clearActiveTool,
		discardActiveTool = discardActiveTool,
		updateCommittedEdit = updateCommittedEdit,
		onDisabledToolActivated = function(p16) --[[ line: 745 ]]
			-- upvalues: getFFlagEnableMomentTextGeneration (copy), getIsGenerating (write), host (ref)
			if getFFlagEnableMomentTextGeneration() and p16 == "text" and (getIsGenerating(false) and host.onGenerateTextManualEditBlocked ~= nil) then
				host.onGenerateTextManualEditBlocked()
			end
		end,
		getActiveModal = var22,
		showModal = showModal,
		dismissModal = dismissModal,
		getVoiceCoachmarkDismissed = var29,
		dismissVoiceCoachmark = dismissVoiceCoachmark,
		publish = function() --[[ line: 538 ]]
			-- upvalues: store (ref), host (ref), var23 (ref), dialogTypeModule (copy), dismissModal (ref), fFlagMomentTextGenerationFilteredSignal (copy), emitGeneratedTextFeedback (ref), getFFlagMomentsAnalyticsProducerPrereqs (copy), sessionManager (copy), funnelEventNames (copy), preview (ref), var24 (ref), fireAnalyticsEventModule (copy), eventNames (copy), cryoModule (copy), makeCreationEventFieldsModule (copy), fFlagMomentsRealtimeSessionTelemetry (copy), momentsCommonModule (copy), fFlagMomentsContentStatsTelemetry (copy), dismiss (ref)
			local description = store.getDescription(false)
			
			if host.isTextFiltered ~= nil and host.isTextFiltered(description) then
				var23({
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
			local var87 = if getFFlagMomentsAnalyticsProducerPrereqs() then sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow) else nil
			
			if host.createMoment ~= nil then
				host.createMoment(store.getSelectedCapture(false), var24(false), description, var87, preview.playback.getTimeLength(false))
			end
			fireAnalyticsEventModule(eventNames.MomentsEditingFlowPublished, cryoModule.Dictionary.join(makeCreationEventFieldsModule.makeStepField(eventNames.MomentsEditingFlowPublished), makeCreationEventFieldsModule.makeCreationBaseFields(var87)))
			
			if fFlagMomentsRealtimeSessionTelemetry then
				momentsCommonModule.Analytics.reportMomentsCreationStep("published")
			end
			if fFlagMomentsContentStatsTelemetry then
				local analytics = momentsCommonModule.Analytics
				local var88 = var24(false)
				local var89 = 0
				
				if var88.music ~= nil then
					var89 += 1
					analytics.reportMomentsPublishedWithEdit("music")
				end
				if var88.trim ~= nil then
					var89 += 1
					analytics.reportMomentsPublishedWithEdit("trim")
				end
				if var88.textOverlays ~= nil and #var88.textOverlays > 0 then
					var89 += 1
					analytics.reportMomentsPublishedWithEdit("text_overlay")
				end
				if var88.stickerOverlays ~= nil and #var88.stickerOverlays > 0 then
					var89 += 1
					analytics.reportMomentsPublishedWithEdit("sticker")
				end
				if description ~= nil and description ~= "" then
					var89 += 1
					analytics.reportMomentsPublishedWithEdit("description")
				end
				analytics.reportMomentsPublishedEditCount(var89)
				local selectedCapture = store.getSelectedCapture(false)
				
				if selectedCapture ~= nil then
					analytics.reportMomentsPublishedByCaptureType(if selectedCapture.CaptureType == Enum.CaptureType.Video then "video" elseif selectedCapture.CaptureType == Enum.CaptureType.Screenshot then "screenshot" else "unknown")
				end
			end
			dismiss()
		end,
		exit = function() --[[ line: 753 ]]
			-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), dismiss (ref)
			fireAnalyticsEventModule(eventNames.MomentsEditingFlowExited, withCreationSession(makeCreationEventFieldsModule.makeStepField(eventNames.MomentsEditingFlowExited)))
			dismiss()
		end,
		generateText = function() --[[ line: 629 ]]
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
			local var93 = host.generateMomentText(selectedCapture)
			
			if var93 == nil then
				setIsGenerating(false)
				
				return
			elseif getFFlagEnableMomentTextGeneration() then
				setActiveGeneration({ promise = var93, capture = selectedCapture })
			end
			var93:andThen(function(p17) --[[ line: 656 ]]
				-- upvalues: getFFlagEnableMomentTextGeneration (copy), setActiveGeneration (copy), fFlagMomentTextGenerationFilteredSignal (copy), fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (copy), fFlagMomentsContentStatsTelemetry (copy), momentsCommonModule (copy), host (copy), setIsGenerating (copy), store (copy), makeDefaultTextOverlayEditModule (copy)
				if getFFlagEnableMomentTextGeneration() then
					setActiveGeneration(nil)
				end
				if fFlagMomentTextGenerationFilteredSignal and p17 ~= nil and p17.error == "CONTENT_FILTERED" then
					fireAnalyticsEventModule(eventNames.EditingFlowGenerateTextFiltered, withCreationSession({}))
					
					if fFlagMomentsContentStatsTelemetry then
						momentsCommonModule.Analytics.reportMomentsGenerateText("filtered")
					end
					if host.onGenerateTextFiltered ~= nil then
						host.onGenerateTextFiltered()
					end
					setIsGenerating(false)
					
					return
				elseif p17 == nil or p17.error ~= nil then
					fireAnalyticsEventModule(eventNames.EditingFlowGenerateTextFailed, withCreationSession({}))
					
					if fFlagMomentsContentStatsTelemetry then
						momentsCommonModule.Analytics.reportMomentsGenerateText("failed")
					end
					if host.onGenerateTextFailure ~= nil then
						host.onGenerateTextFailure()
					end
					setIsGenerating(false)
					
					return
				elseif p17.summary ~= nil and p17.summary ~= "" then
					local var96
					local textOverlayEdits = store.getTextOverlayEdits(false)
					local var95 = if textOverlayEdits ~= nil then nil else textOverlayEdits[1]
					local _ = nil
					
					if getFFlagEnableMomentTextGeneration() and var95 ~= nil then
						var96 = table.clone(var95)
						var96.text = p17.summary
					else
						var96 = makeDefaultTextOverlayEditModule()
						var96.text = p17.summary
					end
					if textOverlayEdits == nil or #textOverlayEdits == 0 then
						store.updateTextOverlayEdits({ var96 })
					else
						local cloned = table.clone(textOverlayEdits)
						cloned[1] = var96
						store.updateTextOverlayEdits(cloned)
					end
				end
				if p17.description ~= nil and p17.description ~= "" then
					store.updateDescription(p17.description)
					
					if fFlagMomentTextGenerationFilteredSignal then
						store.setGeneratedDescription(p17.description)
						store.setGenerationToken(p17.generationToken)
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
			end):catch(function() --[[ line: 727 ]]
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
		submitGeneratedTextFeedback = function(p18) --[[ line: 525 ]]
			-- upvalues: fFlagMomentTextGenerationFilteredSignal (copy), store (ref), emitGeneratedTextFeedback (ref)
			if not fFlagMomentTextGenerationFilteredSignal then return end
			if p18 == "policy_violation" then
				store.setGeneratedTextFeedback(nil)
				emitGeneratedTextFeedback(p18)
				
				return
			end
			store.setGeneratedTextFeedback(p18)
		end,
		preview = preview,
		ttsAudio = var35
	}
end