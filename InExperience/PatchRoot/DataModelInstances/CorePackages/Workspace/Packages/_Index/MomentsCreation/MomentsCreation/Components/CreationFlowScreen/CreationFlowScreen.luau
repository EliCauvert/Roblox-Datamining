local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local cryoModule = require(parent.Cryo)
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local foundationProvider = foundationModule.FoundationProvider
local icon = foundationModule.Icon
local view = foundationModule.View
local colorMode = foundationModule.Enums.ColorMode
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local useMemo = reactModule.useMemo
local useRef = reactModule.useRef
local useTokens = foundationModule.Hooks.useTokens
local useDeviceInsets = momentsCommonModule.Hooks.useDeviceInsets
local useFormFactor = momentsCommonModule.Hooks.useFormFactor
local useToggleState = momentsCommonModule.Hooks.useToggleState
local formFactor = momentsCommonModule.Enums.FormFactor
local eventNames = momentsCommonModule.Analytics.EventNames
local sessionManager = momentsCommonModule.Analytics.SessionManager
local funnelEventNames = momentsCommonModule.Analytics.FunnelEventNames
local fireAnalyticsEventModule = require(momentsCreation.Analytics.fireAnalyticsEvent)
local makeCreationEventFieldsModule = require(momentsCreation.Analytics.makeCreationEventFields)
local getFFlagEnableMomentTextGeneration = momentsCommonModule.Flags.GetFFlagEnableMomentTextGeneration
local getFFlagMomentsAnalyticsProducerPrereqs = momentsCommonModule.Flags.GetFFlagMomentsAnalyticsProducerPrereqs
local getFFlagMomentsCreationSaveDraft = momentsCommonModule.Flags.GetFFlagMomentsCreationSaveDraft
local useSignalState = signalsReactModule.useSignalState
local creationControllerModule = require(momentsCreation.CreationController)
local creationControllerProvider = creationControllerModule.CreationControllerProvider
local useCreationController = creationControllerModule.useCreationController
local useAutoDismissStateModule = require(momentsCreation.Hooks.useAutoDismissState)
local useDraftRestoreEffectModule = require(momentsCreation.Hooks.useDraftRestoreEffect)
local useDraftSaveEffectModule = require(momentsCreation.Hooks.useDraftSaveEffect)
local useDescriptionKeyboardInsetModule = require(momentsCreation.Hooks.useDescriptionKeyboardInset)
local getFFlagMomentsDescriptionKeyboardAvoidanceModule = require(momentsCreation.Flags.GetFFlagMomentsDescriptionKeyboardAvoidance)
local getFFlagMomentsCreationBlockBackgroundInteractionModule = require(momentsCreation.Flags.GetFFlagMomentsCreationBlockBackgroundInteraction)
local getFFlagMomentsStickerButton = momentsCommonModule.Flags.GetFFlagMomentsStickerButton
local getFFlagMomentsCreationTextOverlayResolutionScaleModule = require(momentsCreation.Flags.GetFFlagMomentsCreationTextOverlayResolutionScale)
local getFFlagMomentsTTSAudioOverlayModule = require(momentsCreation.Flags.GetFFlagMomentsTTSAudioOverlay)
local getFFlagMomentsCreationCloseButtonZIndexFixModule = require(momentsCreation.Flags.GetFFlagMomentsCreationCloseButtonZIndexFix)
local stepStubModule = require(script.Parent.StepStub)
local creationFlowStateModule = require(momentsCreation.Enums.CreationFlowState)
local dialogTypeModule = require(momentsCreation.Enums.DialogType)
local _ = require(momentsCreation.Types.CreationFlowTypes)
local captureViewModule = require(momentsCreation.Components.CaptureView)
local creationMediaProviderModule = require(momentsCreation.Components.CreationMediaProvider)
local descriptionViewModule = require(momentsCreation.Components.DescriptionView)
local editCTABarModule = require(momentsCreation.Components.EditCTABar)
local galleryViewModule = require(momentsCreation.Components.GalleryView)
local playbackControlsModule = require(momentsCreation.Components.PlaybackControls)
local previewViewModule = require(momentsCreation.Components.PreviewView)
local exitConfirmationDialogModule = require(momentsCreation.Components.Dialogs.ExitConfirmationDialog)
local textFilteredDialogModule = require(momentsCreation.Components.Dialogs.TextFilteredDialog)
local generateTextOptionsDialogModule = require(momentsCreation.Components.Dialogs.GenerateTextOptionsDialog)
local voiceoverErrorDialogModule = require(momentsCreation.Components.Dialogs.VoiceoverErrorDialog)
local voiceoverDeleteConfirmDialogModule = require(momentsCreation.Components.Dialogs.VoiceoverDeleteConfirmDialog)
local voiceBackControlsModule = require(momentsCreation.Components.Voice.VoiceBackControls)
local sampleCapturesModule = require(momentsCreation.Capture.sampleCaptures)
local publishMomentModule = require(momentsCreation.Upload.publishMoment)
local isTextFilteredModule = require(momentsCreation.Moderation.isTextFiltered)
local musicChipModule = require(momentsCreation.Components.MusicChip)
local var39 = require(parent.MomentsCommon.isStudio)()
local var40 = if var39 then sampleCapturesModule else {}

