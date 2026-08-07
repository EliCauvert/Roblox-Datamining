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
local theme = foundationModule.Enums.Theme
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
local getFFlagMomentsAnalyticsProducerPrereqs = momentsCommonModule.Flags.GetFFlagMomentsAnalyticsProducerPrereqs
local useSignalState = signalsReactModule.useSignalState
local creationControllerModule = require(momentsCreation.CreationController)
local creationControllerProvider = creationControllerModule.CreationControllerProvider
local useCreationController = creationControllerModule.useCreationController
local useAutoDismissStateModule = require(momentsCreation.Hooks.useAutoDismissState)
local useDescriptionKeyboardInsetModule = require(momentsCreation.Hooks.useDescriptionKeyboardInset)
local getFFlagMomentsDescriptionKeyboardAvoidanceModule = require(momentsCreation.Flags.GetFFlagMomentsDescriptionKeyboardAvoidance)
local getFFlagMomentsDescriptionKeyboardAvoidanceFixModule = require(momentsCreation.Flags.GetFFlagMomentsDescriptionKeyboardAvoidanceFix)
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
local var32 = require(parent.MomentsCommon.isStudio)()
local var33 = if var32 then sampleCapturesModule else {}

local function noopActivated() --[[ line: 108 ]] end

local t = {
	affordance = foundationModule.Enums.StateLayerAffordance.None
}

local function GallerySourceView(p0) --[[ line: 115 ]]
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

