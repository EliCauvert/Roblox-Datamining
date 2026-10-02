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
local clampTtsStartTimeModule = require(momentsCreation.Utils.clampTtsStartTime)
local fFlagMomentsCommentsCreatorControlModule = require(momentsCreation.Flags.FFlagMomentsCommentsCreatorControl)
local getFFlagMomentsTTSAudioOverlayModule = require(momentsCreation.Flags.GetFFlagMomentsTTSAudioOverlay)
local getFFlagMomentsTTSStartTimePositioningModule = require(momentsCreation.Flags.GetFFlagMomentsTTSStartTimePositioning)
local fFlagMomentsTTSVoiceSelectorModule = require(momentsCreation.Flags.FFlagMomentsTTSVoiceSelector)
local fFlagMomentsTTSPublishMetadataEditsModule = require(momentsCreation.Flags.FFlagMomentsTTSPublishMetadataEdits)
local getFFlagMomentsGenerateTextInTextOverlayModule = require(momentsCreation.Flags.GetFFlagMomentsGenerateTextInTextOverlay)
local momentsDraftStorageModule = require(momentsCreation.Storage.MomentsDraftStorage)
local makeCreationEventFieldsModule = require(momentsCreation.Analytics.makeCreationEventFields)
local momentsCommonModule = require(parent.MomentsCommon)
local eventNames = momentsCommonModule.Analytics.EventNames
local sessionManager = momentsCommonModule.Analytics.SessionManager
local funnelEventNames = momentsCommonModule.Analytics.FunnelEventNames
local getFFlagEnableMomentTextGeneration = momentsCommonModule.Flags.GetFFlagEnableMomentTextGeneration
local getFFlagMomentsCreationSaveDraft = momentsCommonModule.Flags.GetFFlagMomentsCreationSaveDraft
local fFlagMomentsRealtimeSessionTelemetry = momentsCommonModule.Flags.FFlagMomentsRealtimeSessionTelemetry
local fFlagMomentsContentStatsTelemetry = momentsCommonModule.Flags.FFlagMomentsContentStatsTelemetry
local fFlagMomentTextGenerationFilteredSignal = momentsCommonModule.Flags.FFlagMomentTextGenerationFilteredSignal
local fFlagMomentsTextOverlayV2Redesign = momentsCommonModule.Flags.FFlagMomentsTextOverlayV2Redesign
local createComputed = signalsModule.createComputed
local createSignal = signalsModule.createSignal

