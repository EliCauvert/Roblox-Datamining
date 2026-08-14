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
local useSignalState = signalsReactModule.useSignalState
local creationControllerModule = require(momentsCreation.CreationController)
local creationControllerProvider = creationControllerModule.CreationControllerProvider
local useCreationController = creationControllerModule.useCreationController
local useAutoDismissStateModule = require(momentsCreation.Hooks.useAutoDismissState)
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
local var31 = require(parent.MomentsCommon.isStudio)()
local var32 = if var31 then sampleCapturesModule else {}

local function noopActivated() --[[ line: 107 ]] end

local t = {
	affordance = foundationModule.Enums.StateLayerAffordance.None
}

local function GallerySourceView(p0) --[[ line: 114 ]]
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

local function CreationFlowContent(p1) --[[ line: 136 ]]
	-- upvalues: useCreationController (ref), useDeviceInsets (ref), useTokens (ref), useFormFactor (ref), useToggleState (ref), useAutoDismissStateModule (ref), useSignalState (ref), useDescriptionKeyboardInsetModule (ref), getFFlagMomentsDescriptionKeyboardAvoidanceModule (ref), creationFlowStateModule (ref), useCallback (ref), sessionManager (ref), funnelEventNames (ref), cryoModule (ref), makeCreationEventFieldsModule (ref), getFFlagMomentsAnalyticsProducerPrereqs (ref), fireAnalyticsEventModule (ref), eventNames (ref), dialogTypeModule (ref), useRef (ref), useEffect (ref), getFFlagMomentsStickerButton (ref), reactModule (ref), exitConfirmationDialogModule (ref), textFilteredDialogModule (ref), stepStubModule (ref), useMemo (ref), signalsModule (ref), getFFlagMomentsCreationBlockBackgroundInteractionModule (ref), view (ref), t (ref), formFactor (ref), noopActivated (ref), icon (ref), foundationModule (ref), captureViewModule (ref), getFFlagMomentsCreationTextOverlayResolutionScaleModule (ref), musicChipModule (ref), playbackControlsModule (ref), editCTABarModule (ref), getFFlagEnableMomentTextGeneration (ref), GallerySourceView (ref), galleryViewModule (ref), var32 (ref), previewViewModule (ref), descriptionViewModule (ref), creationMediaProviderModule (ref)
	local createElement_5
	local var37 = useCreationController()
	local var38 = useDeviceInsets()
	local var39 = useTokens()
	local var40 = useFormFactor()
	local var41 = useToggleState(false)
	local var42, var43 = useAutoDismissStateModule()
	local var44 = useSignalState(var37.getStep)
	local var45 = useSignalState(var37.getSelectedCapture)
	local var46 = useSignalState(var37.getComposedEdits)
	local var47 = useSignalState(var37.getAvailableTools)
	local var48 = useSignalState(var37.getActiveTool)
	local var49 = useSignalState(var37.getActiveModal)
	local var50 = useSignalState(var37.getIsGenerating)
	local music = var46.music
	local var51, var52 = useDescriptionKeyboardInsetModule(getFFlagMomentsDescriptionKeyboardAvoidanceModule() and var44 == creationFlowStateModule.Description)
	local captureSource = p1.captureSource
	local var53 = useCallback(function(p2) --[[ line: 168 ]]
		-- upvalues: var37 (ref), var43 (ref)
		var37.selectCapture(p2)
		var43()
	end, { var37, var43 })
	
	local function withCreationSession(p3) --[[ line: 177 ]]
		-- upvalues: sessionManager (copy), funnelEventNames (copy), cryoModule (copy), makeCreationEventFieldsModule (copy)
		return cryoModule.Dictionary.join(p3, makeCreationEventFieldsModule.makeCreationBaseFields(sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow)))
	end
	
	local function flowStepFields() --[[ line: 187 ]]
		-- upvalues: getFFlagMomentsAnalyticsProducerPrereqs (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), var37 (ref)
		return if getFFlagMomentsAnalyticsProducerPrereqs() then withCreationSession(makeCreationEventFieldsModule.makeStepFieldFromState(var37.getStep(false))) else { step = var37.getStep(false) }
	end
	
	local var56 = useCallback(function() --[[ line: 197 ]]
		-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), flowStepFields (ref), var37 (ref), creationFlowStateModule (copy), var43 (ref), withCreationSession (ref), makeCreationEventFieldsModule (copy)
		fireAnalyticsEventModule(eventNames.EditingFlowNextButtonPressed, flowStepFields())
		var37.navigate(creationFlowStateModule.Preview)
		var43()
		fireAnalyticsEventModule(eventNames.MomentsEditingFlowContinueToEditButtonPressed, withCreationSession(makeCreationEventFieldsModule.makeStepField(eventNames.MomentsEditingFlowContinueToEditButtonPressed)))
	end, { var37, var43 })
	local var57 = useCallback(function() --[[ line: 210 ]]
		-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), flowStepFields (ref), var37 (ref), creationFlowStateModule (copy), var41 (ref), withCreationSession (ref), makeCreationEventFieldsModule (copy)
		fireAnalyticsEventModule(eventNames.EditingFlowNextButtonPressed, flowStepFields())
		var37.navigate(creationFlowStateModule.Description)
		var41.disable()
		fireAnalyticsEventModule(eventNames.MomentsEditingFlowContinueToDescriptionButtonPressed, withCreationSession(makeCreationEventFieldsModule.makeStepField(eventNames.MomentsEditingFlowContinueToDescriptionButtonPressed)))
	end, { var37, var41.disable })
	local var58 = useCallback(function() --[[ line: 223 ]]
		-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), flowStepFields (ref), var37 (ref), creationFlowStateModule (copy)
		fireAnalyticsEventModule(eventNames.EditingFlowReturnButtonPressed, flowStepFields())
		var37.navigate(creationFlowStateModule.Preview)
	end, { var37 })
	local var59 = useCallback(function(p4) --[[ line: 228 ]]
		-- upvalues: var37 (ref)
		var37.beginTool(p4)
	end, { var37 })
	local var60 = useCallback(function() --[[ line: 232 ]]
		-- upvalues: var37 (ref)
		var37.beginTool("music")
	end, { var37 })
	local var61 = useCallback(function() --[[ line: 236 ]]
		-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), flowStepFields (ref), var37 (ref), dialogTypeModule (copy), var41 (ref)
		fireAnalyticsEventModule(eventNames.EditingFlowReturnButtonPressed, flowStepFields())
		var37.showModal({
			modalType = dialogTypeModule.ExitCreationConfirmation,
			modalProps = {
				onCancel = var37.dismissModal,
				onConfirm = function() --[[ line: 242 ]]
					-- upvalues: var37 (copy), var41 (copy)
					var37.dismissModal()
					var37.returnToGallery()
					var41.disable()
				end
			}
		})
	end, { var37, var41.disable })
	local var62 = useCallback(function() --[[ line: 251 ]]
		-- upvalues: var37 (ref)
		var37.publish()
	end, { var37 })
	local var63 = useCallback(function() --[[ line: 255 ]]
		-- upvalues: var45 (ref), var37 (ref), dialogTypeModule (copy)
		if var45 then
			var37.showModal({
				modalType = dialogTypeModule.ExitCreationConfirmation,
				modalProps = { onCancel = var37.dismissModal, onConfirm = var37.exit }
			})
			
			return
		end
		var37.exit()
	end, { var37, var45 })
	local var64 = useRef(nil)
	useEffect(function() --[[ line: 270 ]]
		-- upvalues: var64 (ref), var44 (ref), creationFlowStateModule (copy), fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), getFFlagMomentsStickerButton (copy)
		local current = var64.current
		var64.current = var44
		
		if var44 == creationFlowStateModule.Gallery then
			fireAnalyticsEventModule(eventNames.EditingFlowGalleryPageAppear, withCreationSession(makeCreationEventFieldsModule.makeStepField(eventNames.EditingFlowGalleryPageAppear)))
			
			return
		elseif var44 == creationFlowStateModule.Preview then
			if if current ~= creationFlowStateModule.Trimming then if current ~= creationFlowStateModule.Music then if current ~= creationFlowStateModule.TextOverlay then getFFlagMomentsStickerButton() and current == creationFlowStateModule.StickerOverlay else true else true else true then
				return
			else
				fireAnalyticsEventModule(eventNames.EditingFlowEditPageAppear, withCreationSession(makeCreationEventFieldsModule.makeStepField(eventNames.EditingFlowEditPageAppear)))
				
				return
			end
		elseif var44 == creationFlowStateModule.Description then
			fireAnalyticsEventModule(eventNames.EditingFlowPreviewPageAppear, withCreationSession(makeCreationEventFieldsModule.makeStepField(eventNames.EditingFlowPreviewPageAppear)))
		end
	end, { var44 })
	useEffect(function() --[[ line: 302 ]]
		-- upvalues: var44 (ref), creationFlowStateModule (copy), var41 (ref)
		if var44 == creationFlowStateModule.Gallery or var44 == creationFlowStateModule.Music or var44 == creationFlowStateModule.Description then
			var41.disable()
		end
	end, { var44, var41.disable })
	local var65 = useCallback(function() --[[ line: 312 ]]
		-- upvalues: var49 (ref), dialogTypeModule (copy), reactModule (copy), exitConfirmationDialogModule (copy), textFilteredDialogModule (copy)
		return if not (not var49 or not var49.modalType) then if var49.modalType == dialogTypeModule.ExitCreationConfirmation then reactModule.createElement(exitConfirmationDialogModule, var49.modalProps) elseif var49.modalType == dialogTypeModule.TextFiltered then reactModule.createElement(textFilteredDialogModule, var49.modalProps) else nil else nil
	end, { var49 })
	local var66 = useCallback(function(p5) --[[ line: 326 ]]
		-- upvalues: var48 (ref), var44 (ref), var37 (ref), reactModule (copy), stepStubModule (copy)
		if var48 == nil or var48.presentation ~= p5 or var44 ~= var48.step then
			return nil
		elseif var48.renderEditor ~= nil then
			local var86 = var48.renderEditor(var37)
			
			return if var86 == nil then reactModule.createElement(stepStubModule(var48.kind), {}) else var86
		end
	end, { var48, var44, var37 })
	local var67 = useMemo(function() --[[ line: 344 ]]
		-- upvalues: signalsModule (copy)
		local var87, var88 = signalsModule.createSignal(Vector2.zero)
		
		return { getItemSize = var87, setItemSize = var88 }
	end, {})
	local var68 = useMemo(function() --[[ line: 352 ]]
		-- upvalues: signalsModule (copy)
		local var89, var90 = signalsModule.createSignal(Vector2.zero)
		
		return { getItemResolution = var89, setItemResolution = var90 }
	end, {})
	local var69 = useMemo(function() --[[ line: 357 ]]
		-- upvalues: var67 (ref), var68 (ref)
		return {
			getItemSize = var67.getItemSize,
			getItemResolution = var68.getItemResolution
		}
	end, { var67, var68 })
	local var70 = useCallback(function(p6) --[[ line: 361 ]]
		-- upvalues: var67 (ref)
		var67.setItemSize(p6.AbsoluteSize)
	end, { var67 })
	local var71 = useCallback(function(p7) --[[ line: 365 ]]
		-- upvalues: var68 (ref)
		var68.setItemResolution(p7)
	end, { var68 })
	local var72 = useMemo(function() --[[ line: 369 ]]
		-- upvalues: var47 (ref), var37 (ref), var69 (ref)
		local t = {}
		
		for i, v in var47 do
			if v.renderPreviewLayer ~= nil then
				t[v.kind .. "PreviewLayer"] = v.renderPreviewLayer(var37, var69)
			end
		end
		return t
	end, { var47, var37, var69 })
	local var73 = if var41.enabled then Enum.ScaleType.Fit else Enum.ScaleType.Crop
	local var74 = getFFlagMomentsCreationBlockBackgroundInteractionModule()
	local createElement = reactModule.createElement
	local t_1 = {
		tag = "position-center-center anchor-center-center size-full-full",
		backgroundStyle = var39.Color.Common.Scrim,
		onActivated = if var74 then var63 else nil,
		stateLayer = if var74 then t else nil,
		testId = if var74 then "moments-creation-background-scrim" else nil
	}
	local t_2 = {}
	local createElement_1 = reactModule.createElement
	local t_3 = {
		tag = "position-center-center anchor-center-center size-full-full radius-large bg-surface-0",
		sizeConstraint = {
			MaxSize = if var40 == formFactor.Wide then Vector2.new(600, 700) else nil
		},
		onActivated = if var74 then noopActivated else nil,
		stateLayer = if var74 then t else nil,
		testId = if var74 then "moments-creation-panel" else nil
	}
	local t_4 = {
		CloseButtonContainer = reactModule.createElement(view, {
			tag = "position-top-right anchor-top-right auto-xy",
			padding = {
				top = UDim.new(0, var38.top + var39.Padding.Medium),
				right = UDim.new(0, var38.right + var39.Padding.Medium)
			}
		}, {
			CloseButton = reactModule.createElement(view, {
				LayoutOrder = 1,
				tag = "size-1100-1100 padding-medium radius-circle bg-over-media-0",
				onActivated = var63
			}, {
				CloseIcon = reactModule.createElement(icon, {
					name = "icons/navigation/close_small",
					ZIndex = 2,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					size = foundationModule.Enums.IconSize.Small,
					style = var39.Color.ActionEmphasis.Foreground
				})
			})
		})
	}
	local createElement_2 = reactModule.createElement
	local t_5 = { tag = "size-full", onAbsoluteSizeChanged = var52 }
	local t_6 = {}
	local createElement_3 = reactModule.createElement
	local t_7 = {
		tag = "col align-x-center",
		Size = var51:map(function(p8) --[[ line: 439 ]]
			return UDim2.new(1, 0, 1, -p8)
		end)
	}
	local t_8 = {}
	local createElement_4 = reactModule.createElement
	local var83 = "CanvasGroup"
	local t_9 = {
		LayoutOrder = 1,
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = var39.Color.None.Transparency
	}
	local t_10 = {
		UIFlexItem = reactModule.createElement("UIFlexItem", {
			FlexMode = Enum.UIFlexMode.Custom,
			ShrinkRatio = if var45 then 1 else 2
		}),
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var39.Radius.Large) }),
		ClickCapture = reactModule.createElement(view, {
			tag = "size-full",
			ZIndex = 0,
			onActivated = var43,
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			}
		}),
		CaptureView = reactModule.createElement(captureViewModule, {
			preview = var37.preview,
			scaleType = var73,
			onAbsoluteSizeChanged = var70,
			onResolutionChanged = if getFFlagMomentsCreationTextOverlayResolutionScaleModule() then var71 else nil
		}, var72),
		PreviewMediaOverlay = reactModule.createElement(view, {
			tag = "col position-bottom-center anchor-bottom-center size-full-0 auto-y",
			ZIndex = 5
		}, {
			OtherControls = reactModule.createElement(view, {
				tag = "size-full-0 auto-y",
				LayoutOrder = 1,
				padding = {
					bottom = UDim.new(0, var39.Padding.Large),
					left = UDim.new(0, math.max(var38.left, var39.Padding.Large)),
					right = UDim.new(0, math.max(var38.right, var39.Padding.Large))
				}
			}, {
				MusicIndicator = if music and (var44 == creationFlowStateModule.Preview or var44 == creationFlowStateModule.Description) then reactModule.createElement(view, { tag = "position-bottom-left anchor-bottom-left auto-xy" }, {
					MusicChip = reactModule.createElement(musicChipModule, { musicAssetId = music.assetId, onActivated = var60 })
				}) else nil
			}),
			PlaybackControls = if var45 and var45.CaptureType == Enum.CaptureType.Video and var42 and (var44 == creationFlowStateModule.Gallery or var44 == creationFlowStateModule.Preview) then reactModule.createElement(playbackControlsModule, {
				layoutOrder = 2,
				preview = var37.preview,
				toggleFitMode = var41.toggle,
				isFitMode = var41.enabled
			}) else nil
		})
	}
	
	if var44 == creationFlowStateModule.Preview then
		createElement_5 = reactModule.createElement
		createElement_5 = createElement_5(editCTABarModule, {
			zIndex = 4,
			tools = var47,
			onToolSelected = var59,
			showText = var42,
			isLoadingMap = if var50 then { generateText = true } else nil,
			isDisabledMap = if getFFlagEnableMomentTextGeneration() and var50 then { text = true } else nil,
			onDisabledToolActivated = var37.onDisabledToolActivated
		})
	else
		createElement_5 = nil
	end
	t_10.EditCTABar = createElement_5
	t_8.PreviewContainer = createElement_4(var83, t_9, t_10)
	t_8.GalleryView = if var44 ~= creationFlowStateModule.Gallery then if captureSource ~= nil then reactModule.createElement(galleryViewModule, {
		layoutOrder = 2,
		hasMoreCaptures = false,
		onShowMore = nil,
		captures = var32,
		onCaptureSelected = var53,
		onNextCallback = var56,
		selectedCapture = var45
	}) else reactModule.createElement(GallerySourceView, {
		layoutOrder = 2,
		captureSource = captureSource,
		onCaptureSelected = var53,
		onNextCallback = var56,
		selectedCapture = var45
	}) else nil
	t_8.PreviewView = if var44 == creationFlowStateModule.Preview then reactModule.createElement(previewViewModule, {
		layoutOrder = 2,
		onContinueCallback = var57,
		onReturnToGalleryCallback = if not p1.excludeGallery then var61 else nil
	}) else nil
	t_8.ActiveStepEditor = var66("Step")
	t_8.DescriptionView = if var44 == creationFlowStateModule.Description then reactModule.createElement(descriptionViewModule, {
		layoutOrder = 2,
		onPublish = var62,
		onReturnToEditing = var58
	}) else nil
	t_6.MainView = createElement_3(view, t_7, t_8)
	t_6.MusicView = var66("Overlay")
	t_4.MainViewContainer = createElement_2(view, t_5, t_6)
	t_2.CreationFlowView = createElement_1(view, t_3, t_4)
	t_2.Modal = var65()
	
	return reactModule.createElement(creationMediaProviderModule, {
		preview = var37.preview,
		getSelectedCapture = var37.getSelectedCapture
	}, createElement(view, t_1, t_2))
