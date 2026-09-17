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
local getFFlagMomentsTTSAudioOverlayModule = require(momentsCreation.Flags.GetFFlagMomentsTTSAudioOverlay)
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
local createComputed = signalsModule.createComputed
local createSignal = signalsModule.createSignal

return function(p1)
	-- upvalues: creationToolRegistryModule (ref), defaultCreationToolsModule (ref), sessionManager (ref), funnelEventNames (ref), createSignal (ref), createComputed (ref), getFFlagEnableMomentTextGeneration (ref), getFFlagMomentsTTSAudioOverlayModule (ref), createCapturePreviewControllerModule (ref), createTTSAudioManagerModule (ref), cryoModule (ref), makeCreationEventFieldsModule (ref), creationFlowStateModule (ref), getFFlagMomentsCreationSaveDraft (ref), momentsDraftStorageModule (ref), fireAnalyticsEventModule (ref), eventNames (ref), fFlagMomentsRealtimeSessionTelemetry (ref), momentsCommonModule (ref), fFlagMomentsContentStatsTelemetry (ref), createEditSessionModule (ref), fFlagMomentTextGenerationFilteredSignal (ref), dialogTypeModule (ref), makeDefaultTextOverlayEditModule (ref), getFFlagMomentsGenerateTextInTextOverlayModule (ref)
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
	local var12 = createComputed(function(p3)
		-- upvalues: store (ref), host (ref), var4 (ref), registry (ref)
		local selectedCapture = store.getSelectedCapture(p3)
		local var13 = if selectedCapture ~= nil then nil else selectedCapture.CaptureType
		local t = {
			canGenerateText = host.generateMomentText ~= nil,
			captureType = var13,
			getComposedEdits = var4
		}
		local t_1 = {}
		
		for i, v in registry.getAll() do
			if (if v.supportedCaptureTypes ~= nil then var13 ~= nil and table.find(v.supportedCaptureTypes, var13) ~= nil else true) and (v.isAvailable == nil or v.isAvailable(t)) then
				table.insert(t_1, v)
			end
		end
		return t_1
	end)
	local var14 = createComputed(function(p4)
		-- upvalues: store (ref), registry (ref)
		local step = store.getStep(p4)
		
		for i, v in registry.getAll() do
			if v.step == step then
				return v
			end
		end
		return nil
	end)
	local var15 = createComputed(function(p5)
		-- upvalues: getFFlagMomentsTTSAudioOverlayModule (copy), var14 (ref), getActiveSession (write), var4 (ref)
		if not getFFlagMomentsTTSAudioOverlayModule then
			return nil
		end
		local var16 = var14(p5)
		
		if var16 ~= nil and var16.kind == "voice" then
			local var17 = getActiveSession(p5)
			local var18 = if var17 ~= nil then nil else var17.getDraft(p5)
			
			return if var18 == nil or var18.text == nil or var18.text == "" then var4(p5).tts else var18
		end
	end)
	local preview = p1.preview or createCapturePreviewControllerModule(store, createComputed(function(p5)
		-- upvalues: var14 (ref), getActiveSession (write), var4 (ref)
		local var16 = var14(p5)
		
		if var16 ~= nil and var16.kind == "trim" then
			local var17 = getActiveSession(p5)
			local var18 = if var17 ~= nil then nil else var17.getDraft(p5)
			
			if var18 ~= nil and var18.startTime ~= nil and var18.endTime ~= nil then
				return { startTime = var18.startTime, endTime = var18.endTime }
			end
		end
		local trim = var4(p5).trim
		
		return if trim == nil or trim.startTime == nil or trim.endTime == nil then nil else { startTime = trim.startTime, endTime = trim.endTime }
	end), createComputed(function(p5)
		-- upvalues: var14 (ref), getActiveSession (write), var4 (ref)
		local var16 = var14(p5)
		
		if var16 ~= nil and var16.kind == "music" then
			local var17 = getActiveSession(p5)
			local var18 = if var17 ~= nil then nil else var17.getDraft(p5)
			
			return if var18 == nil or var18.assetId == nil then var4(p5).music else var18
		end
	end))
	local var16 = nil
	
	if p1.ttsAudio ~= nil then
		var16 = p1.ttsAudio
	elseif getFFlagMomentsTTSAudioOverlayModule then
		var16 = store.getTTSAudio(false)
		
		if var16 == nil then
			var16 = createTTSAudioManagerModule()
			store.setTTSAudio(var16)
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
		-- upvalues: getFFlagEnableMomentTextGeneration (copy), getActiveGeneration (write), setActiveGeneration (write), setIsGenerating (write), store (ref), creationFlowStateModule (copy), setActiveSession (write), var16 (write), getFFlagMomentsCreationSaveDraft (copy), momentsDraftStorageModule (copy), fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (ref)
		if getFFlagEnableMomentTextGeneration() then
			local var17 = getActiveGeneration(false)
			
			if var17 ~= nil then
				var17.promise:cancel()
				setActiveGeneration(nil)
				setIsGenerating(false)
			end
		end
		store.clearEdits(creationFlowStateModule.Gallery)
		setActiveSession(nil)
		
		if var16 ~= nil then
			var16.reset()
		end
		if getFFlagMomentsCreationSaveDraft() then
			momentsDraftStorageModule.clear()
			fireAnalyticsEventModule(eventNames.MomentsReturnToGallery, withCreationSession({}))
		end
	end
	
	local function selectCapture(p5)
		-- upvalues: getActiveGeneration (write), getFFlagEnableMomentTextGeneration (copy), setActiveGeneration (write), setIsGenerating (write), store (ref), fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), fFlagMomentsRealtimeSessionTelemetry (copy), momentsCommonModule (copy)
		local var17 = getActiveGeneration(false)
		
		if getFFlagEnableMomentTextGeneration() and var17 ~= nil and p5 ~= var17.capture then
			local var18 = getActiveGeneration(false)
			
			if var18 ~= nil then
				var18.promise:cancel()
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
		local var17 = registry.get(p5)
		
		if var17 == nil then return end
		if fFlagMomentsContentStatsTelemetry then
			momentsCommonModule.Analytics.reportMomentsEditToolOpened(var17.kind)
		end
		if var17.cta.analyticsEvent ~= nil then
			fireAnalyticsEventModule(var17.cta.analyticsEvent, withCreationSession(makeCreationEventFieldsModule.makeToolField(var17)))
		end
		if var17.presentation == "InstantAction" then
			if var17.apply ~= nil then
				var17.apply(var1)
			end
			return
		else
			local _ = nil
			local createSession = var17.createSession
			local var18 = if createSession ~= nil then createEditSessionModule() else createSession()
			
			if var17.step == nil or store.navigate(var17.step) then
				var18.begin(store.getEditsMap(false)[p5])
				setActiveSession(var18)
				
				return
			end
		end
	end
	
	local function commitActiveTool()
		-- upvalues: getActiveSession (write), var14 (ref), store (ref), creationFlowStateModule (copy), var1 (write), fireAnalyticsEventModule (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), setActiveSession (write)
		local var17 = getActiveSession(false)
		local var18 = var14(false)
		
		if var17 == nil or var18 == nil then
			store.navigate(creationFlowStateModule.Preview)
			
			return
		end
		local var19 = var17.commit()
		
		if var18.onCommit ~= nil and var18.onCommit(var19, var1) == false then return end
		store.setCommittedEdit(var18.kind, var19)
		
		if var18.cta.commitAnalyticsEvent ~= nil and (not var18.cta.commitRequiresEdit or (if var18.toEdits ~= nil then next(var18.toEdits(var19)) ~= nil else true)) then
			fireAnalyticsEventModule(var18.cta.commitAnalyticsEvent, withCreationSession(makeCreationEventFieldsModule.makeToolField(var18)))
		end
		setActiveSession(nil)
		store.navigate(creationFlowStateModule.Preview)
	end
	
	local function saveActiveTool()
		-- upvalues: getActiveSession (write), var14 (ref), store (ref)
		local var17 = getActiveSession(false)
		local var18 = var14(false)
		
		if var17 == nil or var18 == nil then
			return
		end
		store.setCommittedEdit(var18.kind, var17.commit())
	end
	
	local function clearActiveTool()
		-- upvalues: getActiveSession (write), var14 (ref), var16 (write)
		local var17 = getActiveSession(false)
		local var18 = var14(false)
		
		if var18 == nil then return end
		if var17 ~= nil then
			var17.update(nil)
		end
		if var18.kind == "voice" and var16 ~= nil then
			var16.reset()
		end
	end
	
	local function discardActiveTool()
		-- upvalues: getActiveSession (write), var14 (ref), var16 (write), var4 (ref), fireAnalyticsEventModule (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), fFlagMomentsContentStatsTelemetry (copy), momentsCommonModule (copy), setActiveSession (write), store (ref), creationFlowStateModule (copy)
		local var17 = getActiveSession(false)
		local var18 = var14(false)
		
		if var17 ~= nil then
			var17.discard()
		end
		if var18 ~= nil and var18.kind == "voice" and var16 ~= nil then
			local tts = var4(false).tts
			
			if tts == nil or tts.text == nil or tts.text == "" then
				var16.reset()
			else
				var16.generate(tts.text, tts.voiceId)
			end
		end
		if var18 ~= nil and var18.cta.cancelAnalyticsEvent ~= nil then
			fireAnalyticsEventModule(var18.cta.cancelAnalyticsEvent, withCreationSession(makeCreationEventFieldsModule.makeToolField(var18)))
		end
		if fFlagMomentsContentStatsTelemetry and var18 ~= nil then
			momentsCommonModule.Analytics.reportMomentsEditToolAbandoned(var18.kind)
		end
		setActiveSession(nil)
		store.navigate(creationFlowStateModule.Preview)
	end
	
	local function updateCommittedEdit(p5, p6)
		-- upvalues: store (ref)
		store.setCommittedEdit(p5, p6)
	end
	
	local function dismiss()
		-- upvalues: getFFlagEnableMomentTextGeneration (copy), getActiveGeneration (write), setActiveGeneration (write), setIsGenerating (write), host (ref), var3 (ref), p1 (ref), creationFlowStateModule (copy), store (ref), var16 (write), getFFlagMomentsCreationSaveDraft (copy), momentsDraftStorageModule (copy)
		if getFFlagEnableMomentTextGeneration() then
			local var17 = getActiveGeneration(false)
			
			if var17 ~= nil then
				var17.promise:cancel()
				setActiveGeneration(nil)
				setIsGenerating(false)
			end
			if host.dismissGenerationToasts ~= nil then
				host.dismissGenerationToasts()
			end
		end
		var3(nil)
		store.clearEdits(if p1.excludeGallery then creationFlowStateModule.Preview else creationFlowStateModule.Gallery)
		
		if var16 ~= nil then
			var16.destroy()
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
		getAvailableTools = var12,
		getActiveTool = var14,
		getActiveSession = getActiveSession,
		getComposedEdits = var4,
		getEffectiveTTS = var15,
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
		publish = function()
			-- upvalues: store (ref), host (ref), var3 (ref), dialogTypeModule (copy), dismissModal (ref), fFlagMomentTextGenerationFilteredSignal (copy), emitGeneratedTextFeedback (ref), sessionManager (copy), funnelEventNames (copy), preview (ref), var4 (ref), cryoModule (copy), makeCreationEventFieldsModule (copy), eventNames (copy), getFFlagEnableMomentTextGeneration (copy), fireAnalyticsEventModule (copy), fFlagMomentsRealtimeSessionTelemetry (copy), momentsCommonModule (copy), fFlagMomentsContentStatsTelemetry (copy), getFFlagMomentsTTSAudioOverlayModule (copy), dismiss (ref)
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
				host.createMoment(store.getSelectedCapture(false), var4(false), description, sessionId, preview.playback.getTimeLength(false))
			end
			local textOverlayEdits
			local var17 = cryoModule.Dictionary.join(makeCreationEventFieldsModule.makeStepField(eventNames.MomentsEditingFlowPublished), makeCreationEventFieldsModule.makeCreationBaseFields(sessionId))
			
			if getFFlagEnableMomentTextGeneration() then
				textOverlayEdits = store.getTextOverlayEdits(false)
				var17 = cryoModule.Dictionary.join(var17, makeCreationEventFieldsModule.makeGeneratedTextOutcomeFields(store.getGeneratedDescription(false), description, store.getGeneratedSummary(false), if textOverlayEdits == nil or textOverlayEdits[1] == nil then nil else textOverlayEdits[1].text))
			end
			fireAnalyticsEventModule(eventNames.MomentsEditingFlowPublished, var17)
			
			if fFlagMomentsRealtimeSessionTelemetry then
				momentsCommonModule.Analytics.reportMomentsCreationStep("published")
			end
			if fFlagMomentsContentStatsTelemetry then
				textOverlayEdits = momentsCommonModule.Analytics
				local var18 = var4(false)
				local var19 = 0
				
				if var18.music ~= nil then
					var19 += 1
					textOverlayEdits.reportMomentsPublishedWithEdit("music")
				end
				if var18.trim ~= nil then
					var19 += 1
					textOverlayEdits.reportMomentsPublishedWithEdit("trim")
				end
				if var18.textOverlays ~= nil and #var18.textOverlays > 0 then
					var19 += 1
					textOverlayEdits.reportMomentsPublishedWithEdit("text_overlay")
				end
				if var18.stickerOverlays ~= nil and #var18.stickerOverlays > 0 then
					var19 += 1
					textOverlayEdits.reportMomentsPublishedWithEdit("sticker")
				end
				if description ~= nil and description ~= "" then
					var19 += 1
					textOverlayEdits.reportMomentsPublishedWithEdit("description")
				end
				if getFFlagMomentsTTSAudioOverlayModule and var18.tts ~= nil then
					var19 += 1
					textOverlayEdits.reportMomentsPublishedWithEdit("tts")
				end
				textOverlayEdits.reportMomentsPublishedEditCount(var19)
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
			-- upvalues: getIsGenerating (write), host (ref), store (ref), getFFlagEnableMomentTextGeneration (copy), setIsGenerating (write), setActiveGeneration (write), fFlagMomentTextGenerationFilteredSignal (copy), fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (ref), fFlagMomentsContentStatsTelemetry (copy), momentsCommonModule (copy), makeDefaultTextOverlayEditModule (copy), getFFlagMomentsGenerateTextInTextOverlayModule (copy), getActiveSession (write), var14 (ref)
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
			local var17 = host.generateMomentText(selectedCapture, p5)
			
			if var17 == nil then
				setIsGenerating(false)
				
				return
			elseif getFFlagEnableMomentTextGeneration() then
				setActiveGeneration({ promise = var17, capture = selectedCapture })
			end
			var17:andThen(function(p6)
				-- upvalues: getFFlagEnableMomentTextGeneration (copy), setActiveGeneration (copy), fFlagMomentTextGenerationFilteredSignal (copy), fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (copy), fFlagMomentsContentStatsTelemetry (copy), momentsCommonModule (copy), host (copy), setIsGenerating (copy), store (copy), makeDefaultTextOverlayEditModule (copy), getFFlagMomentsGenerateTextInTextOverlayModule (copy), getActiveSession (copy), var14 (copy)
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
					local var18
					local textOverlayEdits = store.getTextOverlayEdits(false)
					local var19 = if textOverlayEdits ~= nil then nil else textOverlayEdits[1]
					local _ = nil
					
					if getFFlagEnableMomentTextGeneration() and var19 ~= nil then
						var18 = table.clone(var19)
						var18.text = p6.summary
					else
						var18 = makeDefaultTextOverlayEditModule()
						var18.text = p6.summary
					end
					local cloned
					local _ = nil
					
					if textOverlayEdits == nil or #textOverlayEdits == 0 then
						cloned = { var18 }
					else
						cloned = table.clone(textOverlayEdits)
						cloned[1] = var18
					end
					store.updateTextOverlayEdits(cloned)
					
					if getFFlagMomentsGenerateTextInTextOverlayModule() then
						local var20 = getActiveSession(false)
						local var21 = var14(false)
						
						if var20 ~= nil and var21 ~= nil and var21.kind == "text" then
							local draft = var20.getDraft(false)
							local var22 = draft and draft[1]
							
							if var22 == nil then
								var20.update(cloned)
							else
								local cloned_1 = table.clone(var22)
								cloned_1.text = p6.summary
								var20.update({ cloned_1 })
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
		ttsAudio = var16
	}
end