return function(p1)
	-- upvalues: creationToolRegistryModule (ref), defaultCreationToolsModule (ref), sessionManager (ref), funnelEventNames (ref), createSignal (ref), createComputed (ref), getFFlagEnableMomentTextGeneration (ref), getFFlagMomentsTTSAudioOverlayModule (ref), createCapturePreviewControllerModule (ref), createTTSAudioManagerModule (ref), cryoModule (ref), makeCreationEventFieldsModule (ref), creationFlowStateModule (ref), getFFlagMomentsCreationSaveDraft (ref), momentsDraftStorageModule (ref), fireAnalyticsEventModule (ref), eventNames (ref), fFlagMomentsRealtimeSessionTelemetry (ref), momentsCommonModule (ref), fFlagMomentsContentStatsTelemetry (ref), createEditSessionModule (ref), getFFlagMomentsTTSStartTimePositioningModule (ref), clampTtsStartTimeModule (ref), fFlagMomentTextGenerationFilteredSignal (ref), dialogTypeModule (ref), fFlagMomentsCommentsCreatorControlModule (ref), fFlagMomentsTTSPublishMetadataEditsModule (ref), fFlagMomentsTTSVoiceSelectorModule (ref), fFlagMomentsTextOverlayV2Redesign (ref), makeDefaultTextOverlayEditModule (ref), getFFlagMomentsGenerateTextInTextOverlayModule (ref)
	local store = p1.store
	local host = p1.host or {}
	local registry = p1.registry or creationToolRegistryModule(defaultCreationToolsModule)
	
	if sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow) == nil then
		sessionManager.startSession(funnelEventNames.FunnelTypes.CreationFlow)
	end
	local getIsGenerating, setIsGenerating
	local var1 = nil
	local _ = nil
	local _ = nil
	local getActiveSession = store.getActiveSession
	local setActiveSession = store.setActiveSession
	local var2, var3 = createSignal(nil)
	local var4 = createComputed(function(p2)
		-- upvalues: store (ref), registry (ref)
		local t = {}
		
		for i, v in store.getEditsMap(p2) do
			if v ~= nil then
				local var5 = registry.get(i)
				
				if var5 == nil or var5.toEdits == nil then
					t[i] = v
				else
					for i_1, v_1 in var5.toEdits(v) do
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
		local var6, var7 = createSignal(false)
		getIsGenerating = var6
		setIsGenerating = var7
	end
	local getActiveGeneration, setActiveGeneration
	local _ = nil
	local _ = nil
	
	if getFFlagEnableMomentTextGeneration() then
		getActiveGeneration = store.getActiveGeneration
		setActiveGeneration = store.setActiveGeneration
	else
		local var8, var9 = createSignal(nil)
		getActiveGeneration = var8
		setActiveGeneration = var9
	end
	local function _()
		-- upvalues: getActiveGeneration (write), setActiveGeneration (write), setIsGenerating (write)
		local var10 = getActiveGeneration(false)
		
		if var10 == nil then
			return
		end
		var10.promise:cancel()
		setActiveGeneration(nil)
		setIsGenerating(false)
	end
	
	local var10, var11 = createSignal(false)
	local var12, var13 = createSignal(nil)
	local var14 = createComputed(function(p3)
		-- upvalues: store (ref), host (ref), var4 (ref), registry (ref)
		local selectedCapture = store.getSelectedCapture(p3)
		local var15 = if selectedCapture ~= nil then nil else selectedCapture.CaptureType
		local t = {
			canGenerateText = host.generateMomentText ~= nil,
			captureType = var15,
			getComposedEdits = var4
		}
		local t_1 = {}
		
		for i, v in registry.getAll() do
			if (if v.supportedCaptureTypes ~= nil then var15 ~= nil and table.find(v.supportedCaptureTypes, var15) ~= nil else true) and (v.isAvailable == nil or v.isAvailable(t)) then
				table.insert(t_1, v)
			end
		end
		return t_1
	end)
	local var16 = createComputed(function(p4)
		-- upvalues: store (ref), registry (ref)
		local step = store.getStep(p4)
		
		for i, v in registry.getAll() do
			if v.step == step then
				return v
			end
		end
		return nil
	end)
	local var17 = createComputed(function(p5)
		-- upvalues: getFFlagMomentsTTSAudioOverlayModule (copy), var16 (ref), getActiveSession (write), var4 (ref)
		if not getFFlagMomentsTTSAudioOverlayModule then
			return nil
		end
		local var18 = var16(p5)
		
		if var18 ~= nil and var18.kind == "voice" then
			local var19 = getActiveSession(p5)
			local var20 = if var19 ~= nil then nil else var19.getDraft(p5)
			
			return if var20 == nil or var20.text == nil or var20.text == "" then var4(p5).tts else var20
		end
	end)
	local preview = p1.preview or createCapturePreviewControllerModule(store, createComputed(function(p5)
		-- upvalues: var16 (ref), getActiveSession (write), var4 (ref)
		local var18 = var16(p5)
		
		if var18 ~= nil and var18.kind == "trim" then
			local var19 = getActiveSession(p5)
			local var20 = if var19 ~= nil then nil else var19.getDraft(p5)
			
			if var20 ~= nil and var20.startTime ~= nil and var20.endTime ~= nil then
				return { startTime = var20.startTime, endTime = var20.endTime }
			end
		end
		local trim = var4(p5).trim
		
		return if trim == nil or trim.startTime == nil or trim.endTime == nil then nil else { startTime = trim.startTime, endTime = trim.endTime }
	end), createComputed(function(p5)
		-- upvalues: var16 (ref), getActiveSession (write), var4 (ref)
		local var18 = var16(p5)
		
		if var18 ~= nil and var18.kind == "music" then
			local var19 = getActiveSession(p5)
			local var20 = if var19 ~= nil then nil else var19.getDraft(p5)
			
			return if var20 == nil or var20.assetId == nil then var4(p5).music else var20
		end
	end))
	local var18 = nil
	
	if p1.ttsAudio ~= nil then
		var18 = p1.ttsAudio
	elseif getFFlagMomentsTTSAudioOverlayModule then
		var18 = store.getTTSAudio(false)
		
		if var18 == nil then
			var18 = createTTSAudioManagerModule()
			store.setTTSAudio(var18)
		end
	end
	local function showModal(p5)
		-- upvalues: var3 (ref)
		var3(p5)
	end
	
	local function dismissModal()
		-- upvalues: var3 (ref)
		var3(nil)
	end
	
	local function dismissVoiceCoachmark()
		-- upvalues: var11 (ref)
		var11(true)
	end
	
	local function withCreationSession(p5)
		-- upvalues: sessionManager (copy), funnelEventNames (copy), cryoModule (copy), makeCreationEventFieldsModule (copy)
		return cryoModule.Dictionary.join(p5, makeCreationEventFieldsModule.makeCreationBaseFields(sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow)))
	end
	
	local function navigate(p5)
		-- upvalues: store (ref)
		store.navigate(p5)
	end
	
	local function returnToGallery()
		-- upvalues: getFFlagEnableMomentTextGeneration (copy), getActiveGeneration (write), setActiveGeneration (write), setIsGenerating (write), store (ref), creationFlowStateModule (copy), setActiveSession (write), var18 (write), getFFlagMomentsCreationSaveDraft (copy), momentsDraftStorageModule (copy), fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (ref)
		if getFFlagEnableMomentTextGeneration() then
			local var19 = getActiveGeneration(false)
			
			if var19 ~= nil then
				var19.promise:cancel()
				setActiveGeneration(nil)
				setIsGenerating(false)
			end
		end
		store.clearEdits(creationFlowStateModule.Gallery)
		setActiveSession(nil)
		
		if var18 ~= nil then
			var18.reset()
		end
		if getFFlagMomentsCreationSaveDraft() then
			momentsDraftStorageModule.clear()
			fireAnalyticsEventModule(eventNames.MomentsReturnToGallery, withCreationSession({}))
		end
	end
	
	local function selectCapture(p5)
		-- upvalues: getActiveGeneration (write), getFFlagEnableMomentTextGeneration (copy), setActiveGeneration (write), setIsGenerating (write), store (ref), fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), fFlagMomentsRealtimeSessionTelemetry (copy), momentsCommonModule (copy)
		local var19 = getActiveGeneration(false)
		
		if getFFlagEnableMomentTextGeneration() and var19 ~= nil and p5 ~= var19.capture then
			local var20 = getActiveGeneration(false)
			
			if var20 ~= nil then
				var20.promise:cancel()
				setActiveGeneration(nil)
				setIsGenerating(false)
			end
		end
		store.onSelectedCaptureUpdated(p5)
		
		if p5 ~= nil then
			fireAnalyticsEventModule(eventNames.EditingFlowGalleryItemSelected, withCreationSession(makeCreationEventFieldsModule.makeToolFieldFromKind("gallery")))
			
			if fFlagMomentsRealtimeSessionTelemetry then
				momentsCommonModule.Analytics.reportMomentsCreationStep("gallery_selected")
			end
		end
	end
	
	local function setDescription(value)
		-- upvalues: store (ref)
		store.updateDescription(value)
	end
	
	local function beginTool(p5)
		-- upvalues: registry (ref), fFlagMomentsContentStatsTelemetry (copy), momentsCommonModule (copy), fireAnalyticsEventModule (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), var1 (write), createEditSessionModule (copy), store (ref), setActiveSession (write)
		local var19 = registry.get(p5)
		
		if var19 == nil then return end
		if fFlagMomentsContentStatsTelemetry then
			momentsCommonModule.Analytics.reportMomentsEditToolOpened(var19.kind)
		end
		if var19.cta.analyticsEvent ~= nil then
			fireAnalyticsEventModule(var19.cta.analyticsEvent, withCreationSession(makeCreationEventFieldsModule.makeToolField(var19)))
		end
		if var19.presentation == "InstantAction" then
			if var19.apply ~= nil then
				var19.apply(var1)
			end
			return
		else
			local _ = nil
			local createSession = var19.createSession
			local var20 = if createSession ~= nil then createEditSessionModule() else createSession()
			
			if var19.step == nil or store.navigate(var19.step) then
				var20.begin(store.getEditsMap(false)[p5])
				setActiveSession(var20)
				
				return
			end
		end
	end
	
	local function commitActiveTool()
		-- upvalues: getActiveSession (write), var16 (ref), store (ref), creationFlowStateModule (copy), var1 (write), getFFlagMomentsTTSStartTimePositioningModule (copy), var4 (ref), clampTtsStartTimeModule (copy), fireAnalyticsEventModule (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), setActiveSession (write)
		local var19 = getActiveSession(false)
		local var20 = var16(false)
		
		if var19 == nil or var20 == nil then
			store.navigate(creationFlowStateModule.Preview)
			
			return
		end
		local var21 = var19.commit()
		
		if var20.onCommit ~= nil and var20.onCommit(var21, var1) == false then return end
		store.setCommittedEdit(var20.kind, var21)
		
		if getFFlagMomentsTTSStartTimePositioningModule and var20.kind == "trim" and (var21 ~= nil and var21.startTime ~= nil) and var21.endTime ~= nil then
			local var22 = var21.endTime - var21.startTime
			local tts = var4(false).tts
			
			if tts ~= nil and tts.startTime ~= nil and var22 > 0 then
				local var23 = clampTtsStartTimeModule(tts.startTime, var22)
				
				if var23 ~= tts.startTime then
					local cloned = table.clone(tts)
					cloned.startTime = var23
					store.setCommittedEdit("voice", cloned)
				end
			end
		end
		if var20.cta.commitAnalyticsEvent ~= nil and (not var20.cta.commitRequiresEdit or (if var20.toEdits ~= nil then next(var20.toEdits(var21)) ~= nil else true)) then
			fireAnalyticsEventModule(var20.cta.commitAnalyticsEvent, withCreationSession(makeCreationEventFieldsModule.makeToolField(var20)))
		end
		setActiveSession(nil)
		store.navigate(creationFlowStateModule.Preview)
	end
	
	local function saveActiveTool()
		-- upvalues: getActiveSession (write), var16 (ref), store (ref)
		local var19 = getActiveSession(false)
		local var20 = var16(false)
		
		if var19 == nil or var20 == nil then
			return
		end
		store.setCommittedEdit(var20.kind, var19.commit())
	end
	
	local function clearActiveTool()
		-- upvalues: getActiveSession (write), var16 (ref), var18 (write)
		local var19 = getActiveSession(false)
		local var20 = var16(false)
		
		if var20 == nil then return end
		if var19 ~= nil then
			var19.update(nil)
		end
		if var20.kind == "voice" and var18 ~= nil then
			var18.reset()
		end
	end
	
	local function discardActiveTool()
		-- upvalues: getActiveSession (write), var16 (ref), var18 (write), var4 (ref), fireAnalyticsEventModule (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), fFlagMomentsContentStatsTelemetry (copy), momentsCommonModule (copy), setActiveSession (write), store (ref), creationFlowStateModule (copy)
		local var19 = getActiveSession(false)
		local var20 = var16(false)
		
		if var19 ~= nil then
			var19.discard()
		end
		if var20 ~= nil and var20.kind == "voice" and var18 ~= nil then
			local tts = var4(false).tts
			
			if tts == nil or tts.text == nil or tts.text == "" then
				var18.reset()
			else
				var18.generate(tts.text, tts.voiceId)
			end
		end
		if var20 ~= nil and var20.cta.cancelAnalyticsEvent ~= nil then
			fireAnalyticsEventModule(var20.cta.cancelAnalyticsEvent, withCreationSession(makeCreationEventFieldsModule.makeToolField(var20)))
		end
		if fFlagMomentsContentStatsTelemetry and var20 ~= nil then
			momentsCommonModule.Analytics.reportMomentsEditToolAbandoned(var20.kind)
		end
		setActiveSession(nil)
		store.navigate(creationFlowStateModule.Preview)
	end
	
	local function updateCommittedEdit(p5, p6)
		-- upvalues: store (ref)
		store.setCommittedEdit(p5, p6)
	end
	
	local function dismiss()
		-- upvalues: getFFlagEnableMomentTextGeneration (copy), getActiveGeneration (write), setActiveGeneration (write), setIsGenerating (write), host (ref), var3 (ref), p1 (ref), creationFlowStateModule (copy), store (ref), var18 (write), getFFlagMomentsCreationSaveDraft (copy), momentsDraftStorageModule (copy)
		if getFFlagEnableMomentTextGeneration() then
			local var19 = getActiveGeneration(false)
			
			if var19 ~= nil then
				var19.promise:cancel()
				setActiveGeneration(nil)
				setIsGenerating(false)
			end
			if host.dismissGenerationToasts ~= nil then
				host.dismissGenerationToasts()
			end
		end
		var3(nil)
		store.clearEdits(if p1.excludeGallery then creationFlowStateModule.Preview else creationFlowStateModule.Gallery)
		
		if var18 ~= nil then
			var18.destroy()
			store.setTTSAudio(nil)
		end
		if getFFlagMomentsCreationSaveDraft() then
			momentsDraftStorageModule.clear()
		end
		if host.exitCreationFlow ~= nil then
			host.exitCreationFlow()
		end
	end
	
	local function emitGeneratedTextFeedback(p5)
		-- upvalues: fFlagMomentTextGenerationFilteredSignal (copy), host (ref), store (ref)
		if not fFlagMomentTextGenerationFilteredSignal or host.momentGeneratedTextFeedback == nil then return end
		local generationToken = store.getGenerationToken(false)
		
		if generationToken == nil or generationToken == "" then
			return
		end
		host.momentGeneratedTextFeedback(generationToken, p5):catch(function() end)
	end
	
	return {
		getStep = store.getStep,
		navigate = navigate,
		returnToGallery = returnToGallery,
		getSelectedCapture = store.getSelectedCapture,
		selectCapture = selectCapture,
		getDescription = store.getDescription,
		setDescription = setDescription,
		getAvailableTools = var14,
		getActiveTool = var16,
		getActiveSession = getActiveSession,
		getComposedEdits = var4,
		getEffectiveTTS = var17,
		beginTool = beginTool,
		commitActiveTool = commitActiveTool,
		saveActiveTool = saveActiveTool,
		clearActiveTool = clearActiveTool,
		discardActiveTool = discardActiveTool,
		updateCommittedEdit = updateCommittedEdit,
		onDisabledToolActivated = function(p5)
			-- upvalues: getFFlagEnableMomentTextGeneration (copy), getIsGenerating (write), host (ref)
			if getFFlagEnableMomentTextGeneration() and p5 == "text" and (getIsGenerating(false) and host.onGenerateTextManualEditBlocked ~= nil) then
				host.onGenerateTextManualEditBlocked()
			end
		end,
		getActiveModal = var2,
		showModal = showModal,
		dismissModal = dismissModal,
		getVoiceCoachmarkDismissed = var10,
		dismissVoiceCoachmark = dismissVoiceCoachmark,
		getSelectedVoiceId = var12,
		setSelectedVoiceId = var13,
		publish = function()
			-- upvalues: store (ref), host (ref), var3 (ref), dialogTypeModule (copy), dismissModal (ref), fFlagMomentTextGenerationFilteredSignal (copy), emitGeneratedTextFeedback (ref), sessionManager (copy), funnelEventNames (copy), preview (ref), fFlagMomentsCommentsCreatorControlModule (copy), var4 (ref), cryoModule (copy), makeCreationEventFieldsModule (copy), eventNames (copy), getFFlagEnableMomentTextGeneration (copy), getFFlagMomentsTTSAudioOverlayModule (copy), fFlagMomentsTTSPublishMetadataEditsModule (copy), fFlagMomentsTTSVoiceSelectorModule (copy), getFFlagMomentsTTSStartTimePositioningModule (copy), var18 (write), fFlagMomentsTextOverlayV2Redesign (copy), fireAnalyticsEventModule (copy), fFlagMomentsRealtimeSessionTelemetry (copy), momentsCommonModule (copy), fFlagMomentsContentStatsTelemetry (copy), dismiss (ref)
			local description = store.getDescription(false)
			
			if host.isTextFiltered ~= nil and host.isTextFiltered(description) then
				var3({
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
			local sessionId = sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow)
			
			if host.createMoment ~= nil then
				local timeLength = preview.playback.getTimeLength(false)
				
				if fFlagMomentsCommentsCreatorControlModule then
					host.createMoment(store.getSelectedCapture(false), var4(false), description, sessionId, timeLength, store.getCommentsEnabled(false))
				else
					host.createMoment(store.getSelectedCapture(false), var4(false), description, sessionId, timeLength)
				end
			end
			local textOverlayEdits
			local var19 = cryoModule.Dictionary.join(makeCreationEventFieldsModule.makeStepField(eventNames.MomentsEditingFlowPublished), makeCreationEventFieldsModule.makeCreationBaseFields(sessionId))
			
			if getFFlagEnableMomentTextGeneration() then
				textOverlayEdits = store.getTextOverlayEdits(false)
				var19 = cryoModule.Dictionary.join(var19, makeCreationEventFieldsModule.makeGeneratedTextOutcomeFields(store.getGeneratedDescription(false), description, store.getGeneratedSummary(false), if textOverlayEdits == nil or textOverlayEdits[1] == nil then nil else textOverlayEdits[1].text))
			end
			textOverlayEdits = getFFlagMomentsTTSAudioOverlayModule and fFlagMomentsTTSPublishMetadataEditsModule
			
			if fFlagMomentsTTSVoiceSelectorModule and not textOverlayEdits then
				local tts = var4(false).tts
				
				if tts ~= nil then
					var19 = cryoModule.Dictionary.join(var19, { voiceId = tostring(tts.voiceId) })
				end
			end
			if getFFlagMomentsTTSAudioOverlayModule and getFFlagMomentsTTSStartTimePositioningModule and not textOverlayEdits then
				local var20 = var4(false)
				local tts = var20.tts
				
				if tts ~= nil then
					local startTime = tts.startTime or 0
					local var21 = if var20.trim ~= nil then preview.playback.getTimeLength(false) else var20.trim.endTime - var20.trim.startTime
					var19 = cryoModule.Dictionary.join(var19, {
						ttsStartTimeSeconds = tostring(startTime),
						ttsVideoDurationSeconds = tostring(var21),
						ttsStartTimeFraction = tostring(if var21 > 0 then startTime / var21 else 0)
					})
				end
			end
			if textOverlayEdits then
				local var22 = var4(false)
				local tts = var22.tts
				
				if tts ~= nil then
					var19 = cryoModule.Dictionary.join(var19, makeCreationEventFieldsModule.makeVoicePublishSummaryFields(tts, if var22.trim ~= nil then preview.playback.getTimeLength(false) else var22.trim.endTime - var22.trim.startTime, if not (var18 == nil or var18.getLoadedText(false) ~= tts.text or var18.getLoadedVoiceId(false) ~= tts.voiceId) then var18.getTimeLength(false) else nil))
				end
			end
			if fFlagMomentsTextOverlayV2Redesign then
				local textOverlays = var4(false).textOverlays
				var19 = cryoModule.Dictionary.join(var19, makeCreationEventFieldsModule.makeTextOverlayPublishSummaryFields(textOverlays and textOverlays[1]))
			end
			fireAnalyticsEventModule(eventNames.MomentsEditingFlowPublished, var19)
			
			if fFlagMomentsRealtimeSessionTelemetry then
				momentsCommonModule.Analytics.reportMomentsCreationStep("published")
			end
			if fFlagMomentsContentStatsTelemetry then
				local analytics = momentsCommonModule.Analytics
				local var23 = var4(false)
				local var24 = 0
				
				if var23.music ~= nil then
					var24 += 1
					analytics.reportMomentsPublishedWithEdit("music")
				end
				if var23.trim ~= nil then
					var24 += 1
					analytics.reportMomentsPublishedWithEdit("trim")
				end
				if var23.textOverlays ~= nil and #var23.textOverlays > 0 then
					var24 += 1
					analytics.reportMomentsPublishedWithEdit("text_overlay")
				end
				if var23.stickerOverlays ~= nil and #var23.stickerOverlays > 0 then
					var24 += 1
					analytics.reportMomentsPublishedWithEdit("sticker")
				end
				if description ~= nil and description ~= "" then
					var24 += 1
					analytics.reportMomentsPublishedWithEdit("description")
				end
				if getFFlagMomentsTTSAudioOverlayModule and var23.tts ~= nil then
					var24 += 1
					analytics.reportMomentsPublishedWithEdit("tts")
				end
				analytics.reportMomentsPublishedEditCount(var24)
				local selectedCapture = store.getSelectedCapture(false)
				
				if selectedCapture ~= nil then
					analytics.reportMomentsPublishedByCaptureType(if selectedCapture.CaptureType == Enum.CaptureType.Video then "video" elseif selectedCapture.CaptureType == Enum.CaptureType.Screenshot then "screenshot" else "unknown")
				end
			end
			dismiss()
		end,
		exit = function()
			-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), dismiss (ref)
			fireAnalyticsEventModule(eventNames.MomentsEditingFlowExited, withCreationSession(makeCreationEventFieldsModule.makeStepField(eventNames.MomentsEditingFlowExited)))
			dismiss()
		end,
		generateText = function(p5)
			-- upvalues: getIsGenerating (write), host (ref), store (ref), getFFlagEnableMomentTextGeneration (copy), setIsGenerating (write), setActiveGeneration (write), fFlagMomentTextGenerationFilteredSignal (copy), fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (ref), fFlagMomentsContentStatsTelemetry (copy), momentsCommonModule (copy), makeDefaultTextOverlayEditModule (copy), getFFlagMomentsGenerateTextInTextOverlayModule (copy), getActiveSession (write), var16 (ref)
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
			local var19 = host.generateMomentText(selectedCapture, p5)
			
			if var19 == nil then
				setIsGenerating(false)
				
				return
			elseif getFFlagEnableMomentTextGeneration() then
				setActiveGeneration({ promise = var19, capture = selectedCapture })
			end
			var19:andThen(function(p6)
				-- upvalues: getFFlagEnableMomentTextGeneration (copy), setActiveGeneration (copy), fFlagMomentTextGenerationFilteredSignal (copy), fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (copy), fFlagMomentsContentStatsTelemetry (copy), momentsCommonModule (copy), host (copy), setIsGenerating (copy), store (copy), makeDefaultTextOverlayEditModule (copy), getFFlagMomentsGenerateTextInTextOverlayModule (copy), getActiveSession (copy), var16 (copy)
				if getFFlagEnableMomentTextGeneration() then
					setActiveGeneration(nil)
				end
				if fFlagMomentTextGenerationFilteredSignal and p6 ~= nil and p6.error == "CONTENT_FILTERED" then
					fireAnalyticsEventModule(eventNames.EditingFlowGenerateTextFiltered, withCreationSession({}))
					
					if fFlagMomentsContentStatsTelemetry then
						momentsCommonModule.Analytics.reportMomentsGenerateText("filtered")
					end
					if host.onGenerateTextFiltered ~= nil then
						host.onGenerateTextFiltered()
					end
					setIsGenerating(false)
					
					return
				elseif p6 == nil or p6.error ~= nil then
					fireAnalyticsEventModule(eventNames.EditingFlowGenerateTextFailed, withCreationSession({}))
					
					if fFlagMomentsContentStatsTelemetry then
						momentsCommonModule.Analytics.reportMomentsGenerateText("failed")
					end
					if host.onGenerateTextFailure ~= nil then
						host.onGenerateTextFailure()
					end
					setIsGenerating(false)
					
					return
				elseif p6.summary ~= nil and p6.summary ~= "" then
					local var20
					local textOverlayEdits = store.getTextOverlayEdits(false)
					local var21 = if textOverlayEdits ~= nil then nil else textOverlayEdits[1]
					local _ = nil
					
					if getFFlagEnableMomentTextGeneration() and var21 ~= nil then
						var20 = table.clone(var21)
						var20.text = p6.summary
					else
						var20 = makeDefaultTextOverlayEditModule()
						var20.text = p6.summary
					end
					local cloned
					local _ = nil
					
					if textOverlayEdits == nil or #textOverlayEdits == 0 then
						cloned = { var20 }
					else
						cloned = table.clone(textOverlayEdits)
						cloned[1] = var20
					end
					store.updateTextOverlayEdits(cloned)
					
					if getFFlagMomentsGenerateTextInTextOverlayModule() then
						local var22 = getActiveSession(false)
						local var23 = var16(false)
						
						if var22 ~= nil and var23 ~= nil and var23.kind == "text" then
							local draft = var22.getDraft(false)
							local var24 = draft and draft[1]
							
							if var24 == nil then
								var22.update(cloned)
							else
								local cloned_1 = table.clone(var24)
								cloned_1.text = p6.summary
								var22.update({ cloned_1 })
							end
						end
					end
					if getFFlagEnableMomentTextGeneration() then
						store.setGeneratedSummary(p6.summary)
					end
				end
				if p6.description ~= nil and p6.description ~= "" then
					store.updateDescription(p6.description)
					
					if fFlagMomentTextGenerationFilteredSignal or getFFlagEnableMomentTextGeneration() then
						store.setGeneratedDescription(p6.description)
						store.setGenerationToken(p6.generationToken)
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
			end):catch(function()
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
		getCanGenerateText = function(_)
			-- upvalues: host (ref)
			return host.generateMomentText ~= nil
		end,
		submitGeneratedTextFeedback = function(p5)
			-- upvalues: fFlagMomentTextGenerationFilteredSignal (copy), store (ref), emitGeneratedTextFeedback (ref)
			if not fFlagMomentTextGenerationFilteredSignal then return end
			if p5 == "policy_violation" then
				store.setGeneratedTextFeedback(nil)
				emitGeneratedTextFeedback(p5)
				
				return
			end
			store.setGeneratedTextFeedback(p5)
		end,
		preview = preview,
		ttsAudio = var18
	}
end