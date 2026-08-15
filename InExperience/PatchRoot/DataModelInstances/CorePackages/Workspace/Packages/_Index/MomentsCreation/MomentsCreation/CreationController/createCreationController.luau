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
local getFFlagMomentsAnalyticsProducerPrereqs = momentsCommonModule.Flags.GetFFlagMomentsAnalyticsProducerPrereqs
local fFlagMomentsRealtimeSessionTelemetry = momentsCommonModule.Flags.FFlagMomentsRealtimeSessionTelemetry
local fFlagMomentsContentStatsTelemetry = momentsCommonModule.Flags.FFlagMomentsContentStatsTelemetry
local createComputed = signalsModule.createComputed
local createSignal = signalsModule.createSignal

return function(p0) --[[ line: 67 | named "createCreationController" ]]
	-- upvalues: creationToolRegistryModule (ref), defaultCreationToolsModule (ref), getFFlagMomentsAnalyticsProducerPrereqs (ref), sessionManager (ref), funnelEventNames (ref), getFFlagMomentsCreationPersistEditSessionModule (ref), createSignal (ref), createComputed (ref), getFFlagMomentsTTSAudioOverlayModule (ref), createCapturePreviewControllerModule (ref), createTTSAudioManagerModule (ref), cryoModule (ref), makeCreationEventFieldsModule (ref), creationFlowStateModule (ref), fireAnalyticsEventModule (ref), eventNames (ref), fFlagMomentsRealtimeSessionTelemetry (ref), momentsCommonModule (ref), fFlagMomentsContentStatsTelemetry (ref), createEditSessionModule (ref), dialogTypeModule (ref), makeDefaultTextOverlayEditModule (ref)
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
		
		local setActiveSession = function(p1) --[[ line: 96 ]]
			-- upvalues: var21 (write)
			var21(p1)
		end
	end
	var21, var22 = createSignal(nil)
	local var23 = createComputed(function(p2) --[[ line: 105 ]]
		-- upvalues: store (ref), registry (ref)
		local t = {}
		
		for i, v in store.getEditsMap(p2) do
			if v ~= nil then
				local var35 = registry.get(i)
				
				if var35 == nil or var35.toEdits == nil then
					t[i] = v
				else
					for i_1, v_1 in var35.toEdits(v) do
						t[i_1] = v_1
					end
				end
			end
		end
		return t
	end)
	local var24, var25 = createSignal(false)
	local var26 = createComputed(function(p3) --[[ line: 127 ]]
		-- upvalues: store (ref), host (ref), var23 (ref), registry (ref)
		local selectedCapture = store.getSelectedCapture(p3)
		local var37 = if selectedCapture ~= nil then nil else selectedCapture.CaptureType
		local t = {
			canGenerateText = host.generateMomentText ~= nil,
			captureType = var37,
			getComposedEdits = var23
		}
		local t_1 = {}
		
		for i, v in registry.getAll() do
			if (if v.supportedCaptureTypes ~= nil then var37 ~= nil and table.find(v.supportedCaptureTypes, var37) ~= nil else true) and (v.isAvailable == nil or v.isAvailable(t)) then
				table.insert(t_1, v)
			end
		end
		return t_1
	end)
	local var27 = createComputed(function(p4) --[[ line: 149 ]]
		-- upvalues: store (ref), registry (ref)
		local step = store.getStep(p4)
		
		for i, v in registry.getAll() do
			if v.step == step then
				return v
			end
		end
		return nil
	end)
	local var28 = createComputed(function(p5) --[[ line: 194 ]]
		-- upvalues: getFFlagMomentsTTSAudioOverlayModule (copy), var27 (ref), getActiveSession (write), var23 (ref)
		if not getFFlagMomentsTTSAudioOverlayModule then
			return nil
		end
		local var41 = var27(p5)
		
		if var41 ~= nil and var41.kind == "voice" then
			local var42 = getActiveSession(p5)
			local var43 = if var42 ~= nil then nil else var42.getDraft(p5)
			
			return if var43 == nil or var43.text == nil or var43.text == "" then var23(p5).tts else var43
		end
	end)
	local preview = p0.preview or createCapturePreviewControllerModule(store, createComputed(function(p6) --[[ line: 163 ]]
		-- upvalues: var27 (ref), getActiveSession (write), var23 (ref)
		local var44 = var27(p6)
		
		if var44 ~= nil and var44.kind == "trim" then
			local var45 = getActiveSession(p6)
			local var46 = if var45 ~= nil then nil else var45.getDraft(p6)
			
			if var46 ~= nil and var46.startTime ~= nil and var46.endTime ~= nil then
				return { startTime = var46.startTime, endTime = var46.endTime }
			end
		end
		local trim = var23(p6).trim
		
		return if trim == nil or trim.startTime == nil or trim.endTime == nil then nil else { startTime = trim.startTime, endTime = trim.endTime }
	end), createComputed(function(p7) --[[ line: 182 ]]
		-- upvalues: var27 (ref), getActiveSession (write), var23 (ref)
		local var47 = var27(p7)
		
		if var47 ~= nil and var47.kind == "music" then
			local var48 = getActiveSession(p7)
			local var49 = if var48 ~= nil then nil else var48.getDraft(p7)
			
			return if var49 == nil or var49.assetId == nil then var23(p7).music else var49
		end
	end))
	local ttsAudio = p0.ttsAudio or (if getFFlagMomentsTTSAudioOverlayModule then createTTSAudioManagerModule() else nil)
	
	local function showModal(p8) --[[ line: 214 ]]
		-- upvalues: var22 (ref)
		var22(p8)
	end
	
	local function dismissModal() --[[ line: 218 ]]
		-- upvalues: var22 (ref)
		var22(nil)
	end
	
	local function withCreationSession(p9) --[[ line: 226 ]]
		-- upvalues: sessionManager (copy), funnelEventNames (copy), cryoModule (copy), makeCreationEventFieldsModule (copy)
		return cryoModule.Dictionary.join(p9, makeCreationEventFieldsModule.makeCreationBaseFields(sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow)))
	end
	
	local function _() --[[ line: 408 | named "dismiss" ]]
		-- upvalues: var22 (ref), p0 (ref), creationFlowStateModule (copy), store (ref), host (ref)
		var22(nil)
		store.clearEdits(if p0.excludeGallery then creationFlowStateModule.Preview else creationFlowStateModule.Gallery)
		
		if host.exitCreationFlow ~= nil then
			host.exitCreationFlow()
		end
	end
	
	return {
		getStep = store.getStep,
		navigate = function(p10) --[[ line: 231 ]]
			-- upvalues: store (ref)
			store.navigate(p10)
		end,
		returnToGallery = function() --[[ line: 236 ]]
			-- upvalues: store (ref), creationFlowStateModule (copy), setActiveSession (write), ttsAudio (ref)
			store.clearEdits(creationFlowStateModule.Gallery)
			setActiveSession(nil)
			
			if ttsAudio ~= nil then
				ttsAudio.reset()
			end
		end,
		getSelectedCapture = store.getSelectedCapture,
		selectCapture = function(p11) --[[ line: 248 ]]
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
		setDescription = function(value) --[[ line: 264 ]]
			-- upvalues: store (ref)
			store.updateDescription(value)
		end,
		getAvailableTools = var26,
		getActiveTool = var27,
		getActiveSession = getActiveSession,
		getComposedEdits = var23,
		getEffectiveTTS = var28,
		beginTool = function(p12) --[[ line: 268 ]]
			-- upvalues: registry (ref), fFlagMomentsContentStatsTelemetry (copy), momentsCommonModule (copy), fireAnalyticsEventModule (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), var18 (write), createEditSessionModule (copy), store (ref), setActiveSession (write)
			local var50 = registry.get(p12)
			
			if var50 == nil then return end
			if fFlagMomentsContentStatsTelemetry then
				momentsCommonModule.Analytics.reportMomentsEditToolOpened(var50.kind)
			end
			if var50.cta.analyticsEvent ~= nil then
				fireAnalyticsEventModule(var50.cta.analyticsEvent, withCreationSession(makeCreationEventFieldsModule.makeToolField(var50)))
			end
			if var50.presentation == "InstantAction" then
				if var50.apply ~= nil then
					var50.apply(var18)
				end
				return
			else
				local _ = nil
				local createSession = var50.createSession
				local var51 = if createSession ~= nil then createEditSessionModule() else createSession()
				
				if var50.step == nil or store.navigate(var50.step) then
					var51.begin(store.getEditsMap(false)[p12])
					setActiveSession(var51)
					
					return
				end
			end
		end,
		commitActiveTool = function() --[[ line: 310 ]]
			-- upvalues: getActiveSession (write), var27 (ref), store (ref), creationFlowStateModule (copy), var18 (write), fireAnalyticsEventModule (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), setActiveSession (write)
			local var52 = getActiveSession(false)
			local var53 = var27(false)
			
			if var52 == nil or var53 == nil then
				store.navigate(creationFlowStateModule.Preview)
				
				return
			end
			local var54 = var52.commit()
			
			if var53.onCommit ~= nil and var53.onCommit(var54, var18) == false then return end
			store.setCommittedEdit(var53.kind, var54)
			
			if var53.cta.commitAnalyticsEvent ~= nil then
				fireAnalyticsEventModule(var53.cta.commitAnalyticsEvent, withCreationSession(makeCreationEventFieldsModule.makeToolField(var53)))
			end
			setActiveSession(nil)
			store.navigate(creationFlowStateModule.Preview)
		end,
		saveActiveTool = function() --[[ line: 339 ]]
			-- upvalues: getActiveSession (write), var27 (ref), store (ref)
			local var55 = getActiveSession(false)
			local var56 = var27(false)
			
			if var55 == nil or var56 == nil then
				return
			end
			store.setCommittedEdit(var56.kind, var55.commit())
		end,
		clearActiveTool = function() --[[ line: 354 ]]
			-- upvalues: getActiveSession (write), var27 (ref), ttsAudio (ref)
			local var57 = getActiveSession(false)
			local var58 = var27(false)
			
			if var58 == nil then return end
			if var57 ~= nil then
				var57.update(nil)
			end
			if var58.kind == "voice" and ttsAudio ~= nil then
				ttsAudio.reset()
			end
		end,
		discardActiveTool = function() --[[ line: 368 ]]
			-- upvalues: getActiveSession (write), var27 (ref), ttsAudio (ref), var23 (ref), fireAnalyticsEventModule (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), fFlagMomentsContentStatsTelemetry (copy), momentsCommonModule (copy), setActiveSession (write), store (ref), creationFlowStateModule (copy)
			local var59 = getActiveSession(false)
			local var60 = var27(false)
			
			if var59 ~= nil then
				var59.discard()
			end
			if var60 ~= nil and var60.kind == "voice" and ttsAudio ~= nil then
				local tts = var23(false).tts
				
				if tts == nil or tts.text == nil or tts.text == "" then
					ttsAudio.reset()
				else
					ttsAudio.generate(tts.text, tts.voiceId)
				end
			end
			if var60 ~= nil and var60.cta.cancelAnalyticsEvent ~= nil then
				fireAnalyticsEventModule(var60.cta.cancelAnalyticsEvent, withCreationSession(makeCreationEventFieldsModule.makeToolField(var60)))
			end
			if fFlagMomentsContentStatsTelemetry and var60 ~= nil then
				momentsCommonModule.Analytics.reportMomentsEditToolAbandoned(var60.kind)
			end
			setActiveSession(nil)
			store.navigate(creationFlowStateModule.Preview)
		end,
		updateCommittedEdit = function(p13, p14) --[[ line: 404 ]]
			-- upvalues: store (ref)
			store.setCommittedEdit(p13, p14)
		end,
		getActiveModal = var21,
		showModal = showModal,
		dismissModal = dismissModal,
		publish = function() --[[ line: 417 ]]
			-- upvalues: store (ref), host (ref), var22 (ref), dialogTypeModule (copy), dismissModal (ref), getFFlagMomentsAnalyticsProducerPrereqs (copy), sessionManager (copy), funnelEventNames (copy), preview (ref), var23 (ref), fireAnalyticsEventModule (copy), eventNames (copy), cryoModule (copy), makeCreationEventFieldsModule (copy), fFlagMomentsRealtimeSessionTelemetry (copy), momentsCommonModule (copy), fFlagMomentsContentStatsTelemetry (copy), p0 (ref), creationFlowStateModule (copy)
			local description = store.getDescription(false)
			
			if host.isTextFiltered ~= nil and host.isTextFiltered(description) then
				var22({
					modalType = dialogTypeModule.TextFiltered,
					modalProps = { onConfirm = dismissModal }
				})
				
				return
			end
			local var62 = if getFFlagMomentsAnalyticsProducerPrereqs() then sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow) else nil
			
			if host.createMoment ~= nil then
				host.createMoment(store.getSelectedCapture(false), var23(false), description, var62, preview.playback.getTimeLength(false))
			end
			fireAnalyticsEventModule(eventNames.MomentsEditingFlowPublished, cryoModule.Dictionary.join(makeCreationEventFieldsModule.makeStepField(eventNames.MomentsEditingFlowPublished), makeCreationEventFieldsModule.makeCreationBaseFields(var62)))
			
			if fFlagMomentsRealtimeSessionTelemetry then
				momentsCommonModule.Analytics.reportMomentsCreationStep("published")
			end
			if fFlagMomentsContentStatsTelemetry then
				local analytics = momentsCommonModule.Analytics
				local var63 = var23(false)
				local var64 = 0
				
				if var63.music ~= nil then
					var64 += 1
					analytics.reportMomentsPublishedWithEdit("music")
				end
				if var63.trim ~= nil then
					var64 += 1
					analytics.reportMomentsPublishedWithEdit("trim")
				end
				if var63.textOverlays ~= nil and #var63.textOverlays > 0 then
					var64 += 1
					analytics.reportMomentsPublishedWithEdit("text_overlay")
				end
				if var63.stickerOverlays ~= nil and #var63.stickerOverlays > 0 then
					var64 += 1
					analytics.reportMomentsPublishedWithEdit("sticker")
				end
				if description ~= nil and description ~= "" then
					var64 += 1
					analytics.reportMomentsPublishedWithEdit("description")
				end
				analytics.reportMomentsPublishedEditCount(var64)
				local selectedCapture = store.getSelectedCapture(false)
				
				if selectedCapture ~= nil then
					analytics.reportMomentsPublishedByCaptureType(if selectedCapture.CaptureType == Enum.CaptureType.Video then "video" elseif selectedCapture.CaptureType == Enum.CaptureType.Screenshot then "screenshot" else "unknown")
				end
			end
			var22(nil)
			store.clearEdits(if p0.excludeGallery then creationFlowStateModule.Preview else creationFlowStateModule.Gallery)
			
			if host.exitCreationFlow ~= nil then
				host.exitCreationFlow()
			end
		end,
		exit = function() --[[ line: 565 ]]
			-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), var22 (ref), p0 (ref), creationFlowStateModule (copy), store (ref), host (ref)
			fireAnalyticsEventModule(eventNames.MomentsEditingFlowExited, withCreationSession(makeCreationEventFieldsModule.makeStepField(eventNames.MomentsEditingFlowExited)))
			var22(nil)
			store.clearEdits(if p0.excludeGallery then creationFlowStateModule.Preview else creationFlowStateModule.Gallery)
			
			if host.exitCreationFlow ~= nil then
				host.exitCreationFlow()
			end
		end,
		generateText = function() --[[ line: 499 ]]
			-- upvalues: var24 (ref), host (ref), store (ref), var25 (ref), fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (ref), fFlagMomentsContentStatsTelemetry (copy), momentsCommonModule (copy), makeDefaultTextOverlayEditModule (copy)
			if var24(false) then return end
			if host.generateMomentText == nil then return end
			local selectedCapture = store.getSelectedCapture(false)
			
			if selectedCapture == nil then return end
			var25(true)
			local var67 = host.generateMomentText(selectedCapture)
			
			if var67 == nil then
				var25(false)
				
				return
			end
			var67:andThen(function(p15) --[[ line: 517 ]]
				-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (copy), fFlagMomentsContentStatsTelemetry (copy), momentsCommonModule (copy), host (copy), var25 (copy), makeDefaultTextOverlayEditModule (copy), store (copy)
				if p15 == nil or p15.error ~= nil then
					fireAnalyticsEventModule(eventNames.EditingFlowGenerateTextFailed, withCreationSession({}))
					
					if fFlagMomentsContentStatsTelemetry then
						momentsCommonModule.Analytics.reportMomentsGenerateText("failed")
					end
					if host.onGenerateTextFailure ~= nil then
						host.onGenerateTextFailure()
					end
					var25(false)
					
					return
				elseif p15.summary ~= nil and p15.summary ~= "" then
					local var68 = makeDefaultTextOverlayEditModule()
					var68.text = p15.summary
					local textOverlayEdits = store.getTextOverlayEdits(false)
					
					if textOverlayEdits == nil or #textOverlayEdits == 0 then
						store.updateTextOverlayEdits({ var68 })
					else
						local cloned = table.clone(textOverlayEdits)
						cloned[1] = var68
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
				var25(false)
			end):catch(function() --[[ line: 553 ]]
				-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (copy), fFlagMomentsContentStatsTelemetry (copy), momentsCommonModule (copy), host (copy), var25 (copy)
				fireAnalyticsEventModule(eventNames.EditingFlowGenerateTextFailed, withCreationSession({}))
				
				if fFlagMomentsContentStatsTelemetry then
					momentsCommonModule.Analytics.reportMomentsGenerateText("failed")
				end
				if host.onGenerateTextFailure ~= nil then
					host.onGenerateTextFailure()
				end
				var25(false)
			end)
		end,
		getIsGenerating = var24,
		preview = preview,
		ttsAudio = ttsAudio
	}
end