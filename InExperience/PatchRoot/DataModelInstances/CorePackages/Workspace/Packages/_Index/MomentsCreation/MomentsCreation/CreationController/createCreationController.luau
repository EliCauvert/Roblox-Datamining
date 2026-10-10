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
local fFlagMomentsTTSDraftRestoreModule = require(momentsCreation.Flags.FFlagMomentsTTSDraftRestore)
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
	-- upvalues: defaultCreationToolsModule (ref), creationToolRegistryModule (ref), sessionManager (ref), funnelEventNames (ref), createSignal (ref), createComputed (ref), getFFlagEnableMomentTextGeneration (ref), getFFlagMomentsTTSAudioOverlayModule (ref), createCapturePreviewControllerModule (ref), createTTSAudioManagerModule (ref), cryoModule (ref), makeCreationEventFieldsModule (ref), creationFlowStateModule (ref), getFFlagMomentsCreationSaveDraft (ref), momentsDraftStorageModule (ref), fireAnalyticsEventModule (ref), eventNames (ref), fFlagMomentsRealtimeSessionTelemetry (ref), momentsCommonModule (ref), fFlagMomentsContentStatsTelemetry (ref), createEditSessionModule (ref), getFFlagMomentsTTSStartTimePositioningModule (ref), clampTtsStartTimeModule (ref), fFlagMomentTextGenerationFilteredSignal (ref), dialogTypeModule (ref), fFlagMomentsTTSDraftRestoreModule (ref), fFlagMomentsCommentsCreatorControlModule (ref), fFlagMomentsTTSPublishMetadataEditsModule (ref), fFlagMomentsTTSVoiceSelectorModule (ref), fFlagMomentsTextOverlayV2Redesign (ref), makeDefaultTextOverlayEditModule (ref), getFFlagMomentsGenerateTextInTextOverlayModule (ref)
	local store = p1.store
	local host = p1.host or {}
	local var1 = defaultCreationToolsModule
	
	if host.toolKinds ~= nil then
		local t = {}
		
		for i, v in host.toolKinds do
			t[v] = true
		end
		var1 = {}
		
		for i_1, v_1 in defaultCreationToolsModule do
			if t[v_1.kind] then
				table.insert(var1, v_1)
			end
		end
	end
	local registry = p1.registry or creationToolRegistryModule(var1)
	
	if sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow) == nil then
		sessionManager.startSession(funnelEventNames.FunnelTypes.CreationFlow)
	end
	local getIsGenerating, setIsGenerating
	local var2 = nil
	local _ = nil
	local _ = nil
	local getActiveSession = store.getActiveSession
	local setActiveSession = store.setActiveSession
	local var3, var4 = createSignal(nil)
	local var5 = createComputed(function(p2)
		-- upvalues: store (ref), registry (ref)
		local t = {}
		
		for i, v in store.getEditsMap(p2) do
			if v ~= nil then
				local var6 = registry.get(i)
				
				if var6 == nil or var6.toEdits == nil then
					t[i] = v
				else
					for i_1, v_1 in var6.toEdits(v) do
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
		local var7, var8 = createSignal(false)
		getIsGenerating = var7
		setIsGenerating = var8
	end
	local getActiveGeneration, setActiveGeneration
	local _ = nil
	local _ = nil
	
	if getFFlagEnableMomentTextGeneration() then
		getActiveGeneration = store.getActiveGeneration
		setActiveGeneration = store.setActiveGeneration
	else
		local var9, var10 = createSignal(nil)
		getActiveGeneration = var9
		setActiveGeneration = var10
	end
	local function _()
		-- upvalues: getActiveGeneration (write), setActiveGeneration (write), setIsGenerating (write)
		local var11 = getActiveGeneration(false)
		
		if var11 == nil then
			return
		end
		var11.promise:cancel()
		setActiveGeneration(nil)
		setIsGenerating(false)
	end
	
	local var11, var12 = createSignal(false)
	local var13, var14 = createSignal(nil)
	local var15 = createComputed(function(p3)
		-- upvalues: store (ref), host (ref), var5 (ref), registry (ref)
		local selectedCapture = store.getSelectedCapture(p3)
		local var16 = if selectedCapture ~= nil then nil else selectedCapture.CaptureType
		local t = {
			canGenerateText = host.generateMomentText ~= nil,
			captureType = var16,
			getComposedEdits = var5
		}
		local t_1 = {}
		
		for i, v in registry.getAll() do
			if (if v.supportedCaptureTypes ~= nil then var16 ~= nil and table.find(v.supportedCaptureTypes, var16) ~= nil else true) and (v.isAvailable == nil or v.isAvailable(t)) then
				table.insert(t_1, v)
			end
		end
		return t_1
	end)
	local var17 = createComputed(function(p4)
		-- upvalues: store (ref), registry (ref)
		local step = store.getStep(p4)
		
		for i, v in registry.getAll() do
			if v.step == step then
				return v
			end
		end
		return nil
	end)
	local var18 = createComputed(function(p5)
		-- upvalues: getFFlagMomentsTTSAudioOverlayModule (copy), var17 (ref), getActiveSession (write), var5 (ref)
		if not getFFlagMomentsTTSAudioOverlayModule then
			return nil
		end
		local var19 = var17(p5)
		
		if var19 ~= nil and var19.kind == "voice" then
			local var20 = getActiveSession(p5)
			local var21 = if var20 ~= nil then nil else var20.getDraft(p5)
			
			return if var21 == nil or var21.text == nil or var21.text == "" then var5(p5).tts else var21
		end
	end)
	local preview = p1.preview or createCapturePreviewControllerModule(store, createComputed(function(p5)
		-- upvalues: var17 (ref), getActiveSession (write), var5 (ref)
		local var19 = var17(p5)
		
		if var19 ~= nil and var19.kind == "trim" then
			local var20 = getActiveSession(p5)
			local var21 = if var20 ~= nil then nil else var20.getDraft(p5)
			
			if var21 ~= nil and var21.startTime ~= nil and var21.endTime ~= nil then
				return { startTime = var21.startTime, endTime = var21.endTime }
			end
		end
		local trim = var5(p5).trim
		
		return if trim == nil or trim.startTime == nil or trim.endTime == nil then nil else { startTime = trim.startTime, endTime = trim.endTime }
	end), createComputed(function(p5)
		-- upvalues: var17 (ref), getActiveSession (write), var5 (ref)
		local var19 = var17(p5)
		
		if var19 ~= nil and var19.kind == "music" then
			local var20 = getActiveSession(p5)
			local var21 = if var20 ~= nil then nil else var20.getDraft(p5)
			
			return if var21 == nil or var21.assetId == nil then var5(p5).music else var21
		end
	end))
	local var19 = if host.toolKinds ~= nil then table.find(host.toolKinds, "voice") ~= nil else true
	local var20 = nil
	
	if p1.ttsAudio ~= nil then
		var20 = p1.ttsAudio
	elseif getFFlagMomentsTTSAudioOverlayModule and var19 then
		var20 = store.getTTSAudio(false)
		
		if var20 == nil then
			var20 = createTTSAudioManagerModule(nil, host.ttsAudioParent)
			store.setTTSAudio(var20)
		end
	end
	local function showModal(p5)
		-- upvalues: var4 (ref)
		var4(p5)
	end
	
	local function dismissModal()
		-- upvalues: var4 (ref)
		var4(nil)
	end
	
	local function dismissVoiceCoachmark()
		-- upvalues: var12 (ref)
		var12(true)
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
		-- upvalues: getFFlagEnableMomentTextGeneration (copy), getActiveGeneration (write), setActiveGeneration (write), setIsGenerating (write), store (ref), creationFlowStateModule (copy), setActiveSession (write), var20 (write), getFFlagMomentsCreationSaveDraft (copy), host (ref), momentsDraftStorageModule (copy), fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (ref)
		if getFFlagEnableMomentTextGeneration() then
			local var21 = getActiveGeneration(false)
			
			if var21 ~= nil then
				var21.promise:cancel()
				setActiveGeneration(nil)
				setIsGenerating(false)
			end
		end
		store.clearEdits(creationFlowStateModule.Gallery)
		setActiveSession(nil)
		
		if var20 ~= nil then
			var20.reset()
		end
		if getFFlagMomentsCreationSaveDraft() then
			if not host.disableDrafts then
				momentsDraftStorageModule.clear()
			end
			fireAnalyticsEventModule(eventNames.MomentsReturnToGallery, withCreationSession({}))
		end
	end
	
	local function selectCapture(p5)
		-- upvalues: getActiveGeneration (write), getFFlagEnableMomentTextGeneration (copy), setActiveGeneration (write), setIsGenerating (write), store (ref), fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), fFlagMomentsRealtimeSessionTelemetry (copy), momentsCommonModule (copy)
		local var21 = getActiveGeneration(false)
		
		if getFFlagEnableMomentTextGeneration() and var21 ~= nil and p5 ~= var21.capture then
			local var22 = getActiveGeneration(false)
			
			if var22 ~= nil then
				var22.promise:cancel()
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
		-- upvalues: registry (ref), fFlagMomentsContentStatsTelemetry (copy), momentsCommonModule (copy), fireAnalyticsEventModule (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), var2 (write), createEditSessionModule (copy), store (ref), setActiveSession (write)
		local var21 = registry.get(p5)
		
		if var21 == nil then return end
		if fFlagMomentsContentStatsTelemetry then
			momentsCommonModule.Analytics.reportMomentsEditToolOpened(var21.kind)
		end
		if var21.cta.analyticsEvent ~= nil then
			fireAnalyticsEventModule(var21.cta.analyticsEvent, withCreationSession(makeCreationEventFieldsModule.makeToolField(var21)))
		end
		if var21.presentation == "InstantAction" then
			if var21.apply ~= nil then
				var21.apply(var2)
			end
			return
		else
			local _ = nil
			local createSession = var21.createSession
			local var22 = if createSession ~= nil then createEditSessionModule() else createSession()
			
			if var21.step == nil or store.navigate(var21.step) then
				var22.begin(store.getEditsMap(false)[p5])
				setActiveSession(var22)
				
				return
			end
		end
	end
	
	local function commitActiveTool()
		-- upvalues: getActiveSession (write), var17 (ref), store (ref), creationFlowStateModule (copy), var2 (write), getFFlagMomentsTTSStartTimePositioningModule (copy), var5 (ref), clampTtsStartTimeModule (copy), fireAnalyticsEventModule (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), setActiveSession (write)
		local var21 = getActiveSession(false)
		local var22 = var17(false)
		
		if var21 == nil or var22 == nil then
			store.navigate(creationFlowStateModule.Preview)
			
			return
		end
		local var23 = var21.commit()
		
		if var22.onCommit ~= nil and var22.onCommit(var23, var2) == false then return end
		store.setCommittedEdit(var22.kind, var23)
		
		if getFFlagMomentsTTSStartTimePositioningModule and var22.kind == "trim" and (var23 ~= nil and var23.startTime ~= nil) and var23.endTime ~= nil then
			local var24 = var23.endTime - var23.startTime
			local tts = var5(false).tts
			
			if tts ~= nil and tts.startTime ~= nil and var24 > 0 then
				local var25 = clampTtsStartTimeModule(tts.startTime, var24)
				
				if var25 ~= tts.startTime then
					local cloned = table.clone(tts)
					cloned.startTime = var25
					store.setCommittedEdit("voice", cloned)
				end
			end
		end
		if var22.cta.commitAnalyticsEvent ~= nil and (not var22.cta.commitRequiresEdit or (if var22.toEdits ~= nil then next(var22.toEdits(var23)) ~= nil else true)) then
			fireAnalyticsEventModule(var22.cta.commitAnalyticsEvent, withCreationSession(makeCreationEventFieldsModule.makeToolField(var22)))
		end
		setActiveSession(nil)
		store.navigate(creationFlowStateModule.Preview)
	end
	
	local function saveActiveTool()
		-- upvalues: getActiveSession (write), var17 (ref), store (ref)
		local var21 = getActiveSession(false)
		local var22 = var17(false)
		
		if var21 == nil or var22 == nil then
			return
		end
		store.setCommittedEdit(var22.kind, var21.commit())
	end
	
	local function clearActiveTool()
		-- upvalues: getActiveSession (write), var17 (ref), var20 (write)
		local var21 = getActiveSession(false)
		local var22 = var17(false)
		
		if var22 == nil then return end
		if var21 ~= nil then
			var21.update(nil)
		end
		if var22.kind == "voice" and var20 ~= nil then
			var20.reset()
		end
	end
	
	local function discardActiveTool()
		-- upvalues: getActiveSession (write), var17 (ref), var20 (write), var5 (ref), fireAnalyticsEventModule (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), fFlagMomentsContentStatsTelemetry (copy), momentsCommonModule (copy), setActiveSession (write), store (ref), creationFlowStateModule (copy)
		local var21 = getActiveSession(false)
		local var22 = var17(false)
		
		if var21 ~= nil then
			var21.discard()
		end
		if var22 ~= nil and var22.kind == "voice" and var20 ~= nil then
			local tts = var5(false).tts
			
			if tts == nil or tts.text == nil or tts.text == "" then
				var20.reset()
			else
				var20.generate(tts.text, tts.voiceId)
			end
		end
		if var22 ~= nil and var22.cta.cancelAnalyticsEvent ~= nil then
			fireAnalyticsEventModule(var22.cta.cancelAnalyticsEvent, withCreationSession(makeCreationEventFieldsModule.makeToolField(var22)))
		end
		if fFlagMomentsContentStatsTelemetry and var22 ~= nil then
			momentsCommonModule.Analytics.reportMomentsEditToolAbandoned(var22.kind)
		end
		setActiveSession(nil)
		store.navigate(creationFlowStateModule.Preview)
	end
	
	local function updateCommittedEdit(p5, p6)
		-- upvalues: store (ref)
		store.setCommittedEdit(p5, p6)
	end
	
	local function dismiss()
		-- upvalues: getFFlagEnableMomentTextGeneration (copy), getActiveGeneration (write), setActiveGeneration (write), setIsGenerating (write), host (ref), var4 (ref), p1 (ref), creationFlowStateModule (copy), store (ref), var20 (write), getFFlagMomentsCreationSaveDraft (copy), momentsDraftStorageModule (copy)
		if getFFlagEnableMomentTextGeneration() then
			local var21 = getActiveGeneration(false)
			
			if var21 ~= nil then
				var21.promise:cancel()
				setActiveGeneration(nil)
				setIsGenerating(false)
			end
			if host.dismissGenerationToasts ~= nil then
				host.dismissGenerationToasts()
			end
		end
		var4(nil)
		store.clearEdits(if p1.excludeGallery then creationFlowStateModule.Preview else creationFlowStateModule.Gallery)
		
		if var20 ~= nil then
			var20.destroy()
			store.setTTSAudio(nil)
		end
		if getFFlagMomentsCreationSaveDraft() and not host.disableDrafts then
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
	
	local function submitGeneratedTextFeedback(p5)
		-- upvalues: fFlagMomentTextGenerationFilteredSignal (copy), store (ref), emitGeneratedTextFeedback (ref)
		if not fFlagMomentTextGenerationFilteredSignal then return end
		if p5 == "policy_violation" then
			store.setGeneratedTextFeedback(nil)
			emitGeneratedTextFeedback(p5)
			
			return
		end
		store.setGeneratedTextFeedback(p5)
	end
	
	local var21 = 0
	
	local _ = function()
		-- upvalues: host (ref), p1 (ref), var21 (write)
		if host.publishDebounceSeconds == nil then
			return true
		end
		local var22 = if p1.clock ~= nil then os.clock() else p1.clock()
		
		if var22 - var21 < host.publishDebounceSeconds then
			return false
		end
		var21 = var22
		
		return true
	end
	
	return {
		getStep = store.getStep,
		navigate = navigate,
		returnToGallery = returnToGallery,
		getSelectedCapture = store.getSelectedCapture,
		selectCapture = selectCapture,
		getDescription = store.getDescription,
		setDescription = setDescription,
		getAvailableTools = var15,
		getActiveTool = var17,
		getActiveSession = getActiveSession,
		getComposedEdits = var5,
		getEffectiveTTS = var18,
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
		getActiveModal = var3,
		showModal = showModal,
		dismissModal = dismissModal,
		getVoiceCoachmarkDismissed = var11,
		dismissVoiceCoachmark = dismissVoiceCoachmark,
		getSelectedVoiceId = var13,
		setSelectedVoiceId = var14,
		publish = function()
			-- upvalues: store (ref), host (ref), var4 (ref), dialogTypeModule (copy), dismissModal (ref), p1 (ref), var21 (write), fFlagMomentsTTSDraftRestoreModule (copy), fFlagMomentTextGenerationFilteredSignal (copy), emitGeneratedTextFeedback (ref), sessionManager (copy), funnelEventNames (copy), preview (ref), fFlagMomentsCommentsCreatorControlModule (copy), var5 (ref), cryoModule (copy), makeCreationEventFieldsModule (copy), eventNames (copy), getFFlagEnableMomentTextGeneration (copy), getFFlagMomentsTTSAudioOverlayModule (copy), fFlagMomentsTTSPublishMetadataEditsModule (copy), fFlagMomentsTTSVoiceSelectorModule (copy), getFFlagMomentsTTSStartTimePositioningModule (copy), var20 (write), fFlagMomentsTextOverlayV2Redesign (copy), fireAnalyticsEventModule (copy), fFlagMomentsRealtimeSessionTelemetry (copy), momentsCommonModule (copy), fFlagMomentsContentStatsTelemetry (copy), dismiss (ref)
			local var22
			local description = store.getDescription(false)
			
			if host.isTextFiltered ~= nil and host.isTextFiltered(description) then
				var4({
					modalType = dialogTypeModule.TextFiltered,
					modalProps = { onConfirm = dismissModal }
				})
				
				return
			elseif host.publishDebounceSeconds == nil then
				var22 = true
			else
				local var23 = if p1.clock ~= nil then os.clock() else p1.clock()
				
				if var23 - var21 < host.publishDebounceSeconds then
					var22 = false
				else
					var21 = var23
					var22 = true
				end
			end
			if not var22 then return end
			if fFlagMomentsTTSDraftRestoreModule and store.getPendingRestoredVoice(false) ~= nil then
				store.setPendingRestoredVoice(nil)
				store.setCommittedEdit("voice", nil)
			end
			if fFlagMomentTextGenerationFilteredSignal then
				local generatedTextFeedback = store.getGeneratedTextFeedback(false)
				
				if generatedTextFeedback ~= nil then
					emitGeneratedTextFeedback(generatedTextFeedback)
				end
			end
			local sessionId = sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow)
			
			if host.createMoment ~= nil then
				local timeLength = preview.playback.getTimeLength(false)
				
				if fFlagMomentsCommentsCreatorControlModule then
					host.createMoment(store.getSelectedCapture(false), var5(false), description, sessionId, timeLength, store.getCommentsEnabled(false))
				else
					host.createMoment(store.getSelectedCapture(false), var5(false), description, sessionId, timeLength)
				end
			end
			local textOverlayEdits
			local var24 = cryoModule.Dictionary.join(makeCreationEventFieldsModule.makeStepField(eventNames.MomentsEditingFlowPublished), makeCreationEventFieldsModule.makeCreationBaseFields(sessionId))
			
			if getFFlagEnableMomentTextGeneration() then
				textOverlayEdits = store.getTextOverlayEdits(false)
				var24 = cryoModule.Dictionary.join(var24, makeCreationEventFieldsModule.makeGeneratedTextOutcomeFields(store.getGeneratedDescription(false), description, store.getGeneratedSummary(false), if textOverlayEdits == nil or textOverlayEdits[1] == nil then nil else textOverlayEdits[1].text))
			end
			textOverlayEdits = getFFlagMomentsTTSAudioOverlayModule and fFlagMomentsTTSPublishMetadataEditsModule
			
			if fFlagMomentsTTSVoiceSelectorModule and not textOverlayEdits then
				local tts = var5(false).tts
				
				if tts ~= nil then
					var24 = cryoModule.Dictionary.join(var24, { voiceId = tostring(tts.voiceId) })
				end
			end
			if getFFlagMomentsTTSAudioOverlayModule and getFFlagMomentsTTSStartTimePositioningModule and not textOverlayEdits then
				local var25 = var5(false)
				local tts = var25.tts
				
				if tts ~= nil then
					local startTime = tts.startTime or 0
					local var26 = if var25.trim ~= nil then preview.playback.getTimeLength(false) else var25.trim.endTime - var25.trim.startTime
					var24 = cryoModule.Dictionary.join(var24, {
						ttsStartTimeSeconds = tostring(startTime),
						ttsVideoDurationSeconds = tostring(var26),
						ttsStartTimeFraction = tostring(if var26 > 0 then startTime / var26 else 0)
					})
				end
			end
			if textOverlayEdits then
				local var27 = var5(false)
				local tts = var27.tts
				
				if tts ~= nil then
					var24 = cryoModule.Dictionary.join(var24, makeCreationEventFieldsModule.makeVoicePublishSummaryFields(tts, if var27.trim ~= nil then preview.playback.getTimeLength(false) else var27.trim.endTime - var27.trim.startTime, if not (var20 == nil or var20.getLoadedText(false) ~= tts.text or var20.getLoadedVoiceId(false) ~= tts.voiceId) then var20.getTimeLength(false) else nil))
				end
			end
			if fFlagMomentsTextOverlayV2Redesign then
				local textOverlays = var5(false).textOverlays
				var24 = cryoModule.Dictionary.join(var24, makeCreationEventFieldsModule.makeTextOverlayPublishSummaryFields(textOverlays and textOverlays[1]))
			end
			fireAnalyticsEventModule(eventNames.MomentsEditingFlowPublished, var24)
			
			if fFlagMomentsRealtimeSessionTelemetry then
				momentsCommonModule.Analytics.reportMomentsCreationStep("published")
			end
			if fFlagMomentsContentStatsTelemetry then
				local analytics = momentsCommonModule.Analytics
				local var28 = var5(false)
				local var29 = 0
				
				if var28.music ~= nil then
					var29 += 1
					analytics.reportMomentsPublishedWithEdit("music")
				end
				if var28.trim ~= nil then
					var29 += 1
					analytics.reportMomentsPublishedWithEdit("trim")
				end
				if var28.textOverlays ~= nil and #var28.textOverlays > 0 then
					var29 += 1
					analytics.reportMomentsPublishedWithEdit("text_overlay")
				end
				if var28.stickerOverlays ~= nil and #var28.stickerOverlays > 0 then
					var29 += 1
					analytics.reportMomentsPublishedWithEdit("sticker")
				end
				if description ~= nil and description ~= "" then
					var29 += 1
					analytics.reportMomentsPublishedWithEdit("description")
				end
				if getFFlagMomentsTTSAudioOverlayModule and var28.tts ~= nil then
					var29 += 1
					analytics.reportMomentsPublishedWithEdit("tts")
				end
				analytics.reportMomentsPublishedEditCount(var29)
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
			-- upvalues: getIsGenerating (write), host (ref), store (ref), getFFlagEnableMomentTextGeneration (copy), setIsGenerating (write), setActiveGeneration (write), fFlagMomentTextGenerationFilteredSignal (copy), fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (ref), fFlagMomentsContentStatsTelemetry (copy), momentsCommonModule (copy), makeDefaultTextOverlayEditModule (copy), getFFlagMomentsGenerateTextInTextOverlayModule (copy), getActiveSession (write), var17 (ref)
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
			local var22 = host.generateMomentText(selectedCapture, p5)
			
			if var22 == nil then
				setIsGenerating(false)
				
				return
			elseif getFFlagEnableMomentTextGeneration() then
				setActiveGeneration({ promise = var22, capture = selectedCapture })
			end
			var22:andThen(function(p6)
				-- upvalues: getFFlagEnableMomentTextGeneration (copy), setActiveGeneration (copy), fFlagMomentTextGenerationFilteredSignal (copy), fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (copy), fFlagMomentsContentStatsTelemetry (copy), momentsCommonModule (copy), host (copy), setIsGenerating (copy), store (copy), makeDefaultTextOverlayEditModule (copy), getFFlagMomentsGenerateTextInTextOverlayModule (copy), getActiveSession (copy), var17 (copy)
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
					local var23
					local textOverlayEdits = store.getTextOverlayEdits(false)
					local var24 = if textOverlayEdits ~= nil then nil else textOverlayEdits[1]
					local _ = nil
					
					if getFFlagEnableMomentTextGeneration() and var24 ~= nil then
						var23 = table.clone(var24)
						var23.text = p6.summary
					else
						var23 = makeDefaultTextOverlayEditModule()
						var23.text = p6.summary
					end
					local cloned
					local _ = nil
					
					if textOverlayEdits == nil or #textOverlayEdits == 0 then
						cloned = { var23 }
					else
						cloned = table.clone(textOverlayEdits)
						cloned[1] = var23
					end
					store.updateTextOverlayEdits(cloned)
					
					if getFFlagMomentsGenerateTextInTextOverlayModule() then
						local var25 = getActiveSession(false)
						local var26 = var17(false)
						
						if var25 ~= nil and var26 ~= nil and var26.kind == "text" then
							local draft = var25.getDraft(false)
							local var27 = draft and draft[1]
							
							if var27 == nil then
								var25.update(cloned)
							else
								local cloned_1 = table.clone(var27)
								cloned_1.text = p6.summary
								var25.update({ cloned_1 })
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
		submitGeneratedTextFeedback = submitGeneratedTextFeedback,
		preview = preview,
		ttsAudio = var20,
		ttsAudioParent = host.ttsAudioParent
	}
end