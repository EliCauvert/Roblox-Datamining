local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local CryoModule = require(Parent.Cryo)
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local FoundationProvider = FoundationModule.FoundationProvider
local Icon = FoundationModule.Icon
local View = FoundationModule.View
local ColorMode = FoundationModule.Enums.ColorMode
local UseCallbackFunction = ReactModule.useCallback
local UseEffectFunction = ReactModule.useEffect
local UseMemoFunction = ReactModule.useMemo
local UseRefFunction = ReactModule.useRef
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseDeviceInsetsFunction = MomentsCommonModule.Hooks.useDeviceInsets
local UseFormFactorFunction = MomentsCommonModule.Hooks.useFormFactor
local UseToggleStateFunction = MomentsCommonModule.Hooks.useToggleState
local FormFactor = MomentsCommonModule.Enums.FormFactor
local GradientBackdrop = MomentsCommonModule.Components.GradientBackdrop
local EventNames = MomentsCommonModule.Analytics.EventNames
local SessionManager = MomentsCommonModule.Analytics.SessionManager
local FunnelEventNames = MomentsCommonModule.Analytics.FunnelEventNames
local FireAnalyticsEventModule = require(MomentsCreation.Analytics.fireAnalyticsEvent)
local MakeCreationEventFieldsModule = require(MomentsCreation.Analytics.makeCreationEventFields)
local GetFFlagEnableMomentTextGenerationFunction = MomentsCommonModule.Flags.GetFFlagEnableMomentTextGeneration
local GetFFlagMomentsCreationSaveDraftFunction = MomentsCommonModule.Flags.GetFFlagMomentsCreationSaveDraft
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local CreationControllerModule = require(MomentsCreation.CreationController)
local CreationControllerProvider = CreationControllerModule.CreationControllerProvider
local UseCreationControllerFunction = CreationControllerModule.useCreationController
local UseAutoDismissStateModule = require(MomentsCreation.Hooks.useAutoDismissState)
local UseDraftRestoreEffectModule = require(MomentsCreation.Hooks.useDraftRestoreEffect)
local UseDraftSaveEffectModule = require(MomentsCreation.Hooks.useDraftSaveEffect)
local UseRestoredVoiceoverCheckModule = require(MomentsCreation.Hooks.useRestoredVoiceoverCheck)
local UseDescriptionKeyboardInsetModule = require(MomentsCreation.Hooks.useDescriptionKeyboardInset)
local GetFFlagMomentsStickerButtonFunction = MomentsCommonModule.Flags.GetFFlagMomentsStickerButton
local GetFFlagMomentsTTSAudioOverlayModule = require(MomentsCreation.Flags.GetFFlagMomentsTTSAudioOverlay)
local GetFFlagMomentsTTSCoachmarkModule = require(MomentsCreation.Flags.GetFFlagMomentsTTSCoachmark)
local FFlagMomentsTTSDraftRestoreModule = require(MomentsCreation.Flags.FFlagMomentsTTSDraftRestore)
local GetFFlagMomentsCreationCloseButtonZIndexFixModule = require(MomentsCreation.Flags.GetFFlagMomentsCreationCloseButtonZIndexFix)
local FFlagMomentsCreationToolsIxpEnabledModule = require(MomentsCreation.Flags.FFlagMomentsCreationToolsIxpEnabled)
local FFlagMomentsCreationMusicChipRemoveButtonModule = require(MomentsCreation.Flags.FFlagMomentsCreationMusicChipRemoveButton)
local FFlagMomentsCreationMusicEditorRedesignModule = require(MomentsCreation.Flags.FFlagMomentsCreationMusicEditorRedesign)
local FStringMomentsCreationToolsIxpLayerModule = require(MomentsCreation.Flags.FStringMomentsCreationToolsIxpLayer)
local FFlagMomentsCreationToolsIxpEnabled2Module = require(MomentsCreation.Flags.FFlagMomentsCreationToolsIxpEnabled2)
local FStringMomentsCreationToolsIxpLayer2Module = require(MomentsCreation.Flags.FStringMomentsCreationToolsIxpLayer2)
local FFlagMomentsCreationToolsIxpEnabled3Module = require(MomentsCreation.Flags.FFlagMomentsCreationToolsIxpEnabled3)
local FStringMomentsCreationToolsIxpLayer3Module = require(MomentsCreation.Flags.FStringMomentsCreationToolsIxpLayer3)
local FFlagMomentsTextOverlayDragToDeleteRefinementModule = require(MomentsCreation.Flags.FFlagMomentsTextOverlayDragToDeleteRefinement)
local LogMomentsLayerExposureFunction = MomentsCommonModule.Utils.logMomentsLayerExposure
local StepStubModule = require(script.Parent.StepStub)
local CreationFlowStateModule = require(MomentsCreation.Enums.CreationFlowState)
local DialogTypeModule = require(MomentsCreation.Enums.DialogType)
local DockedEditorContextModule = require(MomentsCreation.Contexts.DockedEditorContext)
local _ = require(MomentsCreation.Types.CreationFlowTypes)
local CaptureViewModule = require(MomentsCreation.Components.CaptureView)
local CreationMediaProviderModule = require(MomentsCreation.Components.CreationMediaProvider)
local DescriptionViewModule = require(MomentsCreation.Components.DescriptionView)
local EditCTABarModule = require(MomentsCreation.Components.EditCTABar)
local GalleryViewModule = require(MomentsCreation.Components.GalleryView)
local PlaybackControlsModule = require(MomentsCreation.Components.PlaybackControls)
local PreviewViewModule = require(MomentsCreation.Components.PreviewView)
local ExitConfirmationDialogModule = require(MomentsCreation.Components.Dialogs.ExitConfirmationDialog)
local TextFilteredDialogModule = require(MomentsCreation.Components.Dialogs.TextFilteredDialog)
local GenerateTextOptionsDialogModule = require(MomentsCreation.Components.Dialogs.GenerateTextOptionsDialog)
local VoiceoverErrorDialogModule = require(MomentsCreation.Components.Dialogs.VoiceoverErrorDialog)
local VoiceoverDeleteConfirmDialogModule = require(MomentsCreation.Components.Dialogs.VoiceoverDeleteConfirmDialog)
local VoiceSelectorDialogModule = require(MomentsCreation.Components.Dialogs.VoiceSelectorDialog)
local VoiceBackControlsModule = require(MomentsCreation.Components.Voice.VoiceBackControls)
local SampleCapturesModule = require(MomentsCreation.Capture.sampleCaptures)
local PublishMomentModule = require(MomentsCreation.Upload.publishMoment)
local IsTextFilteredModule = require(MomentsCreation.Moderation.isTextFiltered)
local MusicChipModule = require(MomentsCreation.Components.MusicChip)
local v1 = require(Parent.MomentsCommon.isStudio)()
local SampleCapturesModule1 = if v1 then SampleCapturesModule else {}

