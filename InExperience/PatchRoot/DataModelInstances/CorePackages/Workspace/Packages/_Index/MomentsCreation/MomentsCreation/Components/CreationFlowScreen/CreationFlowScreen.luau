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
local voiceoverDeleteConfirmDialogModule = require(momentsCreation.Components.Dialogs.VoiceoverDeleteConfirmDialog)
local voiceBackControlsModule = require(momentsCreation.Components.Voice.VoiceBackControls)
local sampleCapturesModule = require(momentsCreation.Capture.sampleCaptures)
local publishMomentModule = require(momentsCreation.Upload.publishMoment)
local isTextFilteredModule = require(momentsCreation.Moderation.isTextFiltered)
local musicChipModule = require(momentsCreation.Components.MusicChip)
local var37 = require(parent.MomentsCommon.isStudio)()
local var38 = if var37 then sampleCapturesModule else {}

local function noopActivated() --[[ line: 114 ]] end

local t = {
	affordance = foundationModule.Enums.StateLayerAffordance.None
}

local function GallerySourceView(p0) --[[ line: 121 ]]
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

local function CreationFlowContent(p1) --[[ line: 143 ]]
	-- upvalues: useCreationController (ref), getFFlagMomentsCreationSaveDraft (ref), useDraftRestoreEffectModule (ref), useDraftSaveEffectModule (ref), useDeviceInsets (ref), useTokens (ref), useFormFactor (ref), useToggleState (ref), useAutoDismissStateModule (ref), useSignalState (ref), useDescriptionKeyboardInsetModule (ref), getFFlagMomentsDescriptionKeyboardAvoidanceModule (ref), creationFlowStateModule (ref), useCallback (ref), sessionManager (ref), funnelEventNames (ref), cryoModule (ref), makeCreationEventFieldsModule (ref), getFFlagMomentsAnalyticsProducerPrereqs (ref), fireAnalyticsEventModule (ref), eventNames (ref), dialogTypeModule (ref), useRef (ref), useEffect (ref), getFFlagMomentsStickerButton (ref), getFFlagMomentsTTSAudioOverlayModule (ref), reactModule (ref), exitConfirmationDialogModule (ref), textFilteredDialogModule (ref), voiceoverErrorDialogModule (ref), voiceoverDeleteConfirmDialogModule (ref), stepStubModule (ref), useMemo (ref), signalsModule (ref), getFFlagMomentsCreationBlockBackgroundInteractionModule (ref), view (ref), t (ref), formFactor (ref), noopActivated (ref), voiceBackControlsModule (ref), icon (ref), foundationModule (ref), captureViewModule (ref), getFFlagMomentsCreationTextOverlayResolutionScaleModule (ref), musicChipModule (ref), playbackControlsModule (ref), editCTABarModule (ref), getFFlagEnableMomentTextGeneration (ref), GallerySourceView (ref), galleryViewModule (ref), var38 (ref), previewViewModule (ref), descriptionViewModule (ref), creationMediaProviderModule (ref)
	local var43 = useCreationController()
	
	if getFFlagMomentsCreationSaveDraft() then
		useDraftRestoreEffectModule(p1.captureSource)
		useDraftSaveEffectModule()
	end
	local var94
	local var44 = useDeviceInsets()
	local var45 = useTokens()
	local var46 = useFormFactor()
	local var47 = useToggleState(false)
	local var48, var49 = useAutoDismissStateModule()
	local var50 = useSignalState(var43.getStep)
	local var51 = useSignalState(var43.getSelectedCapture)
	local var52 = useSignalState(var43.getComposedEdits)
	local var53 = useSignalState(var43.getAvailableTools)
	local var54 = useSignalState(var43.getActiveTool)
	local var55 = useSignalState(var43.getActiveModal)
	local var56 = useSignalState(var43.getIsGenerating)
	local music = var52.music
	local var57, var58 = useDescriptionKeyboardInsetModule(getFFlagMomentsDescriptionKeyboardAvoidanceModule() and var50 == creationFlowStateModule.Description)
	local captureSource = p1.captureSource
	local var59 = useCallback(function(p2) --[[ line: 183 ]]
		-- upvalues: var43 (ref), var49 (ref)
		var43.selectCapture(p2)
		var49()
	end, { var43, var49 })
	
	local function withCreationSession(p3) --[[ line: 192 ]]
		-- upvalues: sessionManager (copy), funnelEventNames (copy), cryoModule (copy), makeCreationEventFieldsModule (copy)
		return cryoModule.Dictionary.join(p3, makeCreationEventFieldsModule.makeCreationBaseFields(sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow)))
	end
	
	local function flowStepFields() --[[ line: 202 ]]
		-- upvalues: getFFlagMomentsAnalyticsProducerPrereqs (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), var43 (ref)
		return if getFFlagMomentsAnalyticsProducerPrereqs() then withCreationSession(makeCreationEventFieldsModule.makeStepFieldFromState(var43.getStep(false))) else { step = var43.getStep(false) }
	end
	
	local var62 = useCallback(function() --[[ line: 212 ]]
		-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), flowStepFields (ref), var43 (ref), creationFlowStateModule (copy), var49 (ref), withCreationSession (ref), makeCreationEventFieldsModule (copy)
		fireAnalyticsEventModule(eventNames.EditingFlowNextButtonPressed, flowStepFields())
		var43.navigate(creationFlowStateModule.Preview)
		var49()
		fireAnalyticsEventModule(eventNames.MomentsEditingFlowContinueToEditButtonPressed, withCreationSession(makeCreationEventFieldsModule.makeStepField(eventNames.MomentsEditingFlowContinueToEditButtonPressed)))
	end, { var43, var49 })
	local var63 = useCallback(function() --[[ line: 225 ]]
		-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), flowStepFields (ref), var43 (ref), creationFlowStateModule (copy), var47 (ref), withCreationSession (ref), makeCreationEventFieldsModule (copy)
		fireAnalyticsEventModule(eventNames.EditingFlowNextButtonPressed, flowStepFields())
		var43.navigate(creationFlowStateModule.Description)
		var47.disable()
		fireAnalyticsEventModule(eventNames.MomentsEditingFlowContinueToDescriptionButtonPressed, withCreationSession(makeCreationEventFieldsModule.makeStepField(eventNames.MomentsEditingFlowContinueToDescriptionButtonPressed)))
	end, { var43, var47.disable })
	local var64 = useCallback(function() --[[ line: 238 ]]
		-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), flowStepFields (ref), var43 (ref), creationFlowStateModule (copy)
		fireAnalyticsEventModule(eventNames.EditingFlowReturnButtonPressed, flowStepFields())
		var43.navigate(creationFlowStateModule.Preview)
	end, { var43 })
	local var65 = useCallback(function(p4) --[[ line: 243 ]]
		-- upvalues: var43 (ref)
		var43.beginTool(p4)
	end, { var43 })
	local var66 = useCallback(function() --[[ line: 247 ]]
		-- upvalues: var43 (ref)
		var43.beginTool("music")
	end, { var43 })
	local var67 = useCallback(function() --[[ line: 251 ]]
		-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), flowStepFields (ref), var43 (ref), dialogTypeModule (copy), var47 (ref)
		fireAnalyticsEventModule(eventNames.EditingFlowReturnButtonPressed, flowStepFields())
		var43.showModal({
			modalType = dialogTypeModule.ExitCreationConfirmation,
			modalProps = {
				onCancel = var43.dismissModal,
				onConfirm = function() --[[ line: 257 ]]
					-- upvalues: var43 (copy), var47 (copy)
					var43.dismissModal()
					var43.returnToGallery()
					var47.disable()
				end
			}
		})
	end, { var43, var47.disable })
	local var68 = useCallback(function() --[[ line: 266 ]]
		-- upvalues: var43 (ref)
		var43.publish()
	end, { var43 })
	local var69 = useCallback(function() --[[ line: 270 ]]
		-- upvalues: var51 (ref), var43 (ref), dialogTypeModule (copy)
		if var51 then
			var43.showModal({
				modalType = dialogTypeModule.ExitCreationConfirmation,
				modalProps = { onCancel = var43.dismissModal, onConfirm = var43.exit }
			})
			
			return
		end
		var43.exit()
	end, { var43, var51 })
	local var70 = useRef(nil)
	useEffect(function() --[[ line: 285 ]]
		-- upvalues: var70 (ref), var50 (ref), creationFlowStateModule (copy), fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), getFFlagMomentsStickerButton (copy), getFFlagMomentsTTSAudioOverlayModule (copy)
		local current = var70.current
		var70.current = var50
		
		if var50 == creationFlowStateModule.Gallery then
			fireAnalyticsEventModule(eventNames.EditingFlowGalleryPageAppear, withCreationSession(makeCreationEventFieldsModule.makeStepField(eventNames.EditingFlowGalleryPageAppear)))
			
			return
		elseif var50 == creationFlowStateModule.Preview then
			if if current ~= creationFlowStateModule.Trimming then if current ~= creationFlowStateModule.Music then if current ~= creationFlowStateModule.TextOverlay then if getFFlagMomentsStickerButton() then true else getFFlagMomentsTTSAudioOverlayModule and current == creationFlowStateModule.Voice else true else true else true then
				return
			else
				fireAnalyticsEventModule(eventNames.EditingFlowEditPageAppear, withCreationSession(makeCreationEventFieldsModule.makeStepField(eventNames.EditingFlowEditPageAppear)))
				
				return
			end
		elseif var50 == creationFlowStateModule.Description then
			fireAnalyticsEventModule(eventNames.EditingFlowPreviewPageAppear, withCreationSession(makeCreationEventFieldsModule.makeStepField(eventNames.EditingFlowPreviewPageAppear)))
		end
	end, { var50 })
	useEffect(function() --[[ line: 318 ]]
		-- upvalues: var50 (ref), creationFlowStateModule (copy), var47 (ref)
		if var50 == creationFlowStateModule.Gallery or var50 == creationFlowStateModule.Music or var50 == creationFlowStateModule.Description then
			var47.disable()
		end
	end, { var50, var47.disable })
	local var71 = useCallback(function() --[[ line: 328 ]]
		-- upvalues: var55 (ref), dialogTypeModule (copy), reactModule (copy), exitConfirmationDialogModule (copy), textFilteredDialogModule (copy), voiceoverErrorDialogModule (copy), voiceoverDeleteConfirmDialogModule (copy)
		return if not (not var55 or not var55.modalType) then if var55.modalType == dialogTypeModule.ExitCreationConfirmation then reactModule.createElement(exitConfirmationDialogModule, var55.modalProps) elseif var55.modalType == dialogTypeModule.TextFiltered then reactModule.createElement(textFilteredDialogModule, var55.modalProps) elseif var55.modalType == dialogTypeModule.VoiceoverError then reactModule.createElement(voiceoverErrorDialogModule, var55.modalProps) elseif var55.modalType == dialogTypeModule.VoiceoverDelete then reactModule.createElement(voiceoverDeleteConfirmDialogModule, var55.modalProps) else nil else nil
	end, { var55 })
	local var72 = useCallback(function(p5) --[[ line: 346 ]]
		-- upvalues: var54 (ref), var50 (ref), var43 (ref), reactModule (copy), stepStubModule (copy)
		if var54 == nil or var54.presentation ~= p5 or var50 ~= var54.step then
			return nil
		elseif var54.renderEditor ~= nil then
			local var95 = var54.renderEditor(var43)
			
			return if var95 == nil then reactModule.createElement(stepStubModule(var54.kind), {}) else var95
		end
	end, { var54, var50, var43 })
	local var73 = useMemo(function() --[[ line: 364 ]]
		-- upvalues: signalsModule (copy)
		local var96, var97 = signalsModule.createSignal(Vector2.zero)
		
		return { getItemSize = var96, setItemSize = var97 }
	end, {})
	local var74 = useMemo(function() --[[ line: 372 ]]
		-- upvalues: signalsModule (copy)
		local var98, var99 = signalsModule.createSignal(Vector2.zero)
		
		return { getItemResolution = var98, setItemResolution = var99 }
	end, {})
	local var75 = useMemo(function() --[[ line: 377 ]]
		-- upvalues: var73 (ref), var74 (ref)
		return {
			getItemSize = var73.getItemSize,
			getItemResolution = var74.getItemResolution
		}
	end, { var73, var74 })
	local var76 = useCallback(function(p6) --[[ line: 381 ]]
		-- upvalues: var73 (ref)
		var73.setItemSize(p6.AbsoluteSize)
	end, { var73 })
	local var77 = useCallback(function(p7) --[[ line: 385 ]]
		-- upvalues: var74 (ref)
		var74.setItemResolution(p7)
	end, { var74 })
	local var78 = useMemo(function() --[[ line: 389 ]]
		-- upvalues: var53 (ref), var43 (ref), var75 (ref)
		local t = {}
		
		for i, v in var53 do
			if v.renderPreviewLayer ~= nil then
				t[v.kind .. "PreviewLayer"] = v.renderPreviewLayer(var43, var75)
			end
		end
		return t
	end, { var53, var43, var75 })
	local var79 = if var47.enabled then Enum.ScaleType.Fit else Enum.ScaleType.Crop
	local var80 = getFFlagMomentsCreationBlockBackgroundInteractionModule()
	local createElement = reactModule.createElement
	local t_1 = {
		tag = "position-center-center anchor-center-center size-full-full",
		backgroundStyle = var45.Color.Common.Scrim,
		onActivated = if var80 then var69 else nil,
		stateLayer = if var80 then t else nil,
		testId = if var80 then "moments-creation-background-scrim" else nil
	}
	local t_2 = {}
	local createElement_1 = reactModule.createElement
	local t_3 = {
		tag = "position-center-center anchor-center-center size-full-full radius-large bg-surface-0",
		sizeConstraint = {
			MaxSize = if var46 == formFactor.Wide then Vector2.new(600, 700) else nil
		},
		onActivated = if var80 then noopActivated else nil,
		stateLayer = if var80 then t else nil,
		testId = if var80 then "moments-creation-panel" else nil
	}
	local t_4 = {
		VoiceBackControls = if getFFlagMomentsTTSAudioOverlayModule and var50 == creationFlowStateModule.Voice then reactModule.createElement(voiceBackControlsModule) else nil,
		CloseButtonContainer = if getFFlagMomentsTTSAudioOverlayModule and var50 == creationFlowStateModule.Voice then nil else reactModule.createElement(view, {
			tag = "position-top-right anchor-top-right auto-xy",
			padding = {
				top = UDim.new(0, var44.top + var45.Padding.Medium),
				right = UDim.new(0, var44.right + var45.Padding.Medium)
			}
		}, {
			CloseButton = reactModule.createElement(view, {
				LayoutOrder = 1,
				tag = "size-1100-1100 padding-medium radius-circle bg-over-media-0",
				onActivated = var69
			}, {
				CloseIcon = reactModule.createElement(icon, {
					name = "icons/navigation/close_small",
					ZIndex = 2,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					size = foundationModule.Enums.IconSize.Small,
					style = var45.Color.ActionEmphasis.Foreground
				})
			})
		})
	}
	local createElement_2 = reactModule.createElement
	local t_5 = { tag = "size-full", onAbsoluteSizeChanged = var58 }
	local t_6 = {}
	local createElement_3 = reactModule.createElement
	local t_7 = {
		tag = "col align-x-center",
		Size = var57:map(function(p8) --[[ line: 466 ]]
			return UDim2.new(1, 0, 1, -p8)
		end)
	}
	local t_8 = {}
	local createElement_4 = reactModule.createElement
	local var89 = "CanvasGroup"
	local t_9 = {
		LayoutOrder = 1,
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = var45.Color.None.Transparency
	}
	local t_10 = {
		UIFlexItem = reactModule.createElement("UIFlexItem", {
			FlexMode = Enum.UIFlexMode.Custom,
			ShrinkRatio = if var51 then 1 else 2
		}),
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var45.Radius.Large) }),
		ClickCapture = reactModule.createElement(view, {
			tag = "size-full",
			ZIndex = 0,
			onActivated = var49,
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			}
		}),
		CaptureView = reactModule.createElement(captureViewModule, {
			preview = var43.preview,
			scaleType = var79,
			onAbsoluteSizeChanged = var76,
			onResolutionChanged = if getFFlagMomentsCreationTextOverlayResolutionScaleModule() then var77 else nil
		}, var78)
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
				bottom = UDim.new(0, var45.Padding.Large),
				left = UDim.new(0, math.max(var44.left, var45.Padding.Large)),
				right = UDim.new(0, math.max(var44.right, var45.Padding.Large))
			}
		}, {
			MusicIndicator = if music and (var50 == creationFlowStateModule.Preview or var50 == creationFlowStateModule.Description) then reactModule.createElement(view, { tag = "position-bottom-left anchor-bottom-left auto-xy" }, {
				MusicChip = reactModule.createElement(musicChipModule, { musicAssetId = music.assetId, onActivated = var66 })
			}) else nil
		})
	}
	
	if var51 and var51.CaptureType == Enum.CaptureType.Video and (var50 == creationFlowStateModule.Gallery or var50 == creationFlowStateModule.Preview or getFFlagMomentsTTSAudioOverlayModule and var50 == creationFlowStateModule.Voice) and (var48 or getFFlagMomentsTTSAudioOverlayModule and var50 == creationFlowStateModule.Voice) then
		var94 = reactModule.createElement
		var94 = var94(playbackControlsModule, {
			layoutOrder = 2,
			preview = var43.preview,
			toggleFitMode = var47.toggle,
			isFitMode = var47.enabled,
			onSeek = if getFFlagMomentsTTSAudioOverlayModule and var50 == creationFlowStateModule.Voice then function(p9) --[[ line: 544 ]]
				-- upvalues: var43 (ref)
				local ttsAudio = var43.ttsAudio
				
				if ttsAudio == nil then return end
				local timeLength = ttsAudio.getTimeLength(false)
				
				if timeLength > 0 and p9 >= 0 and p9 < timeLength then
					ttsAudio.seek(p9)
				end
			end else nil
		})
	else
		var94 = nil
	end
	local createElement_6
	t_12.PlaybackControls = var94
	t_10.PreviewMediaOverlay = createElement_5(view, t_11, t_12)
	
	if var50 == creationFlowStateModule.Preview then
		createElement_6 = reactModule.createElement
		createElement_6 = createElement_6(editCTABarModule, {
			zIndex = 4,
			tools = var53,
			onToolSelected = var65,
			showText = var48,
			isLoadingMap = if var56 then { generateText = true } else nil,
			isDisabledMap = if getFFlagEnableMomentTextGeneration() and var56 then { text = true } else nil,
			onDisabledToolActivated = var43.onDisabledToolActivated,
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
	t_8.PreviewContainer = createElement_4(var89, t_9, t_10)
	t_8.GalleryView = if var50 ~= creationFlowStateModule.Gallery then if captureSource ~= nil then reactModule.createElement(galleryViewModule, {
		layoutOrder = 2,
		hasMoreCaptures = false,
		onShowMore = nil,
		captures = var38,
		onCaptureSelected = var59,
		onNextCallback = var62,
		selectedCapture = var51
	}) else reactModule.createElement(GallerySourceView, {
		layoutOrder = 2,
		captureSource = captureSource,
		onCaptureSelected = var59,
		onNextCallback = var62,
		selectedCapture = var51
	}) else nil
	t_8.PreviewView = if var50 == creationFlowStateModule.Preview then reactModule.createElement(previewViewModule, {
		layoutOrder = 2,
		onContinueCallback = var63,
		onReturnToGalleryCallback = if not p1.excludeGallery then var67 else nil
	}) else nil
	t_8.ActiveStepEditor = var72("Step")
	t_8.DescriptionView = if var50 == creationFlowStateModule.Description then reactModule.createElement(descriptionViewModule, {
		layoutOrder = 2,
		onPublish = var68,
		onReturnToEditing = var64
	}) else nil
	t_6.MainView = createElement_3(view, t_7, t_8)
	t_6.MusicView = var72("Overlay")
	t_4.MainViewContainer = createElement_2(view, t_5, t_6)
	t_2.CreationFlowView = createElement_1(view, t_3, t_4)
	t_2.Modal = var71()
	
	return reactModule.createElement(creationMediaProviderModule, {
		preview = var43.preview,
		getSelectedCapture = var43.getSelectedCapture
	}, createElement(view, t_1, t_2))
end

return function(p10) --[[ line: 651 | named "CreationFlowScreen" ]]
	-- upvalues: reactModule (ref), isTextFilteredModule (ref), var37 (ref), publishMomentModule (ref), foundationProvider (ref), colorMode (ref), creationControllerProvider (ref), CreationFlowContent (ref)
	local onExit = p10.onExit
	local host = p10.host
	local captureSource = p10.captureSource
	local var102 = reactModule.useMemo(function() --[[ line: 656 ]]
		-- upvalues: host (ref), onExit (ref), captureSource (ref), isTextFilteredModule (copy), var37 (copy), publishMomentModule (copy)
		return if host == nil then {
			exitCreationFlow = onExit,
			captureSource = captureSource,
			isTextFiltered = isTextFilteredModule,
			createMoment = if var37 then function(_, _, p11) --[[ line: 665 ]]
				print(`[moments-creation] dev publish (not uploaded): "{p11}"`)
			end else publishMomentModule
		} else host
	end, { host, onExit, captureSource })
	
	return reactModule.createElement(foundationProvider, { colorMode = colorMode.Dark }, {
		Root = reactModule.createElement(creationControllerProvider, { host = var102, excludeGallery = p10.excludeGallery }, {
			Content = reactModule.createElement(CreationFlowContent, {
				excludeGallery = p10.excludeGallery,
				captureSource = var102.captureSource
			})
		})
	})
end