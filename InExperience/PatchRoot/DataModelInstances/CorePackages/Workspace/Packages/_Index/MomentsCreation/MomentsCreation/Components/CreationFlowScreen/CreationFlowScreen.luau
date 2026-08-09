local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
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
local fireAnalyticsEventModule = require(momentsCreation.Analytics.fireAnalyticsEvent)
local useSignalState = signalsReactModule.useSignalState
local creationControllerModule = require(momentsCreation.CreationController)
local creationControllerProvider = creationControllerModule.CreationControllerProvider
local useCreationController = creationControllerModule.useCreationController
local useAutoDismissStateModule = require(momentsCreation.Hooks.useAutoDismissState)
local useDescriptionKeyboardInsetModule = require(momentsCreation.Hooks.useDescriptionKeyboardInset)
local getFFlagMomentsDescriptionKeyboardAvoidanceModule = require(momentsCreation.Flags.GetFFlagMomentsDescriptionKeyboardAvoidance)
local getFFlagMomentsDescriptionKeyboardAvoidanceFixModule = require(momentsCreation.Flags.GetFFlagMomentsDescriptionKeyboardAvoidanceFix)
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
local var28 = require(parent.MomentsCommon.isStudio)()
local var29 = if var28 then sampleCapturesModule else {}

local function GallerySourceView(p0) --[[ line: 98 ]]
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