local function noopActivated() end

local StateLayer = {
	affordance = FoundationModule.Enums.StateLayerAffordance.None
}

local function GallerySourceView(p1)
	-- upvalues: UseSignalStateFunction (copy), ReactModule (copy), GalleryViewModule (copy)
	local CaptureSource = p1.captureSource
	
	return ReactModule.createElement(GalleryViewModule, {
		captures = UseSignalStateFunction(CaptureSource.getCaptures),
		layoutOrder = p1.layoutOrder,
		onCaptureSelected = p1.onCaptureSelected,
		onNextCallback = p1.onNextCallback,
		selectedCapture = p1.selectedCapture,
		hasMoreCaptures = not UseSignalStateFunction(CaptureSource.getIsFinished),
		onShowMore = CaptureSource.fetchMore
	})
end

local function CreationFlowContent(p1)
	-- upvalues: UseCreationControllerFunction (copy), GetFFlagMomentsCreationSaveDraftFunction (copy), UseDraftRestoreEffectModule (copy), UseDraftSaveEffectModule (copy), FFlagMomentsTTSDraftRestoreModule (copy), UseRestoredVoiceoverCheckModule (copy), UseDeviceInsetsFunction (copy), UseTokensFunction (copy), UseFormFactorFunction (copy), UseToggleStateFunction (copy), UseAutoDismissStateModule (copy), UseSignalStateFunction (copy), UseDescriptionKeyboardInsetModule (copy), CreationFlowStateModule (copy), GetFFlagMomentsTTSAudioOverlayModule (copy), FFlagMomentsCreationMusicEditorRedesignModule (copy), ReactModule (copy), UseMemoFunction (copy), UseCallbackFunction (copy), SessionManager (copy), FunnelEventNames (copy), CryoModule (copy), MakeCreationEventFieldsModule (copy), FireAnalyticsEventModule (copy), EventNames (copy), DialogTypeModule (copy), UseRefFunction (copy), UseEffectFunction (copy), GetFFlagMomentsStickerButtonFunction (copy), FFlagMomentsCreationToolsIxpEnabledModule (copy), LogMomentsLayerExposureFunction (copy), FStringMomentsCreationToolsIxpLayerModule (copy), FFlagMomentsCreationToolsIxpEnabled2Module (copy), FStringMomentsCreationToolsIxpLayer2Module (copy), FFlagMomentsCreationToolsIxpEnabled3Module (copy), FStringMomentsCreationToolsIxpLayer3Module (copy), ExitConfirmationDialogModule (copy), TextFilteredDialogModule (copy), GenerateTextOptionsDialogModule (copy), VoiceoverErrorDialogModule (copy), VoiceoverDeleteConfirmDialogModule (copy), VoiceSelectorDialogModule (copy), StepStubModule (copy), SignalsModule (copy), FFlagMomentsTextOverlayDragToDeleteRefinementModule (copy), View (copy), StateLayer (copy), FormFactor (copy), noopActivated (copy), VoiceBackControlsModule (copy), GetFFlagMomentsCreationCloseButtonZIndexFixModule (copy), Icon (copy), FoundationModule (copy), CaptureViewModule (copy), GradientBackdrop (copy), MusicChipModule (copy), FFlagMomentsCreationMusicChipRemoveButtonModule (copy), PlaybackControlsModule (copy), EditCTABarModule (copy), GetFFlagEnableMomentTextGenerationFunction (copy), GetFFlagMomentsTTSCoachmarkModule (copy), GallerySourceView (copy), GalleryViewModule (copy), SampleCapturesModule1 (copy), PreviewViewModule (copy), DescriptionViewModule (copy), DockedEditorContextModule (copy), CreationMediaProviderModule (copy)
	local UseCreationControllerResult = UseCreationControllerFunction()
	
	if GetFFlagMomentsCreationSaveDraftFunction() then
		UseDraftRestoreEffectModule(p1.captureSource, p1.disableDrafts)
		UseDraftSaveEffectModule(p1.disableDrafts)
		
		if FFlagMomentsTTSDraftRestoreModule then
			UseRestoredVoiceoverCheckModule(UseCreationControllerResult)
		end
	end
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local UseTokensResult = UseTokensFunction()
	local UseFormFactorResult = UseFormFactorFunction()
	local UseToggleStateResult = UseToggleStateFunction(false)
	local UseAutoDismissStateModuleResult, UseAutoDismissStateModuleResult2 = UseAutoDismissStateModule()
	local UseSignalStateResult = UseSignalStateFunction(UseCreationControllerResult.getStep)
	local UseSignalStateResult1 = UseSignalStateFunction(UseCreationControllerResult.getSelectedCapture)
	local UseSignalStateResult2 = UseSignalStateFunction(UseCreationControllerResult.getComposedEdits)
	local UseSignalStateResult3 = UseSignalStateFunction(UseCreationControllerResult.getAvailableTools)
	local UseSignalStateResult4 = UseSignalStateFunction(UseCreationControllerResult.getActiveTool)
	local UseSignalStateResult5 = UseSignalStateFunction(UseCreationControllerResult.getActiveModal)
	local UseSignalStateResult6 = UseSignalStateFunction(UseCreationControllerResult.getIsGenerating)
	local Music = UseSignalStateResult2.music
	local UseDescriptionKeyboardInsetModuleResult, UseDescriptionKeyboardInsetModuleResult2 = UseDescriptionKeyboardInsetModule(UseSignalStateResult == CreationFlowStateModule.Description or GetFFlagMomentsTTSAudioOverlayModule and UseSignalStateResult == CreationFlowStateModule.Voice)
	local v2 = 0
	local Value = nil
	
	if FFlagMomentsCreationMusicEditorRedesignModule then
		local UseStateResult2
		v2, UseStateResult2 = ReactModule.useState(0)
		Value = UseMemoFunction(function()
			-- upvalues: UseStateResult2 (copy)
			return { setDockedEditorHeight = UseStateResult2 }
		end, { UseStateResult2 })
	end
	local CaptureSource = p1.captureSource
	local UseCallbackResult = UseCallbackFunction(function(p2)
		-- upvalues: UseCreationControllerResult (copy), UseAutoDismissStateModuleResult2 (copy)
		UseCreationControllerResult.selectCapture(p2)
		UseAutoDismissStateModuleResult2()
	end, {
		UseCreationControllerResult,
		UseAutoDismissStateModuleResult2
	})
	
	local function withCreationSession(StepField)
		-- upvalues: SessionManager (upval), FunnelEventNames (upval), CryoModule (upval), MakeCreationEventFieldsModule (upval)
		return CryoModule.Dictionary.join(StepField, MakeCreationEventFieldsModule.makeCreationBaseFields((SessionManager.getSessionId(FunnelEventNames.FunnelTypes.CreationFlow))))
	end
	
	local function flowStepFields()
		-- upvalues: withCreationSession (copy), MakeCreationEventFieldsModule (upval), UseCreationControllerResult (copy)
		return withCreationSession(MakeCreationEventFieldsModule.makeStepFieldFromState((UseCreationControllerResult.getStep(false))))
	end
	
	local UseCallbackResult1 = UseCallbackFunction(function()
		-- upvalues: FireAnalyticsEventModule (upval), EventNames (upval), flowStepFields (copy), UseCreationControllerResult (copy), CreationFlowStateModule (upval), UseAutoDismissStateModuleResult2 (copy), withCreationSession (copy), MakeCreationEventFieldsModule (upval)
		FireAnalyticsEventModule(EventNames.EditingFlowNextButtonPressed, flowStepFields())
		UseCreationControllerResult.navigate(CreationFlowStateModule.Preview)
		UseAutoDismissStateModuleResult2()
		FireAnalyticsEventModule(EventNames.MomentsEditingFlowContinueToEditButtonPressed, withCreationSession(MakeCreationEventFieldsModule.makeStepField(EventNames.MomentsEditingFlowContinueToEditButtonPressed)))
	end, {
		UseCreationControllerResult,
		UseAutoDismissStateModuleResult2
	})
	local UseCallbackResult2 = UseCallbackFunction(function()
		-- upvalues: FireAnalyticsEventModule (upval), EventNames (upval), flowStepFields (copy), UseCreationControllerResult (copy), CreationFlowStateModule (upval), UseToggleStateResult (copy), withCreationSession (copy), MakeCreationEventFieldsModule (upval)
		FireAnalyticsEventModule(EventNames.EditingFlowNextButtonPressed, flowStepFields())
		UseCreationControllerResult.navigate(CreationFlowStateModule.Description)
		UseToggleStateResult.disable()
		FireAnalyticsEventModule(EventNames.MomentsEditingFlowContinueToDescriptionButtonPressed, withCreationSession(MakeCreationEventFieldsModule.makeStepField(EventNames.MomentsEditingFlowContinueToDescriptionButtonPressed)))
	end, {
		UseCreationControllerResult,
		UseToggleStateResult.disable
	})
	local UseCallbackResult3 = UseCallbackFunction(function()
		-- upvalues: FireAnalyticsEventModule (upval), EventNames (upval), flowStepFields (copy), UseCreationControllerResult (copy), CreationFlowStateModule (upval)
		FireAnalyticsEventModule(EventNames.EditingFlowReturnButtonPressed, flowStepFields())
		UseCreationControllerResult.navigate(CreationFlowStateModule.Preview)
	end, { UseCreationControllerResult })
	local UseCallbackResult4 = UseCallbackFunction(function(p2)
		-- upvalues: UseCreationControllerResult (copy)
		UseCreationControllerResult.beginTool(p2)
	end, { UseCreationControllerResult })
	local UseCallbackResult5 = UseCallbackFunction(function()
		-- upvalues: UseCreationControllerResult (copy)
		UseCreationControllerResult.beginTool("music")
	end, { UseCreationControllerResult })
	local UseCallbackResult6 = UseCallbackFunction(function()
		-- upvalues: UseCreationControllerResult (copy)
		UseCreationControllerResult.updateCommittedEdit("music", nil)
	end, { UseCreationControllerResult })
	local UseCallbackResult7 = UseCallbackFunction(function()
		-- upvalues: FireAnalyticsEventModule (upval), EventNames (upval), flowStepFields (copy), UseCreationControllerResult (copy), DialogTypeModule (upval), UseToggleStateResult (copy)
		FireAnalyticsEventModule(EventNames.EditingFlowReturnButtonPressed, flowStepFields())
		UseCreationControllerResult.showModal({
			modalType = DialogTypeModule.ExitCreationConfirmation,
			modalProps = {
				onCancel = UseCreationControllerResult.dismissModal,
				onConfirm = function()
					-- upvalues: UseCreationControllerResult (upval), UseToggleStateResult (upval)
					UseCreationControllerResult.dismissModal()
					UseCreationControllerResult.returnToGallery()
					UseToggleStateResult.disable()
				end
			}
		})
	end, {
		UseCreationControllerResult,
		UseToggleStateResult.disable
	})
	local UseCallbackResult8 = UseCallbackFunction(function()
		-- upvalues: UseCreationControllerResult (copy)
		UseCreationControllerResult.publish()
	end, { UseCreationControllerResult })
	local UseCallbackResult9 = UseCallbackFunction(function()
		-- upvalues: UseSignalStateResult1 (copy), UseCreationControllerResult (copy), DialogTypeModule (upval)
		if UseSignalStateResult1 then
			UseCreationControllerResult.showModal({
				modalType = DialogTypeModule.ExitCreationConfirmation,
				modalProps = {
					onCancel = UseCreationControllerResult.dismissModal,
					onConfirm = UseCreationControllerResult.exit
				}
			})
			
			return
		else
			UseCreationControllerResult.exit()
		end
	end, { UseCreationControllerResult, UseSignalStateResult1 })
	local UseRefResult = UseRefFunction(nil)
	UseEffectFunction(function()
		-- upvalues: UseRefResult (copy), UseSignalStateResult (copy), CreationFlowStateModule (upval), FireAnalyticsEventModule (upval), EventNames (upval), withCreationSession (copy), MakeCreationEventFieldsModule (upval), GetFFlagMomentsStickerButtonFunction (upval), GetFFlagMomentsTTSAudioOverlayModule (upval), FFlagMomentsCreationToolsIxpEnabledModule (upval), p1 (copy), LogMomentsLayerExposureFunction (upval), FStringMomentsCreationToolsIxpLayerModule (upval), FFlagMomentsCreationToolsIxpEnabled2Module (upval), FStringMomentsCreationToolsIxpLayer2Module (upval), FFlagMomentsCreationToolsIxpEnabled3Module (upval), FStringMomentsCreationToolsIxpLayer3Module (upval)
		local Current = UseRefResult.current
		UseRefResult.current = UseSignalStateResult
		
		if UseSignalStateResult == CreationFlowStateModule.Gallery then
			FireAnalyticsEventModule(EventNames.EditingFlowGalleryPageAppear, withCreationSession(MakeCreationEventFieldsModule.makeStepField(EventNames.EditingFlowGalleryPageAppear)))
			
			return
		end
		if UseSignalStateResult == CreationFlowStateModule.Preview then
			if Current ~= CreationFlowStateModule.Trimming and (Current ~= CreationFlowStateModule.Music and (Current ~= CreationFlowStateModule.TextOverlay and ((not GetFFlagMomentsStickerButtonFunction() or Current ~= CreationFlowStateModule.StickerOverlay) and (not GetFFlagMomentsTTSAudioOverlayModule or Current ~= CreationFlowStateModule.Voice)))) then
				FireAnalyticsEventModule(EventNames.EditingFlowEditPageAppear, withCreationSession(MakeCreationEventFieldsModule.makeStepField(EventNames.EditingFlowEditPageAppear)))
				
				if FFlagMomentsCreationToolsIxpEnabledModule and not p1.disableExperimentExposure then
					LogMomentsLayerExposureFunction(FStringMomentsCreationToolsIxpLayerModule)
				end
				if FFlagMomentsCreationToolsIxpEnabled2Module and not p1.disableExperimentExposure then
					LogMomentsLayerExposureFunction(FStringMomentsCreationToolsIxpLayer2Module)
				end
				if FFlagMomentsCreationToolsIxpEnabled3Module and not p1.disableExperimentExposure then
					LogMomentsLayerExposureFunction(FStringMomentsCreationToolsIxpLayer3Module)
					
					return
				end
			end
		elseif UseSignalStateResult == CreationFlowStateModule.Description then
			FireAnalyticsEventModule(EventNames.EditingFlowPreviewPageAppear, withCreationSession(MakeCreationEventFieldsModule.makeStepField(EventNames.EditingFlowPreviewPageAppear)))
		end
	end, { UseSignalStateResult, p1.disableExperimentExposure })
	UseEffectFunction(function()
		-- upvalues: UseSignalStateResult (copy), CreationFlowStateModule (upval), UseToggleStateResult (copy)
		if UseSignalStateResult == CreationFlowStateModule.Gallery or UseSignalStateResult == CreationFlowStateModule.Music or UseSignalStateResult == CreationFlowStateModule.Description then
			UseToggleStateResult.disable()
		end
	end, { UseSignalStateResult, UseToggleStateResult.disable })
	local UseCallbackResult10 = UseCallbackFunction(function()
		-- upvalues: UseSignalStateResult5 (copy), DialogTypeModule (upval), ReactModule (upval), ExitConfirmationDialogModule (upval), TextFilteredDialogModule (upval), GenerateTextOptionsDialogModule (upval), VoiceoverErrorDialogModule (upval), VoiceoverDeleteConfirmDialogModule (upval), VoiceSelectorDialogModule (upval)
		return if UseSignalStateResult5 and UseSignalStateResult5.modalType then if UseSignalStateResult5.modalType == DialogTypeModule.ExitCreationConfirmation then ReactModule.createElement(ExitConfirmationDialogModule, UseSignalStateResult5.modalProps) elseif UseSignalStateResult5.modalType == DialogTypeModule.TextFiltered then ReactModule.createElement(TextFilteredDialogModule, UseSignalStateResult5.modalProps) elseif UseSignalStateResult5.modalType == DialogTypeModule.GenerateTextOptions then ReactModule.createElement(GenerateTextOptionsDialogModule, UseSignalStateResult5.modalProps) elseif UseSignalStateResult5.modalType == DialogTypeModule.VoiceoverError then ReactModule.createElement(VoiceoverErrorDialogModule, UseSignalStateResult5.modalProps) elseif UseSignalStateResult5.modalType == DialogTypeModule.VoiceoverDelete then ReactModule.createElement(VoiceoverDeleteConfirmDialogModule, UseSignalStateResult5.modalProps) elseif UseSignalStateResult5.modalType == DialogTypeModule.VoiceSelector then ReactModule.createElement(VoiceSelectorDialogModule, UseSignalStateResult5.modalProps) else nil else nil
	end, { UseSignalStateResult5 })
	local UseCallbackResult11 = UseCallbackFunction(function(Presentation)
		-- upvalues: UseSignalStateResult4 (copy), UseSignalStateResult (copy), UseCreationControllerResult (copy), ReactModule (upval), StepStubModule (upval)
		if UseSignalStateResult4 == nil or UseSignalStateResult4.presentation ~= Presentation or UseSignalStateResult ~= UseSignalStateResult4.step then
			return nil
		end
		if UseSignalStateResult4.renderEditor ~= nil then
			local RenderEditorResult = UseSignalStateResult4.renderEditor(UseCreationControllerResult)
			
			if RenderEditorResult ~= nil then
				return RenderEditorResult
			end
		end
		return ReactModule.createElement(StepStubModule(UseSignalStateResult4.kind), {})
	end, {
		UseSignalStateResult4,
		UseSignalStateResult,
		UseCreationControllerResult
	})
	local UseMemoResult = UseMemoFunction(function()
		-- upvalues: SignalsModule (upval)
		local Signal, Signal2 = SignalsModule.createSignal(Vector2.zero)
		
		return { getItemSize = Signal, setItemSize = Signal2 }
	end, {})
	local UseMemoResult1 = UseMemoFunction(function()
		-- upvalues: SignalsModule (upval)
		local Signal, Signal2 = SignalsModule.createSignal(Vector2.zero)
		
		return { getItemResolution = Signal, setItemResolution = Signal2 }
	end, {})
	local UseMemoResult2 = UseMemoFunction(function()
		-- upvalues: SignalsModule (upval)
		local Signal, Signal2 = SignalsModule.createSignal(false)
		
		return { get = Signal, set = Signal2 }
	end, {})
	local UseSignalStateResult7 = UseSignalStateFunction(UseMemoResult2.get)
	
	if FFlagMomentsTextOverlayDragToDeleteRefinementModule then
		UseEffectFunction(function()
			-- upvalues: UseMemoResult2 (copy)
			UseMemoResult2.set(false)
		end, { UseSignalStateResult, UseMemoResult2 })
	end
	local UseMemoResult3 = UseMemoFunction(function()
		-- upvalues: UseMemoResult (copy), UseMemoResult1 (copy), UseMemoResult2 (copy)
		return {
			getItemSize = UseMemoResult.getItemSize,
			getItemResolution = UseMemoResult1.getItemResolution,
			setIsOverlayDragging = UseMemoResult2.set
		}
	end, { UseMemoResult, UseMemoResult1, UseMemoResult2 })
	
	return ReactModule.createElement(CreationMediaProviderModule, {
		preview = UseCreationControllerResult.preview,
		getSelectedCapture = UseCreationControllerResult.getSelectedCapture
	}, (ReactModule.createElement(View, {
		tag = "position-center-center anchor-center-center size-full-full",
		testId = "moments-creation-background-scrim",
		backgroundStyle = UseTokensResult.Color.Common.Scrim,
		onActivated = UseCallbackResult9,
		stateLayer = StateLayer
	}, {
		CreationFlowView = ReactModule.createElement(View, {
			tag = "position-center-center anchor-center-center size-full-full radius-large bg-surface-0",
			testId = "moments-creation-panel",
			sizeConstraint = {
				MaxSize = if UseFormFactorResult == FormFactor.Wide then Vector2.new(600, 700) else nil
			},
			onActivated = noopActivated,
			stateLayer = StateLayer
		}, {
			VoiceBackControls = if GetFFlagMomentsTTSAudioOverlayModule and UseSignalStateResult == CreationFlowStateModule.Voice then ReactModule.createElement(VoiceBackControlsModule) else nil,
			CloseButtonContainer = if GetFFlagMomentsTTSAudioOverlayModule and UseSignalStateResult == CreationFlowStateModule.Voice then nil elseif v2 > 0 then nil elseif FFlagMomentsTextOverlayDragToDeleteRefinementModule and UseSignalStateResult7 then nil else ReactModule.createElement(View, {
				tag = "position-top-right anchor-top-right auto-xy",
				padding = {
					top = UDim.new(0, UseDeviceInsetsResult.top + UseTokensResult.Padding.Medium),
					right = UDim.new(0, UseDeviceInsetsResult.right + UseTokensResult.Padding.Medium)
				},
				ZIndex = if GetFFlagMomentsCreationCloseButtonZIndexFixModule then 10 else nil
			}, {
				CloseButton = ReactModule.createElement(View, {
					LayoutOrder = 1,
					tag = "size-1100-1100 padding-medium radius-circle bg-over-media-0",
					onActivated = UseCallbackResult9
				}, {
					CloseIcon = ReactModule.createElement(Icon, {
						name = "icons/navigation/close_small",
						ZIndex = 2,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.fromScale(0.5, 0.5),
						size = FoundationModule.Enums.IconSize.Small,
						style = UseTokensResult.Color.ActionEmphasis.Foreground
					})
				})
			}),
			MainViewContainer = ReactModule.createElement(View, {
				tag = "size-full",
				ZIndex = if GetFFlagMomentsCreationCloseButtonZIndexFixModule then 1 else nil,
				onAbsoluteSizeChanged = UseDescriptionKeyboardInsetModuleResult2
			}, {
				MainView = ReactModule.createElement(View, {
					tag = "col align-x-center",
					Size = UseDescriptionKeyboardInsetModuleResult:map(function(p2): UDim2
						-- upvalues: v2 (ref)
						return UDim2.new(1, 0, 1, -(p2 + v2))
					end)
				}, {
					PreviewContainer = ReactModule.createElement("CanvasGroup", {
						LayoutOrder = 1,
						Size = UDim2.fromScale(1, 1),
						BackgroundTransparency = UseTokensResult.Color.None.Transparency
					}, {
						UIFlexItem = ReactModule.createElement("UIFlexItem", {
							FlexMode = Enum.UIFlexMode.Custom,
							ShrinkRatio = if UseSignalStateResult1 then 1 else 2
						}),
						UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, UseTokensResult.Radius.Large) }),
						ClickCapture = ReactModule.createElement(View, {
							tag = "size-full",
							ZIndex = 0,
							onActivated = UseAutoDismissStateModuleResult2,
							stateLayer = {
								affordance = FoundationModule.Enums.StateLayerAffordance.None
							}
						}),
						CaptureView = ReactModule.createElement(CaptureViewModule, {
							preview = UseCreationControllerResult.preview,
							scaleType = if UseToggleStateResult.enabled then Enum.ScaleType.Fit else Enum.ScaleType.Crop,
							onAbsoluteSizeChanged = UseCallbackFunction(function(Frame)
								-- upvalues: UseMemoResult (copy)
								UseMemoResult.setItemSize(Frame.AbsoluteSize)
							end, { UseMemoResult }),
							onResolutionChanged = UseCallbackFunction(function(p2)
								-- upvalues: UseMemoResult1 (copy)
								UseMemoResult1.setItemResolution(p2)
							end, { UseMemoResult1 }),
							ttsAudio = UseCreationControllerResult.ttsAudio
						}, (UseMemoFunction(function()
							-- upvalues: UseSignalStateResult3 (copy), UseCreationControllerResult (copy), UseMemoResult3 (copy)
							local RenderPreviewLayerResults = {}
							
							for _, value in UseSignalStateResult3 do
								if value.renderPreviewLayer ~= nil then
									RenderPreviewLayerResults[value.kind .. "PreviewLayer"] = value.renderPreviewLayer(UseCreationControllerResult, UseMemoResult3)
								end
							end
							return RenderPreviewLayerResults
						end, {
							UseSignalStateResult3,
							UseCreationControllerResult,
							UseMemoResult3
						}))),
						VoiceTopScrim = if GetFFlagMomentsTTSAudioOverlayModule and UseSignalStateResult == CreationFlowStateModule.Voice then ReactModule.createElement(GradientBackdrop, {
							rotation = 90,
							zIndex = 2,
							color3 = UseTokensResult.Color.Common.Scrim.Color3,
							size = UDim2.new(1, 0, 0.25, 0)
						}) else nil,
						PreviewMediaOverlay = ReactModule.createElement(View, {
							tag = "col position-bottom-center anchor-bottom-center size-full-0 auto-y",
							ZIndex = 5
						}, {
							OtherControls = ReactModule.createElement(View, {
								tag = "size-full-0 auto-y",
								LayoutOrder = 1,
								padding = {
									bottom = UDim.new(0, UseTokensResult.Padding.Large),
									left = UDim.new(0, (math.max(UseDeviceInsetsResult.left, UseTokensResult.Padding.Large))),
									right = UDim.new(0, (math.max(UseDeviceInsetsResult.right, UseTokensResult.Padding.Large)))
								}
							}, {
								MusicIndicator = if Music and (UseSignalStateResult == CreationFlowStateModule.Preview or UseSignalStateResult == CreationFlowStateModule.Description) then if FFlagMomentsTextOverlayDragToDeleteRefinementModule and UseSignalStateResult7 then nil else ReactModule.createElement(View, { tag = "position-bottom-left anchor-bottom-left auto-xy" }, {
									MusicChip = ReactModule.createElement(MusicChipModule, {
										musicAssetId = Music.assetId,
										onActivated = UseCallbackResult5,
										onRemove = if FFlagMomentsCreationMusicChipRemoveButtonModule then UseCallbackResult6 else nil
									})
								}) else nil
							}),
							PlaybackControls = if UseSignalStateResult1 and UseSignalStateResult1.CaptureType == Enum.CaptureType.Video and (UseSignalStateResult == CreationFlowStateModule.Gallery or UseSignalStateResult == CreationFlowStateModule.Preview or GetFFlagMomentsTTSAudioOverlayModule and UseSignalStateResult == CreationFlowStateModule.Voice) and (UseAutoDismissStateModuleResult or GetFFlagMomentsTTSAudioOverlayModule and UseSignalStateResult == CreationFlowStateModule.Voice) then if UseSignalStateResult7 then nil else ReactModule.createElement(PlaybackControlsModule, {
								layoutOrder = 2,
								preview = UseCreationControllerResult.preview,
								toggleFitMode = UseToggleStateResult.toggle,
								isFitMode = UseToggleStateResult.enabled,
								onSeek = if GetFFlagMomentsTTSAudioOverlayModule and UseSignalStateResult == CreationFlowStateModule.Voice then function(p2: number)
									-- upvalues: UseCreationControllerResult (copy)
									local TtsAudio = UseCreationControllerResult.ttsAudio
									
									if TtsAudio == nil then return end
									local TimeLength: number = TtsAudio.getTimeLength(false)
									
									if TimeLength > 0 and p2 >= 0 and p2 < TimeLength then
										TtsAudio.seek(p2)
									end
								end else nil
							}) else nil
						}),
						EditCTABar = if UseSignalStateResult == CreationFlowStateModule.Preview then ReactModule.createElement(EditCTABarModule, {
							zIndex = 4,
							tools = UseSignalStateResult3,
							onToolSelected = UseCallbackResult4,
							showText = UseAutoDismissStateModuleResult,
							isLoadingMap = if UseSignalStateResult6 then { generateText = true } else nil,
							isDisabledMap = if GetFFlagEnableMomentTextGenerationFunction() and UseSignalStateResult6 then { text = true } else nil,
							onDisabledToolActivated = UseCreationControllerResult.onDisabledToolActivated,
							hidden = if FFlagMomentsTextOverlayDragToDeleteRefinementModule then UseSignalStateResult7 else nil,
							coachmark = if GetFFlagMomentsTTSAudioOverlayModule and GetFFlagMomentsTTSCoachmarkModule() then require(script.Parent.makeVoiceCoachmarkConfig)(GetFFlagMomentsTTSAudioOverlayModule, GetFFlagMomentsTTSCoachmarkModule()) else nil
						}) else nil
					}),
					GalleryView = if UseSignalStateResult == CreationFlowStateModule.Gallery then if CaptureSource == nil then ReactModule.createElement(GalleryViewModule, {
						layoutOrder = 2,
						hasMoreCaptures = false,
						onShowMore = nil,
						captures = SampleCapturesModule1,
						onCaptureSelected = UseCallbackResult,
						onNextCallback = UseCallbackResult1,
						selectedCapture = UseSignalStateResult1
					}) else ReactModule.createElement(GallerySourceView, {
						layoutOrder = 2,
						captureSource = CaptureSource,
						onCaptureSelected = UseCallbackResult,
						onNextCallback = UseCallbackResult1,
						selectedCapture = UseSignalStateResult1
					}) else nil,
					PreviewView = if UseSignalStateResult == CreationFlowStateModule.Preview then ReactModule.createElement(PreviewViewModule, {
						layoutOrder = 2,
						onContinueCallback = UseCallbackResult2,
						onReturnToGalleryCallback = if p1.excludeGallery then nil else UseCallbackResult7
					}) else nil,
					ActiveStepEditor = UseCallbackResult11("Step"),
					DescriptionView = if UseSignalStateResult == CreationFlowStateModule.Description then ReactModule.createElement(DescriptionViewModule, {
						layoutOrder = 2,
						onPublish = UseCallbackResult8,
						onReturnToEditing = UseCallbackResult3
					}) else nil
				}),
				MusicView = if FFlagMomentsCreationMusicEditorRedesignModule then ReactModule.createElement(DockedEditorContextModule.Provider, { value = Value }, { MusicView = UseCallbackResult11("Overlay") }) else UseCallbackResult11("Overlay")
			})
		}),
		Modal = UseCallbackResult10()
	})))
