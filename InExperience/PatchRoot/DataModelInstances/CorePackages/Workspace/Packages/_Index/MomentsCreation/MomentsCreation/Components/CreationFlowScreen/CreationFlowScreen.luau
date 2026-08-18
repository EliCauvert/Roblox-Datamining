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
local sampleCapturesModule = require(momentsCreation.Capture.sampleCaptures)
local publishMomentModule = require(momentsCreation.Upload.publishMoment)
local isTextFilteredModule = require(momentsCreation.Moderation.isTextFiltered)
local musicChipModule = require(momentsCreation.Components.MusicChip)
local var33 = require(parent.MomentsCommon.isStudio)()
local var34 = if var33 then sampleCapturesModule else {}

local function noopActivated() --[[ line: 110 ]] end

local t = {
	affordance = foundationModule.Enums.StateLayerAffordance.None
}

local function GallerySourceView(p0) --[[ line: 117 ]]
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

local function CreationFlowContent(p1) --[[ line: 139 ]]
	-- upvalues: useCreationController (ref), getFFlagMomentsCreationSaveDraft (ref), useDraftRestoreEffectModule (ref), useDraftSaveEffectModule (ref), useDeviceInsets (ref), useTokens (ref), useFormFactor (ref), useToggleState (ref), useAutoDismissStateModule (ref), useSignalState (ref), useDescriptionKeyboardInsetModule (ref), getFFlagMomentsDescriptionKeyboardAvoidanceModule (ref), creationFlowStateModule (ref), useCallback (ref), sessionManager (ref), funnelEventNames (ref), cryoModule (ref), makeCreationEventFieldsModule (ref), getFFlagMomentsAnalyticsProducerPrereqs (ref), fireAnalyticsEventModule (ref), eventNames (ref), dialogTypeModule (ref), useRef (ref), useEffect (ref), getFFlagMomentsStickerButton (ref), reactModule (ref), exitConfirmationDialogModule (ref), textFilteredDialogModule (ref), stepStubModule (ref), useMemo (ref), signalsModule (ref), getFFlagMomentsCreationBlockBackgroundInteractionModule (ref), view (ref), t (ref), formFactor (ref), noopActivated (ref), icon (ref), foundationModule (ref), captureViewModule (ref), getFFlagMomentsCreationTextOverlayResolutionScaleModule (ref), musicChipModule (ref), playbackControlsModule (ref), editCTABarModule (ref), getFFlagEnableMomentTextGeneration (ref), GallerySourceView (ref), galleryViewModule (ref), var34 (ref), previewViewModule (ref), descriptionViewModule (ref), creationMediaProviderModule (ref)
	local var39 = useCreationController()
	
	if getFFlagMomentsCreationSaveDraft() then
		useDraftRestoreEffectModule(p1.captureSource)
		useDraftSaveEffectModule()
	end
	local createElement_5
	local var40 = useDeviceInsets()
	local var41 = useTokens()
	local var42 = useFormFactor()
	local var43 = useToggleState(false)
	local var44, var45 = useAutoDismissStateModule()
	local var46 = useSignalState(var39.getStep)
	local var47 = useSignalState(var39.getSelectedCapture)
	local var48 = useSignalState(var39.getComposedEdits)
	local var49 = useSignalState(var39.getAvailableTools)
	local var50 = useSignalState(var39.getActiveTool)
	local var51 = useSignalState(var39.getActiveModal)
	local var52 = useSignalState(var39.getIsGenerating)
	local music = var48.music
	local var53, var54 = useDescriptionKeyboardInsetModule(getFFlagMomentsDescriptionKeyboardAvoidanceModule() and var46 == creationFlowStateModule.Description)
	local captureSource = p1.captureSource
	local var55 = useCallback(function(p2) --[[ line: 179 ]]
		-- upvalues: var39 (ref), var45 (ref)
		var39.selectCapture(p2)
		var45()
	end, { var39, var45 })
	
	local function withCreationSession(p3) --[[ line: 188 ]]
		-- upvalues: sessionManager (copy), funnelEventNames (copy), cryoModule (copy), makeCreationEventFieldsModule (copy)
		return cryoModule.Dictionary.join(p3, makeCreationEventFieldsModule.makeCreationBaseFields(sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow)))
	end
	
	local function flowStepFields() --[[ line: 198 ]]
		-- upvalues: getFFlagMomentsAnalyticsProducerPrereqs (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), var39 (ref)
		return if getFFlagMomentsAnalyticsProducerPrereqs() then withCreationSession(makeCreationEventFieldsModule.makeStepFieldFromState(var39.getStep(false))) else { step = var39.getStep(false) }
	end
	
	local var58 = useCallback(function() --[[ line: 208 ]]
		-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), flowStepFields (ref), var39 (ref), creationFlowStateModule (copy), var45 (ref), withCreationSession (ref), makeCreationEventFieldsModule (copy)
		fireAnalyticsEventModule(eventNames.EditingFlowNextButtonPressed, flowStepFields())
		var39.navigate(creationFlowStateModule.Preview)
		var45()
		fireAnalyticsEventModule(eventNames.MomentsEditingFlowContinueToEditButtonPressed, withCreationSession(makeCreationEventFieldsModule.makeStepField(eventNames.MomentsEditingFlowContinueToEditButtonPressed)))
	end, { var39, var45 })
	local var59 = useCallback(function() --[[ line: 221 ]]
		-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), flowStepFields (ref), var39 (ref), creationFlowStateModule (copy), var43 (ref), withCreationSession (ref), makeCreationEventFieldsModule (copy)
		fireAnalyticsEventModule(eventNames.EditingFlowNextButtonPressed, flowStepFields())
		var39.navigate(creationFlowStateModule.Description)
		var43.disable()
		fireAnalyticsEventModule(eventNames.MomentsEditingFlowContinueToDescriptionButtonPressed, withCreationSession(makeCreationEventFieldsModule.makeStepField(eventNames.MomentsEditingFlowContinueToDescriptionButtonPressed)))
	end, { var39, var43.disable })
	local var60 = useCallback(function() --[[ line: 234 ]]
		-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), flowStepFields (ref), var39 (ref), creationFlowStateModule (copy)
		fireAnalyticsEventModule(eventNames.EditingFlowReturnButtonPressed, flowStepFields())
		var39.navigate(creationFlowStateModule.Preview)
	end, { var39 })
	local var61 = useCallback(function(p4) --[[ line: 239 ]]
		-- upvalues: var39 (ref)
		var39.beginTool(p4)
	end, { var39 })
	local var62 = useCallback(function() --[[ line: 243 ]]
		-- upvalues: var39 (ref)
		var39.beginTool("music")
	end, { var39 })
	local var63 = useCallback(function() --[[ line: 247 ]]
		-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), flowStepFields (ref), var39 (ref), dialogTypeModule (copy), var43 (ref)
		fireAnalyticsEventModule(eventNames.EditingFlowReturnButtonPressed, flowStepFields())
		var39.showModal({
			modalType = dialogTypeModule.ExitCreationConfirmation,
			modalProps = {
				onCancel = var39.dismissModal,
				onConfirm = function() --[[ line: 253 ]]
					-- upvalues: var39 (copy), var43 (copy)
					var39.dismissModal()
					var39.returnToGallery()
					var43.disable()
				end
			}
		})
	end, { var39, var43.disable })
	local var64 = useCallback(function() --[[ line: 262 ]]
		-- upvalues: var39 (ref)
		var39.publish()
	end, { var39 })
	local var65 = useCallback(function() --[[ line: 266 ]]
		-- upvalues: var47 (ref), var39 (ref), dialogTypeModule (copy)
		if var47 then
			var39.showModal({
				modalType = dialogTypeModule.ExitCreationConfirmation,
				modalProps = { onCancel = var39.dismissModal, onConfirm = var39.exit }
			})
			
			return
		end
		var39.exit()
	end, { var39, var47 })
	local var66 = useRef(nil)
	useEffect(function() --[[ line: 281 ]]
		-- upvalues: var66 (ref), var46 (ref), creationFlowStateModule (copy), fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), getFFlagMomentsStickerButton (copy)
		local current = var66.current
		var66.current = var46
		
		if var46 == creationFlowStateModule.Gallery then
			fireAnalyticsEventModule(eventNames.EditingFlowGalleryPageAppear, withCreationSession(makeCreationEventFieldsModule.makeStepField(eventNames.EditingFlowGalleryPageAppear)))
			
			return
		elseif var46 == creationFlowStateModule.Preview then
			if if current ~= creationFlowStateModule.Trimming then if current ~= creationFlowStateModule.Music then if current ~= creationFlowStateModule.TextOverlay then getFFlagMomentsStickerButton() and current == creationFlowStateModule.StickerOverlay else true else true else true then
				return
			else
				fireAnalyticsEventModule(eventNames.EditingFlowEditPageAppear, withCreationSession(makeCreationEventFieldsModule.makeStepField(eventNames.EditingFlowEditPageAppear)))
				
				return
			end
		elseif var46 == creationFlowStateModule.Description then
			fireAnalyticsEventModule(eventNames.EditingFlowPreviewPageAppear, withCreationSession(makeCreationEventFieldsModule.makeStepField(eventNames.EditingFlowPreviewPageAppear)))
		end
	end, { var46 })
	useEffect(function() --[[ line: 313 ]]
		-- upvalues: var46 (ref), creationFlowStateModule (copy), var43 (ref)
		if var46 == creationFlowStateModule.Gallery or var46 == creationFlowStateModule.Music or var46 == creationFlowStateModule.Description then
			var43.disable()
		end
	end, { var46, var43.disable })
	local var67 = useCallback(function() --[[ line: 323 ]]
		-- upvalues: var51 (ref), dialogTypeModule (copy), reactModule (copy), exitConfirmationDialogModule (copy), textFilteredDialogModule (copy)
		return if not (not var51 or not var51.modalType) then if var51.modalType == dialogTypeModule.ExitCreationConfirmation then reactModule.createElement(exitConfirmationDialogModule, var51.modalProps) elseif var51.modalType == dialogTypeModule.TextFiltered then reactModule.createElement(textFilteredDialogModule, var51.modalProps) else nil else nil
	end, { var51 })
	local var68 = useCallback(function(p5) --[[ line: 337 ]]
		-- upvalues: var50 (ref), var46 (ref), var39 (ref), reactModule (copy), stepStubModule (copy)
		if var50 == nil or var50.presentation ~= p5 or var46 ~= var50.step then
			return nil
		elseif var50.renderEditor ~= nil then
			local var88 = var50.renderEditor(var39)
			
			return if var88 == nil then reactModule.createElement(stepStubModule(var50.kind), {}) else var88
		end
	end, { var50, var46, var39 })
	local var69 = useMemo(function() --[[ line: 355 ]]
		-- upvalues: signalsModule (copy)
		local var89, var90 = signalsModule.createSignal(Vector2.zero)
		
		return { getItemSize = var89, setItemSize = var90 }
	end, {})
	local var70 = useMemo(function() --[[ line: 363 ]]
		-- upvalues: signalsModule (copy)
		local var91, var92 = signalsModule.createSignal(Vector2.zero)
		
		return { getItemResolution = var91, setItemResolution = var92 }
	end, {})
	local var71 = useMemo(function() --[[ line: 368 ]]
		-- upvalues: var69 (ref), var70 (ref)
		return {
			getItemSize = var69.getItemSize,
			getItemResolution = var70.getItemResolution
		}
	end, { var69, var70 })
	local var72 = useCallback(function(p6) --[[ line: 372 ]]
		-- upvalues: var69 (ref)
		var69.setItemSize(p6.AbsoluteSize)
	end, { var69 })
	local var73 = useCallback(function(p7) --[[ line: 376 ]]
		-- upvalues: var70 (ref)
		var70.setItemResolution(p7)
	end, { var70 })
	local var74 = useMemo(function() --[[ line: 380 ]]
		-- upvalues: var49 (ref), var39 (ref), var71 (ref)
		local t = {}
		
		for i, v in var49 do
			if v.renderPreviewLayer ~= nil then
				t[v.kind .. "PreviewLayer"] = v.renderPreviewLayer(var39, var71)
			end
		end
		return t
	end, { var49, var39, var71 })
	local var75 = if var43.enabled then Enum.ScaleType.Fit else Enum.ScaleType.Crop
	local var76 = getFFlagMomentsCreationBlockBackgroundInteractionModule()
	local createElement = reactModule.createElement
	local t_1 = {
		tag = "position-center-center anchor-center-center size-full-full",
		backgroundStyle = var41.Color.Common.Scrim,
		onActivated = if var76 then var65 else nil,
		stateLayer = if var76 then t else nil,
		testId = if var76 then "moments-creation-background-scrim" else nil
	}
	local t_2 = {}
	local createElement_1 = reactModule.createElement
	local t_3 = {
		tag = "position-center-center anchor-center-center size-full-full radius-large bg-surface-0",
		sizeConstraint = {
			MaxSize = if var42 == formFactor.Wide then Vector2.new(600, 700) else nil
		},
		onActivated = if var76 then noopActivated else nil,
		stateLayer = if var76 then t else nil,
		testId = if var76 then "moments-creation-panel" else nil
	}
	local t_4 = {
		CloseButtonContainer = reactModule.createElement(view, {
			tag = "position-top-right anchor-top-right auto-xy",
			padding = {
				top = UDim.new(0, var40.top + var41.Padding.Medium),
				right = UDim.new(0, var40.right + var41.Padding.Medium)
			}
		}, {
			CloseButton = reactModule.createElement(view, {
				LayoutOrder = 1,
				tag = "size-1100-1100 padding-medium radius-circle bg-over-media-0",
				onActivated = var65
			}, {
				CloseIcon = reactModule.createElement(icon, {
					name = "icons/navigation/close_small",
					ZIndex = 2,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					size = foundationModule.Enums.IconSize.Small,
					style = var41.Color.ActionEmphasis.Foreground
				})
			})
		})
	}
	local createElement_2 = reactModule.createElement
	local t_5 = { tag = "size-full", onAbsoluteSizeChanged = var54 }
	local t_6 = {}
	local createElement_3 = reactModule.createElement
	local t_7 = {
		tag = "col align-x-center",
		Size = var53:map(function(p8) --[[ line: 450 ]]
			return UDim2.new(1, 0, 1, -p8)
		end)
	}
	local t_8 = {}
	local createElement_4 = reactModule.createElement
	local var85 = "CanvasGroup"
	local t_9 = {
		LayoutOrder = 1,
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = var41.Color.None.Transparency
	}
	local t_10 = {
		UIFlexItem = reactModule.createElement("UIFlexItem", {
			FlexMode = Enum.UIFlexMode.Custom,
			ShrinkRatio = if var47 then 1 else 2
		}),
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var41.Radius.Large) }),
		ClickCapture = reactModule.createElement(view, {
			tag = "size-full",
			ZIndex = 0,
			onActivated = var45,
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			}
		}),
		CaptureView = reactModule.createElement(captureViewModule, {
			preview = var39.preview,
			scaleType = var75,
			onAbsoluteSizeChanged = var72,
			onResolutionChanged = if getFFlagMomentsCreationTextOverlayResolutionScaleModule() then var73 else nil
		}, var74),
		PreviewMediaOverlay = reactModule.createElement(view, {
			tag = "col position-bottom-center anchor-bottom-center size-full-0 auto-y",
			ZIndex = 5
		}, {
			OtherControls = reactModule.createElement(view, {
				tag = "size-full-0 auto-y",
				LayoutOrder = 1,
				padding = {
					bottom = UDim.new(0, var41.Padding.Large),
					left = UDim.new(0, math.max(var40.left, var41.Padding.Large)),
					right = UDim.new(0, math.max(var40.right, var41.Padding.Large))
				}
			}, {
				MusicIndicator = if music and (var46 == creationFlowStateModule.Preview or var46 == creationFlowStateModule.Description) then reactModule.createElement(view, { tag = "position-bottom-left anchor-bottom-left auto-xy" }, {
					MusicChip = reactModule.createElement(musicChipModule, { musicAssetId = music.assetId, onActivated = var62 })
				}) else nil
			}),
			PlaybackControls = if var47 and var47.CaptureType == Enum.CaptureType.Video and var44 and (var46 == creationFlowStateModule.Gallery or var46 == creationFlowStateModule.Preview) then reactModule.createElement(playbackControlsModule, {
				layoutOrder = 2,
				preview = var39.preview,
				toggleFitMode = var43.toggle,
				isFitMode = var43.enabled
			}) else nil
		})
	}
	
	if var46 == creationFlowStateModule.Preview then
		createElement_5 = reactModule.createElement
		createElement_5 = createElement_5(editCTABarModule, {
			zIndex = 4,
			tools = var49,
			onToolSelected = var61,
			showText = var44,
			isLoadingMap = if var52 then { generateText = true } else nil,
			isDisabledMap = if getFFlagEnableMomentTextGeneration() and var52 then { text = true } else nil,
			onDisabledToolActivated = var39.onDisabledToolActivated
		})
	else
		createElement_5 = nil
	end
	t_10.EditCTABar = createElement_5
	t_8.PreviewContainer = createElement_4(var85, t_9, t_10)
	t_8.GalleryView = if var46 ~= creationFlowStateModule.Gallery then if captureSource ~= nil then reactModule.createElement(galleryViewModule, {
		layoutOrder = 2,
		hasMoreCaptures = false,
		onShowMore = nil,
		captures = var34,
		onCaptureSelected = var55,
		onNextCallback = var58,
		selectedCapture = var47
	}) else reactModule.createElement(GallerySourceView, {
		layoutOrder = 2,
		captureSource = captureSource,
		onCaptureSelected = var55,
		onNextCallback = var58,
		selectedCapture = var47
	}) else nil
	t_8.PreviewView = if var46 == creationFlowStateModule.Preview then reactModule.createElement(previewViewModule, {
		layoutOrder = 2,
		onContinueCallback = var59,
		onReturnToGalleryCallback = if not p1.excludeGallery then var63 else nil
	}) else nil
	t_8.ActiveStepEditor = var68("Step")
	t_8.DescriptionView = if var46 == creationFlowStateModule.Description then reactModule.createElement(descriptionViewModule, {
		layoutOrder = 2,
		onPublish = var64,
		onReturnToEditing = var60
	}) else nil
	t_6.MainView = createElement_3(view, t_7, t_8)
	t_6.MusicView = var68("Overlay")
	t_4.MainViewContainer = createElement_2(view, t_5, t_6)
	t_2.CreationFlowView = createElement_1(view, t_3, t_4)
	t_2.Modal = var67()
	
	return reactModule.createElement(creationMediaProviderModule, {
		preview = var39.preview,
		getSelectedCapture = var39.getSelectedCapture
	}, createElement(view, t_1, t_2))