local function CreationFlowContent(p1) --[[ line: 120 ]]
	-- upvalues: useCreationController (ref), useDeviceInsets (ref), useTokens (ref), useFormFactor (ref), useToggleState (ref), useAutoDismissStateModule (ref), useSignalState (ref), useDescriptionKeyboardInsetModule (ref), getFFlagMomentsDescriptionKeyboardAvoidanceModule (ref), creationFlowStateModule (ref), useCallback (ref), fireAnalyticsEventModule (ref), eventNames (ref), dialogTypeModule (ref), useRef (ref), useEffect (ref), reactModule (ref), exitConfirmationDialogModule (ref), textFilteredDialogModule (ref), stepStubModule (ref), useMemo (ref), signalsModule (ref), view (ref), formFactor (ref), icon (ref), foundationModule (ref), getFFlagMomentsDescriptionKeyboardAvoidanceFixModule (ref), captureViewModule (ref), musicChipModule (ref), playbackControlsModule (ref), editCTABarModule (ref), GallerySourceView (ref), galleryViewModule (ref), var29 (ref), previewViewModule (ref), descriptionViewModule (ref), creationMediaProviderModule (ref)
	local var32 = useCreationController()
	local var33 = useDeviceInsets()
	local var34 = useTokens()
	local var35 = useFormFactor()
	local var36 = useToggleState(false)
	local var37, var38 = useAutoDismissStateModule()
	local var39 = useSignalState(var32.getStep)
	local var40 = useSignalState(var32.getSelectedCapture)
	local var41 = useSignalState(var32.getComposedEdits)
	local var42 = useSignalState(var32.getAvailableTools)
	local var43 = useSignalState(var32.getActiveTool)
	local var44 = useSignalState(var32.getActiveModal)
	local music = var41.music
	local var45, var46 = useDescriptionKeyboardInsetModule(getFFlagMomentsDescriptionKeyboardAvoidanceModule() and var39 == creationFlowStateModule.Description)
	local captureSource = p1.captureSource
	local var47 = useCallback(function(p2) --[[ line: 151 ]]
		-- upvalues: var32 (ref), var38 (ref)
		var32.selectCapture(p2)
		var38()
	end, { var32, var38 })
	local var48 = useCallback(function() --[[ line: 157 ]]
		-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), var32 (ref), creationFlowStateModule (copy), var38 (ref)
		fireAnalyticsEventModule(eventNames.EditingFlowNextButtonPressed, { step = var32.getStep(false) })
		var32.navigate(creationFlowStateModule.Preview)
		var38()
		fireAnalyticsEventModule(eventNames.MomentsEditingFlowContinueToEditButtonPressed)
	end, { var32, var38 })
	local var49 = useCallback(function() --[[ line: 167 ]]
		-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), var32 (ref), creationFlowStateModule (copy), var36 (ref)
		fireAnalyticsEventModule(eventNames.EditingFlowNextButtonPressed, { step = var32.getStep(false) })
		var32.navigate(creationFlowStateModule.Description)
		var36.disable()
		fireAnalyticsEventModule(eventNames.MomentsEditingFlowContinueToDescriptionButtonPressed)
	end, { var32, var36.disable })
	local var50 = useCallback(function() --[[ line: 177 ]]
		-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), var32 (ref), creationFlowStateModule (copy)
		fireAnalyticsEventModule(eventNames.EditingFlowReturnButtonPressed, { step = var32.getStep(false) })
		var32.navigate(creationFlowStateModule.Preview)
	end, { var32 })
	local var51 = useCallback(function(p3) --[[ line: 184 ]]
		-- upvalues: var32 (ref)
		var32.beginTool(p3)
	end, { var32 })
	local var52 = useCallback(function() --[[ line: 188 ]]
		-- upvalues: var32 (ref)
		var32.beginTool("music")
	end, { var32 })
	local var53 = useCallback(function() --[[ line: 192 ]]
		-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), var32 (ref), dialogTypeModule (copy), var36 (ref)
		fireAnalyticsEventModule(eventNames.EditingFlowReturnButtonPressed, { step = var32.getStep(false) })
		var32.showModal({
			modalType = dialogTypeModule.ExitCreationConfirmation,
			modalProps = {
				onCancel = var32.dismissModal,
				onConfirm = function() --[[ line: 200 ]]
					-- upvalues: var32 (copy), var36 (copy)
					var32.dismissModal()
					var32.returnToGallery()
					var36.disable()
				end
			}
		})
	end, { var32, var36.disable })
	local var54 = useCallback(function() --[[ line: 209 ]]
		-- upvalues: var32 (ref)
		var32.publish()
	end, { var32 })
	local var55 = useCallback(function() --[[ line: 213 ]]
		-- upvalues: var40 (ref), var32 (ref), dialogTypeModule (copy)
		if var40 then
			var32.showModal({
				modalType = dialogTypeModule.ExitCreationConfirmation,
				modalProps = { onCancel = var32.dismissModal, onConfirm = var32.exit }
			})
			
			return
		end
		var32.exit()
	end, { var32, var40 })
	local var56 = useRef(nil)
	useEffect(function() --[[ line: 228 ]]
		-- upvalues: var56 (ref), var39 (ref), creationFlowStateModule (copy), fireAnalyticsEventModule (copy), eventNames (copy)
		local current = var56.current
		var56.current = var39
		
		if var39 == creationFlowStateModule.Gallery then
			fireAnalyticsEventModule(eventNames.EditingFlowGalleryPageAppear)
			
			return
		elseif var39 == creationFlowStateModule.Preview then
			if if current ~= creationFlowStateModule.Trimming then if current ~= creationFlowStateModule.Music then current == creationFlowStateModule.TextOverlay else true else true then
				return
			else
				fireAnalyticsEventModule(eventNames.EditingFlowEditPageAppear)
				
				return
			end
		elseif var39 == creationFlowStateModule.Description then
			fireAnalyticsEventModule(eventNames.EditingFlowPreviewPageAppear)
		end
	end, { var39 })
	useEffect(function() --[[ line: 248 ]]
		-- upvalues: var39 (ref), creationFlowStateModule (copy), var36 (ref)
		if var39 == creationFlowStateModule.Gallery or var39 == creationFlowStateModule.Music or var39 == creationFlowStateModule.Description then
			var36.disable()
		end
	end, { var39, var36.disable })
	local var57 = useCallback(function() --[[ line: 258 ]]
		-- upvalues: var44 (ref), dialogTypeModule (copy), reactModule (copy), exitConfirmationDialogModule (copy), textFilteredDialogModule (copy)
		return if not (not var44 or not var44.modalType) then if var44.modalType == dialogTypeModule.ExitCreationConfirmation then reactModule.createElement(exitConfirmationDialogModule, var44.modalProps) elseif var44.modalType == dialogTypeModule.TextFiltered then reactModule.createElement(textFilteredDialogModule, var44.modalProps) else nil else nil
	end, { var44 })
	local var58 = useCallback(function(p4) --[[ line: 272 ]]
		-- upvalues: var43 (ref), var39 (ref), var32 (ref), reactModule (copy), stepStubModule (copy)
		if var43 == nil or var43.presentation ~= p4 or var39 ~= var43.step then
			return nil
		elseif var43.renderEditor ~= nil then
			local var61 = var43.renderEditor(var32)
			
			return if var61 == nil then reactModule.createElement(stepStubModule(var43.kind), {}) else var61
		end
	end, { var43, var39, var32 })
	local var59 = useMemo(function() --[[ line: 290 ]]
		-- upvalues: signalsModule (copy)
		local var62, var63 = signalsModule.createSignal(Vector2.zero)
		
		return { getItemSize = var62, setItemSize = var63 }
	end, {})
	local var60 = useMemo(function() --[[ line: 295 ]]
		-- upvalues: var59 (ref)
		return { getItemSize = var59.getItemSize }
	end, { var59 })
	
	return reactModule.createElement(creationMediaProviderModule, {
		preview = var32.preview,
		getSelectedCapture = var32.getSelectedCapture
	}, reactModule.createElement(view, {
		tag = "position-center-center anchor-center-center size-full-full",
		backgroundStyle = var34.Color.Common.Scrim
	}, {
		CreationFlowView = reactModule.createElement(view, {
			tag = "position-center-center anchor-center-center size-full-full radius-large bg-surface-0",
			sizeConstraint = {
				MaxSize = if var35 == formFactor.Wide then Vector2.new(600, 700) else nil
			}
		}, {
			CloseButtonContainer = reactModule.createElement(view, {
				tag = "position-top-right anchor-top-right auto-xy",
				padding = {
					top = UDim.new(0, var33.top + var34.Padding.Medium),
					right = UDim.new(0, var33.right + var34.Padding.Medium)
				}
			}, {
				CloseButton = reactModule.createElement(view, {
					LayoutOrder = 1,
					tag = "size-1100-1100 padding-medium radius-circle bg-over-media-0",
					onActivated = var55
				}, {
					CloseIcon = reactModule.createElement(icon, {
						name = "icons/navigation/close_small",
						ZIndex = 2,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.fromScale(0.5, 0.5),
						size = foundationModule.Enums.IconSize.Small,
						style = var34.Color.ActionEmphasis.Foreground
					})
				})
			}),
			MainViewContainer = reactModule.createElement(view, { tag = "size-full", onAbsoluteSizeChanged = var46 }, {
				MainView = reactModule.createElement(view, {
					tag = "col align-x-center",
					Size = if getFFlagMomentsDescriptionKeyboardAvoidanceFixModule() then var45:map(function(p5) --[[ line: 362 ]]
						return UDim2.new(1, 0, 1, -p5)
					end) else UDim2.new(1, 0, 1, -var45)
				}, {
					PreviewContainer = reactModule.createElement("CanvasGroup", {
						LayoutOrder = 1,
						Size = UDim2.fromScale(1, 1),
						BackgroundTransparency = var34.Color.None.Transparency
					}, {
						UIFlexItem = reactModule.createElement("UIFlexItem", {
							FlexMode = Enum.UIFlexMode.Custom,
							ShrinkRatio = if var40 then 1 else 2
						}),
						UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var34.Radius.Large) }),
						ClickCapture = reactModule.createElement(view, {
							tag = "size-full",
							ZIndex = 0,
							onActivated = var38,
							stateLayer = {
								affordance = foundationModule.Enums.StateLayerAffordance.None
							}
						}),
						CaptureView = reactModule.createElement(captureViewModule, {
							preview = var32.preview,
							scaleType = if var36.enabled then Enum.ScaleType.Fit else Enum.ScaleType.Crop,
							onAbsoluteSizeChanged = useCallback(function(p6) --[[ line: 299 ]]
								-- upvalues: var59 (ref)
								var59.setItemSize(p6.AbsoluteSize)
							end, { var59 })
						}, useMemo(function() --[[ line: 303 ]]
							-- upvalues: var42 (ref), var32 (ref), var60 (ref)
							local t = {}
							
							for i, v in var42 do
								if v.renderPreviewLayer ~= nil then
									t[v.kind .. "PreviewLayer"] = v.renderPreviewLayer(var32, var60)
								end
							end
							return t
						end, { var42, var32, var60 })),
						PreviewMediaOverlay = reactModule.createElement(view, {
							tag = "col position-bottom-center anchor-bottom-center size-full-0 auto-y",
							ZIndex = 5
						}, {
							OtherControls = reactModule.createElement(view, {
								tag = "size-full-0 auto-y",
								LayoutOrder = 1,
								padding = {
									bottom = UDim.new(0, var34.Padding.Large),
									left = UDim.new(0, math.max(var33.left, var34.Padding.Large)),
									right = UDim.new(0, math.max(var33.right, var34.Padding.Large))
								}
							}, {
								MusicIndicator = if music and (var39 == creationFlowStateModule.Preview or var39 == creationFlowStateModule.Description) then reactModule.createElement(view, { tag = "position-bottom-left anchor-bottom-left auto-xy" }, {
									MusicChip = reactModule.createElement(musicChipModule, { musicAssetId = music.assetId, onActivated = var52 })
								}) else nil
							}),
							PlaybackControls = if var40 and var40.CaptureType == Enum.CaptureType.Video and var37 and (var39 == creationFlowStateModule.Gallery or var39 == creationFlowStateModule.Preview) then reactModule.createElement(playbackControlsModule, {
								layoutOrder = 2,
								preview = var32.preview,
								toggleFitMode = var36.toggle,
								isFitMode = var36.enabled
							}) else nil
						}),
						EditCTABar = if var39 == creationFlowStateModule.Preview then reactModule.createElement(editCTABarModule, {
							zIndex = 4,
							tools = var42,
							onToolSelected = var51,
							showText = var37
						}) else nil
					}),
					GalleryView = if var39 ~= creationFlowStateModule.Gallery then if captureSource ~= nil then reactModule.createElement(galleryViewModule, {
						layoutOrder = 2,
						hasMoreCaptures = false,
						onShowMore = nil,
						captures = var29,
						onCaptureSelected = var47,
						onNextCallback = var48,
						selectedCapture = var40
					}) else reactModule.createElement(GallerySourceView, {
						layoutOrder = 2,
						captureSource = captureSource,
						onCaptureSelected = var47,
						onNextCallback = var48,
						selectedCapture = var40
					}) else nil,
					PreviewView = if var39 == creationFlowStateModule.Preview then reactModule.createElement(previewViewModule, {
						layoutOrder = 2,
						onContinueCallback = var49,
						onReturnToGalleryCallback = if not p1.excludeGallery then var53 else nil
					}) else nil,
					ActiveStepEditor = var58("Step"),
					DescriptionView = if var39 == creationFlowStateModule.Description then reactModule.createElement(descriptionViewModule, {
						layoutOrder = 2,
						onPublish = var54,
						onReturnToEditing = var50
					}) else nil
				}),
				MusicView = var58("Overlay")
			})
		}),
		Modal = var57()
	}))
