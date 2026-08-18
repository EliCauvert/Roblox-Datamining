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
local voiceoverErrorDialogModule = require(momentsCreation.Components.Dialogs.VoiceoverErrorDialog)
local voiceBackControlsModule = require(momentsCreation.Components.Voice.VoiceBackControls)
local sampleCapturesModule = require(momentsCreation.Capture.sampleCaptures)
local publishMomentModule = require(momentsCreation.Upload.publishMoment)
local isTextFilteredModule = require(momentsCreation.Moderation.isTextFiltered)
local musicChipModule = require(momentsCreation.Components.MusicChip)
local var36 = require(parent.MomentsCommon.isStudio)()
local var37 = if var36 then sampleCapturesModule else {}

local function noopActivated() --[[ line: 113 ]] end

local t = {
	affordance = foundationModule.Enums.StateLayerAffordance.None
}

local function GallerySourceView(p0) --[[ line: 120 ]]
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

local function CreationFlowContent(p1) --[[ line: 142 ]]
	-- upvalues: useCreationController (ref), getFFlagMomentsCreationSaveDraft (ref), useDraftRestoreEffectModule (ref), useDraftSaveEffectModule (ref), useDeviceInsets (ref), useTokens (ref), useFormFactor (ref), useToggleState (ref), useAutoDismissStateModule (ref), useSignalState (ref), useDescriptionKeyboardInsetModule (ref), getFFlagMomentsDescriptionKeyboardAvoidanceModule (ref), creationFlowStateModule (ref), useCallback (ref), sessionManager (ref), funnelEventNames (ref), cryoModule (ref), makeCreationEventFieldsModule (ref), getFFlagMomentsAnalyticsProducerPrereqs (ref), fireAnalyticsEventModule (ref), eventNames (ref), dialogTypeModule (ref), useRef (ref), useEffect (ref), getFFlagMomentsStickerButton (ref), getFFlagMomentsTTSAudioOverlayModule (ref), reactModule (ref), exitConfirmationDialogModule (ref), textFilteredDialogModule (ref), voiceoverErrorDialogModule (ref), stepStubModule (ref), useMemo (ref), signalsModule (ref), getFFlagMomentsCreationBlockBackgroundInteractionModule (ref), view (ref), t (ref), formFactor (ref), noopActivated (ref), voiceBackControlsModule (ref), icon (ref), foundationModule (ref), captureViewModule (ref), getFFlagMomentsCreationTextOverlayResolutionScaleModule (ref), musicChipModule (ref), playbackControlsModule (ref), editCTABarModule (ref), getFFlagEnableMomentTextGeneration (ref), GallerySourceView (ref), galleryViewModule (ref), var37 (ref), previewViewModule (ref), descriptionViewModule (ref), creationMediaProviderModule (ref)
	local var42 = useCreationController()
	
	if getFFlagMomentsCreationSaveDraft() then
		useDraftRestoreEffectModule(p1.captureSource)
		useDraftSaveEffectModule()
	end
	local var93
	local var43 = useDeviceInsets()
	local var44 = useTokens()
	local var45 = useFormFactor()
	local var46 = useToggleState(false)
	local var47, var48 = useAutoDismissStateModule()
	local var49 = useSignalState(var42.getStep)
	local var50 = useSignalState(var42.getSelectedCapture)
	local var51 = useSignalState(var42.getComposedEdits)
	local var52 = useSignalState(var42.getAvailableTools)
	local var53 = useSignalState(var42.getActiveTool)
	local var54 = useSignalState(var42.getActiveModal)
	local var55 = useSignalState(var42.getIsGenerating)
	local music = var51.music
	local var56, var57 = useDescriptionKeyboardInsetModule(getFFlagMomentsDescriptionKeyboardAvoidanceModule() and var49 == creationFlowStateModule.Description)
	local captureSource = p1.captureSource
	local var58 = useCallback(function(p2) --[[ line: 182 ]]
		-- upvalues: var42 (ref), var48 (ref)
		var42.selectCapture(p2)
		var48()
	end, { var42, var48 })
	
	local function withCreationSession(p3) --[[ line: 191 ]]
		-- upvalues: sessionManager (copy), funnelEventNames (copy), cryoModule (copy), makeCreationEventFieldsModule (copy)
		return cryoModule.Dictionary.join(p3, makeCreationEventFieldsModule.makeCreationBaseFields(sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow)))
	end
	
	local function flowStepFields() --[[ line: 201 ]]
		-- upvalues: getFFlagMomentsAnalyticsProducerPrereqs (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), var42 (ref)
		return if getFFlagMomentsAnalyticsProducerPrereqs() then withCreationSession(makeCreationEventFieldsModule.makeStepFieldFromState(var42.getStep(false))) else { step = var42.getStep(false) }
	end
	
	local var61 = useCallback(function() --[[ line: 211 ]]
		-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), flowStepFields (ref), var42 (ref), creationFlowStateModule (copy), var48 (ref), withCreationSession (ref), makeCreationEventFieldsModule (copy)
		fireAnalyticsEventModule(eventNames.EditingFlowNextButtonPressed, flowStepFields())
		var42.navigate(creationFlowStateModule.Preview)
		var48()
		fireAnalyticsEventModule(eventNames.MomentsEditingFlowContinueToEditButtonPressed, withCreationSession(makeCreationEventFieldsModule.makeStepField(eventNames.MomentsEditingFlowContinueToEditButtonPressed)))
	end, { var42, var48 })
	local var62 = useCallback(function() --[[ line: 224 ]]
		-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), flowStepFields (ref), var42 (ref), creationFlowStateModule (copy), var46 (ref), withCreationSession (ref), makeCreationEventFieldsModule (copy)
		fireAnalyticsEventModule(eventNames.EditingFlowNextButtonPressed, flowStepFields())
		var42.navigate(creationFlowStateModule.Description)
		var46.disable()
		fireAnalyticsEventModule(eventNames.MomentsEditingFlowContinueToDescriptionButtonPressed, withCreationSession(makeCreationEventFieldsModule.makeStepField(eventNames.MomentsEditingFlowContinueToDescriptionButtonPressed)))
	end, { var42, var46.disable })
	local var63 = useCallback(function() --[[ line: 237 ]]
		-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), flowStepFields (ref), var42 (ref), creationFlowStateModule (copy)
		fireAnalyticsEventModule(eventNames.EditingFlowReturnButtonPressed, flowStepFields())
		var42.navigate(creationFlowStateModule.Preview)
	end, { var42 })
	local var64 = useCallback(function(p4) --[[ line: 242 ]]
		-- upvalues: var42 (ref)
		var42.beginTool(p4)
	end, { var42 })
	local var65 = useCallback(function() --[[ line: 246 ]]
		-- upvalues: var42 (ref)
		var42.beginTool("music")
	end, { var42 })
	local var66 = useCallback(function() --[[ line: 250 ]]
		-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), flowStepFields (ref), var42 (ref), dialogTypeModule (copy), var46 (ref)
		fireAnalyticsEventModule(eventNames.EditingFlowReturnButtonPressed, flowStepFields())
		var42.showModal({
			modalType = dialogTypeModule.ExitCreationConfirmation,
			modalProps = {
				onCancel = var42.dismissModal,
				onConfirm = function() --[[ line: 256 ]]
					-- upvalues: var42 (copy), var46 (copy)
					var42.dismissModal()
					var42.returnToGallery()
					var46.disable()
				end
			}
		})
	end, { var42, var46.disable })
	local var67 = useCallback(function() --[[ line: 265 ]]
		-- upvalues: var42 (ref)
		var42.publish()
	end, { var42 })
	local var68 = useCallback(function() --[[ line: 269 ]]
		-- upvalues: var50 (ref), var42 (ref), dialogTypeModule (copy)
		if var50 then
			var42.showModal({
				modalType = dialogTypeModule.ExitCreationConfirmation,
				modalProps = { onCancel = var42.dismissModal, onConfirm = var42.exit }
			})
			
			return
		end
		var42.exit()
	end, { var42, var50 })
	local var69 = useRef(nil)
	useEffect(function() --[[ line: 284 ]]
		-- upvalues: var69 (ref), var49 (ref), creationFlowStateModule (copy), fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), getFFlagMomentsStickerButton (copy), getFFlagMomentsTTSAudioOverlayModule (copy)
		local current = var69.current
		var69.current = var49
		
		if var49 == creationFlowStateModule.Gallery then
			fireAnalyticsEventModule(eventNames.EditingFlowGalleryPageAppear, withCreationSession(makeCreationEventFieldsModule.makeStepField(eventNames.EditingFlowGalleryPageAppear)))
			
			return
		elseif var49 == creationFlowStateModule.Preview then
			if if current ~= creationFlowStateModule.Trimming then if current ~= creationFlowStateModule.Music then if current ~= creationFlowStateModule.TextOverlay then if getFFlagMomentsStickerButton() then true else getFFlagMomentsTTSAudioOverlayModule and current == creationFlowStateModule.Voice else true else true else true then
				return
			else
				fireAnalyticsEventModule(eventNames.EditingFlowEditPageAppear, withCreationSession(makeCreationEventFieldsModule.makeStepField(eventNames.EditingFlowEditPageAppear)))
				
				return
			end
		elseif var49 == creationFlowStateModule.Description then
			fireAnalyticsEventModule(eventNames.EditingFlowPreviewPageAppear, withCreationSession(makeCreationEventFieldsModule.makeStepField(eventNames.EditingFlowPreviewPageAppear)))
		end
	end, { var49 })
	useEffect(function() --[[ line: 317 ]]
		-- upvalues: var49 (ref), creationFlowStateModule (copy), var46 (ref)
		if var49 == creationFlowStateModule.Gallery or var49 == creationFlowStateModule.Music or var49 == creationFlowStateModule.Description then
			var46.disable()
		end
	end, { var49, var46.disable })
	local var70 = useCallback(function() --[[ line: 327 ]]
		-- upvalues: var54 (ref), dialogTypeModule (copy), reactModule (copy), exitConfirmationDialogModule (copy), textFilteredDialogModule (copy), voiceoverErrorDialogModule (copy)
		return if not (not var54 or not var54.modalType) then if var54.modalType == dialogTypeModule.ExitCreationConfirmation then reactModule.createElement(exitConfirmationDialogModule, var54.modalProps) elseif var54.modalType == dialogTypeModule.TextFiltered then reactModule.createElement(textFilteredDialogModule, var54.modalProps) elseif var54.modalType == dialogTypeModule.VoiceoverError then reactModule.createElement(voiceoverErrorDialogModule, var54.modalProps) else nil else nil
	end, { var54 })
	local var71 = useCallback(function(p5) --[[ line: 343 ]]
		-- upvalues: var53 (ref), var49 (ref), var42 (ref), reactModule (copy), stepStubModule (copy)
		if var53 == nil or var53.presentation ~= p5 or var49 ~= var53.step then
			return nil
		elseif var53.renderEditor ~= nil then
			local var94 = var53.renderEditor(var42)
			
			return if var94 == nil then reactModule.createElement(stepStubModule(var53.kind), {}) else var94
		end
	end, { var53, var49, var42 })
	local var72 = useMemo(function() --[[ line: 361 ]]
		-- upvalues: signalsModule (copy)
		local var95, var96 = signalsModule.createSignal(Vector2.zero)
		
		return { getItemSize = var95, setItemSize = var96 }
	end, {})
	local var73 = useMemo(function() --[[ line: 369 ]]
		-- upvalues: signalsModule (copy)
		local var97, var98 = signalsModule.createSignal(Vector2.zero)
		
		return { getItemResolution = var97, setItemResolution = var98 }
	end, {})
	local var74 = useMemo(function() --[[ line: 374 ]]
		-- upvalues: var72 (ref), var73 (ref)
		return {
			getItemSize = var72.getItemSize,
			getItemResolution = var73.getItemResolution
		}
	end, { var72, var73 })
	local var75 = useCallback(function(p6) --[[ line: 378 ]]
		-- upvalues: var72 (ref)
		var72.setItemSize(p6.AbsoluteSize)
	end, { var72 })
	local var76 = useCallback(function(p7) --[[ line: 382 ]]
		-- upvalues: var73 (ref)
		var73.setItemResolution(p7)
	end, { var73 })
	local var77 = useMemo(function() --[[ line: 386 ]]
		-- upvalues: var52 (ref), var42 (ref), var74 (ref)
		local t = {}
		
		for i, v in var52 do
			if v.renderPreviewLayer ~= nil then
				t[v.kind .. "PreviewLayer"] = v.renderPreviewLayer(var42, var74)
			end
		end
		return t
	end, { var52, var42, var74 })
	local var78 = if var46.enabled then Enum.ScaleType.Fit else Enum.ScaleType.Crop
	local var79 = getFFlagMomentsCreationBlockBackgroundInteractionModule()
	local createElement = reactModule.createElement
	local t_1 = {
		tag = "position-center-center anchor-center-center size-full-full",
		backgroundStyle = var44.Color.Common.Scrim,
		onActivated = if var79 then var68 else nil,
		stateLayer = if var79 then t else nil,
		testId = if var79 then "moments-creation-background-scrim" else nil
	}
	local t_2 = {}
	local createElement_1 = reactModule.createElement
	local t_3 = {
		tag = "position-center-center anchor-center-center size-full-full radius-large bg-surface-0",
		sizeConstraint = {
			MaxSize = if var45 == formFactor.Wide then Vector2.new(600, 700) else nil
		},
		onActivated = if var79 then noopActivated else nil,
		stateLayer = if var79 then t else nil,
		testId = if var79 then "moments-creation-panel" else nil
	}
	local t_4 = {
		VoiceBackControls = if getFFlagMomentsTTSAudioOverlayModule and var49 == creationFlowStateModule.Voice then reactModule.createElement(voiceBackControlsModule) else nil,
		CloseButtonContainer = if getFFlagMomentsTTSAudioOverlayModule and var49 == creationFlowStateModule.Voice then nil else reactModule.createElement(view, {
			tag = "position-top-right anchor-top-right auto-xy",
			padding = {
				top = UDim.new(0, var43.top + var44.Padding.Medium),
				right = UDim.new(0, var43.right + var44.Padding.Medium)
			}
		}, {
			CloseButton = reactModule.createElement(view, {
				LayoutOrder = 1,
				tag = "size-1100-1100 padding-medium radius-circle bg-over-media-0",
				onActivated = var68
			}, {
				CloseIcon = reactModule.createElement(icon, {
					name = "icons/navigation/close_small",
					ZIndex = 2,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					size = foundationModule.Enums.IconSize.Small,
					style = var44.Color.ActionEmphasis.Foreground
				})
			})
		})
	}
	local createElement_2 = reactModule.createElement
	local t_5 = { tag = "size-full", onAbsoluteSizeChanged = var57 }
	local t_6 = {}
	local createElement_3 = reactModule.createElement
	local t_7 = {
		tag = "col align-x-center",
		Size = var56:map(function(p8) --[[ line: 463 ]]
			return UDim2.new(1, 0, 1, -p8)
		end)
	}
	local t_8 = {}
	local createElement_4 = reactModule.createElement
	local var88 = "CanvasGroup"
	local t_9 = {
		LayoutOrder = 1,
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = var44.Color.None.Transparency
	}
	local t_10 = {
		UIFlexItem = reactModule.createElement("UIFlexItem", {
			FlexMode = Enum.UIFlexMode.Custom,
			ShrinkRatio = if var50 then 1 else 2
		}),
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var44.Radius.Large) }),
		ClickCapture = reactModule.createElement(view, {
			tag = "size-full",
			ZIndex = 0,
			onActivated = var48,
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			}
		}),
		CaptureView = reactModule.createElement(captureViewModule, {
			preview = var42.preview,
			scaleType = var78,
			onAbsoluteSizeChanged = var75,
			onResolutionChanged = if getFFlagMomentsCreationTextOverlayResolutionScaleModule() then var76 else nil
		}, var77)
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
				bottom = UDim.new(0, var44.Padding.Large),
				left = UDim.new(0, math.max(var43.left, var44.Padding.Large)),
				right = UDim.new(0, math.max(var43.right, var44.Padding.Large))
			}
		}, {
			MusicIndicator = if music and (var49 == creationFlowStateModule.Preview or var49 == creationFlowStateModule.Description) then reactModule.createElement(view, { tag = "position-bottom-left anchor-bottom-left auto-xy" }, {
				MusicChip = reactModule.createElement(musicChipModule, { musicAssetId = music.assetId, onActivated = var65 })
			}) else nil
		})
	}
	
	if var50 and var50.CaptureType == Enum.CaptureType.Video and (var49 == creationFlowStateModule.Gallery or var49 == creationFlowStateModule.Preview or getFFlagMomentsTTSAudioOverlayModule and var49 == creationFlowStateModule.Voice) and (var47 or getFFlagMomentsTTSAudioOverlayModule and var49 == creationFlowStateModule.Voice) then
		var93 = reactModule.createElement
		var93 = var93(playbackControlsModule, {
			layoutOrder = 2,
			preview = var42.preview,
			toggleFitMode = var46.toggle,
			isFitMode = var46.enabled,
			onSeek = if getFFlagMomentsTTSAudioOverlayModule and var49 == creationFlowStateModule.Voice then function(p9) --[[ line: 541 ]]
				-- upvalues: var42 (ref)
				local ttsAudio = var42.ttsAudio
				
				if ttsAudio == nil then return end
				local timeLength = ttsAudio.getTimeLength(false)
				
				if timeLength > 0 and p9 >= 0 and p9 < timeLength then
					ttsAudio.seek(p9)
				end
			end else nil
		})
	else
		var93 = nil
	end
	local createElement_6
	t_12.PlaybackControls = var93
	t_10.PreviewMediaOverlay = createElement_5(view, t_11, t_12)
	
	if var49 == creationFlowStateModule.Preview then
		createElement_6 = reactModule.createElement
		createElement_6 = createElement_6(editCTABarModule, {
			zIndex = 4,
			tools = var52,
			onToolSelected = var64,
			showText = var47,
			isLoadingMap = if var55 then { generateText = true } else nil,
			isDisabledMap = if getFFlagEnableMomentTextGeneration() and var55 then { text = true } else nil,
			onDisabledToolActivated = var42.onDisabledToolActivated,
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
	t_8.PreviewContainer = createElement_4(var88, t_9, t_10)
	t_8.GalleryView = if var49 ~= creationFlowStateModule.Gallery then if captureSource ~= nil then reactModule.createElement(galleryViewModule, {
		layoutOrder = 2,
		hasMoreCaptures = false,
		onShowMore = nil,
		captures = var37,
		onCaptureSelected = var58,
		onNextCallback = var61,
		selectedCapture = var50
	}) else reactModule.createElement(GallerySourceView, {
		layoutOrder = 2,
		captureSource = captureSource,
		onCaptureSelected = var58,
		onNextCallback = var61,
		selectedCapture = var50
	}) else nil
	t_8.PreviewView = if var49 == creationFlowStateModule.Preview then reactModule.createElement(previewViewModule, {
		layoutOrder = 2,
		onContinueCallback = var62,
		onReturnToGalleryCallback = if not p1.excludeGallery then var66 else nil
	}) else nil
	t_8.ActiveStepEditor = var71("Step")
	t_8.DescriptionView = if var49 == creationFlowStateModule.Description then reactModule.createElement(descriptionViewModule, {
		layoutOrder = 2,
		onPublish = var67,
		onReturnToEditing = var63
	}) else nil
	t_6.MainView = createElement_3(view, t_7, t_8)
	t_6.MusicView = var71("Overlay")
	t_4.MainViewContainer = createElement_2(view, t_5, t_6)
	t_2.CreationFlowView = createElement_1(view, t_3, t_4)
	t_2.Modal = var70()
	
	return reactModule.createElement(creationMediaProviderModule, {
		preview = var42.preview,
		getSelectedCapture = var42.getSelectedCapture
	}, createElement(view, t_1, t_2))
end

return function(p10) --[[ line: 648 | named "CreationFlowScreen" ]]
	-- upvalues: reactModule (ref), isTextFilteredModule (ref), var36 (ref), publishMomentModule (ref), foundationProvider (ref), colorMode (ref), creationControllerProvider (ref), CreationFlowContent (ref)
	local onExit = p10.onExit
	local host = p10.host
	local captureSource = p10.captureSource
	local var101 = reactModule.useMemo(function() --[[ line: 653 ]]
		-- upvalues: host (ref), onExit (ref), captureSource (ref), isTextFilteredModule (copy), var36 (copy), publishMomentModule (copy)
		return if host == nil then {
			exitCreationFlow = onExit,
			captureSource = captureSource,
			isTextFiltered = isTextFilteredModule,
			createMoment = if var36 then function(_, _, p11) --[[ line: 662 ]]
				print(`[moments-creation] dev publish (not uploaded): "{p11}"`)
			end else publishMomentModule
		} else host
	end, { host, onExit, captureSource })
	
	return reactModule.createElement(foundationProvider, { colorMode = colorMode.Dark }, {
		Root = reactModule.createElement(creationControllerProvider, { host = var101, excludeGallery = p10.excludeGallery }, {
			Content = reactModule.createElement(CreationFlowContent, {
				excludeGallery = p10.excludeGallery,
				captureSource = var101.captureSource
			})
		})
	})
end