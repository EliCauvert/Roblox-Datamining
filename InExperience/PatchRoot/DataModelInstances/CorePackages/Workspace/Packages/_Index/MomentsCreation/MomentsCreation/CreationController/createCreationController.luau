local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local CryoModule = require(Parent.Cryo)
local SignalsModule = require(Parent.Signals)
local CreationFlowStateModule = require(MomentsCreation.Enums.CreationFlowState)
local DialogTypeModule = require(MomentsCreation.Enums.DialogType)
local MomentTypeModule = require(MomentsCreation.Enums.MomentType)
local _ = require(MomentsCreation.Types.CreationFlowTypes)
local _ = require(Parent.MomentsTypes)
local CreationToolRegistryModule = require(MomentsCreation.Tools.creationToolRegistry)
local DefaultCreationToolsModule = require(MomentsCreation.Tools.defaultCreationTools)
local CreateCapturePreviewControllerModule = require(MomentsCreation.Preview.createCapturePreviewController)
local CreateTTSAudioManagerModule = require(MomentsCreation.Audio.createTTSAudioManager)
local CreateEditSessionModule = require(MomentsCreation.Stores.createEditSession)
local FireAnalyticsEventModule = require(MomentsCreation.Analytics.fireAnalyticsEvent)
local MakeDefaultTextOverlayEditModule = require(MomentsCreation.Utils.makeDefaultTextOverlayEdit)
local ClampTtsStartTimeModule = require(MomentsCreation.Utils.clampTtsStartTime)
local IsAvatarMomentModule = require(MomentsCreation.Utils.isAvatarMoment)
local FFlagMomentsCommentsCreatorControlModule = require(MomentsCreation.Flags.FFlagMomentsCommentsCreatorControl)
local GetFFlagMomentsTTSAudioOverlayModule = require(MomentsCreation.Flags.GetFFlagMomentsTTSAudioOverlay)
local GetFFlagMomentsTTSStartTimePositioningModule = require(MomentsCreation.Flags.GetFFlagMomentsTTSStartTimePositioning)
local FFlagMomentsTTSVoiceSelectorModule = require(MomentsCreation.Flags.FFlagMomentsTTSVoiceSelector)
local FFlagMomentsTTSPublishMetadataEditsModule = require(MomentsCreation.Flags.FFlagMomentsTTSPublishMetadataEdits)
local FFlagMomentsTTSDraftRestoreModule = require(MomentsCreation.Flags.FFlagMomentsTTSDraftRestore)
local GetFFlagMomentsGenerateTextInTextOverlayModule = require(MomentsCreation.Flags.GetFFlagMomentsGenerateTextInTextOverlay)
local FFlagMomentsTextOverlayOnPhotosModule = require(MomentsCreation.Flags.FFlagMomentsTextOverlayOnPhotos)
local FFlagMomentsCreateAvatarPosts = require(Parent.SharedFlags).FFlagMomentsCreateAvatarPosts
local FFlagMomentsRenderCreatePostStatus = require(Parent.SharedFlags).FFlagMomentsRenderCreatePostStatus
local MomentsDraftStorageModule = require(MomentsCreation.Storage.MomentsDraftStorage)
local MakeCreationEventFieldsModule = require(MomentsCreation.Analytics.makeCreationEventFields)
local MomentsCommonModule = require(Parent.MomentsCommon)
local EventNames = MomentsCommonModule.Analytics.EventNames
local SessionManager = MomentsCommonModule.Analytics.SessionManager
local FunnelEventNames = MomentsCommonModule.Analytics.FunnelEventNames
local GetFFlagEnableMomentTextGenerationFunction = MomentsCommonModule.Flags.GetFFlagEnableMomentTextGeneration
local GetFFlagMomentsCreationSaveDraftFunction = MomentsCommonModule.Flags.GetFFlagMomentsCreationSaveDraft
local FFlagMomentTextGenerationFilteredSignal = MomentsCommonModule.Flags.FFlagMomentTextGenerationFilteredSignal
local FFlagMomentsTextOverlayV2Redesign = MomentsCommonModule.Flags.FFlagMomentsTextOverlayV2Redesign
local CreateComputedFunction = SignalsModule.createComputed
local CreateSignalFunction = SignalsModule.createSignal

