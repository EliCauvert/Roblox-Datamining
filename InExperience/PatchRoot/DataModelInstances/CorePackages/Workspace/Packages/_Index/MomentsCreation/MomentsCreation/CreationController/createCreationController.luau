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
local makeCreationEventFieldsModule = require(momentsCreation.Analytics.makeCreationEventFields)
local momentsCommonModule = require(parent.MomentsCommon)
local eventNames = momentsCommonModule.Analytics.EventNames
local sessionManager = momentsCommonModule.Analytics.SessionManager
local funnelEventNames = momentsCommonModule.Analytics.FunnelEventNames
local getFFlagEnableMomentTextGeneration = momentsCommonModule.Flags.GetFFlagEnableMomentTextGeneration
local getFFlagMomentsAnalyticsProducerPrereqs = momentsCommonModule.Flags.GetFFlagMomentsAnalyticsProducerPrereqs
local fFlagMomentsRealtimeSessionTelemetry = momentsCommonModule.Flags.FFlagMomentsRealtimeSessionTelemetry
local fFlagMomentsContentStatsTelemetry = momentsCommonModule.Flags.FFlagMomentsContentStatsTelemetry
local createComputed = signalsModule.createComputed
local createSignal = signalsModule.createSignal

return function(p0) --[[ line: 68 | named "createCreationController" ]]
	-- upvalues: creationToolRegistryModule (ref), defaultCreationToolsModule (ref), getFFlagMomentsAnalyticsProducerPrereqs (ref), sessionManager (ref), funnelEventNames (ref), getFFlagMomentsCreationPersistEditSessionModule (ref), createSignal (ref), createComputed (ref), getFFlagEnableMomentTextGeneration (ref), getFFlagMomentsTTSAudioOverlayModule (ref), createCapturePreviewControllerModule (ref), createTTSAudioManagerModule (ref), cryoModule (ref), makeCreationEventFieldsModule (ref), creationFlowStateModule (ref), fireAnalyticsEventModule (ref), eventNames (ref), fFlagMomentsRealtimeSessionTelemetry (ref), momentsCommonModule (ref), fFlagMomentsContentStatsTelemetry (ref), createEditSessionModule (ref), dialogTypeModule (ref), makeDefaultTextOverlayEditModule (ref)
	local store = p0.store
	local host = p0.host or {}
	local registry = p0.registry or creationToolRegistryModule(defaultCreationToolsModule)
	
	if getFFlagMomentsAnalyticsProducerPrereqs() and sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow) == nil then
		sessionManager.startSession(funnelEventNames.FunnelTypes.CreationFlow)
	end
	local getActiveSession, var21
	local var18 = nil
	local _ = nil
	local _ = nil
	
	if getFFlagMomentsCreationPersistEditSessionModule() then
		getActiveSession = store.getActiveSession
		local setActiveSession = store.setActiveSession
	else
		local _ = nil
		local var19, var20 = createSignal(nil)
		getActiveSession = var19
		var21 = var20
		
		local setActiveSession = function(p1) --[[ line: 97 ]]
			-- upvalues: var21 (write)
			var21(p1)
		end
	end
	local getIsGenerating, setIsGenerating
	var21, var22 = createSignal(nil)
	local var23 = createComputed(function(p2) --[[ line: 106 ]]
		-- upvalues: store (ref), registry (ref)
		local t = {}
		
		for i, v in store.getEditsMap(p2) do
			if v ~= nil then
				local var38 = registry.get(i)
				
				if var38 == nil or var38.toEdits == nil then
					t[i] = v
				else
					for i_1, v_1 in var38.toEdits(v) do
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
		local var24, var25 = createSignal(false)
		getIsGenerating = var24
		setIsGenerating = var25
	end
	local getActiveGeneration, setActiveGeneration
	local _ = nil
	local _ = nil
	
	if getFFlagEnableMomentTextGeneration() then
		getActiveGeneration = store.getActiveGeneration
		setActiveGeneration = store.setActiveGeneration
	else
		local var26, var27 = createSignal(nil)
		getActiveGeneration = var26
		setActiveGeneration = var27
	end
	local function _() --[[ line: 153 | named "cancelActiveGeneration" ]]
		-- upvalues: getActiveGeneration (write), setActiveGeneration (write), setIsGenerating (write)
		local var39 = getActiveGeneration(false)
		
		if var39 == nil then
			return
		end
		var39.promise:cancel()
		setActiveGeneration(nil)
		setIsGenerating(false)
	end
	
	local var28 = createComputed(function(p3) --[[ line: 164 ]]
		-- upvalues: store (ref), host (ref), var23 (ref), registry (ref)
		local selectedCapture = store.getSelectedCapture(p3)
		local var41 = if selectedCapture ~= nil then nil else selectedCapture.CaptureType
		local t = {
			canGenerateText = host.generateMomentText ~= nil,
			captureType = var41,
			getComposedEdits = var23
		}
		local t_1 = {}
		
		for i, v in registry.getAll() do
			if (if v.supportedCaptureTypes ~= nil then var41 ~= nil and table.find(v.supportedCaptureTypes, var41) ~= nil else true) and (v.isAvailable == nil or v.isAvailable(t)) then
				table.insert(t_1, v)
			end
		end
		return t_1
	end)
	local var29 = createComputed(function(p4) --[[ line: 186 ]]
		-- upvalues: store (ref), registry (ref)
		local step = store.getStep(p4)
		
		for i, v in registry.getAll() do
			if v.step == step then
				return v
			end
		end
		return nil
	end)
	local var30 = createComputed(function(p5) --[[ line: 231 ]]
		-- upvalues: getFFlagMomentsTTSAudioOverlayModule (copy), var29 (ref), getActiveSession (write), var23 (ref)
		if not getFFlagMomentsTTSAudioOverlayModule then
			return nil
		end
		local var45 = var29(p5)
		
		if var45 ~= nil and var45.kind == "voice" then
			local var46 = getActiveSession(p5)
			local var47 = if var46 ~= nil then nil else var46.getDraft(p5)
			
			return if var47 == nil or var47.text == nil or var47.text == "" then var23(p5).tts else var47
		end
	end)
	local preview = p0.preview or createCapturePreviewControllerModule(store, createComputed(function(p6) --[[ line: 200 ]]
		-- upvalues: var29 (ref), getActiveSession (write), var23 (ref)
		local var48 = var29(p6)
		
		if var48 ~= nil and var48.kind == "trim" then
			local var49 = getActiveSession(p6)
			local var50 = if var49 ~= nil then nil else var49.getDraft(p6)
			
			if var50 ~= nil and var50.startTime ~= nil and var50.endTime ~= nil then
				return { startTime = var50.startTime, endTime = var50.endTime }
			end
		end
		local trim = var23(p6).trim
		
		return if trim == nil or trim.startTime == nil or trim.endTime == nil then nil else { startTime = trim.startTime, endTime = trim.endTime }
	end), createComputed(function(p7) --[[ line: 219 ]]
		-- upvalues: var29 (ref), getActiveSession (write), var23 (ref)
		local var51 = var29(p7)
		
		if var51 ~= nil and var51.kind == "music" then
			local var52 = getActiveSession(p7)
			local var53 = if var52 ~= nil then nil else var52.getDraft(p7)
			
			return if var53 == nil or var53.assetId == nil then var23(p7).music else var53
		end
	end))
	local ttsAudio = p0.ttsAudio or (if getFFlagMomentsTTSAudioOverlayModule then createTTSAudioManagerModule() else nil)
	
	local function showModal(p8) --[[ line: 251 ]]
		-- upvalues: var22 (ref)
		var22(p8)
	end
	
	local function dismissModal() --[[ line: 255 ]]
		-- upvalues: var22 (ref)
		var22(nil)
	end
	
	local function withCreationSession(p9) --[[ line: 263 ]]
		-- upvalues: sessionManager (copy), funnelEventNames (copy), cryoModule (copy), makeCreationEventFieldsModule (copy)
		return cryoModule.Dictionary.join(p9, makeCreationEventFieldsModule.makeCreationBaseFields(sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow)))
	end
	
	local function dismiss() --[[ line: 457 ]]
		-- upvalues: getFFlagEnableMomentTextGeneration (copy), getActiveGeneration (write), setActiveGeneration (write), setIsGenerating (write), host (ref), var22 (ref), p0 (ref), creationFlowStateModule (copy), store (ref)
		if getFFlagEnableMomentTextGeneration() then
			local var54 = getActiveGeneration(false)
			
			if var54 ~= nil then
				var54.promise:cancel()
				setActiveGeneration(nil)
				setIsGenerating(false)
			end
			if host.dismissGenerationToasts ~= nil then
				host.dismissGenerationToasts()
			end
		end
		var22(nil)
		store.clearEdits(if p0.excludeGallery then creationFlowStateModule.Preview else creationFlowStateModule.Gallery)
		
		if host.exitCreationFlow ~= nil then
			host.exitCreationFlow()
		end
	end
	
	return {
		getStep = store.getStep,
		navigate = function(p10) --[[ line: 268 ]]
			-- upvalues: store (ref)
			store.navigate(p10)
		end,
		returnToGallery = function() --[[ line: 273 ]]
			-- upvalues: getFFlagEnableMomentTextGeneration (copy), getActiveGeneration (write), setActiveGeneration (write), setIsGenerating (write), store (ref), creationFlowStateModule (copy), setActiveSession (write), ttsAudio (ref)
			if getFFlagEnableMomentTextGeneration() then
				local var55 = getActiveGeneration(false)
				
				if var55 ~= nil then
					var55.promise:cancel()
					setActiveGeneration(nil)
					setIsGenerating(false)
				end
			end
			store.clearEdits(creationFlowStateModule.Gallery)
			setActiveSession(nil)
			
			if ttsAudio ~= nil then
				ttsAudio.reset()
			end
		end,
		getSelectedCapture = store.getSelectedCapture,
		selectCapture = function(p11) --[[ line: 291 ]]
			-- upvalues: getActiveGeneration (write), getFFlagEnableMomentTextGeneration (copy), setActiveGeneration (write), setIsGenerating (write), store (ref), fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), fFlagMomentsRealtimeSessionTelemetry (copy), momentsCommonModule (copy)
			local var56 = getActiveGeneration(false)
			
			if getFFlagEnableMomentTextGeneration() and var56 ~= nil and p11 ~= var56.capture then
				local var57 = getActiveGeneration(false)
				
				if var57 ~= nil then
					var57.promise:cancel()
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
		setDescription = function(value) --[[ line: 313 ]]
			-- upvalues: store (ref)
			store.updateDescription(value)
		end,
		getAvailableTools = var28,
		getActiveTool = var29,
		getActiveSession = getActiveSession,
		getComposedEdits = var23,
		getEffectiveTTS = var30,
		beginTool = function(p12) --[[ line: 317 ]]
			-- upvalues: registry (ref), fFlagMomentsContentStatsTelemetry (copy), momentsCommonModule (copy), fireAnalyticsEventModule (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), var18 (write), createEditSessionModule (copy), store (ref), setActiveSession (write)
			local var58 = registry.get(p12)
			
			if var58 == nil then return end
			if fFlagMomentsContentStatsTelemetry then
				momentsCommonModule.Analytics.reportMomentsEditToolOpened(var58.kind)
			end
			if var58.cta.analyticsEvent ~= nil then
				fireAnalyticsEventModule(var58.cta.analyticsEvent, withCreationSession(makeCreationEventFieldsModule.makeToolField(var58)))
			end
			if var58.presentation == "InstantAction" then
				if var58.apply ~= nil then
					var58.apply(var18)
				end
				return
			else
				local _ = nil
				local createSession = var58.createSession
				local var59 = if createSession ~= nil then createEditSessionModule() else createSession()
				
				if var58.step == nil or store.navigate(var58.step) then
					var59.begin(store.getEditsMap(false)[p12])
					setActiveSession(var59)
					
					return
				end
			end
		end,
		commitActiveTool = function() --[[ line: 359 ]]
			-- upvalues: getActiveSession (write), var29 (ref), store (ref), creationFlowStateModule (copy), var18 (write), fireAnalyticsEventModule (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), setActiveSession (write)
			local var60 = getActiveSession(false)
			local var61 = var29(false)
			
			if var60 == nil or var61 == nil then
				store.navigate(creationFlowStateModule.Preview)
				
				return
			end
			local var62 = var60.commit()
			
			if var61.onCommit ~= nil and var61.onCommit(var62, var18) == false then return end
			store.setCommittedEdit(var61.kind, var62)
			
			if var61.cta.commitAnalyticsEvent ~= nil then
				fireAnalyticsEventModule(var61.cta.commitAnalyticsEvent, withCreationSession(makeCreationEventFieldsModule.makeToolField(var61)))
			end
			setActiveSession(nil)
			store.navigate(creationFlowStateModule.Preview)
		end,
		saveActiveTool = function() --[[ line: 388 ]]
			-- upvalues: getActiveSession (write), var29 (ref), store (ref)
			local var63 = getActiveSession(false)
			local var64 = var29(false)
			
			if var63 == nil or var64 == nil then
				return
			end
			store.setCommittedEdit(var64.kind, var63.commit())
		end,
		clearActiveTool = function() --[[ line: 403 ]]
			-- upvalues: getActiveSession (write), var29 (ref), ttsAudio (ref)
			local var65 = getActiveSession(false)
			local var66 = var29(false)
			
			if var66 == nil then return end
			if var65 ~= nil then
				var65.update(nil)
			end
			if var66.kind == "voice" and ttsAudio ~= nil then
				ttsAudio.reset()
			end
		end,
		discardActiveTool = function() --[[ line: 417 ]]
			-- upvalues: getActiveSession (write), var29 (ref), ttsAudio (ref), var23 (ref), fireAnalyticsEventModule (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), fFlagMomentsContentStatsTelemetry (copy), momentsCommonModule (copy), setActiveSession (write), store (ref), creationFlowStateModule (copy)
			local var67 = getActiveSession(false)
			local var68 = var29(false)
			
			if var67 ~= nil then
				var67.discard()
			end
			if var68 ~= nil and var68.kind == "voice" and ttsAudio ~= nil then
				local tts = var23(false).tts
				
				if tts == nil or tts.text == nil or tts.text == "" then
					ttsAudio.reset()
				else
					ttsAudio.generate(tts.text, tts.voiceId)
				end
			end
			if var68 ~= nil and var68.cta.cancelAnalyticsEvent ~= nil then
				fireAnalyticsEventModule(var68.cta.cancelAnalyticsEvent, withCreationSession(makeCreationEventFieldsModule.makeToolField(var68)))
			end
			if fFlagMomentsContentStatsTelemetry and var68 ~= nil then
				momentsCommonModule.Analytics.reportMomentsEditToolAbandoned(var68.kind)
			end
			setActiveSession(nil)
			store.navigate(creationFlowStateModule.Preview)
		end,
		updateCommittedEdit = function(p13, p14) --[[ line: 453 ]]
			-- upvalues: store (ref)
			store.setCommittedEdit(p13, p14)
		end,
		onDisabledToolActivated = function(p15) --[[ line: 653 ]]
			-- upvalues: getFFlagEnableMomentTextGeneration (copy), getIsGenerating (write), host (ref)
			if getFFlagEnableMomentTextGeneration() and p15 == "text" and (getIsGenerating(false) and host.onGenerateTextManualEditBlocked ~= nil) then
				host.onGenerateTextManualEditBlocked()
			end
		end,
		getActiveModal = var21,
		showModal = showModal,
		dismissModal = dismissModal,
		publish = function() --[[ line: 477 ]]
			-- upvalues: store (ref), host (ref), var22 (ref), dialogTypeModule (copy), dismissModal (ref), getFFlagMomentsAnalyticsProducerPrereqs (copy), sessionManager (copy), funnelEventNames (copy), preview (ref), var23 (ref), fireAnalyticsEventModule (copy), eventNames (copy), cryoModule (copy), makeCreationEventFieldsModule (copy), fFlagMomentsRealtimeSessionTelemetry (copy), momentsCommonModule (copy), fFlagMomentsContentStatsTelemetry (copy), dismiss (ref)
			local description = store.getDescription(false)
			
			if host.isTextFiltered ~= nil and host.isTextFiltered(description) then
				var22({
					modalType = dialogTypeModule.TextFiltered,
					modalProps = { onConfirm = dismissModal }
				})
				
				return
			end
			local var70 = if getFFlagMomentsAnalyticsProducerPrereqs() then sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow) else nil
			
			if host.createMoment ~= nil then
				host.createMoment(store.getSelectedCapture(false), var23(false), description, var70, preview.playback.getTimeLength(false))
			end
			fireAnalyticsEventModule(eventNames.MomentsEditingFlowPublished, cryoModule.Dictionary.join(makeCreationEventFieldsModule.makeStepField(eventNames.MomentsEditingFlowPublished), makeCreationEventFieldsModule.makeCreationBaseFields(var70)))
			
			if fFlagMomentsRealtimeSessionTelemetry then
				momentsCommonModule.Analytics.reportMomentsCreationStep("published")
			end
			if fFlagMomentsContentStatsTelemetry then
				local analytics = momentsCommonModule.Analytics
				local var71 = var23(false)
				local var72 = 0
				
				if var71.music ~= nil then
					var72 += 1
					analytics.reportMomentsPublishedWithEdit("music")
				end
				if var71.trim ~= nil then
					var72 += 1
					analytics.reportMomentsPublishedWithEdit("trim")
				end
				if var71.textOverlays ~= nil and #var71.textOverlays > 0 then
					var72 += 1
					analytics.reportMomentsPublishedWithEdit("text_overlay")
				end
				if var71.stickerOverlays ~= nil and #var71.stickerOverlays > 0 then
					var72 += 1
					analytics.reportMomentsPublishedWithEdit("sticker")
				end
				if description ~= nil and description ~= "" then
					var72 += 1
					analytics.reportMomentsPublishedWithEdit("description")
				end
				analytics.reportMomentsPublishedEditCount(var72)
				local selectedCapture = store.getSelectedCapture(false)
				
				if selectedCapture ~= nil then
					analytics.reportMomentsPublishedByCaptureType(if selectedCapture.CaptureType == Enum.CaptureType.Video then "video" elseif selectedCapture.CaptureType == Enum.CaptureType.Screenshot then "screenshot" else "unknown")
				end
			end
			dismiss()
		end,
		exit = function() --[[ line: 661 ]]
			-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), dismiss (ref)
			fireAnalyticsEventModule(eventNames.MomentsEditingFlowExited, withCreationSession(makeCreationEventFieldsModule.makeStepField(eventNames.MomentsEditingFlowExited)))
			dismiss()
		end,
		generateText = function() --[[ line: 559 ]]
			-- upvalues: getIsGenerating (write), host (ref), store (ref), getFFlagEnableMomentTextGeneration (copy), setIsGenerating (write), setActiveGeneration (write), fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (ref), fFlagMomentsContentStatsTelemetry (copy), momentsCommonModule (copy), makeDefaultTextOverlayEditModule (copy)
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
			local var76 = host.generateMomentText(selectedCapture)
			
			if var76 == nil then
				setIsGenerating(false)
				
				return
			elseif getFFlagEnableMomentTextGeneration() then
				setActiveGeneration({ promise = var76, capture = selectedCapture })
			end
			var76:andThen(function(p16) --[[ line: 586 ]]
				-- upvalues: getFFlagEnableMomentTextGeneration (copy), setActiveGeneration (copy), fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (copy), fFlagMomentsContentStatsTelemetry (copy), momentsCommonModule (copy), host (copy), setIsGenerating (copy), store (copy), makeDefaultTextOverlayEditModule (copy)
				if getFFlagEnableMomentTextGeneration() then
					setActiveGeneration(nil)
				end
				if p16 == nil or p16.error ~= nil then
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
					local var79
					local textOverlayEdits = store.getTextOverlayEdits(false)
					local var78 = if textOverlayEdits ~= nil then nil else textOverlayEdits[1]
					local _ = nil
					
					if getFFlagEnableMomentTextGeneration() and var78 ~= nil then
						var79 = table.clone(var78)
						var79.text = p16.summary
					else
						var79 = makeDefaultTextOverlayEditModule()
						var79.text = p16.summary
					end
					if textOverlayEdits == nil or #textOverlayEdits == 0 then
						store.updateTextOverlayEdits({ var79 })
					else
						local cloned = table.clone(textOverlayEdits)
						cloned[1] = var79
						store.updateTextOverlayEdits(cloned)
					end
				end
				if p16.description ~= nil and p16.description ~= "" then
					store.updateDescription(p16.description)
				end
				fireAnalyticsEventModule(eventNames.EditingFlowGenerateTextSucceeded, withCreationSession({}))
				
				if fFlagMomentsContentStatsTelemetry then
					momentsCommonModule.Analytics.reportMomentsGenerateText("succeeded")
				end
				if host.onGenerateTextSuccess ~= nil then
					host.onGenerateTextSuccess()
				end
				setIsGenerating(false)
			end):catch(function() --[[ line: 635 ]]
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
		ttsAudio = ttsAudio
	}
end