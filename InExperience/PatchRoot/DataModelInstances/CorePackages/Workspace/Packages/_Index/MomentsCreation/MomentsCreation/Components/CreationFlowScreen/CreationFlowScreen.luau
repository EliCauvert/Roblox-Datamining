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
local var1 = require(parent.MomentsCommon.isStudio)()
local var2 = if var1 then sampleCapturesModule else {}

local function noopActivated() end

local t = {
	affordance = foundationModule.Enums.StateLayerAffordance.None
}

local function GallerySourceView(p1)
	-- upvalues: useSignalState (ref), reactModule (ref), galleryViewModule (ref)
	local captureSource = p1.captureSource
	
	return reactModule.createElement(galleryViewModule, {
		captures = useSignalState(captureSource.getCaptures),
		layoutOrder = p1.layoutOrder,
		onCaptureSelected = p1.onCaptureSelected,
		onNextCallback = p1.onNextCallback,
		selectedCapture = p1.selectedCapture,
		hasMoreCaptures = not useSignalState(captureSource.getIsFinished),
		onShowMore = captureSource.fetchMore
	})
end

local function CreationFlowContent(p1)
	-- upvalues: useCreationController (ref), getFFlagMomentsCreationSaveDraft (ref), useDraftRestoreEffectModule (ref), useDraftSaveEffectModule (ref), useDeviceInsets (ref), useTokens (ref), useFormFactor (ref), useToggleState (ref), useAutoDismissStateModule (ref), useSignalState (ref), useDescriptionKeyboardInsetModule (ref), getFFlagMomentsDescriptionKeyboardAvoidanceModule (ref), creationFlowStateModule (ref), useCallback (ref), sessionManager (ref), funnelEventNames (ref), cryoModule (ref), makeCreationEventFieldsModule (ref), getFFlagMomentsAnalyticsProducerPrereqs (ref), fireAnalyticsEventModule (ref), eventNames (ref), dialogTypeModule (ref), useRef (ref), useEffect (ref), getFFlagMomentsStickerButton (ref), getFFlagMomentsTTSAudioOverlayModule (ref), reactModule (ref), exitConfirmationDialogModule (ref), textFilteredDialogModule (ref), generateTextOptionsDialogModule (ref), voiceoverErrorDialogModule (ref), voiceoverDeleteConfirmDialogModule (ref), stepStubModule (ref), useMemo (ref), signalsModule (ref), getFFlagMomentsCreationBlockBackgroundInteractionModule (ref), view (ref), t (ref), formFactor (ref), noopActivated (ref), voiceBackControlsModule (ref), getFFlagMomentsCreationCloseButtonZIndexFixModule (ref), icon (ref), foundationModule (ref), captureViewModule (ref), getFFlagMomentsCreationTextOverlayResolutionScaleModule (ref), musicChipModule (ref), playbackControlsModule (ref), editCTABarModule (ref), getFFlagEnableMomentTextGeneration (ref), GallerySourceView (ref), galleryViewModule (ref), var2 (ref), previewViewModule (ref), descriptionViewModule (ref), creationMediaProviderModule (ref)
	local var3 = useCreationController()
	
	if getFFlagMomentsCreationSaveDraft() then
		useDraftRestoreEffectModule(p1.captureSource)
		useDraftSaveEffectModule()
	end
	local var4
	local var5 = useDeviceInsets()
	local var6 = useTokens()
	local var7 = useFormFactor()
	local var8 = useToggleState(false)
	local var9, var10 = useAutoDismissStateModule()
	local var11 = useSignalState(var3.getStep)
	local var12 = useSignalState(var3.getSelectedCapture)
	local var13 = useSignalState(var3.getComposedEdits)
	local var14 = useSignalState(var3.getAvailableTools)
	local var15 = useSignalState(var3.getActiveTool)
	local var16 = useSignalState(var3.getActiveModal)
	local var17 = useSignalState(var3.getIsGenerating)
	local music = var13.music
	local var18, var19 = useDescriptionKeyboardInsetModule(getFFlagMomentsDescriptionKeyboardAvoidanceModule() and var11 == creationFlowStateModule.Description)
	local captureSource = p1.captureSource
	local var20 = useCallback(function(p2)
		-- upvalues: var3 (ref), var10 (ref)
		var3.selectCapture(p2)
		var10()
	end, { var3, var10 })
	
	local function withCreationSession(p2)
		-- upvalues: sessionManager (copy), funnelEventNames (copy), cryoModule (copy), makeCreationEventFieldsModule (copy)
		return cryoModule.Dictionary.join(p2, makeCreationEventFieldsModule.makeCreationBaseFields(sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow)))
	end
	
	local function flowStepFields()
		-- upvalues: getFFlagMomentsAnalyticsProducerPrereqs (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), var3 (ref)
		return if getFFlagMomentsAnalyticsProducerPrereqs() then withCreationSession(makeCreationEventFieldsModule.makeStepFieldFromState(var3.getStep(false))) else { step = var3.getStep(false) }
	end
	
	local var21 = useCallback(function()
		-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), flowStepFields (ref), var3 (ref), creationFlowStateModule (copy), var10 (ref), withCreationSession (ref), makeCreationEventFieldsModule (copy)
		fireAnalyticsEventModule(eventNames.EditingFlowNextButtonPressed, flowStepFields())
		var3.navigate(creationFlowStateModule.Preview)
		var10()
		fireAnalyticsEventModule(eventNames.MomentsEditingFlowContinueToEditButtonPressed, withCreationSession(makeCreationEventFieldsModule.makeStepField(eventNames.MomentsEditingFlowContinueToEditButtonPressed)))
	end, { var3, var10 })
	local var22 = useCallback(function()
		-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), flowStepFields (ref), var3 (ref), creationFlowStateModule (copy), var8 (ref), withCreationSession (ref), makeCreationEventFieldsModule (copy)
		fireAnalyticsEventModule(eventNames.EditingFlowNextButtonPressed, flowStepFields())
		var3.navigate(creationFlowStateModule.Description)
		var8.disable()
		fireAnalyticsEventModule(eventNames.MomentsEditingFlowContinueToDescriptionButtonPressed, withCreationSession(makeCreationEventFieldsModule.makeStepField(eventNames.MomentsEditingFlowContinueToDescriptionButtonPressed)))
	end, { var3, var8.disable })
	local var23 = useCallback(function()
		-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), flowStepFields (ref), var3 (ref), creationFlowStateModule (copy)
		fireAnalyticsEventModule(eventNames.EditingFlowReturnButtonPressed, flowStepFields())
		var3.navigate(creationFlowStateModule.Preview)
	end, { var3 })
	local var24 = useCallback(function(p2)
		-- upvalues: var3 (ref)
		var3.beginTool(p2)
	end, { var3 })
	local var25 = useCallback(function()
		-- upvalues: var3 (ref)
		var3.beginTool("music")
	end, { var3 })
	local var26 = useCallback(function()
		-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), flowStepFields (ref), var3 (ref), dialogTypeModule (copy), var8 (ref)
		fireAnalyticsEventModule(eventNames.EditingFlowReturnButtonPressed, flowStepFields())
		var3.showModal({
			modalType = dialogTypeModule.ExitCreationConfirmation,
			modalProps = {
				onCancel = var3.dismissModal,
				onConfirm = function()
					-- upvalues: var3 (copy), var8 (copy)
					var3.dismissModal()
					var3.returnToGallery()
					var8.disable()
				end
			}
		})
	end, { var3, var8.disable })
	local var27 = useCallback(function()
		-- upvalues: var3 (ref)
		var3.publish()
	end, { var3 })
	local var28 = useCallback(function()
		-- upvalues: var12 (ref), var3 (ref), dialogTypeModule (copy)
		if var12 then
			var3.showModal({
				modalType = dialogTypeModule.ExitCreationConfirmation,
				modalProps = { onCancel = var3.dismissModal, onConfirm = var3.exit }
			})
			
			return
		end
		var3.exit()
	end, { var3, var12 })
	local var29 = useRef(nil)
	useEffect(function()
		-- upvalues: var29 (ref), var11 (ref), creationFlowStateModule (copy), fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), getFFlagMomentsStickerButton (copy), getFFlagMomentsTTSAudioOverlayModule (copy)
		local current = var29.current
		var29.current = var11
		
		if var11 == creationFlowStateModule.Gallery then
			fireAnalyticsEventModule(eventNames.EditingFlowGalleryPageAppear, withCreationSession(makeCreationEventFieldsModule.makeStepField(eventNames.EditingFlowGalleryPageAppear)))
			
			return
		elseif var11 == creationFlowStateModule.Preview then
			if if current ~= creationFlowStateModule.Trimming then if current ~= creationFlowStateModule.Music then if current ~= creationFlowStateModule.TextOverlay then if getFFlagMomentsStickerButton() then true else getFFlagMomentsTTSAudioOverlayModule and current == creationFlowStateModule.Voice else true else true else true then
				return
			else
				fireAnalyticsEventModule(eventNames.EditingFlowEditPageAppear, withCreationSession(makeCreationEventFieldsModule.makeStepField(eventNames.EditingFlowEditPageAppear)))
				
				return
			end
		elseif var11 == creationFlowStateModule.Description then
			fireAnalyticsEventModule(eventNames.EditingFlowPreviewPageAppear, withCreationSession(makeCreationEventFieldsModule.makeStepField(eventNames.EditingFlowPreviewPageAppear)))
		end
	end, { var11 })
	useEffect(function()
		-- upvalues: var11 (ref), creationFlowStateModule (copy), var8 (ref)
		if var11 == creationFlowStateModule.Gallery or var11 == creationFlowStateModule.Music or var11 == creationFlowStateModule.Description then
			var8.disable()
		end
	end, { var11, var8.disable })
	local var30 = useCallback(function()
		-- upvalues: var16 (ref), dialogTypeModule (copy), reactModule (copy), exitConfirmationDialogModule (copy), textFilteredDialogModule (copy), generateTextOptionsDialogModule (copy), voiceoverErrorDialogModule (copy), voiceoverDeleteConfirmDialogModule (copy)
		return if not (not var16 or not var16.modalType) then if var16.modalType == dialogTypeModule.ExitCreationConfirmation then reactModule.createElement(exitConfirmationDialogModule, var16.modalProps) elseif var16.modalType == dialogTypeModule.TextFiltered then reactModule.createElement(textFilteredDialogModule, var16.modalProps) elseif var16.modalType == dialogTypeModule.GenerateTextOptions then reactModule.createElement(generateTextOptionsDialogModule, var16.modalProps) elseif var16.modalType == dialogTypeModule.VoiceoverError then reactModule.createElement(voiceoverErrorDialogModule, var16.modalProps) elseif var16.modalType == dialogTypeModule.VoiceoverDelete then reactModule.createElement(voiceoverDeleteConfirmDialogModule, var16.modalProps) else nil else nil
	end, { var16 })
	local var31 = useCallback(function(p2)
		-- upvalues: var15 (ref), var11 (ref), var3 (ref), reactModule (copy), stepStubModule (copy)
		if var15 == nil or var15.presentation ~= p2 or var11 ~= var15.step then
			return nil
		elseif var15.renderEditor ~= nil then
			local var32 = var15.renderEditor(var3)
			
			return if var32 == nil then reactModule.createElement(stepStubModule(var15.kind), {}) else var32
		end
	end, { var15, var11, var3 })
	local var32 = useMemo(function()
		-- upvalues: signalsModule (copy)
		local var33, var34 = signalsModule.createSignal(Vector2.zero)
		
		return { getItemSize = var33, setItemSize = var34 }
	end, {})
	local var33 = useMemo(function()
		-- upvalues: signalsModule (copy)
		local var34, var35 = signalsModule.createSignal(Vector2.zero)
		
		return { getItemResolution = var34, setItemResolution = var35 }
	end, {})
	local var34 = useMemo(function()
		-- upvalues: signalsModule (copy)
		local var35, var36 = signalsModule.createSignal(false)
		
		return { get = var35, set = var36 }
	end, {})
	local var35 = useSignalState(var34.get)
	local var36 = useMemo(function()
		-- upvalues: var32 (ref), var33 (ref), var34 (ref)
		return {
			getItemSize = var32.getItemSize,
			getItemResolution = var33.getItemResolution,
			setIsOverlayDragging = var34.set
		}
	end, { var32, var33, var34 })
	local var37 = useCallback(function(p2)
		-- upvalues: var32 (ref)
		var32.setItemSize(p2.AbsoluteSize)
	end, { var32 })
	local var38 = useCallback(function(p2)
		-- upvalues: var33 (ref)
		var33.setItemResolution(p2)
	end, { var33 })
	local var39 = useMemo(function()
		-- upvalues: var14 (ref), var3 (ref), var36 (ref)
		local t = {}
		
		for i, v in var14 do
			if v.renderPreviewLayer ~= nil then
				t[v.kind .. "PreviewLayer"] = v.renderPreviewLayer(var3, var36)
			end
		end
		return t
	end, { var14, var3, var36 })
	local var40 = if var8.enabled then Enum.ScaleType.Fit else Enum.ScaleType.Crop
	local var41 = getFFlagMomentsCreationBlockBackgroundInteractionModule()
	local createElement = reactModule.createElement
	local t_1 = {
		tag = "position-center-center anchor-center-center size-full-full",
		backgroundStyle = var6.Color.Common.Scrim,
		onActivated = if var41 then var28 else nil,
		stateLayer = if var41 then t else nil,
		testId = if var41 then "moments-creation-background-scrim" else nil
	}
	local t_2 = {}
	local createElement_1 = reactModule.createElement
	local t_3 = {
		tag = "position-center-center anchor-center-center size-full-full radius-large bg-surface-0",
		sizeConstraint = {
			MaxSize = if var7 == formFactor.Wide then Vector2.new(600, 700) else nil
		},
		onActivated = if var41 then noopActivated else nil,
		stateLayer = if var41 then t else nil,
		testId = if var41 then "moments-creation-panel" else nil
	}
	local t_4 = {
		VoiceBackControls = if getFFlagMomentsTTSAudioOverlayModule and var11 == creationFlowStateModule.Voice then reactModule.createElement(voiceBackControlsModule) else nil,
		CloseButtonContainer = if getFFlagMomentsTTSAudioOverlayModule and var11 == creationFlowStateModule.Voice then nil else reactModule.createElement(view, {
			tag = "position-top-right anchor-top-right auto-xy",
			padding = {
				top = UDim.new(0, var5.top + var6.Padding.Medium),
				right = UDim.new(0, var5.right + var6.Padding.Medium)
			},
			ZIndex = if getFFlagMomentsCreationCloseButtonZIndexFixModule then 10 else nil
		}, {
			CloseButton = reactModule.createElement(view, {
				LayoutOrder = 1,
				tag = "size-1100-1100 padding-medium radius-circle bg-over-media-0",
				onActivated = var28
			}, {
				CloseIcon = reactModule.createElement(icon, {
					name = "icons/navigation/close_small",
					ZIndex = 2,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					size = foundationModule.Enums.IconSize.Small,
					style = var6.Color.ActionEmphasis.Foreground
				})
			})
		})
	}
	local createElement_2 = reactModule.createElement
	local t_5 = {
		tag = "size-full",
		ZIndex = if getFFlagMomentsCreationCloseButtonZIndexFixModule then 1 else nil,
		onAbsoluteSizeChanged = var19
	}
	local t_6 = {}
	local createElement_3 = reactModule.createElement
	local t_7 = {
		tag = "col align-x-center",
		Size = var18:map(function(p2)
			return UDim2.new(1, 0, 1, -p2)
		end)
	}
	local t_8 = {}
	local createElement_4 = reactModule.createElement
	local var42 = "CanvasGroup"
	local t_9 = {
		LayoutOrder = 1,
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = var6.Color.None.Transparency
	}
	local t_10 = {
		UIFlexItem = reactModule.createElement("UIFlexItem", {
			FlexMode = Enum.UIFlexMode.Custom,
			ShrinkRatio = if var12 then 1 else 2
		}),
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var6.Radius.Large) }),
		ClickCapture = reactModule.createElement(view, {
			tag = "size-full",
			ZIndex = 0,
			onActivated = var10,
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			}
		}),
		CaptureView = reactModule.createElement(captureViewModule, {
			preview = var3.preview,
			scaleType = var40,
			onAbsoluteSizeChanged = var37,
			onResolutionChanged = if getFFlagMomentsCreationTextOverlayResolutionScaleModule() then var38 else nil
		}, var39)
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
				bottom = UDim.new(0, var6.Padding.Large),
				left = UDim.new(0, math.max(var5.left, var6.Padding.Large)),
				right = UDim.new(0, math.max(var5.right, var6.Padding.Large))
			}
		}, {
			MusicIndicator = if music and (var11 == creationFlowStateModule.Preview or var11 == creationFlowStateModule.Description) then reactModule.createElement(view, { tag = "position-bottom-left anchor-bottom-left auto-xy" }, {
				MusicChip = reactModule.createElement(musicChipModule, { musicAssetId = music.assetId, onActivated = var25 })
			}) else nil
		})
	}
	
	if var12 and var12.CaptureType == Enum.CaptureType.Video and (var11 == creationFlowStateModule.Gallery or var11 == creationFlowStateModule.Preview or getFFlagMomentsTTSAudioOverlayModule and var11 == creationFlowStateModule.Voice) and ((var9 or getFFlagMomentsTTSAudioOverlayModule and var11 == creationFlowStateModule.Voice) and not var35) then
		var4 = reactModule.createElement
		var4 = var4(playbackControlsModule, {
			layoutOrder = 2,
			preview = var3.preview,
			toggleFitMode = var8.toggle,
			isFitMode = var8.enabled,
			onSeek = if getFFlagMomentsTTSAudioOverlayModule and var11 == creationFlowStateModule.Voice then function(p2)
				-- upvalues: var3 (ref)
				local ttsAudio = var3.ttsAudio
				
				if ttsAudio == nil then return end
				local timeLength = ttsAudio.getTimeLength(false)
				
				if timeLength > 0 and p2 >= 0 and p2 < timeLength then
					ttsAudio.seek(p2)
				end
			end else nil
		})
	else
		var4 = nil
	end
	local createElement_6
	t_12.PlaybackControls = var4
	t_10.PreviewMediaOverlay = createElement_5(view, t_11, t_12)
	
	if var11 == creationFlowStateModule.Preview then
		createElement_6 = reactModule.createElement
		createElement_6 = createElement_6(editCTABarModule, {
			zIndex = 4,
			tools = var14,
			onToolSelected = var24,
			showText = var9,
			isLoadingMap = if var17 then { generateText = true } else nil,
			isDisabledMap = if getFFlagEnableMomentTextGeneration() and var17 then { text = true } else nil,
			onDisabledToolActivated = var3.onDisabledToolActivated,
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
	t_8.PreviewContainer = createElement_4(var42, t_9, t_10)
	t_8.GalleryView = if var11 ~= creationFlowStateModule.Gallery then if captureSource ~= nil then reactModule.createElement(galleryViewModule, {
		layoutOrder = 2,
		hasMoreCaptures = false,
		onShowMore = nil,
		captures = var2,
		onCaptureSelected = var20,
		onNextCallback = var21,
		selectedCapture = var12
	}) else reactModule.createElement(GallerySourceView, {
		layoutOrder = 2,
		captureSource = captureSource,
		onCaptureSelected = var20,
		onNextCallback = var21,
		selectedCapture = var12
	}) else nil
	t_8.PreviewView = if var11 == creationFlowStateModule.Preview then reactModule.createElement(previewViewModule, {
		layoutOrder = 2,
		onContinueCallback = var22,
		onReturnToGalleryCallback = if not p1.excludeGallery then var26 else nil
	}) else nil
	t_8.ActiveStepEditor = var31("Step")
	t_8.DescriptionView = if var11 == creationFlowStateModule.Description then reactModule.createElement(descriptionViewModule, {
		layoutOrder = 2,
		onPublish = var27,
		onReturnToEditing = var23
	}) else nil
	t_6.MainView = createElement_3(view, t_7, t_8)
	t_6.MusicView = var31("Overlay")
	t_4.MainViewContainer = createElement_2(view, t_5, t_6)
	t_2.CreationFlowView = createElement_1(view, t_3, t_4)
	t_2.Modal = var30()
	
	return reactModule.createElement(creationMediaProviderModule, {
		preview = var3.preview,
		getSelectedCapture = var3.getSelectedCapture
	}, createElement(view, t_1, t_2))
end

return function(p2)
	-- upvalues: reactModule (ref), isTextFilteredModule (ref), var1 (ref), publishMomentModule (ref), foundationProvider (ref), colorMode (ref), creationControllerProvider (ref), CreationFlowContent (ref)
	local onExit = p2.onExit
	local host = p2.host
	local captureSource = p2.captureSource
	local var40 = reactModule.useMemo(function()
		-- upvalues: host (ref), onExit (ref), captureSource (ref), isTextFilteredModule (copy), var1 (copy), publishMomentModule (copy)
		return if host == nil then {
			exitCreationFlow = onExit,
			captureSource = captureSource,
			isTextFiltered = isTextFilteredModule,
			createMoment = if var1 then function(_, _, p3)
				print(`[moments-creation] dev publish (not uploaded): "{p11}"`)
			end else publishMomentModule
		} else host
	end, { host, onExit, captureSource })
	
	return reactModule.createElement(foundationProvider, { colorMode = colorMode.Dark }, {
		Root = reactModule.createElement(creationControllerProvider, { host = var40, excludeGallery = p2.excludeGallery }, {
			Content = reactModule.createElement(CreationFlowContent, {
				excludeGallery = p2.excludeGallery,
				captureSource = var40.captureSource
			})
		})
	})
end