local function CreationFlowContent(p1) --[[ line: 137 ]]
	-- upvalues: useCreationController (ref), useDeviceInsets (ref), useTokens (ref), useFormFactor (ref), useToggleState (ref), useAutoDismissStateModule (ref), useSignalState (ref), useDescriptionKeyboardInsetModule (ref), getFFlagMomentsDescriptionKeyboardAvoidanceModule (ref), creationFlowStateModule (ref), useCallback (ref), sessionManager (ref), funnelEventNames (ref), cryoModule (ref), makeCreationEventFieldsModule (ref), getFFlagMomentsAnalyticsProducerPrereqs (ref), fireAnalyticsEventModule (ref), eventNames (ref), dialogTypeModule (ref), useRef (ref), useEffect (ref), getFFlagMomentsStickerButton (ref), reactModule (ref), exitConfirmationDialogModule (ref), textFilteredDialogModule (ref), stepStubModule (ref), useMemo (ref), signalsModule (ref), getFFlagMomentsCreationBlockBackgroundInteractionModule (ref), view (ref), t (ref), formFactor (ref), noopActivated (ref), icon (ref), foundationModule (ref), getFFlagMomentsDescriptionKeyboardAvoidanceFixModule (ref), captureViewModule (ref), getFFlagMomentsCreationTextOverlayResolutionScaleModule (ref), musicChipModule (ref), playbackControlsModule (ref), editCTABarModule (ref), GallerySourceView (ref), galleryViewModule (ref), var33 (ref), previewViewModule (ref), descriptionViewModule (ref), creationMediaProviderModule (ref)
	local var38 = useCreationController()
	local var39 = useDeviceInsets()
	local var40 = useTokens()
	local var41 = useFormFactor()
	local var42 = useToggleState(false)
	local var43, var44 = useAutoDismissStateModule()
	local var45 = useSignalState(var38.getStep)
	local var46 = useSignalState(var38.getSelectedCapture)
	local var47 = useSignalState(var38.getComposedEdits)
	local var48 = useSignalState(var38.getAvailableTools)
	local var49 = useSignalState(var38.getActiveTool)
	local var50 = useSignalState(var38.getActiveModal)
	local var51 = useSignalState(var38.getIsGenerating)
	local music = var47.music
	local var52, var53 = useDescriptionKeyboardInsetModule(getFFlagMomentsDescriptionKeyboardAvoidanceModule() and var45 == creationFlowStateModule.Description)
	local captureSource = p1.captureSource
	local var54 = useCallback(function(p2) --[[ line: 169 ]]
		-- upvalues: var38 (ref), var44 (ref)
		var38.selectCapture(p2)
		var44()
	end, { var38, var44 })
	
	local function withCreationSession(p3) --[[ line: 178 ]]
		-- upvalues: sessionManager (copy), funnelEventNames (copy), cryoModule (copy), makeCreationEventFieldsModule (copy)
		return cryoModule.Dictionary.join(p3, makeCreationEventFieldsModule.makeCreationBaseFields(sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow)))
	end
	
	local function flowStepFields() --[[ line: 188 ]]
		-- upvalues: getFFlagMomentsAnalyticsProducerPrereqs (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), var38 (ref)
		return if getFFlagMomentsAnalyticsProducerPrereqs() then withCreationSession(makeCreationEventFieldsModule.makeStepFieldFromState(var38.getStep(false))) else { step = var38.getStep(false) }
	end
	
	local var57 = useCallback(function() --[[ line: 198 ]]
		-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), flowStepFields (ref), var38 (ref), creationFlowStateModule (copy), var44 (ref), withCreationSession (ref), makeCreationEventFieldsModule (copy)
		fireAnalyticsEventModule(eventNames.EditingFlowNextButtonPressed, flowStepFields())
		var38.navigate(creationFlowStateModule.Preview)
		var44()
		fireAnalyticsEventModule(eventNames.MomentsEditingFlowContinueToEditButtonPressed, withCreationSession(makeCreationEventFieldsModule.makeStepField(eventNames.MomentsEditingFlowContinueToEditButtonPressed)))
	end, { var38, var44 })
	local var58 = useCallback(function() --[[ line: 211 ]]
		-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), flowStepFields (ref), var38 (ref), creationFlowStateModule (copy), var42 (ref), withCreationSession (ref), makeCreationEventFieldsModule (copy)
		fireAnalyticsEventModule(eventNames.EditingFlowNextButtonPressed, flowStepFields())
		var38.navigate(creationFlowStateModule.Description)
		var42.disable()
		fireAnalyticsEventModule(eventNames.MomentsEditingFlowContinueToDescriptionButtonPressed, withCreationSession(makeCreationEventFieldsModule.makeStepField(eventNames.MomentsEditingFlowContinueToDescriptionButtonPressed)))
	end, { var38, var42.disable })
	local var59 = useCallback(function() --[[ line: 224 ]]
		-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), flowStepFields (ref), var38 (ref), creationFlowStateModule (copy)
		fireAnalyticsEventModule(eventNames.EditingFlowReturnButtonPressed, flowStepFields())
		var38.navigate(creationFlowStateModule.Preview)
	end, { var38 })
	local var60 = useCallback(function(p4) --[[ line: 229 ]]
		-- upvalues: var38 (ref)
		var38.beginTool(p4)
	end, { var38 })
	local var61 = useCallback(function() --[[ line: 233 ]]
		-- upvalues: var38 (ref)
		var38.beginTool("music")
	end, { var38 })
	local var62 = useCallback(function() --[[ line: 237 ]]
		-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), flowStepFields (ref), var38 (ref), dialogTypeModule (copy), var42 (ref)
		fireAnalyticsEventModule(eventNames.EditingFlowReturnButtonPressed, flowStepFields())
		var38.showModal({
			modalType = dialogTypeModule.ExitCreationConfirmation,
			modalProps = {
				onCancel = var38.dismissModal,
				onConfirm = function() --[[ line: 243 ]]
					-- upvalues: var38 (copy), var42 (copy)
					var38.dismissModal()
					var38.returnToGallery()
					var42.disable()
				end
			}
		})
	end, { var38, var42.disable })
	local var63 = useCallback(function() --[[ line: 252 ]]
		-- upvalues: var38 (ref)
		var38.publish()
	end, { var38 })
	local var64 = useCallback(function() --[[ line: 256 ]]
		-- upvalues: var46 (ref), var38 (ref), dialogTypeModule (copy)
		if var46 then
			var38.showModal({
				modalType = dialogTypeModule.ExitCreationConfirmation,
				modalProps = { onCancel = var38.dismissModal, onConfirm = var38.exit }
			})
			
			return
		end
		var38.exit()
	end, { var38, var46 })
	local var65 = useRef(nil)
	useEffect(function() --[[ line: 271 ]]
		-- upvalues: var65 (ref), var45 (ref), creationFlowStateModule (copy), fireAnalyticsEventModule (copy), eventNames (copy), withCreationSession (ref), makeCreationEventFieldsModule (copy), getFFlagMomentsStickerButton (copy)
		local current = var65.current
		var65.current = var45
		
		if var45 == creationFlowStateModule.Gallery then
			fireAnalyticsEventModule(eventNames.EditingFlowGalleryPageAppear, withCreationSession(makeCreationEventFieldsModule.makeStepField(eventNames.EditingFlowGalleryPageAppear)))
			
			return
		elseif var45 == creationFlowStateModule.Preview then
			if if current ~= creationFlowStateModule.Trimming then if current ~= creationFlowStateModule.Music then if current ~= creationFlowStateModule.TextOverlay then getFFlagMomentsStickerButton() and current == creationFlowStateModule.StickerOverlay else true else true else true then
				return
			else
				fireAnalyticsEventModule(eventNames.EditingFlowEditPageAppear, withCreationSession(makeCreationEventFieldsModule.makeStepField(eventNames.EditingFlowEditPageAppear)))
				
				return
			end
		elseif var45 == creationFlowStateModule.Description then
			fireAnalyticsEventModule(eventNames.EditingFlowPreviewPageAppear, withCreationSession(makeCreationEventFieldsModule.makeStepField(eventNames.EditingFlowPreviewPageAppear)))
		end
	end, { var45 })
	useEffect(function() --[[ line: 303 ]]
		-- upvalues: var45 (ref), creationFlowStateModule (copy), var42 (ref)
		if var45 == creationFlowStateModule.Gallery or var45 == creationFlowStateModule.Music or var45 == creationFlowStateModule.Description then
			var42.disable()
		end
	end, { var45, var42.disable })
	local var66 = useCallback(function() --[[ line: 313 ]]
		-- upvalues: var50 (ref), dialogTypeModule (copy), reactModule (copy), exitConfirmationDialogModule (copy), textFilteredDialogModule (copy)
		return if not (not var50 or not var50.modalType) then if var50.modalType == dialogTypeModule.ExitCreationConfirmation then reactModule.createElement(exitConfirmationDialogModule, var50.modalProps) elseif var50.modalType == dialogTypeModule.TextFiltered then reactModule.createElement(textFilteredDialogModule, var50.modalProps) else nil else nil
	end, { var50 })
	local var67 = useCallback(function(p5) --[[ line: 327 ]]
		-- upvalues: var49 (ref), var45 (ref), var38 (ref), reactModule (copy), stepStubModule (copy)
		if var49 == nil or var49.presentation ~= p5 or var45 ~= var49.step then
			return nil
		elseif var49.renderEditor ~= nil then
			local var72 = var49.renderEditor(var38)
			
			return if var72 == nil then reactModule.createElement(stepStubModule(var49.kind), {}) else var72
		end
	end, { var49, var45, var38 })
	local var68 = useMemo(function() --[[ line: 345 ]]
		-- upvalues: signalsModule (copy)
		local var73, var74 = signalsModule.createSignal(Vector2.zero)
		
		return { getItemSize = var73, setItemSize = var74 }
	end, {})
	local var69 = useMemo(function() --[[ line: 353 ]]
		-- upvalues: signalsModule (copy)
		local var75, var76 = signalsModule.createSignal(Vector2.zero)
		
		return { getItemResolution = var75, setItemResolution = var76 }
	end, {})
	local var70 = useMemo(function() --[[ line: 358 ]]
		-- upvalues: var68 (ref), var69 (ref)
		return {
			getItemSize = var68.getItemSize,
			getItemResolution = var69.getItemResolution
		}
	end, { var68, var69 })
	local var71 = getFFlagMomentsCreationBlockBackgroundInteractionModule()
	
	return reactModule.createElement(creationMediaProviderModule, {
		preview = var38.preview,
		getSelectedCapture = var38.getSelectedCapture
	}, reactModule.createElement(view, {
		tag = "position-center-center anchor-center-center size-full-full",
		backgroundStyle = var40.Color.Common.Scrim,
		onActivated = if var71 then var64 else nil,
		stateLayer = if var71 then t else nil,
		testId = if var71 then "moments-creation-background-scrim" else nil
	}, {
		CreationFlowView = reactModule.createElement(view, {
			tag = "position-center-center anchor-center-center size-full-full radius-large bg-surface-0",
			sizeConstraint = {
				MaxSize = if var41 == formFactor.Wide then Vector2.new(600, 700) else nil
			},
			onActivated = if var71 then noopActivated else nil,
			stateLayer = if var71 then t else nil,
			testId = if var71 then "moments-creation-panel" else nil
		}, {
			CloseButtonContainer = reactModule.createElement(view, {
				tag = "position-top-right anchor-top-right auto-xy",
				padding = {
					top = UDim.new(0, var39.top + var40.Padding.Medium),
					right = UDim.new(0, var39.right + var40.Padding.Medium)
				}
			}, {
				CloseButton = reactModule.createElement(view, {
					LayoutOrder = 1,
					tag = "size-1100-1100 padding-medium radius-circle bg-over-media-0",
					onActivated = var64
				}, {
					CloseIcon = reactModule.createElement(icon, {
						name = "icons/navigation/close_small",
						ZIndex = 2,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.fromScale(0.5, 0.5),
						size = foundationModule.Enums.IconSize.Small,
						style = var40.Color.ActionEmphasis.Foreground
					})
				})
			}),
			MainViewContainer = reactModule.createElement(view, { tag = "size-full", onAbsoluteSizeChanged = var53 }, {
				MainView = reactModule.createElement(view, {
					tag = "col align-x-center",
					Size = if getFFlagMomentsDescriptionKeyboardAvoidanceFixModule() then var52:map(function(p6) --[[ line: 441 ]]
						return UDim2.new(1, 0, 1, -p6)
					end) else UDim2.new(1, 0, 1, -var52)
				}, {
					PreviewContainer = reactModule.createElement("CanvasGroup", {
						LayoutOrder = 1,
						Size = UDim2.fromScale(1, 1),
						BackgroundTransparency = var40.Color.None.Transparency
					}, {
						UIFlexItem = reactModule.createElement("UIFlexItem", {
							FlexMode = Enum.UIFlexMode.Custom,
							ShrinkRatio = if var46 then 1 else 2
						}),
						UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var40.Radius.Large) }),
						ClickCapture = reactModule.createElement(view, {
							tag = "size-full",
							ZIndex = 0,
							onActivated = var44,
							stateLayer = {
								affordance = foundationModule.Enums.StateLayerAffordance.None
							}
						}),
						CaptureView = reactModule.createElement(captureViewModule, {
							preview = var38.preview,
							scaleType = if var42.enabled then Enum.ScaleType.Fit else Enum.ScaleType.Crop,
							onAbsoluteSizeChanged = useCallback(function(p7) --[[ line: 362 ]]
								-- upvalues: var68 (ref)
								var68.setItemSize(p7.AbsoluteSize)
							end, { var68 }),
							onResolutionChanged = if getFFlagMomentsCreationTextOverlayResolutionScaleModule() then useCallback(function(p8) --[[ line: 366 ]]
								-- upvalues: var69 (ref)
								var69.setItemResolution(p8)
							end, { var69 }) else nil
						}, useMemo(function() --[[ line: 370 ]]
							-- upvalues: var48 (ref), var38 (ref), var70 (ref)
							local t = {}
							
							for i, v in var48 do
								if v.renderPreviewLayer ~= nil then
									t[v.kind .. "PreviewLayer"] = v.renderPreviewLayer(var38, var70)
								end
							end
							return t
						end, { var48, var38, var70 })),
						PreviewMediaOverlay = reactModule.createElement(view, {
							tag = "col position-bottom-center anchor-bottom-center size-full-0 auto-y",
							ZIndex = 5
						}, {
							OtherControls = reactModule.createElement(view, {
								tag = "size-full-0 auto-y",
								LayoutOrder = 1,
								padding = {
									bottom = UDim.new(0, var40.Padding.Large),
									left = UDim.new(0, math.max(var39.left, var40.Padding.Large)),
									right = UDim.new(0, math.max(var39.right, var40.Padding.Large))
								}
							}, {
								MusicIndicator = if music and (var45 == creationFlowStateModule.Preview or var45 == creationFlowStateModule.Description) then reactModule.createElement(view, { tag = "position-bottom-left anchor-bottom-left auto-xy" }, {
									MusicChip = reactModule.createElement(musicChipModule, { musicAssetId = music.assetId, onActivated = var61 })
								}) else nil
							}),
							PlaybackControls = if var46 and var46.CaptureType == Enum.CaptureType.Video and var43 and (var45 == creationFlowStateModule.Gallery or var45 == creationFlowStateModule.Preview) then reactModule.createElement(playbackControlsModule, {
								layoutOrder = 2,
								preview = var38.preview,
								toggleFitMode = var42.toggle,
								isFitMode = var42.enabled
							}) else nil
						}),
						EditCTABar = if var45 == creationFlowStateModule.Preview then reactModule.createElement(editCTABarModule, {
							zIndex = 4,
							tools = var48,
							onToolSelected = var60,
							showText = var43,
							isLoadingMap = if var51 then { generateText = true } else nil
						}) else nil
					}),
					GalleryView = if var45 ~= creationFlowStateModule.Gallery then if captureSource ~= nil then reactModule.createElement(galleryViewModule, {
						layoutOrder = 2,
						hasMoreCaptures = false,
						onShowMore = nil,
						captures = var33,
						onCaptureSelected = var54,
						onNextCallback = var57,
						selectedCapture = var46
					}) else reactModule.createElement(GallerySourceView, {
						layoutOrder = 2,
						captureSource = captureSource,
						onCaptureSelected = var54,
						onNextCallback = var57,
						selectedCapture = var46
					}) else nil,
					PreviewView = if var45 == creationFlowStateModule.Preview then reactModule.createElement(previewViewModule, {
						layoutOrder = 2,
						onContinueCallback = var58,
						onReturnToGalleryCallback = if not p1.excludeGallery then var62 else nil
					}) else nil,
					ActiveStepEditor = var67("Step"),
					DescriptionView = if var45 == creationFlowStateModule.Description then reactModule.createElement(descriptionViewModule, {
						layoutOrder = 2,
						onPublish = var63,
						onReturnToEditing = var59
					}) else nil
				}),
				MusicView = var67("Overlay")
			})
		}),
		Modal = var66()
	}))