end

return function(p9) --[[ line: 597 | named "CreationFlowScreen" ]]
	-- upvalues: reactModule (ref), isTextFilteredModule (ref), var31 (ref), publishMomentModule (ref), foundationProvider (ref), colorMode (ref), creationControllerProvider (ref), CreationFlowContent (ref)
	local onExit = p9.onExit
	local host = p9.host
	local captureSource = p9.captureSource
	local var92 = reactModule.useMemo(function() --[[ line: 602 ]]
		-- upvalues: host (ref), onExit (ref), captureSource (ref), isTextFilteredModule (copy), var31 (copy), publishMomentModule (copy)
		return if host == nil then {
			exitCreationFlow = onExit,
			captureSource = captureSource,
			isTextFiltered = isTextFilteredModule,
			createMoment = if var31 then function(_, _, p10) --[[ line: 611 ]]
				print(`[moments-creation] dev publish (not uploaded): "{p10}"`)
			end else publishMomentModule
		} else host
	end, { host, onExit, captureSource })
	
	return reactModule.createElement(foundationProvider, { colorMode = colorMode.Dark }, {
		Root = reactModule.createElement(creationControllerProvider, { host = var92, excludeGallery = p9.excludeGallery }, {
			Content = reactModule.createElement(CreationFlowContent, {
				excludeGallery = p9.excludeGallery,
				captureSource = var92.captureSource
			})
		})
	})
end