local function noopActivated() end

local t = {
	affordance = foundationModule.Enums.StateLayerAffordance.None
}

local function GallerySourceView(p0)
	-- upvalues: useSignalState (ref), reactModule (ref), galleryViewModule (ref)
	local captureSource = p0.captureSource
	
	return reactModule.createElement(galleryViewModule, {
		captures = useSignalState(captureSource.getCaptures),
		layoutOrder = p0.layoutOrder,
		onCaptureSelected = p0.onCaptureSelected,
		onNextCallback = p0.onNextCallback,
		selectedCapture = p0.selectedCapture,
		hasMoreCaptures = not useSignalState(captureSource.getIsFinished),
		onShowMore = captureSource.fetchMore
	})
end

local function CreationFlowContent(p1)
	-- upvalues: useCreationController (ref), getFFlagMomentsCreationSaveDraft (ref), useDraftRestoreEffectModule (ref), useDraftSaveEffectModule (ref), useDeviceInsets (ref), useTokens (ref), useFormFactor (ref), useToggleState (ref), useAutoDismissStateModule (ref), useSignalState (ref), useDescriptionKeyboardInsetModule (ref), getFFlagMomentsDescriptionKeyboardAvoidanceModule (ref), creationFlowStateModule (ref), useCallback (ref), sessionManager (ref), funnelEventNames (ref), cryoModule (ref), makeCreationEventFieldsModule (ref), getFFlagMomentsAnalyticsProducerPrereqs (ref), fireAnalyticsEventModule (ref), eventNames (ref), dialogTypeModule (ref), useRef (ref), useEffect (ref), getFFlagMomentsStickerButton (ref), getFFlagMomentsTTSAudioOverlayModule (ref), reactModule (ref), exitConfirmationDialogModule (ref), textFilteredDialogModule (ref), generateTextOptionsDialogModule (ref), voiceoverErrorDialogModule (ref), voiceoverDeleteConfirmDialogModule (ref), stepStubModule (ref), useMemo (ref), signalsModule (ref), getFFlagMomentsCreationBlockBackgroundInteractionModule (ref), view (ref), t (ref), formFactor (ref), noopActivated (ref), voiceBackControlsModule (ref), getFFlagMomentsCreationCloseButtonZIndexFixModule (ref), icon (ref), foundationModule (ref), captureViewModule (ref), getFFlagMomentsCreationTextOverlayResolutionScaleModule (ref), musicChipModule (ref), playbackControlsModule (ref), editCTABarModule (ref), getFFlagEnableMomentTextGeneration (ref), GallerySourceView (ref), galleryViewModule (ref), var40 (ref), previewViewModule (ref), descriptionViewModule (ref), creationMediaProviderModule (ref)
	local var45 = useCreationController()
	
	if getFFlagMomentsCreationSaveDraft() then
		useDraftRestoreEffectModule(p1.captureSource)
		useDraftSaveEffectModule()
	end
	local var98
	local var46 = useDeviceInsets()
	local var47 = useTokens()
	local var48 = useFormFactor()
	local var49 = useToggleState(false)
	local var50, var51 = useAutoDismissStateModule()
	local var52 = useSignalState(var45.getStep)
	local var53 = useSignalState(var45.getSelectedCapture)
	local var54 = useSignalState(var45.getComposedEdits)
	local var55 = useSignalState(var45.getAvailableTools)
	local var56 = useSignalState(var45.getActiveTool)
	local var57 = useSignalState(var45.getActiveModal)
	local var58 = useSignalState(var45.getIsGenerating)
	local music = var54.music
	local var59, var60 = useDescriptionKeyboardInsetModule(getFFlagMomentsDescriptionKeyboardAvoidanceModule() and var52 == creationFlowStateModule.Description)
	local captureSource = p1.captureSource
	local var61 = useCallback(function(p2)
		-- upvalues: var45 (ref), var51 (ref)
		var45.selectCapture(p2)
		var51()
	end, { var45, var51 })
	
	local function withCreationSession(p3)
		-- upvalues: sessionManager (copy), funnelEventNames (copy), cryoModule (copy), makeCreationEventFieldsModule (copy)
		return cryoModule.Dictionary.join(p3, makeCreationEventFieldsModule.makeCreationBaseFields(sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow)))
	end
	
	local function flowStepFields()
		-- upvalues: getFFlagMomentsAnalyticsProducerPrereqs (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), var45 (ref)
		return if getFFlagMomentsAnalyticsProducerPrereqs() then withCreationSession(makeCreationEventFieldsModule.makeStepFieldFromState(var45.getStep(false))) else { step = var45.getStep(false) }
	end
	
	local var64 = useCallback(function()
		-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), flowStepFields (ref), var45 (ref), creationFlowStateModule (copy), var51 (ref), withCreationSession (ref), makeCreationEventFieldsModule (copy)
		fireAnalyticsEventModule(eventNames.EditingFlowNextButtonPressed, flowStepFields())
		var45.navigate(creationFlowStateModule.Preview)
		var51()
		fireAnalyticsEventModule(eventNames.MomentsEditingFlowContinueToEditButtonPressed, withCreationSession(makeCreationEventFieldsModule.makeStepField(eventNames.MomentsEditingFlowContinueToEditButtonPressed)))
	end, { var45, var51 })
	local var65 = useCallback(function()
		-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), flowStepFields (ref), var45 (ref), creationFlowStateModule (copy), var49 (ref), withCreationSession (ref), makeCreationEventFieldsModule (copy)
		fireAnalyticsEventModule(eventNames.EditingFlowNextButtonPressed, flowStepFields())
		var45.navigate(creationFlowStateModule.Description)
		var49.disable()
		fireAnalyticsEventModule(eventNames.MomentsEditingFlowContinueToDescriptionButtonPressed, withCreationSession(makeCreationEventFieldsModule.makeStepField(eventNames.MomentsEditingFlowContinueToDescriptionButtonPressed)))
	end, { var45, var49.disable })
	local var66 = useCallback(function()
		-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), flowStepFields (ref), var45 (ref), creationFlowStateModule (copy)
		fireAnalyticsEventModule(eventNames.EditingFlowReturnButtonPressed, flowStepFields())
		var45.navigate(creationFlowStateModule.Preview)
	end, { var45 })
	local var67 = useCallback(function(p4)
		-- upvalues: var45 (ref)
		var45.beginTool(p4)
	end, { var45 })
	local var68 = useCallback(function()
		-- upvalues: var45 (ref)
		var45.beginTool("music")
	end, { var45 })
	local var69 = useCallback(function()
		-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), flowStepFields (ref), var45 (ref), dialogTypeModule (copy), var49 (ref)
		fireAnalyticsEventModule(eventNames.EditingFlowReturnButtonPressed, flowStepFields())
		var45.showModal({
			modalType = dialogTypeModule.ExitCreationConfirmation,
			modalProps = {
				onCancel = var45.dismissModal,
				onConfirm = function()
					-- upvalues: var45 (copy), var49 (copy)
					var45.dismissModal()
					var45.returnToGallery()
					var49.disable()
				end
			}
		})
	end, { var45, var49.disable })
	local var70 = useCallback(function()
		-- upvalues: var45 (ref)
		var45.publish()
	end, { var45 })
	local var71 = useCallback(function()
		-- upvalues: var53 (ref), var45 (ref), dialogTypeModule (copy)
		if var53 then
			var45.showModal({
				modalType = dialogTypeModule.ExitCreationConfirmation,
				modalProps = { onCancel = var45.dismissModal, onConfirm = var45.exit }
			})
			
			return
		end
		var45.exit()
	end, { var45, var53 })
	local var72 = useRef(nil)
	useEffect(function()
		-- upvalues: var72 (ref), var52 (ref), creationFlowStateModule (copy), fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), getFFlagMomentsStickerButton (copy), getFFlagMomentsTTSAudioOverlayModule (copy)
		local current = var72.current
		var72.current = var52
		
		if var52 == creationFlowStateModule.Gallery then
			fireAnalyticsEventModule(eventNames.EditingFlowGalleryPageAppear, withCreationSession(makeCreationEventFieldsModule.makeStepField(eventNames.EditingFlowGalleryPageAppear)))
			
			return
		elseif var52 == creationFlowStateModule.Preview then
			if if current ~= creationFlowStateModule.Trimming then if current ~= creationFlowStateModule.Music then if current ~= creationFlowStateModule.TextOverlay then if getFFlagMomentsStickerButton() then true else getFFlagMomentsTTSAudioOverlayModule and current == creationFlowStateModule.Voice else true else true else true then
				return
			else
				fireAnalyticsEventModule(eventNames.EditingFlowEditPageAppear, withCreationSession(makeCreationEventFieldsModule.makeStepField(eventNames.EditingFlowEditPageAppear)))
				
				return
			end
		elseif var52 == creationFlowStateModule.Description then
			fireAnalyticsEventModule(eventNames.EditingFlowPreviewPageAppear, withCreationSession(makeCreationEventFieldsModule.makeStepField(eventNames.EditingFlowPreviewPageAppear)))
		end
	end, { var52 })
	useEffect(function()
		-- upvalues: var52 (ref), creationFlowStateModule (copy), var49 (ref)
		if var52 == creationFlowStateModule.Gallery or var52 == creationFlowStateModule.Music or var52 == creationFlowStateModule.Description then
			var49.disable()
		end
	end, { var52, var49.disable })
	local var73 = useCallback(function()
		-- upvalues: var57 (ref), dialogTypeModule (copy), reactModule (copy), exitConfirmationDialogModule (copy), textFilteredDialogModule (copy), generateTextOptionsDialogModule (copy), voiceoverErrorDialogModule (copy), voiceoverDeleteConfirmDialogModule (copy)
		return if not (not var57 or not var57.modalType) then if var57.modalType == dialogTypeModule.ExitCreationConfirmation then reactModule.createElement(exitConfirmationDialogModule, var57.modalProps) elseif var57.modalType == dialogTypeModule.TextFiltered then reactModule.createElement(textFilteredDialogModule, var57.modalProps) elseif var57.modalType == dialogTypeModule.GenerateTextOptions then reactModule.createElement(generateTextOptionsDialogModule, var57.modalProps) elseif var57.modalType == dialogTypeModule.VoiceoverError then reactModule.createElement(voiceoverErrorDialogModule, var57.modalProps) elseif var57.modalType == dialogTypeModule.VoiceoverDelete then reactModule.createElement(voiceoverDeleteConfirmDialogModule, var57.modalProps) else nil else nil
	end, { var57 })
	local var74 = useCallback(function(p5)
		-- upvalues: var56 (ref), var52 (ref), var45 (ref), reactModule (copy), stepStubModule (copy)
		if var56 == nil or var56.presentation ~= p5 or var52 ~= var56.step then
			return nil
		elseif var56.renderEditor ~= nil then
			local var99 = var56.renderEditor(var45)
			
			return if var99 == nil then reactModule.createElement(stepStubModule(var56.kind), {}) else var99
		end
	end, { var56, var52, var45 })
	local var75 = useMemo(function()
		-- upvalues: signalsModule (copy)
		local var100, var101 = signalsModule.createSignal(Vector2.zero)
		
		return { getItemSize = var100, setItemSize = var101 }
	end, {})
	local var76 = useMemo(function()
		-- upvalues: signalsModule (copy)
		local var102, var103 = signalsModule.createSignal(Vector2.zero)
		
		return { getItemResolution = var102, setItemResolution = var103 }
	end, {})
	local var77 = useMemo(function()
		-- upvalues: signalsModule (copy)
		local var104, var105 = signalsModule.createSignal(false)
		
		return { get = var104, set = var105 }
	end, {})
	local var78 = useSignalState(var77.get)
	local var79 = useMemo(function()
		-- upvalues: var75 (ref), var76 (ref), var77 (ref)
		return {
			getItemSize = var75.getItemSize,
			getItemResolution = var76.getItemResolution,
			setIsOverlayDragging = var77.set
		}
	end, { var75, var76, var77 })
	local var80 = useCallback(function(p6)
		-- upvalues: var75 (ref)
		var75.setItemSize(p6.AbsoluteSize)
	end, { var75 })
	local var81 = useCallback(function(p7)
		-- upvalues: var76 (ref)
		var76.setItemResolution(p7)
	end, { var76 })
	local var82 = useMemo(function()
		-- upvalues: var55 (ref), var45 (ref), var79 (ref)
		local t = {}
		
		for i, v in var55 do
			if v.renderPreviewLayer ~= nil then
				t[v.kind .. "PreviewLayer"] = v.renderPreviewLayer(var45, var79)
			end
		end
		return t
	end, { var55, var45, var79 })
	local var83 = if var49.enabled then Enum.ScaleType.Fit else Enum.ScaleType.Crop
	local var84 = getFFlagMomentsCreationBlockBackgroundInteractionModule()
	local createElement = reactModule.createElement
	local t_1 = {
		tag = "position-center-center anchor-center-center size-full-full",
		backgroundStyle = var47.Color.Common.Scrim,
		onActivated = if var84 then var71 else nil,
		stateLayer = if var84 then t else nil,
		testId = if var84 then "moments-creation-background-scrim" else nil
	}
	local t_2 = {}
	local createElement_1 = reactModule.createElement
	local t_3 = {
		tag = "position-center-center anchor-center-center size-full-full radius-large bg-surface-0",
		sizeConstraint = {
			MaxSize = if var48 == formFactor.Wide then Vector2.new(600, 700) else nil
		},
		onActivated = if var84 then noopActivated else nil,
		stateLayer = if var84 then t else nil,
		testId = if var84 then "moments-creation-panel" else nil
	}
	local t_4 = {
		VoiceBackControls = if getFFlagMomentsTTSAudioOverlayModule and var52 == creationFlowStateModule.Voice then reactModule.createElement(voiceBackControlsModule) else nil,
		CloseButtonContainer = if getFFlagMomentsTTSAudioOverlayModule and var52 == creationFlowStateModule.Voice then nil else reactModule.createElement(view, {
			tag = "position-top-right anchor-top-right auto-xy",
			padding = {
				top = UDim.new(0, var46.top + var47.Padding.Medium),
				right = UDim.new(0, var46.right + var47.Padding.Medium)
			},
			ZIndex = if getFFlagMomentsCreationCloseButtonZIndexFixModule then 10 else nil
		}, {
			CloseButton = reactModule.createElement(view, {
				LayoutOrder = 1,
				tag = "size-1100-1100 padding-medium radius-circle bg-over-media-0",
				onActivated = var71
			}, {
				CloseIcon = reactModule.createElement(icon, {
					name = "icons/navigation/close_small",
					ZIndex = 2,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					size = foundationModule.Enums.IconSize.Small,
					style = var47.Color.ActionEmphasis.Foreground
				})
			})
		})
	}
	local createElement_2 = reactModule.createElement
	local t_5 = {
		tag = "size-full",
		ZIndex = if getFFlagMomentsCreationCloseButtonZIndexFixModule then 1 else nil,
		onAbsoluteSizeChanged = var60
	}
	local t_6 = {}
	local createElement_3 = reactModule.createElement
	local t_7 = {
		tag = "col align-x-center",
		Size = var59:map(function(p8)
			return UDim2.new(1, 0, 1, -p8)
		end)
	}
	local t_8 = {}
	local createElement_4 = reactModule.createElement
	local var93 = "CanvasGroup"
	local t_9 = {
		LayoutOrder = 1,
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = var47.Color.None.Transparency
	}
	local t_10 = {
		UIFlexItem = reactModule.createElement("UIFlexItem", {
			FlexMode = Enum.UIFlexMode.Custom,
			ShrinkRatio = if var53 then 1 else 2
		}),
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var47.Radius.Large) }),
		ClickCapture = reactModule.createElement(view, {
			tag = "size-full",
			ZIndex = 0,
			onActivated = var51,
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			}
		}),
		CaptureView = reactModule.createElement(captureViewModule, {
			preview = var45.preview,
			scaleType = var83,
			onAbsoluteSizeChanged = var80,
			onResolutionChanged = if getFFlagMomentsCreationTextOverlayResolutionScaleModule() then var81 else nil
		}, var82)
	}
	local createElement_5 = reactModule.createElement
	local t_11 = {
		tag = "col position-bottom-center anchor-bottom-center size-full-0 auto-y",
		ZIndex = 5
	}
	local t_12 = {
		OtherControls = reactModule.createElement(view, {
			tag = "size-full-0 auto-y",
			LayoutOrder = 1,
			padding = {
				bottom = UDim.new(0, var47.Padding.Large),
				left = UDim.new(0, math.max(var46.left, var47.Padding.Large)),
				right = UDim.new(0, math.max(var46.right, var47.Padding.Large))
			}
		}, {
			MusicIndicator = if music and (var52 == creationFlowStateModule.Preview or var52 == creationFlowStateModule.Description) then reactModule.createElement(view, { tag = "position-bottom-left anchor-bottom-left auto-xy" }, {
				MusicChip = reactModule.createElement(musicChipModule, { musicAssetId = music.assetId, onActivated = var68 })
			}) else nil
		})
	}
	
	if var53 and var53.CaptureType == Enum.CaptureType.Video and (var52 == creationFlowStateModule.Gallery or var52 == creationFlowStateModule.Preview or getFFlagMomentsTTSAudioOverlayModule and var52 == creationFlowStateModule.Voice) and ((var50 or getFFlagMomentsTTSAudioOverlayModule and var52 == creationFlowStateModule.Voice) and not var78) then
		var98 = reactModule.createElement
		var98 = var98(playbackControlsModule, {
			layoutOrder = 2,
			preview = var45.preview,
			toggleFitMode = var49.toggle,
			isFitMode = var49.enabled,
			onSeek = if getFFlagMomentsTTSAudioOverlayModule and var52 == creationFlowStateModule.Voice then function(p9)
				-- upvalues: var45 (ref)
				local ttsAudio = var45.ttsAudio
				
				if ttsAudio == nil then return end
				local timeLength = ttsAudio.getTimeLength(false)
				
				if timeLength > 0 and p9 >= 0 and p9 < timeLength then
					ttsAudio.seek(p9)
				end
			end else nil
		})
	else
		var98 = nil
	end
	local createElement_6
	t_12.PlaybackControls = var98
	t_10.PreviewMediaOverlay = createElement_5(view, t_11, t_12)
	
	if var52 == creationFlowStateModule.Preview then
		createElement_6 = reactModule.createElement
		createElement_6 = createElement_6(editCTABarModule, {
			zIndex = 4,
			tools = var55,
			onToolSelected = var67,
			showText = var50,
			isLoadingMap = if var58 then { generateText = true } else nil,
			isDisabledMap = if getFFlagEnableMomentTextGeneration() and var58 then { text = true } else nil,
			onDisabledToolActivated = var45.onDisabledToolActivated,
			coachmark = if getFFlagMomentsTTSAudioOverlayModule then {
				kind = "voice",
				title = "Narrate the video",
				text = "Use text to speech to tell your story along with the video"
			} else nil
		})
	else
		createElement_6 = nil
	end
	t_10.EditCTABar = createElement_6
	t_8.PreviewContainer = createElement_4(var93, t_9, t_10)
	t_8.GalleryView = if var52 ~= creationFlowStateModule.Gallery then if captureSource ~= nil then reactModule.createElement(galleryViewModule, {
		layoutOrder = 2,
		hasMoreCaptures = false,
		onShowMore = nil,
		captures = var40,
		onCaptureSelected = var61,
		onNextCallback = var64,
		selectedCapture = var53
	}) else reactModule.createElement(GallerySourceView, {
		layoutOrder = 2,
		captureSource = captureSource,
		onCaptureSelected = var61,
		onNextCallback = var64,
		selectedCapture = var53
	}) else nil
	t_8.PreviewView = if var52 == creationFlowStateModule.Preview then reactModule.createElement(previewViewModule, {
		layoutOrder = 2,
		onContinueCallback = var65,
		onReturnToGalleryCallback = if not p1.excludeGallery then var69 else nil
	}) else nil
	t_8.ActiveStepEditor = var74("Step")
	t_8.DescriptionView = if var52 == creationFlowStateModule.Description then reactModule.createElement(descriptionViewModule, {
		layoutOrder = 2,
		onPublish = var70,
		onReturnToEditing = var66
	}) else nil
	t_6.MainView = createElement_3(view, t_7, t_8)
	t_6.MusicView = var74("Overlay")
	t_4.MainViewContainer = createElement_2(view, t_5, t_6)
	t_2.CreationFlowView = createElement_1(view, t_3, t_4)
	t_2.Modal = var73()
	
	return reactModule.createElement(creationMediaProviderModule, {
		preview = var45.preview,
		getSelectedCapture = var45.getSelectedCapture
	}, createElement(view, t_1, t_2))
end

return function(p10)
	-- upvalues: reactModule (ref), isTextFilteredModule (ref), var39 (ref), publishMomentModule (ref), foundationProvider (ref), colorMode (ref), creationControllerProvider (ref), CreationFlowContent (ref)
	local onExit = p10.onExit
	local host = p10.host
	local captureSource = p10.captureSource
	local var108 = reactModule.useMemo(function()
		-- upvalues: host (ref), onExit (ref), captureSource (ref), isTextFilteredModule (copy), var39 (copy), publishMomentModule (copy)
		return if host == nil then {
			exitCreationFlow = onExit,
			captureSource = captureSource,
			isTextFiltered = isTextFilteredModule,
			createMoment = if var39 then function(_, _, p11)
				print(`[moments-creation] dev publish (not uploaded): "{p11}"`)
			end else publishMomentModule
		} else host
	end, { host, onExit, captureSource })
	
	return reactModule.createElement(foundationProvider, { colorMode = colorMode.Dark }, {
		Root = reactModule.createElement(creationControllerProvider, { host = var108, excludeGallery = p10.excludeGallery }, {
			Content = reactModule.createElement(CreationFlowContent, {
				excludeGallery = p10.excludeGallery,
				captureSource = var108.captureSource
			})
		})
	})
end