end

return function(p7) --[[ line: 510 | named "CreationFlowScreen" ]]
	-- upvalues: reactModule (ref), isTextFilteredModule (ref), var28 (ref), publishMomentModule (ref), foundationProvider (ref), theme (ref), creationControllerProvider (ref), CreationFlowContent (ref)
	local onExit = p7.onExit
	local host = p7.host
	local captureSource = p7.captureSource
	local var65 = reactModule.useMemo(function() --[[ line: 515 ]]
		-- upvalues: host (ref), onExit (ref), captureSource (ref), isTextFilteredModule (copy), var28 (copy), publishMomentModule (copy)
		return if host == nil then {
			exitCreationFlow = onExit,
			captureSource = captureSource,
			isTextFiltered = isTextFilteredModule,
			createMoment = if var28 then function(_, _, p8) --[[ line: 524 ]]
				print(`[moments-creation] dev publish (not uploaded): "{p8}"`)
			end else publishMomentModule
		} else host
	end, { host, onExit, captureSource })
	
	return reactModule.createElement(foundationProvider, { theme = theme.Dark }, {
		Root = reactModule.createElement(creationControllerProvider, { host = var65, excludeGallery = p7.excludeGallery }, {
			Content = reactModule.createElement(CreationFlowContent, {
				excludeGallery = p7.excludeGallery,
				captureSource = var65.captureSource
			})
		})
	})
end