end

return function(p2)
	-- upvalues: ReactModule (copy), IsTextFilteredModule (copy), v1 (copy), PublishMomentModule (copy), FoundationProvider (copy), ColorMode (copy), CreationControllerProvider (copy), CreationFlowContent (copy)
	local OnExit = p2.onExit
	local Host = p2.host
	local CaptureSource = p2.captureSource
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Host (copy), OnExit (copy), CaptureSource (copy), IsTextFilteredModule (upval), v1 (upval), PublishMomentModule (upval)
		return if Host == nil then {
			exitCreationFlow = OnExit,
			captureSource = CaptureSource,
			isTextFiltered = IsTextFilteredModule,
			createMoment = if v1 then function(_, _, p3)
				print(`[moments-creation] dev publish (not uploaded): "{p13}"`)
			end else PublishMomentModule
		} else Host
	end, { Host, OnExit, CaptureSource })
	
	return ReactModule.createElement(FoundationProvider, { colorMode = ColorMode.Dark }, {
		Root = ReactModule.createElement(CreationControllerProvider, {
			host = UseMemoResult,
			excludeGallery = p2.excludeGallery
		}, {
			Content = ReactModule.createElement(CreationFlowContent, {
				excludeGallery = p2.excludeGallery,
				captureSource = UseMemoResult.captureSource,
				disableDrafts = UseMemoResult.disableDrafts,
				disableExperimentExposure = UseMemoResult.disableExperimentExposure
			})
		})
	})
end