end

return function(p9) --[[ line: 593 | named "CreationFlowScreen" ]]
	-- upvalues: reactModule (ref), isTextFilteredModule (ref), var32 (ref), publishMomentModule (ref), foundationProvider (ref), theme (ref), creationControllerProvider (ref), CreationFlowContent (ref)
	local onExit = p9.onExit
	local host = p9.host
	local captureSource = p9.captureSource
	local var78 = reactModule.useMemo(function() --[[ line: 598 ]]
		-- upvalues: host (ref), onExit (ref), captureSource (ref), isTextFilteredModule (copy), var32 (copy), publishMomentModule (copy)
		return if host == nil then {
			exitCreationFlow = onExit,
			captureSource = captureSource,
			isTextFiltered = isTextFilteredModule,
			createMoment = if var32 then function(_, _, p10) --[[ line: 607 ]]
				print(`[moments-creation] dev publish (not uploaded): "{p10}"`)
			end else publishMomentModule
		} else host
	end, { host, onExit, captureSource })
	
	return reactModule.createElement(foundationProvider, { theme = theme.Dark }, {
		Root = reactModule.createElement(creationControllerProvider, { host = var78, excludeGallery = p9.excludeGallery }, {
			Content = reactModule.createElement(CreationFlowContent, {
				excludeGallery = p9.excludeGallery,
				captureSource = var78.captureSource
			})
		})
	})
end