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

return function(p1)
	-- upvalues: creationToolRegistryModule (ref), defaultCreationToolsModule (ref), getFFlagMomentsAnalyticsProducerPrereqs (ref), sessionManager (ref), funnelEventNames (ref), getFFlagMomentsCreationPersistEditSessionModule (ref), createSignal (ref), createComputed (ref), getFFlagEnableMomentTextGeneration (ref), getFFlagMomentsTTSAudioOverlayModule (ref), createCapturePreviewControllerModule (ref), createTTSAudioManagerModule (ref), cryoModule (ref), makeCreationEventFieldsModule (ref), creationFlowStateModule (ref), getFFlagMomentsCreationSaveDraft (ref), momentsDraftStorageModule (ref), fireAnalyticsEventModule (ref), eventNames (ref), fFlagMomentsRealtimeSessionTelemetry (ref), momentsCommonModule (ref), fFlagMomentsContentStatsTelemetry (ref), createEditSessionModule (ref), fFlagMomentTextGenerationFilteredSignal (ref), dialogTypeModule (ref), makeDefaultTextOverlayEditModule (ref), getFFlagMomentsGenerateTextInTextOverlayModule (ref)
	local store = p1.store
	local host = p1.host or {}
	local registry = p1.registry or creationToolRegistryModule(defaultCreationToolsModule)
	
	if getFFlagMomentsAnalyticsProducerPrereqs() and sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow) == nil then
		sessionManager.startSession(funnelEventNames.FunnelTypes.CreationFlow)
	end
	local getActiveSession, var1
	local var2 = nil
	local _ = nil
	local _ = nil
	
	if getFFlagMomentsCreationPersistEditSessionModule() then
		getActiveSession = store.getActiveSession
		local setActiveSession = store.setActiveSession
	else
		local _ = nil
		local var3, var4 = createSignal(nil)
		getActiveSession = var3
		var1 = var4
		
		local setActiveSession = function(p2)
			-- upvalues: var1 (write)
			var1(p2)
		end
	end
	local getIsGenerating, setIsGenerating
	var1, var24 = createSignal(nil)
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
	local var13 = createComputed(function(p3)
		-- upvalues: store (ref), host (ref), var5 (ref), registry (ref)
		local selectedCapture = store.getSelectedCapture(p3)
		local var14 = if selectedCapture ~= nil then nil else selectedCapture.CaptureType
		local t = {
			canGenerateText = host.generateMomentText ~= nil,
			captureType = var14,
			getComposedEdits = var5
		}
		local t_1 = {}
		
		for i, v in registry.getAll() do
			if (if v.supportedCaptureTypes ~= nil then var14 ~= nil and table.find(v.supportedCaptureTypes, var14) ~= nil else true) and (v.isAvailable == nil or v.isAvailable(t)) then
				table.insert(t_1, v)
			end
		end
		return t_1
	end)
	local var15 = createComputed(function(p4)
		-- upvalues: store (ref), registry (ref)
		local step = store.getStep(p4)
		
		for i, v in registry.getAll() do
			if v.step == step then
				return v
			end
		end
		return nil
	end)
	local var16 = createComputed(function(p5)
		-- upvalues: getFFlagMomentsTTSAudioOverlayModule (copy), var15 (ref), getActiveSession (write), var5 (ref)
		if not getFFlagMomentsTTSAudioOverlayModule then
			return nil
		end
		local var17 = var15(p5)
		
		if var17 ~= nil and var17.kind == "voice" then
			local var18 = getActiveSession(p5)
			local var19 = if var18 ~= nil then nil else var18.getDraft(p5)
			
			return if var19 == nil or var19.text == nil or var19.text == "" then var5(p5).tts else var19
		end
	end)
	local preview = p1.preview or createCapturePreviewControllerModule(store, createComputed(function(p5)
		-- upvalues: var15 (ref), getActiveSession (write), var5 (ref)
		local var17 = var15(p5)
		
		if var17 ~= nil and var17.kind == "trim" then
			local var18 = getActiveSession(p5)
			local var19 = if var18 ~= nil then nil else var18.getDraft(p5)
			
			if var19 ~= nil and var19.startTime ~= nil and var19.endTime ~= nil then
				return { startTime = var19.startTime, endTime = var19.endTime }
			end
		end
		local trim = var5(p5).trim
		
		return if trim == nil or trim.startTime == nil or trim.endTime == nil then nil else { startTime = trim.startTime, endTime = trim.endTime }
	end), createComputed(function(p5)
		-- upvalues: var15 (ref), getActiveSession (write), var5 (ref)
		local var17 = var15(p5)
		
		if var17 ~= nil and var17.kind == "music" then
			local var18 = getActiveSession(p5)
			local var19 = if var18 ~= nil then nil else var18.getDraft(p5)
			
			return if var19 == nil or var19.assetId == nil then var5(p5).music else var19
		end
	end))
	local var17 = nil
	
	if p1.ttsAudio ~= nil then
		var17 = p1.ttsAudio
	elseif getFFlagMomentsTTSAudioOverlayModule then
		var17 = store.getTTSAudio(false)
		
		if var17 == nil then
			var17 = createTTSAudioManagerModule()
			store.setTTSAudio(var17)
		end
	end
	local function showModal(p5)
		-- upvalues: var24 (ref)
		var24(p5)
	end
	
	local function dismissModal()
		-- upvalues: var24 (ref)
		var24(nil)
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
		-- upvalues: getFFlagEnableMomentTextGeneration (copy), getActiveGeneration (write), setActiveGeneration (write), setIsGenerating (write), store (ref), creationFlowStateModule (copy), setActiveSession (write), var17 (write), getFFlagMomentsCreationSaveDraft (copy), momentsDraftStorageModule (copy), fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (ref)
		if getFFlagEnableMomentTextGeneration() then
			local var18 = getActiveGeneration(false)
			
			if var18 ~= nil then
				var18.promise:cancel()
				setActiveGeneration(nil)
				setIsGenerating(false)
			end
		end
		store.clearEdits(creationFlowStateModule.Gallery)
		setActiveSession(nil)
		
		if var17 ~= nil then
			var17.reset()
		end
		if getFFlagMomentsCreationSaveDraft() then
			momentsDraftStorageModule.clear()
			fireAnalyticsEventModule(eventNames.MomentsReturnToGallery, withCreationSession({}))
		end
	end
	
	local function selectCapture(p5)
		-- upvalues: getActiveGeneration (write), getFFlagEnableMomentTextGeneration (copy), setActiveGeneration (write), setIsGenerating (write), store (ref), fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), fFlagMomentsRealtimeSessionTelemetry (copy), momentsCommonModule (copy)
		local var18 = getActiveGeneration(false)
		
		if getFFlagEnableMomentTextGeneration() and var18 ~= nil and p5 ~= var18.capture then
			local var19 = getActiveGeneration(false)
			
			if var19 ~= nil then
				var19.promise:cancel()
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
		local var18 = registry.get(p5)
		
		if var18 == nil then return end
		if fFlagMomentsContentStatsTelemetry then
			momentsCommonModule.Analytics.reportMomentsEditToolOpened(var18.kind)
		end
		if var18.cta.analyticsEvent ~= nil then
			fireAnalyticsEventModule(var18.cta.analyticsEvent, withCreationSession(makeCreationEventFieldsModule.makeToolField(var18)))
		end
		if var18.presentation == "InstantAction" then
			if var18.apply ~= nil then
				var18.apply(var2)
			end
			return
		else
			local _ = nil
			local createSession = var18.createSession
			local var19 = if createSession ~= nil then createEditSessionModule() else createSession()
			
			if var18.step == nil or store.navigate(var18.step) then
				var19.begin(store.getEditsMap(false)[p5])
				setActiveSession(var19)
				
				return
			end
		end
	end
	
	local function commitActiveTool()
		-- upvalues: getActiveSession (write), var15 (ref), store (ref), creationFlowStateModule (copy), var2 (write), fireAnalyticsEventModule (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), setActiveSession (write)
		local var18 = getActiveSession(false)
		local var19 = var15(false)
		
		if var18 == nil or var19 == nil then
			store.navigate(creationFlowStateModule.Preview)
			
			return
		end
		local var20 = var18.commit()
		
		if var19.onCommit ~= nil and var19.onCommit(var20, var2) == false then return end
		store.setCommittedEdit(var19.kind, var20)
		
		if var19.cta.commitAnalyticsEvent ~= nil then
			fireAnalyticsEventModule(var19.cta.commitAnalyticsEvent, withCreationSession(makeCreationEventFieldsModule.makeToolField(var19)))
		end
		setActiveSession(nil)
		store.navigate(creationFlowStateModule.Preview)
	end
	
	local function saveActiveTool()
		-- upvalues: getActiveSession (write), var15 (ref), store (ref)
		local var18 = getActiveSession(false)
		local var19 = var15(false)
		
		if var18 == nil or var19 == nil then
			return
		end
		store.setCommittedEdit(var19.kind, var18.commit())
	end
	
	local function clearActiveTool()
		-- upvalues: getActiveSession (write), var15 (ref), var17 (write)
		local var18 = getActiveSession(false)
		local var19 = var15(false)
		
		if var19 == nil then return end
		if var18 ~= nil then
			var18.update(nil)
		end
		if var19.kind == "voice" and var17 ~= nil then
			var17.reset()
		end
	end
	
	local function discardActiveTool()
		-- upvalues: getActiveSession (write), var15 (ref), var17 (write), var5 (ref), fireAnalyticsEventModule (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), fFlagMomentsContentStatsTelemetry (copy), momentsCommonModule (copy), setActiveSession (write), store (ref), creationFlowStateModule (copy)
		local var18 = getActiveSession(false)
		local var19 = var15(false)
		
		if var18 ~= nil then
			var18.discard()
		end
		if var19 ~= nil and var19.kind == "voice" and var17 ~= nil then
			local tts = var5(false).tts
			
			if tts == nil or tts.text == nil or tts.text == "" then
				var17.reset()
			else
				var17.generate(tts.text, tts.voiceId)
			end
		end
		if var19 ~= nil and var19.cta.cancelAnalyticsEvent ~= nil then
			fireAnalyticsEventModule(var19.cta.cancelAnalyticsEvent, withCreationSession(makeCreationEventFieldsModule.makeToolField(var19)))
		end
		if fFlagMomentsContentStatsTelemetry and var19 ~= nil then
			momentsCommonModule.Analytics.reportMomentsEditToolAbandoned(var19.kind)
		end
		setActiveSession(nil)
		store.navigate(creationFlowStateModule.Preview)
	end
	
	local function updateCommittedEdit(p5, p6)
		-- upvalues: store (ref)
		store.setCommittedEdit(p5, p6)
	end
	
	local function dismiss()
		-- upvalues: getFFlagEnableMomentTextGeneration (copy), getActiveGeneration (write), setActiveGeneration (write), setIsGenerating (write), host (ref), var24 (ref), p1 (ref), creationFlowStateModule (copy), store (ref), var17 (write), getFFlagMomentsCreationSaveDraft (copy), momentsDraftStorageModule (copy)
		if getFFlagEnableMomentTextGeneration() then
			local var18 = getActiveGeneration(false)
			
			if var18 ~= nil then
				var18.promise:cancel()
				setActiveGeneration(nil)
				setIsGenerating(false)
			end
			if host.dismissGenerationToasts ~= nil then
				host.dismissGenerationToasts()
			end
		end
		var24(nil)
		store.clearEdits(if p1.excludeGallery then creationFlowStateModule.Preview else creationFlowStateModule.Gallery)
		
		if var17 ~= nil then
			var17.destroy()
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
		getAvailableTools = var13,
		getActiveTool = var15,
		getActiveSession = getActiveSession,
		getComposedEdits = var5,
		getEffectiveTTS = var16,
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
		getActiveModal = var1,
		showModal = showModal,
		dismissModal = dismissModal,
		getVoiceCoachmarkDismissed = var11,
		dismissVoiceCoachmark = dismissVoiceCoachmark,
		publish = function()
			-- upvalues: store (ref), host (ref), var24 (ref), dialogTypeModule (copy), dismissModal (ref), fFlagMomentTextGenerationFilteredSignal (copy), emitGeneratedTextFeedback (ref), getFFlagMomentsAnalyticsProducerPrereqs (copy), sessionManager (copy), funnelEventNames (copy), preview (ref), var5 (ref), cryoModule (copy), makeCreationEventFieldsModule (copy), eventNames (copy), getFFlagEnableMomentTextGeneration (copy), fireAnalyticsEventModule (copy), fFlagMomentsRealtimeSessionTelemetry (copy), momentsCommonModule (copy), fFlagMomentsContentStatsTelemetry (copy), dismiss (ref)
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
			local var18 = if getFFlagMomentsAnalyticsProducerPrereqs() then sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow) else nil
			
			if host.createMoment ~= nil then
				host.createMoment(store.getSelectedCapture(false), var5(false), description, var18, preview.playback.getTimeLength(false))
			end
			local textOverlayEdits
			local var19 = cryoModule.Dictionary.join(makeCreationEventFieldsModule.makeStepField(eventNames.MomentsEditingFlowPublished), makeCreationEventFieldsModule.makeCreationBaseFields(var18))
			
			if getFFlagEnableMomentTextGeneration() then
				textOverlayEdits = store.getTextOverlayEdits(false)
				var19 = cryoModule.Dictionary.join(var19, makeCreationEventFieldsModule.makeGeneratedTextOutcomeFields(store.getGeneratedDescription(false), description, store.getGeneratedSummary(false), if textOverlayEdits == nil or textOverlayEdits[1] == nil then nil else textOverlayEdits[1].text))
			end
			fireAnalyticsEventModule(eventNames.MomentsEditingFlowPublished, var19)
			
			if fFlagMomentsRealtimeSessionTelemetry then
				momentsCommonModule.Analytics.reportMomentsCreationStep("published")
			end
			if fFlagMomentsContentStatsTelemetry then
				textOverlayEdits = momentsCommonModule.Analytics
				local var20 = var5(false)
				local var21 = 0
				
				if var20.music ~= nil then
					var21 += 1
					textOverlayEdits.reportMomentsPublishedWithEdit("music")
				end
				if var20.trim ~= nil then
					var21 += 1
					textOverlayEdits.reportMomentsPublishedWithEdit("trim")
				end
				if var20.textOverlays ~= nil and #var20.textOverlays > 0 then
					var21 += 1
					textOverlayEdits.reportMomentsPublishedWithEdit("text_overlay")
				end
				if var20.stickerOverlays ~= nil and #var20.stickerOverlays > 0 then
					var21 += 1
					textOverlayEdits.reportMomentsPublishedWithEdit("sticker")
				end
				if description ~= nil and description ~= "" then
					var21 += 1
					textOverlayEdits.reportMomentsPublishedWithEdit("description")
				end
				textOverlayEdits.reportMomentsPublishedEditCount(var21)
				local selectedCapture = store.getSelectedCapture(false)
				
				if selectedCapture ~= nil then
					textOverlayEdits.reportMomentsPublishedByCaptureType(if selectedCapture.CaptureType == Enum.CaptureType.Video then "video" elseif selectedCapture.CaptureType == Enum.CaptureType.Screenshot then "screenshot" else "unknown")
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
			-- upvalues: getIsGenerating (write), host (ref), store (ref), getFFlagEnableMomentTextGeneration (copy), setIsGenerating (write), setActiveGeneration (write), fFlagMomentTextGenerationFilteredSignal (copy), fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (ref), fFlagMomentsContentStatsTelemetry (copy), momentsCommonModule (copy), makeDefaultTextOverlayEditModule (copy), getFFlagMomentsGenerateTextInTextOverlayModule (copy), getActiveSession (write), var15 (ref)
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
			local var18 = host.generateMomentText(selectedCapture, p5)
			
			if var18 == nil then
				setIsGenerating(false)
				
				return
			elseif getFFlagEnableMomentTextGeneration() then
				setActiveGeneration({ promise = var18, capture = selectedCapture })
			end
			var18:andThen(function(p6)
				-- upvalues: getFFlagEnableMomentTextGeneration (copy), setActiveGeneration (copy), fFlagMomentTextGenerationFilteredSignal (copy), fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (copy), fFlagMomentsContentStatsTelemetry (copy), momentsCommonModule (copy), host (copy), setIsGenerating (copy), store (copy), makeDefaultTextOverlayEditModule (copy), getFFlagMomentsGenerateTextInTextOverlayModule (copy), getActiveSession (copy), var15 (copy)
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
					local var19
					local textOverlayEdits = store.getTextOverlayEdits(false)
					local var20 = if textOverlayEdits ~= nil then nil else textOverlayEdits[1]
					local _ = nil
					
					if getFFlagEnableMomentTextGeneration() and var20 ~= nil then
						var19 = table.clone(var20)
						var19.text = p6.summary
					else
						var19 = makeDefaultTextOverlayEditModule()
						var19.text = p6.summary
					end
					local cloned
					local _ = nil
					
					if textOverlayEdits == nil or #textOverlayEdits == 0 then
						cloned = { var19 }
					else
						cloned = table.clone(textOverlayEdits)
						cloned[1] = var19
					end
					store.updateTextOverlayEdits(cloned)
					
					if getFFlagMomentsGenerateTextInTextOverlayModule() then
						local var21 = getActiveSession(false)
						local var22 = var15(false)
						
						if var21 ~= nil and var22 ~= nil and var22.kind == "text" then
							local draft = var21.getDraft(false)
							local var23 = draft and draft[1]
							
							if var23 == nil then
								var21.update(cloned)
							else
								local cloned_1 = table.clone(var23)
								cloned_1.text = p6.summary
								var21.update({ cloned_1 })
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
		ttsAudio = var17
	}
end