return function(p1)
	-- upvalues: DefaultCreationToolsModule (copy), CreationToolRegistryModule (copy), SessionManager (copy), FunnelEventNames (copy), FFlagMomentsCreateAvatarPosts (copy), CreationFlowStateModule (copy), CreateSignalFunction (copy), FFlagMomentsRenderCreatePostStatus (copy), CreateComputedFunction (copy), GetFFlagEnableMomentTextGenerationFunction (copy), IsAvatarMomentModule (copy), MomentTypeModule (copy), GetFFlagMomentsTTSAudioOverlayModule (copy), CreateCapturePreviewControllerModule (copy), CreateTTSAudioManagerModule (copy), CryoModule (copy), MakeCreationEventFieldsModule (copy), GetFFlagMomentsCreationSaveDraftFunction (copy), MomentsDraftStorageModule (copy), FireAnalyticsEventModule (copy), EventNames (copy), MomentsCommonModule (copy), CreateEditSessionModule (copy), GetFFlagMomentsTTSStartTimePositioningModule (copy), ClampTtsStartTimeModule (copy), FFlagMomentTextGenerationFilteredSignal (copy), Parent (copy), DialogTypeModule (copy), FFlagMomentsTTSDraftRestoreModule (copy), FFlagMomentsCommentsCreatorControlModule (copy), FFlagMomentsTTSPublishMetadataEditsModule (copy), FFlagMomentsTTSVoiceSelectorModule (copy), FFlagMomentsTextOverlayV2Redesign (copy), FFlagMomentsTextOverlayOnPhotosModule (copy), MakeDefaultTextOverlayEditModule (copy), GetFFlagMomentsGenerateTextInTextOverlayModule (copy)
	local Store = p1.store
	local Host = p1.host or {}
	local List = DefaultCreationToolsModule
	
	if Host.toolKinds ~= nil then
		local t = {}
		
		for _, toolKind in Host.toolKinds do
			t[toolKind] = true
		end
		List = {}
		
		for _, value in DefaultCreationToolsModule do
			if t[value.kind] then
				table.insert(List, value)
			end
		end
	end
	local Registry = p1.registry or CreationToolRegistryModule(List)
	
	if SessionManager.getSessionId(FunnelEventNames.FunnelTypes.CreationFlow) == nil then
		SessionManager.startSession(FunnelEventNames.FunnelTypes.CreationFlow)
	end
	if FFlagMomentsCreateAvatarPosts and p1.initialAvatarMoment ~= nil and Store.getSelectedCapture(false) ~= p1.initialAvatarMoment then
		Store.clearEdits(CreationFlowStateModule.Preview)
		Store.onSelectedCaptureUpdated(p1.initialAvatarMoment)
	end
	local v1 = nil
	local GetActiveSessionFunction = nil
	local SetActiveSessionFunction = nil
	GetActiveSessionFunction = Store.getActiveSession
	SetActiveSessionFunction = Store.setActiveSession
	local Signal, Signal2 = CreateSignalFunction(nil)
	local Callback1 = nil
	local Callback = nil
	
	if FFlagMomentsRenderCreatePostStatus then
		Callback1, Callback = CreateSignalFunction(false)
	end
	local Computed = CreateComputedFunction(function(p2)
		-- upvalues: Store (copy), Registry (copy)
		local t = {}
		
		for i, value in Store.getEditsMap(p2) do
			if value ~= nil then
				local GetResult = Registry.get(i)
				
				if GetResult == nil or GetResult.toEdits == nil then
					t[i] = value
				else
					for i1, value1 in GetResult.toEdits(value) do
						t[i1] = value1
					end
				end
			end
		end
		return t
	end)
	local GetIsGeneratingFunction = nil
	local SetIsGeneratingFunction = nil
	
	if GetFFlagEnableMomentTextGenerationFunction() then
		GetIsGeneratingFunction = Store.getIsGenerating
		SetIsGeneratingFunction = Store.setIsGenerating
	else
		GetIsGeneratingFunction, SetIsGeneratingFunction = CreateSignalFunction(false)
	end
	local GetActiveGenerationFunction = nil
	local SetActiveGenerationFunction = nil
	
	if GetFFlagEnableMomentTextGenerationFunction() then
		GetActiveGenerationFunction = Store.getActiveGeneration
		SetActiveGenerationFunction = Store.setActiveGeneration
	else
		GetActiveGenerationFunction, SetActiveGenerationFunction = CreateSignalFunction(nil)
	end
	local function _()
		-- upvalues: GetActiveGenerationFunction (ref), SetActiveGenerationFunction (ref), SetIsGeneratingFunction (ref)
		local ActiveGeneration = GetActiveGenerationFunction(false)
		
		if ActiveGeneration ~= nil then
			ActiveGeneration.promise:cancel()
			SetActiveGenerationFunction(nil)
			SetIsGeneratingFunction(false)
			
			return
		end
	end
	
	local Signal1, Signal2_1 = CreateSignalFunction(false)
	local Signal3, Signal2_2 = CreateSignalFunction(nil)
	local Computed1 = CreateComputedFunction(function(p3)
		-- upvalues: Store (copy), FFlagMomentsCreateAvatarPosts (upval), IsAvatarMomentModule (upval), MomentTypeModule (upval), Host (copy), Computed (copy), Registry (copy)
		local SelectedCapture = Store.getSelectedCapture(p3)
		local CaptureType = if SelectedCapture == nil then nil else SelectedCapture.CaptureType
		local Avatar = if FFlagMomentsCreateAvatarPosts and IsAvatarMomentModule(SelectedCapture) then MomentTypeModule.Avatar else nil
		local config = {
			canGenerateText = Host.generateMomentText ~= nil,
			captureType = CaptureType,
			momentType = Avatar,
			getComposedEdits = Computed
		}
		local List = {}
		
		for _, value in Registry.getAll() do
			if (if FFlagMomentsCreateAvatarPosts and Avatar ~= nil then value.supportedMomentTypes ~= nil and table.find(value.supportedMomentTypes, Avatar) ~= nil else value.supportedCaptureTypes == nil or CaptureType ~= nil and table.find(value.supportedCaptureTypes, CaptureType) ~= nil) and (value.isAvailable == nil or value.isAvailable(config)) then
				table.insert(List, value)
			end
		end
		return List
	end)
	local Computed2 = CreateComputedFunction(function(p4)
		-- upvalues: Store (copy), Registry (copy)
		local Step = Store.getStep(p4)
		
		for _, value in Registry.getAll() do
			if value.step == Step then
				return value
			end
		end
		return nil
	end)
	local Computed3 = CreateComputedFunction(function(p5)
		-- upvalues: Computed2 (copy), GetActiveSessionFunction (ref), Computed (copy)
		local ComputedResult = Computed2(p5)
		
		if ComputedResult ~= nil and ComputedResult.kind == "trim" then
			local ActiveSession = GetActiveSessionFunction(p5)
			local Draft = if ActiveSession == nil then nil else ActiveSession.getDraft(p5)
			
			if Draft ~= nil and Draft.startTime ~= nil and Draft.endTime ~= nil then
				return { startTime = Draft.startTime, endTime = Draft.endTime }
			end
		end
		local Trim = Computed(p5).trim
		
		return if Trim == nil or Trim.startTime == nil or Trim.endTime == nil then nil else { startTime = Trim.startTime, endTime = Trim.endTime }
	end)
	local Computed4 = CreateComputedFunction(function(p5)
		-- upvalues: Computed2 (copy), GetActiveSessionFunction (ref), Computed (copy)
		local ComputedResult = Computed2(p5)
		
		if ComputedResult ~= nil and ComputedResult.kind == "music" then
			local ActiveSession = GetActiveSessionFunction(p5)
			local Draft = if ActiveSession == nil then nil else ActiveSession.getDraft(p5)
			
			if Draft ~= nil and Draft.assetId ~= nil then
				return Draft
			end
		end
		return Computed(p5).music
	end)
	local Computed5 = CreateComputedFunction(function(p5)
		-- upvalues: GetFFlagMomentsTTSAudioOverlayModule (upval), Computed2 (copy), GetActiveSessionFunction (ref), Computed (copy)
		if not GetFFlagMomentsTTSAudioOverlayModule then
			return nil
		end
		local ComputedResult = Computed2(p5)
		
		if ComputedResult ~= nil and ComputedResult.kind == "voice" then
			local ActiveSession = GetActiveSessionFunction(p5)
			local Draft = if ActiveSession == nil then nil else ActiveSession.getDraft(p5)
			
			if Draft ~= nil and Draft.text ~= nil and Draft.text ~= "" then
				return Draft
			end
		end
		return Computed(p5).tts
	end)
	local Preview = p1.preview or CreateCapturePreviewControllerModule(Store, Computed3, Computed4)
	local NoToolKinds: boolean = Host.toolKinds == nil or table.find(Host.toolKinds, "voice") ~= nil
	local TtsAudio = nil
	
	if p1.ttsAudio == nil then
		if GetFFlagMomentsTTSAudioOverlayModule and NoToolKinds then
			TtsAudio = Store.getTTSAudio(false)
			
			if TtsAudio == nil then
				TtsAudio = CreateTTSAudioManagerModule(nil, Host.ttsAudioParent)
				Store.setTTSAudio(TtsAudio)
			end
		end
	else
		TtsAudio = p1.ttsAudio
	end
	local function dismissModal()
		-- upvalues: Signal2 (copy)
		Signal2(nil)
	end
	
	local function withCreationSession(ToolField)
		-- upvalues: SessionManager (upval), FunnelEventNames (upval), CryoModule (upval), MakeCreationEventFieldsModule (upval)
		return CryoModule.Dictionary.join(ToolField, MakeCreationEventFieldsModule.makeCreationBaseFields((SessionManager.getSessionId(FunnelEventNames.FunnelTypes.CreationFlow))))
	end
	
	local function dismiss()
		-- upvalues: FFlagMomentsCreateAvatarPosts (upval), Store (copy), IsAvatarMomentModule (upval), GetFFlagEnableMomentTextGenerationFunction (upval), GetActiveGenerationFunction (ref), SetActiveGenerationFunction (ref), SetIsGeneratingFunction (ref), Host (copy), Signal2 (copy), p1 (copy), CreationFlowStateModule (upval), TtsAudio (ref), GetFFlagMomentsCreationSaveDraftFunction (upval), MomentsDraftStorageModule (upval)
		local SelectedCapture = if FFlagMomentsCreateAvatarPosts then Store.getSelectedCapture(false) else nil
		local IsAvatarMomentModule1 = FFlagMomentsCreateAvatarPosts and IsAvatarMomentModule(SelectedCapture)
		
		if GetFFlagEnableMomentTextGenerationFunction() then
			local ActiveGeneration = GetActiveGenerationFunction(false)
			
			if ActiveGeneration ~= nil then
				ActiveGeneration.promise:cancel()
				SetActiveGenerationFunction(nil)
				SetIsGeneratingFunction(false)
			end
			if Host.dismissGenerationToasts ~= nil then
				Host.dismissGenerationToasts()
			end
		end
		Signal2(nil)
		Store.clearEdits(if p1.excludeGallery then CreationFlowStateModule.Preview else CreationFlowStateModule.Gallery)
		
		if TtsAudio ~= nil then
			TtsAudio.destroy()
			Store.setTTSAudio(nil)
		end
		if GetFFlagMomentsCreationSaveDraftFunction() and not Host.disableDrafts and not IsAvatarMomentModule1 then
			MomentsDraftStorageModule.clear()
		end
		if Host.exitCreationFlow ~= nil then
			Host.exitCreationFlow()
		end
	end
	
	local function emitGeneratedTextFeedback(GeneratedTextFeedback)
		-- upvalues: FFlagMomentTextGenerationFilteredSignal (upval), Host (copy), Store (copy)
		if not FFlagMomentTextGenerationFilteredSignal or Host.momentGeneratedTextFeedback == nil then return end
		local GenerationToken = Store.getGenerationToken(false)
		
		if GenerationToken ~= nil and GenerationToken ~= "" then
			Host.momentGeneratedTextFeedback(GenerationToken, GeneratedTextFeedback):catch(function() end)
			
			return
		end
	end
	
	local v2 = 0
	
	local _ = function(): boolean
		-- upvalues: Host (copy), p1 (copy), v2 (ref)
		if Host.publishDebounceSeconds == nil then
			return true
		end
		local ClockTime = if p1.clock == nil then os.clock() else p1.clock()
		
		if ClockTime - v2 < Host.publishDebounceSeconds then
			return false
		else
			v2 = ClockTime
			
			return true
		end
	end
	
	local function settlePublishResult(Promise)
		-- upvalues: Parent (upval), FFlagMomentsRenderCreatePostStatus (upval), Callback (ref), Host (copy), dismiss (copy)
		local PromiseModule = require(Parent.Promise)
		
		if FFlagMomentsRenderCreatePostStatus and PromiseModule.is(Promise) then
			Callback(true)
			
			local function _(p5)
				-- upvalues: Callback (upval), Host (upval), dismiss (upval)
				Callback(false)
				
				if Host.onPublishFinished ~= nil then
					Host.onPublishFinished(p5)
				end
				if p5 then
					dismiss()
				end
			end
			
			Promise:andThen(function(Enabled)
				-- upvalues: Callback (upval), Host (upval), dismiss (upval)
				local IsEnabled = Enabled == true
				Callback(false)
				
				if Host.onPublishFinished ~= nil then
					Host.onPublishFinished(IsEnabled)
				end
				if IsEnabled then
					dismiss()
				end
			end, function()
				-- upvalues: Callback (upval), Host (upval)
				Callback(false)
				
				if Host.onPublishFinished ~= nil then
					Host.onPublishFinished(false)
				end
			end)
			
			return
		else
			dismiss()
		end
	end
	
	v1 = {
		getStep = Store.getStep,
		navigate = function(Preview)
			-- upvalues: Store (copy)
			Store.navigate(Preview)
		end,
		returnToGallery = function()
			-- upvalues: GetFFlagEnableMomentTextGenerationFunction (upval), GetActiveGenerationFunction (ref), SetActiveGenerationFunction (ref), SetIsGeneratingFunction (ref), Store (copy), CreationFlowStateModule (upval), SetActiveSessionFunction (ref), TtsAudio (ref), GetFFlagMomentsCreationSaveDraftFunction (upval), Host (copy), MomentsDraftStorageModule (upval), FireAnalyticsEventModule (upval), EventNames (upval), withCreationSession (copy)
			if GetFFlagEnableMomentTextGenerationFunction() then
				local ActiveGeneration = GetActiveGenerationFunction(false)
				
				if ActiveGeneration ~= nil then
					ActiveGeneration.promise:cancel()
					SetActiveGenerationFunction(nil)
					SetIsGeneratingFunction(false)
				end
			end
			Store.clearEdits(CreationFlowStateModule.Gallery)
			SetActiveSessionFunction(nil)
			
			if TtsAudio ~= nil then
				TtsAudio.reset()
			end
			if GetFFlagMomentsCreationSaveDraftFunction() then
				if not Host.disableDrafts then
					MomentsDraftStorageModule.clear()
				end
				FireAnalyticsEventModule(EventNames.MomentsReturnToGallery, withCreationSession({}))
			end
		end,
		getSelectedCapture = Store.getSelectedCapture,
		selectCapture = function(Capture)
			-- upvalues: GetActiveGenerationFunction (ref), GetFFlagEnableMomentTextGenerationFunction (upval), SetActiveGenerationFunction (ref), SetIsGeneratingFunction (ref), Store (copy), FireAnalyticsEventModule (upval), EventNames (upval), withCreationSession (copy), MakeCreationEventFieldsModule (upval), MomentsCommonModule (upval)
			local ActiveGeneration = GetActiveGenerationFunction(false)
			
			if GetFFlagEnableMomentTextGenerationFunction() and ActiveGeneration ~= nil and Capture ~= ActiveGeneration.capture then
				local ActiveGeneration1 = GetActiveGenerationFunction(false)
				
				if ActiveGeneration1 ~= nil then
					ActiveGeneration1.promise:cancel()
					SetActiveGenerationFunction(nil)
					SetIsGeneratingFunction(false)
				end
			end
			Store.onSelectedCaptureUpdated(Capture)
			
			if Capture ~= nil then
				FireAnalyticsEventModule(EventNames.EditingFlowGalleryItemSelected, withCreationSession(MakeCreationEventFieldsModule.makeToolFieldFromKind("gallery")))
				MomentsCommonModule.Analytics.reportMomentsCreationStep("gallery_selected")
			end
		end,
		getDescription = Store.getDescription,
		setDescription = function(p5)
			-- upvalues: Store (copy)
			Store.updateDescription(p5)
		end,
		getAvailableTools = Computed1,
		getActiveTool = Computed2,
		getActiveSession = GetActiveSessionFunction,
		getComposedEdits = Computed,
		getEffectiveTTS = Computed5,
		beginTool = function(p5)
			-- upvalues: Registry (copy), MomentsCommonModule (upval), FireAnalyticsEventModule (upval), withCreationSession (copy), MakeCreationEventFieldsModule (upval), v1 (ref), CreateEditSessionModule (upval), Store (copy), SetActiveSessionFunction (ref)
			local GetResult = Registry.get(p5)
			
			if GetResult == nil then return end
			MomentsCommonModule.Analytics.reportMomentsEditToolOpened(GetResult.kind)
			
			if GetResult.cta.analyticsEvent ~= nil then
				FireAnalyticsEventModule(GetResult.cta.analyticsEvent, withCreationSession(MakeCreationEventFieldsModule.makeToolField(GetResult)))
			end
			if GetResult.presentation ~= "InstantAction" then
				local CreateSessionFunction = GetResult.createSession
				local EditSessionModule = if CreateSessionFunction == nil then CreateEditSessionModule() else CreateSessionFunction()
				
				if GetResult.step == nil or Store.navigate(GetResult.step) then
					EditSessionModule.begin(Store.getEditsMap(false)[p5])
					SetActiveSessionFunction(EditSessionModule)
					
					return
				end
				return
			elseif GetResult.apply ~= nil then
				GetResult.apply(v1)
			end
		end,
		commitActiveTool = function()
			-- upvalues: GetActiveSessionFunction (ref), Computed2 (copy), Store (copy), CreationFlowStateModule (upval), v1 (ref), GetFFlagMomentsTTSStartTimePositioningModule (upval), Computed (copy), ClampTtsStartTimeModule (upval), FireAnalyticsEventModule (upval), withCreationSession (copy), MakeCreationEventFieldsModule (upval), SetActiveSessionFunction (ref)
			local ActiveSession = GetActiveSessionFunction(false)
			local ComputedResult = Computed2(false)
			
			if ActiveSession == nil or ComputedResult == nil then
				Store.navigate(CreationFlowStateModule.Preview)
				
				return
			end
			local CommitResult = ActiveSession.commit()
			
			if ComputedResult.onCommit ~= nil and ComputedResult.onCommit(CommitResult, v1) == false then return end
			Store.setCommittedEdit(ComputedResult.kind, CommitResult)
			
			if GetFFlagMomentsTTSStartTimePositioningModule and ComputedResult.kind == "trim" and CommitResult ~= nil and CommitResult.startTime ~= nil and CommitResult.endTime ~= nil then
				local EndTimeDelta = CommitResult.endTime - CommitResult.startTime
				local Tts = Computed(false).tts
				
				if Tts ~= nil and Tts.startTime ~= nil and EndTimeDelta > 0 then
					local ClampTtsStartTimeModuleResult = ClampTtsStartTimeModule(Tts.startTime, EndTimeDelta)
					
					if ClampTtsStartTimeModuleResult ~= Tts.startTime then
						local Copy = table.clone(Tts)
						Copy.startTime = ClampTtsStartTimeModuleResult
						Store.setCommittedEdit("voice", Copy)
					end
				end
			end
			local NoToEdits: boolean = ComputedResult.toEdits == nil or next(ComputedResult.toEdits(CommitResult)) ~= nil
			
			if ComputedResult.cta.commitAnalyticsEvent ~= nil and (not ComputedResult.cta.commitRequiresEdit or NoToEdits) then
				FireAnalyticsEventModule(ComputedResult.cta.commitAnalyticsEvent, withCreationSession(MakeCreationEventFieldsModule.makeToolField(ComputedResult)))
			end
			SetActiveSessionFunction(nil)
			Store.navigate(CreationFlowStateModule.Preview)
		end,
		saveActiveTool = function()
			-- upvalues: GetActiveSessionFunction (ref), Computed2 (copy), Store (copy)
			local ActiveSession = GetActiveSessionFunction(false)
			local ComputedResult = Computed2(false)
			
			if ActiveSession ~= nil and ComputedResult ~= nil then
				Store.setCommittedEdit(ComputedResult.kind, (ActiveSession.commit()))
				
				return
			end
		end,
		clearActiveTool = function()
			-- upvalues: GetActiveSessionFunction (ref), Computed2 (copy), TtsAudio (ref)
			local ActiveSession = GetActiveSessionFunction(false)
			local ComputedResult = Computed2(false)
			
			if ComputedResult == nil then return end
			if ActiveSession ~= nil then
				ActiveSession.update(nil)
			end
			if ComputedResult.kind == "voice" and TtsAudio ~= nil then
				TtsAudio.reset()
			end
		end,
		discardActiveTool = function()
			-- upvalues: GetActiveSessionFunction (ref), Computed2 (copy), TtsAudio (ref), Computed (copy), FireAnalyticsEventModule (upval), withCreationSession (copy), MakeCreationEventFieldsModule (upval), MomentsCommonModule (upval), SetActiveSessionFunction (ref), Store (copy), CreationFlowStateModule (upval)
			local ActiveSession = GetActiveSessionFunction(false)
			local ComputedResult = Computed2(false)
			
			if ActiveSession ~= nil then
				ActiveSession.discard()
			end
			if ComputedResult ~= nil and ComputedResult.kind == "voice" and TtsAudio ~= nil then
				local Tts = Computed(false).tts
				
				if Tts == nil or Tts.text == nil or Tts.text == "" then
					TtsAudio.reset()
				else
					TtsAudio.generate(Tts.text, Tts.voiceId)
				end
			end
			if ComputedResult ~= nil and ComputedResult.cta.cancelAnalyticsEvent ~= nil then
				FireAnalyticsEventModule(ComputedResult.cta.cancelAnalyticsEvent, withCreationSession(MakeCreationEventFieldsModule.makeToolField(ComputedResult)))
			end
			if ComputedResult ~= nil then
				MomentsCommonModule.Analytics.reportMomentsEditToolAbandoned(ComputedResult.kind)
			end
			SetActiveSessionFunction(nil)
			Store.navigate(CreationFlowStateModule.Preview)
		end,
		updateCommittedEdit = function(p5, p6)
			-- upvalues: Store (copy)
			Store.setCommittedEdit(p5, p6)
		end,
		onDisabledToolActivated = function(p5)
			-- upvalues: GetFFlagEnableMomentTextGenerationFunction (upval), GetIsGeneratingFunction (ref), Host (copy)
			if GetFFlagEnableMomentTextGenerationFunction() and p5 == "text" and GetIsGeneratingFunction(false) and Host.onGenerateTextManualEditBlocked ~= nil then
				Host.onGenerateTextManualEditBlocked()
			end
		end,
		getActiveModal = Signal,
		showModal = function(p5)
			-- upvalues: Signal2 (copy)
			Signal2(p5)
		end,
		dismissModal = dismissModal,
		getVoiceCoachmarkDismissed = Signal1,
		dismissVoiceCoachmark = function()
			-- upvalues: Signal2_1 (copy)
			Signal2_1(true)
		end,
		getSelectedVoiceId = Signal3,
		setSelectedVoiceId = Signal2_2,
		getIsPublishing = Callback1,
		publish = function()
			-- upvalues: FFlagMomentsRenderCreatePostStatus (upval), Callback1 (ref), Store (copy), Host (copy), Signal2 (copy), DialogTypeModule (upval), dismissModal (copy), p1 (copy), v2 (ref), FFlagMomentsTTSDraftRestoreModule (upval), FFlagMomentTextGenerationFilteredSignal (upval), emitGeneratedTextFeedback (copy), SessionManager (upval), FunnelEventNames (upval), Preview (copy), FFlagMomentsCommentsCreatorControlModule (upval), Computed (copy), CryoModule (upval), MakeCreationEventFieldsModule (upval), EventNames (upval), GetFFlagEnableMomentTextGenerationFunction (upval), GetFFlagMomentsTTSAudioOverlayModule (upval), FFlagMomentsTTSPublishMetadataEditsModule (upval), FFlagMomentsTTSVoiceSelectorModule (upval), GetFFlagMomentsTTSStartTimePositioningModule (upval), TtsAudio (ref), FFlagMomentsTextOverlayV2Redesign (upval), FireAnalyticsEventModule (upval), MomentsCommonModule (upval), settlePublishResult (copy), dismiss (copy)
			if FFlagMomentsRenderCreatePostStatus and Callback1(false) then return end
			local Description = Store.getDescription(false)
			
			if Host.isTextFiltered ~= nil and Host.isTextFiltered(Description) then
				Signal2({
					modalType = DialogTypeModule.TextFiltered,
					modalProps = { onConfirm = dismissModal }
				})
				
				return
			end
			local Flag = nil
			if Host.publishDebounceSeconds == nil then
				Flag = true
			else
				local ClockTime = if p1.clock == nil then os.clock() else p1.clock()
				
				if ClockTime - v2 < Host.publishDebounceSeconds then
					Flag = false
				else
					v2 = ClockTime
					Flag = true
				end
			end
			if not Flag then return end
			if FFlagMomentsTTSDraftRestoreModule and Store.getPendingRestoredVoice(false) ~= nil then
				Store.setPendingRestoredVoice(nil)
				Store.setCommittedEdit("voice", nil)
			end
			if FFlagMomentTextGenerationFilteredSignal then
				local GeneratedTextFeedback = Store.getGeneratedTextFeedback(false)
				
				if GeneratedTextFeedback ~= nil then
					emitGeneratedTextFeedback(GeneratedTextFeedback)
				end
			end
			local SessionId = SessionManager.getSessionId(FunnelEventNames.FunnelTypes.CreationFlow)
			local Moment = nil
			
			if Host.createMoment ~= nil then
				local TimeLength = Preview.playback.getTimeLength(false)
				Moment = if FFlagMomentsCommentsCreatorControlModule then Host.createMoment(Store.getSelectedCapture(false), Computed(false), Description, SessionId, TimeLength, Store.getCommentsEnabled(false)) else Host.createMoment(Store.getSelectedCapture(false), Computed(false), Description, SessionId, TimeLength)
			end
			local JoinResult = CryoModule.Dictionary.join(MakeCreationEventFieldsModule.makeStepField(EventNames.MomentsEditingFlowPublished), MakeCreationEventFieldsModule.makeCreationBaseFields(SessionId))
			
			if GetFFlagEnableMomentTextGenerationFunction() then
				local TextOverlayEdits = Store.getTextOverlayEdits(false)
				JoinResult = CryoModule.Dictionary.join(JoinResult, MakeCreationEventFieldsModule.makeGeneratedTextOutcomeFields(Store.getGeneratedDescription(false), Description, Store.getGeneratedSummary(false), if TextOverlayEdits == nil or TextOverlayEdits[1] == nil then nil else TextOverlayEdits[1].text))
			end
			local FFlagMomentsTTSPublishMetadataEditsModule1 = GetFFlagMomentsTTSAudioOverlayModule and FFlagMomentsTTSPublishMetadataEditsModule
			
			if FFlagMomentsTTSVoiceSelectorModule and not FFlagMomentsTTSPublishMetadataEditsModule1 then
				local Tts = Computed(false).tts
				
				if Tts ~= nil then
					JoinResult = CryoModule.Dictionary.join(JoinResult, { voiceId = tostring(Tts.voiceId) })
				end
			end
			if GetFFlagMomentsTTSAudioOverlayModule and GetFFlagMomentsTTSStartTimePositioningModule and not FFlagMomentsTTSPublishMetadataEditsModule1 then
				local ComputedResult = Computed(false)
				local Tts = ComputedResult.tts
				
				if Tts ~= nil then
					local StartTime = Tts.startTime or 0
					local TimeLength = if ComputedResult.trim == nil then Preview.playback.getTimeLength(false) else ComputedResult.trim.endTime - ComputedResult.trim.startTime
					JoinResult = CryoModule.Dictionary.join(JoinResult, {
						ttsStartTimeSeconds = tostring(StartTime),
						ttsVideoDurationSeconds = tostring(TimeLength),
						ttsStartTimeFraction = tostring(if TimeLength > 0 then StartTime / TimeLength else 0)
					})
				end
			end
			if FFlagMomentsTTSPublishMetadataEditsModule1 then
				local ComputedResult = Computed(false)
				local Tts = ComputedResult.tts
				
				if Tts ~= nil then
					JoinResult = CryoModule.Dictionary.join(JoinResult, MakeCreationEventFieldsModule.makeVoicePublishSummaryFields(Tts, if ComputedResult.trim == nil then Preview.playback.getTimeLength(false) else ComputedResult.trim.endTime - ComputedResult.trim.startTime, if TtsAudio == nil or TtsAudio.getLoadedText(false) ~= Tts.text or TtsAudio.getLoadedVoiceId(false) ~= Tts.voiceId then nil else TtsAudio.getTimeLength(false)))
				end
			end
			if FFlagMomentsTextOverlayV2Redesign then
				local TextOverlays = Computed(false).textOverlays
				JoinResult = CryoModule.Dictionary.join(JoinResult, MakeCreationEventFieldsModule.makeTextOverlayPublishSummaryFields(TextOverlays and TextOverlays[1]))
			end
			FireAnalyticsEventModule(EventNames.MomentsEditingFlowPublished, JoinResult)
			MomentsCommonModule.Analytics.reportMomentsCreationStep("published")
			local Analytics = MomentsCommonModule.Analytics
			local ComputedResult = Computed(false)
			local Count = 0
			
			if ComputedResult.music ~= nil then
				Count += 1
				Analytics.reportMomentsPublishedWithEdit("music")
			end
			if ComputedResult.trim ~= nil then
				Count += 1
				Analytics.reportMomentsPublishedWithEdit("trim")
			end
			if ComputedResult.textOverlays ~= nil and #ComputedResult.textOverlays > 0 then
				Count += 1
				Analytics.reportMomentsPublishedWithEdit("text_overlay")
			end
			if ComputedResult.stickerOverlays ~= nil and #ComputedResult.stickerOverlays > 0 then
				Count += 1
				Analytics.reportMomentsPublishedWithEdit("sticker")
			end
			if Description ~= nil and Description ~= "" then
				Count += 1
				Analytics.reportMomentsPublishedWithEdit("description")
			end
			if GetFFlagMomentsTTSAudioOverlayModule and ComputedResult.tts ~= nil then
				Count += 1
				Analytics.reportMomentsPublishedWithEdit("tts")
			end
			Analytics.reportMomentsPublishedEditCount(Count)
			local SelectedCapture = Store.getSelectedCapture(false)
			
			if SelectedCapture ~= nil then
				Analytics.reportMomentsPublishedByCaptureType(if SelectedCapture.CaptureType == Enum.CaptureType.Video then "video" elseif SelectedCapture.CaptureType == Enum.CaptureType.Screenshot then "screenshot" else "unknown")
			end
			if FFlagMomentsRenderCreatePostStatus then
				settlePublishResult(Moment)
				
				return
			else
				dismiss()
			end
		end,
		exit = function()
			-- upvalues: FireAnalyticsEventModule (upval), EventNames (upval), withCreationSession (copy), MakeCreationEventFieldsModule (upval), dismiss (copy)
			FireAnalyticsEventModule(EventNames.MomentsEditingFlowExited, withCreationSession(MakeCreationEventFieldsModule.makeStepField(EventNames.MomentsEditingFlowExited)))
			dismiss()
		end,
		generateText = function(p5)
			-- upvalues: GetIsGeneratingFunction (ref), Host (copy), Store (copy), GetFFlagEnableMomentTextGenerationFunction (upval), SetIsGeneratingFunction (ref), SetActiveGenerationFunction (ref), FFlagMomentTextGenerationFilteredSignal (upval), FireAnalyticsEventModule (upval), EventNames (upval), withCreationSession (copy), MomentsCommonModule (upval), MakeDefaultTextOverlayEditModule (upval), GetFFlagMomentsGenerateTextInTextOverlayModule (upval), GetActiveSessionFunction (ref), Computed2 (copy)
			if GetIsGeneratingFunction(false) then return end
			if Host.generateMomentText == nil then return end
			local SelectedCapture = Store.getSelectedCapture(false)
			
			if SelectedCapture == nil then return end
			if GetFFlagEnableMomentTextGenerationFunction() and Host.onGenerateTextWillReplaceInput ~= nil then
				local TextOverlayEdits = Store.getTextOverlayEdits(false)
				
				if TextOverlayEdits ~= nil and #TextOverlayEdits > 0 then
					Host.onGenerateTextWillReplaceInput()
				end
			end
			SetIsGeneratingFunction(true)
			local MomentText = Host.generateMomentText(SelectedCapture, p5)
			
			if MomentText == nil then
				SetIsGeneratingFunction(false)
				
				return
			end
			if GetFFlagEnableMomentTextGenerationFunction() then
				SetActiveGenerationFunction({ promise = MomentText, capture = SelectedCapture })
			end
			MomentText:andThen(function(Result)
				-- upvalues: GetFFlagEnableMomentTextGenerationFunction (upval), SetActiveGenerationFunction (upval), FFlagMomentTextGenerationFilteredSignal (upval), FireAnalyticsEventModule (upval), EventNames (upval), withCreationSession (upval), MomentsCommonModule (upval), Host (upval), SetIsGeneratingFunction (upval), Store (upval), MakeDefaultTextOverlayEditModule (upval), GetFFlagMomentsGenerateTextInTextOverlayModule (upval), GetActiveSessionFunction (upval), Computed2 (upval)
				if GetFFlagEnableMomentTextGenerationFunction() then
					SetActiveGenerationFunction(nil)
				end
				if FFlagMomentTextGenerationFilteredSignal and Result ~= nil and Result.error == "CONTENT_FILTERED" then
					FireAnalyticsEventModule(EventNames.EditingFlowGenerateTextFiltered, withCreationSession({}))
					MomentsCommonModule.Analytics.reportMomentsGenerateText("filtered")
					
					if Host.onGenerateTextFiltered ~= nil then
						Host.onGenerateTextFiltered()
					end
					SetIsGeneratingFunction(false)
					
					return
				elseif Result == nil or Result.error ~= nil then
					FireAnalyticsEventModule(EventNames.EditingFlowGenerateTextFailed, withCreationSession({}))
					MomentsCommonModule.Analytics.reportMomentsGenerateText("failed")
					
					if Host.onGenerateTextFailure ~= nil then
						Host.onGenerateTextFailure()
					end
					SetIsGeneratingFunction(false)
					
					return
				else
					if Result.summary ~= nil and Result.summary ~= "" then
						local TextOverlayEdits = Store.getTextOverlayEdits(false)
						local Tbl = if TextOverlayEdits == nil then nil else TextOverlayEdits[1]
						local DefaultTextOverlayEditModule = nil
						
						if GetFFlagEnableMomentTextGenerationFunction() and Tbl ~= nil then
							DefaultTextOverlayEditModule = table.clone(Tbl)
							DefaultTextOverlayEditModule.text = Result.summary
						else
							DefaultTextOverlayEditModule = MakeDefaultTextOverlayEditModule()
							DefaultTextOverlayEditModule.text = Result.summary
						end
						local list = nil
						if TextOverlayEdits == nil or #TextOverlayEdits == 0 then
							list = { DefaultTextOverlayEditModule }
						else
							list = table.clone(TextOverlayEdits)
							list[1] = DefaultTextOverlayEditModule
						end
						Store.updateTextOverlayEdits(list)
						
						if GetFFlagMomentsGenerateTextInTextOverlayModule() then
							local ActiveSession = GetActiveSessionFunction(false)
							local ComputedResult = Computed2(false)
							
							if ActiveSession ~= nil and ComputedResult ~= nil and ComputedResult.kind == "text" then
								local Draft = ActiveSession.getDraft(false)
								local Tbl1 = Draft and Draft[1]
								
								if Tbl1 == nil then
									ActiveSession.update(list)
								else
									local Copy = table.clone(Tbl1)
									Copy.text = Result.summary
									ActiveSession.update({ Copy })
								end
							end
						end
						if GetFFlagEnableMomentTextGenerationFunction() then
							Store.setGeneratedSummary(Result.summary)
						end
					end
					if Result.description ~= nil and Result.description ~= "" then
						Store.updateDescription(Result.description)
						
						if FFlagMomentTextGenerationFilteredSignal or GetFFlagEnableMomentTextGenerationFunction() then
							Store.setGeneratedDescription(Result.description)
							Store.setGenerationToken(Result.generationToken)
							Store.setGeneratedTextFeedback(nil)
						end
					end
					FireAnalyticsEventModule(EventNames.EditingFlowGenerateTextSucceeded, withCreationSession({}))
					MomentsCommonModule.Analytics.reportMomentsGenerateText("succeeded")
					
					if Host.onGenerateTextSuccess ~= nil then
						Host.onGenerateTextSuccess()
					end
					SetIsGeneratingFunction(false)
				end
			end):catch(function()
				-- upvalues: GetFFlagEnableMomentTextGenerationFunction (upval), SetActiveGenerationFunction (upval), FireAnalyticsEventModule (upval), EventNames (upval), withCreationSession (upval), MomentsCommonModule (upval), Host (upval), SetIsGeneratingFunction (upval)
				if GetFFlagEnableMomentTextGenerationFunction() then
					SetActiveGenerationFunction(nil)
				end
				FireAnalyticsEventModule(EventNames.EditingFlowGenerateTextFailed, withCreationSession({}))
				MomentsCommonModule.Analytics.reportMomentsGenerateText("failed")
				
				if Host.onGenerateTextFailure ~= nil then
					Host.onGenerateTextFailure()
				end
				SetIsGeneratingFunction(false)
			end)
		end,
		getIsGenerating = GetIsGeneratingFunction,
		getCanGenerateText = function(_): boolean
			-- upvalues: Host (copy), FFlagMomentsTextOverlayOnPhotosModule (upval), Store (copy)
			if Host.generateMomentText == nil then
				return false
			elseif FFlagMomentsTextOverlayOnPhotosModule then
				local SelectedCapture = Store.getSelectedCapture(false)
				
				return SelectedCapture ~= nil and SelectedCapture.CaptureType == Enum.CaptureType.Video
			else
				return true
			end
		end,
		submitGeneratedTextFeedback = function(p5)
			-- upvalues: FFlagMomentTextGenerationFilteredSignal (upval), Store (copy), emitGeneratedTextFeedback (copy)
			if not FFlagMomentTextGenerationFilteredSignal then return end
			if p5 == "policy_violation" then
				Store.setGeneratedTextFeedback(nil)
				emitGeneratedTextFeedback(p5)
				
				return
			else
				Store.setGeneratedTextFeedback(p5)
			end
		end,
		preview = Preview,
		ttsAudio = TtsAudio,
		ttsAudioParent = Host.ttsAudioParent
	}
	
	return v1
end