end

return function(p9) --[[ line: 608 | named "CreationFlowScreen" ]]
	-- upvalues: reactModule (ref), isTextFilteredModule (ref), var33 (ref), publishMomentModule (ref), foundationProvider (ref), colorMode (ref), creationControllerProvider (ref), CreationFlowContent (ref)
	local onExit = p9.onExit
	local host = p9.host
	local captureSource = p9.captureSource
	local var94 = reactModule.useMemo(function() --[[ line: 613 ]]
		-- upvalues: host (ref), onExit (ref), captureSource (ref), isTextFilteredModule (copy), var33 (copy), publishMomentModule (copy)
		return if host == nil then {
			exitCreationFlow = onExit,
			captureSource = captureSource,
			isTextFiltered = isTextFilteredModule,
			createMoment = if var33 then function(_, _, p10) --[[ line: 622 ]]
				print(`[moments-creation] dev publish (not uploaded): "{p10}"`)
			end else publishMomentModule
		} else host
	end, { host, onExit, captureSource })
	
	return reactModule.createElement(foundationProvider, { colorMode = colorMode.Dark }, {
		Root = reactModule.createElement(creationControllerProvider, { host = var94, excludeGallery = p9.excludeGallery }, {
			Content = reactModule.createElement(CreationFlowContent, {
				excludeGallery = p9.excludeGallery,
				captureSource = var94.captureSource
			})
		})
	})
end