local momentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local parent = momentsCreationFlow.Parent
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local icon = foundationModule.Icon
local view = foundationModule.View
local captureViewModule = require(momentsCreationFlow.Components.CaptureView)
local descriptionViewModule = require(momentsCreationFlow.Components.DescriptionView)
local editCTABarModule = require(momentsCreationFlow.Components.EditCTABar)
local galleryViewModule = require(momentsCreationFlow.Components.GalleryView)
local musicChipModule = require(momentsCreationFlow.Components.MusicChip)
local musicOverlayModule = require(momentsCreationFlow.Components.MusicOverlay)
local playbackControlsModule = require(momentsCreationFlow.Components.PlaybackControls)
local previewViewModule = require(momentsCreationFlow.Components.PreviewView)
local textOverlayDisplay = momentsCommonModule.TextOverlayDisplay
local exitConfirmationDialogModule = require(momentsCreationFlow.Components.Dialogs.ExitConfirmationDialog)
local textFilteredDialogModule = require(momentsCreationFlow.Components.Dialogs.TextFilteredDialog)
local textOverlayEditorModule = require(momentsCreationFlow.Components.TextOverlay.TextOverlayEditor)
local textOverlayViewModule = require(momentsCreationFlow.Components.TextOverlay.TextOverlayView)
local trimmingViewModule = require(momentsCreationFlow.Components.TrimmingView)
local clearEditsModule = require(momentsCreationFlow.Actions.ClearEdits)
local creationFlowStateUpdatedModule = require(momentsCreationFlow.Actions.CreationFlowStateUpdated)
local musicEditUpdatedModule = require(momentsCreationFlow.Actions.MusicEditUpdated)
local selectedCaptureUpdatedModule = require(momentsCreationFlow.Actions.SelectedCaptureUpdated)
local textOverlayEditsUpdatedModule = require(momentsCreationFlow.Actions.TextOverlayEditsUpdated)
local trimEditUpdatedModule = require(momentsCreationFlow.Actions.TrimEditUpdated)
local useAutoDismissStateModule = require(momentsCreationFlow.Hooks.useAutoDismissState)
local useCallback = reactModule.useCallback
local useDeviceInsets = momentsCommonModule.Hooks.useDeviceInsets
local useDispatch = momentsCommonModule.Hooks.useDispatch
local useFormFactor = momentsCommonModule.Hooks.useFormFactor
local useMemo = reactModule.useMemo
local useRef = reactModule.useRef
local useSelector = momentsCommonModule.Hooks.useSelector
local useToggleState = momentsCommonModule.Hooks.useToggleState
local useTokens = foundationModule.Hooks.useTokens
local useUnifiedPlayback = momentsCommonModule.Hooks.useUnifiedPlayback
local creationFlowContextModule = require(momentsCreationFlow.Context.CreationFlowContext)
local getContentFromCaptureModule = require(momentsCreationFlow.Utils.getContentFromCapture)
local makeMomentMetadataModule = require(momentsCreationFlow.Utils.makeMomentMetadata)
local makeRegistrationInfoModule = require(momentsCreationFlow.Utils.makeRegistrationInfo)
local creationFlowStateModule = require(momentsCreationFlow.Enums.CreationFlowState)
local dialogTypeModule = require(momentsCreationFlow.Enums.DialogType)
local formFactor = momentsCommonModule.Enums.FormFactor
local constantsModule = require(momentsCreationFlow.Constants)
local creationFlowLocalizationModule = require(momentsCreationFlow.Enums.CreationFlowLocalization)
local eventNamesModule = require(momentsCreationFlow.Analytics.EventNames)
local t = {
	rotation = 0,
	scale = 1,
	text = "",
	zIndex = 1,
	position = UDim2.fromScale(0.5, 0.5),
	textOverlayStyle = {
		fontSize = 16,
		font = Enum.Font.BuilderSansMedium,
		fontColor = Color3.new(0, 0, 0),
		textXAlignment = Enum.TextXAlignment.Center
	}
}

return function(p0)
	-- upvalues: useDispatch (ref), useDeviceInsets (ref), useTokens (ref), useFormFactor (ref), useToggleState (ref), useAutoDismissStateModule (ref), reactModule (ref), creationFlowContextModule (ref), useCallback (ref), useRef (ref), useSelector (ref), constantsModule (ref), useMemo (ref), useUnifiedPlayback (ref), getContentFromCaptureModule (ref), eventNamesModule (ref), creationFlowStateUpdatedModule (ref), creationFlowStateModule (ref), dialogTypeModule (ref), makeMomentMetadataModule (ref), makeRegistrationInfoModule (ref), clearEditsModule (ref), trimEditUpdatedModule (ref), musicEditUpdatedModule (ref), textOverlayEditsUpdatedModule (ref), t (ref), selectedCaptureUpdatedModule (ref), view (ref), foundationModule (ref), creationFlowLocalizationModule (ref), exitConfirmationDialogModule (ref), textFilteredDialogModule (ref), formFactor (ref), icon (ref), musicChipModule (ref), playbackControlsModule (ref), textOverlayEditorModule (ref), captureViewModule (ref), textOverlayDisplay (ref), editCTABarModule (ref), galleryViewModule (ref), previewViewModule (ref), trimmingViewModule (ref), textOverlayViewModule (ref), descriptionViewModule (ref), musicOverlayModule (ref)
	local var34 = useDispatch()
	local var35 = useDeviceInsets()
	local var36 = useTokens()
	local var37 = useFormFactor()
	local var38 = useToggleState(false)
	local var39, var40 = useAutoDismissStateModule()
	local var41 = reactModule.useContext(creationFlowContextModule)
	local var42, var43 = reactModule.useState(Vector2.new(0, 0))
	local var44, var45 = reactModule.useState(Vector2.new(0, 0))
	local var46, var47 = reactModule.useState({ modalType = nil, modalProps = nil })
	local var48 = useCallback(function(p1)
		-- upvalues: var45 (ref)
		var45(p1.AbsoluteSize)
	end, {})
	local captures = var41.captures
	local var49 = useRef(0)
	local var50 = useSelector(function(p2)
		-- upvalues: constantsModule (copy)
		return p2[constantsModule.RoduxKey].CreationFlow.currentState
	end)
	local var51 = useSelector(function(p3)
		-- upvalues: constantsModule (copy)
		return p3[constantsModule.RoduxKey].CreationFlow.capture
	end)
	local var52 = useSelector(function(p4)
		-- upvalues: constantsModule (copy)
		return p4[constantsModule.RoduxKey].CreationFlow.textOverlayEdits
	end)
	local var53 = useSelector(function(p5)
		-- upvalues: constantsModule (copy)
		return p5[constantsModule.RoduxKey].CreationFlow.trimEdit
	end)
	local var54 = useSelector(function(p6)
		-- upvalues: constantsModule (copy)
		return p6[constantsModule.RoduxKey].CreationFlow.musicEdit
	end)
	local var55 = useSelector(function(p7)
		-- upvalues: constantsModule (copy)
		return p7[constantsModule.RoduxKey].CreationFlow.description
	end)
	local var56, var57 = reactModule.useState(nil)
	local var58, var59 = reactModule.useState(nil)
	local var60, var61 = reactModule.useState(nil)
	local var62 = useMemo(function()
		-- upvalues: var60 (ref), var54 (ref)
		return var60 or var54
	end, { var60, var54 })
	local var63 = useMemo(function()
		-- upvalues: var58 (ref), var53 (ref)
		return var58 or var53
	end, { var58, var53 })
	local var64 = useUnifiedPlayback(true, {
		autoplay = true,
		looping = true,
		edits = { trim = var63, music = var62 },
		content = if var51 then getContentFromCaptureModule(var51) else nil,
		captureType = if var51 then var51.CaptureType else nil
	})
	local var65 = useCallback(function()
		-- upvalues: var41 (ref), eventNamesModule (copy), var50 (ref), var34 (ref), creationFlowStateUpdatedModule (copy), creationFlowStateModule (copy), var40 (ref)
		var41.fireEvent(eventNamesModule.EditingFlowNextButtonPressed, { editFlowState = var50 })
		var34(creationFlowStateUpdatedModule(creationFlowStateModule.Preview))
		var40()
		var41.fireEvent(eventNamesModule.MomentsEditingFlowContinueToEditButtonPressed)
	end, { var40, var50 })
	local var66 = useCallback(function()
		-- upvalues: var41 (ref), eventNamesModule (copy), var50 (ref), var34 (ref), creationFlowStateUpdatedModule (copy), creationFlowStateModule (copy), var38 (ref)
		var41.fireEvent(eventNamesModule.EditingFlowNextButtonPressed, { editFlowState = var50 })
		var34(creationFlowStateUpdatedModule(creationFlowStateModule.Description))
		var38.disable()
		var41.fireEvent(eventNamesModule.MomentsEditingFlowContinueToDescriptionButtonPressed)
	end, { var50 })
	local var67 = useCallback(function(p8)
		-- upvalues: var41 (ref), var47 (ref), dialogTypeModule (copy)
		local var86 = var41.isTextFiltered(p8)
		
		if var86 then
			var47({
				modalType = dialogTypeModule.TextFiltered,
				modalProps = {
					onConfirm = function()
						-- upvalues: var47 (copy)
						var47(nil)
					end
				}
			})
		end
		return var86
	end, {})
	local var68 = useCallback(function()
		-- upvalues: var67 (ref), var55 (ref), var49 (ref), var53 (ref), var54 (ref), var52 (ref), makeMomentMetadataModule (copy), var51 (ref), makeRegistrationInfoModule (copy), var41 (ref), p0 (ref), var34 (ref), clearEditsModule (copy), creationFlowStateModule (copy), eventNamesModule (copy)
		if var67(var55) then return end
		local processTime = os.clock()
		
		if processTime - var49.current < 0.5 then return end
		var49.current = processTime
		local var88 = makeMomentMetadataModule(var51, var55, { trim = var53, music = var54, textOverlays = var52 })
		var41.createMoment(var51, var88, makeRegistrationInfoModule(var51, var88))
		
		if p0.excludeGallery then
			var34(clearEditsModule(creationFlowStateModule.Preview))
		else
			var34(clearEditsModule(creationFlowStateModule.Gallery))
		end
		var41.fireEvent(eventNamesModule.MomentsEditingFlowPublished)
		var41.exitCreationFlow()
	end, {
		var51, var55, var54, var41, var52, var53, p0.excludeGallery
	})
	local var69 = useCallback(function()
		-- upvalues: var41 (ref), eventNamesModule (copy), var50 (ref), var34 (ref), creationFlowStateUpdatedModule (copy), creationFlowStateModule (copy)
		var41.fireEvent(eventNamesModule.EditingFlowReturnButtonPressed, { editFlowState = var50 })
		var34(creationFlowStateUpdatedModule(creationFlowStateModule.Preview))
	end, { var50 })
	local var70 = useCallback(function()
		-- upvalues: var41 (ref), eventNamesModule (copy), var50 (ref), var47 (ref), var34 (ref), clearEditsModule (copy), creationFlowStateModule (copy), var38 (ref), dialogTypeModule (copy)
		var41.fireEvent(eventNamesModule.EditingFlowReturnButtonPressed, { editFlowState = var50 })
		var47({
			modalType = dialogTypeModule.ExitCreationConfirmation,
			modalProps = {
				onCancel = function()
					-- upvalues: var47 (copy)
					var47(nil)
				end,
				onConfirm = function()
					-- upvalues: var47 (copy), var34 (copy), clearEditsModule (copy), creationFlowStateModule (copy), var38 (copy)
					var47(nil)
					var34(clearEditsModule(creationFlowStateModule.Gallery))
					var38.disable()
				end
			}
		})
	end, { var50 })
	local var71 = useCallback(function()
		-- upvalues: var59 (ref), var34 (ref), creationFlowStateUpdatedModule (copy), creationFlowStateModule (copy), var41 (ref), eventNamesModule (copy)
		var59(nil)
		var34(creationFlowStateUpdatedModule(creationFlowStateModule.Preview))
		var41.fireEvent(eventNamesModule.EditingFlowTrimBackButtonPressed)
	end, { var41 })
	local var72 = useCallback(function()
		-- upvalues: var34 (ref), trimEditUpdatedModule (copy), var58 (ref), var59 (ref), creationFlowStateUpdatedModule (copy), creationFlowStateModule (copy), var41 (ref), eventNamesModule (copy)
		var34(trimEditUpdatedModule(var58))
		var59(nil)
		var34(creationFlowStateUpdatedModule(creationFlowStateModule.Preview))
		var41.fireEvent(eventNamesModule.EditingFlowTrimDoneButtonPressed)
	end, { var58, var41 })
	local var73 = useCallback(function(p9)
		-- upvalues: var59 (ref)
		var59(p9)
	end, {})
	local var74 = useCallback(function()
		-- upvalues: var61 (ref), var34 (ref), creationFlowStateUpdatedModule (copy), creationFlowStateModule (copy), var41 (ref), eventNamesModule (copy)
		var61(nil)
		var34(creationFlowStateUpdatedModule(creationFlowStateModule.Preview))
		var41.fireEvent(eventNamesModule.EditingFlowMusicBackButtonPressed)
	end, {})
	local var75 = useCallback(function()
		-- upvalues: var34 (ref), musicEditUpdatedModule (copy), var60 (ref), var61 (ref), creationFlowStateUpdatedModule (copy), creationFlowStateModule (copy), var41 (ref), eventNamesModule (copy)
		var34(musicEditUpdatedModule(var60))
		var61(nil)
		var34(creationFlowStateUpdatedModule(creationFlowStateModule.Preview))
		var41.fireEvent(eventNamesModule.EditingFlowMusicDoneButtonPressed)
	end, { var60 })
	local var76 = useCallback(function(p10)
		-- upvalues: var61 (ref)
		var61(p10)
	end, {})
	local var77 = useCallback(function()
		-- upvalues: var57 (ref), var34 (ref), creationFlowStateUpdatedModule (copy), creationFlowStateModule (copy), var41 (ref), eventNamesModule (copy)
		var57(nil)
		var34(creationFlowStateUpdatedModule(creationFlowStateModule.Preview))
		var41.fireEvent(eventNamesModule.EditingFlowTextOverlayBackButtonPressed)
	end, { var56, var41 })
	local var78 = useCallback(function()
		-- upvalues: var56 (ref), var34 (ref), textOverlayEditsUpdatedModule (copy), var67 (ref), creationFlowStateUpdatedModule (copy), creationFlowStateModule (copy), var41 (ref), eventNamesModule (copy), var57 (ref)
		local text = var56 and (var56[1] and var56[1].text)
		
		if text == "" then
			var34(textOverlayEditsUpdatedModule(nil))
		elseif var67(text) then return end
		var34(textOverlayEditsUpdatedModule(var56))
		var34(creationFlowStateUpdatedModule(creationFlowStateModule.Preview))
		var41.fireEvent(eventNamesModule.EditingFlowTextOverlayDoneButtonPressed)
		var57(nil)
	end, { var56, var41, var67 })
	local var79 = useCallback(function(p11)
		-- upvalues: var57 (ref)
		var57(p11)
	end, {})
	local var80 = useCallback(function(p12)
		-- upvalues: var34 (ref), textOverlayEditsUpdatedModule (copy)
		var34(textOverlayEditsUpdatedModule(p12))
	end, {})
	local var81 = useCallback(function()
		-- upvalues: var57 (ref), var52 (ref), var34 (ref), creationFlowStateUpdatedModule (copy), creationFlowStateModule (copy)
		var57(var52)
		var34(creationFlowStateUpdatedModule(creationFlowStateModule.TextOverlay))
	end, { var52 })
	reactModule.useEffect(function()
		-- upvalues: var50 (ref), creationFlowStateModule (copy), var57 (ref), var52 (ref), t (copy)
		if var50 == creationFlowStateModule.TextOverlay then
			var57(var52 or { t })
		end
	end, { var52, var50 })
	local var82 = useCallback(function()
		-- upvalues: var34 (ref), creationFlowStateUpdatedModule (copy), creationFlowStateModule (copy), var41 (ref), eventNamesModule (copy)
		var34(creationFlowStateUpdatedModule(creationFlowStateModule.Music))
		var41.fireEvent(eventNamesModule.EditingFlowMusicButtonPressed)
	end, {})
	local var83 = useCallback(function(p13)
		-- upvalues: var34 (ref), selectedCaptureUpdatedModule (copy), var40 (ref), var41 (ref), eventNamesModule (copy)
		var34(selectedCaptureUpdatedModule(p13))
		var40()
		var41.fireEvent(eventNamesModule.EditingFlowGalleryItemSelected)
	end, { var40, var41 })
	local var84 = reactModule.useCallback(function()
		-- upvalues: reactModule (copy), view (copy), foundationModule (copy), var41 (ref), creationFlowLocalizationModule (copy), var36 (ref)
		return reactModule.createElement(view, {
			Size = UDim2.fromScale(1, 1),
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			}
		}, {
			ModeratedText = reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.fromScale(1, 1),
				Text = var41.getLocalization(creationFlowLocalizationModule.PostRemovedTitle),
				TextColor3 = var36.Color.Extended.White.White_70
			})
		})
	end, {})
	local var85 = useCallback(function()
		-- upvalues: var41 (ref), eventNamesModule (copy), var47 (ref), p0 (ref), var34 (ref), clearEditsModule (copy), creationFlowStateModule (copy), var51 (ref), dialogTypeModule (copy)
		local function onExitCreation()
			-- upvalues: var41 (copy), eventNamesModule (copy), var47 (copy), p0 (copy), var34 (copy), clearEditsModule (copy), creationFlowStateModule (copy)
			var41.fireEvent(eventNamesModule.MomentsEditingFlowExited)
			var47(nil)
			
			if p0.excludeGallery then
				var34(clearEditsModule(creationFlowStateModule.Preview))
			else
				var34(clearEditsModule(creationFlowStateModule.Gallery))
			end
			var41.exitCreationFlow()
		end
		
		if var51 then
			var47({
				modalType = dialogTypeModule.ExitCreationConfirmation,
				modalProps = {
					onCancel = function()
						-- upvalues: var47 (copy)
						var47(nil)
					end,
					onConfirm = onExitCreation
				}
			})
			
			return
		end
		onExitCreation()
	end, { var51, var41, p0.excludeGallery })
	reactModule.useEffect(function()
		-- upvalues: var41 (ref)
		var41.setScreenOrientation(Enum.ScreenOrientation.Portrait)
		
		return function()
			-- upvalues: var41 (copy)
			var41.setScreenOrientation(Enum.ScreenOrientation.Sensor)
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var50 (ref), creationFlowStateModule (copy), var38 (ref)
		if var50 == creationFlowStateModule.Gallery or var50 == creationFlowStateModule.Music or var50 == creationFlowStateModule.Description then
			var38.disable()
		end
	end, { var50 })
	
	return reactModule.createElement(view, {
		tag = "anchor-center-center position-center-center size-full-full",
		backgroundStyle = var36.Color.Common.Scrim
	}, {
		CreationFlowView = reactModule.createElement(view, {
			tag = "anchor-center-center bg-surface-0 position-center-center radius-large size-full-full",
			sizeConstraint = {
				MaxSize = if var37 == formFactor.Wide then Vector2.new(600, 700) else nil
			}
		}, {
			CloseButtonContainer = reactModule.createElement(view, { tag = "auto-xy anchor-top-right position-top-right" }, {
				Padding = reactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, var35.top + var36.Padding.Medium),
					PaddingRight = UDim.new(0, var35.right + var36.Padding.Medium)
				}),
				CloseButton = reactModule.createElement(view, {
					LayoutOrder = 1,
					tag = "size-1100-1100 bg-over-media-0 padding-medium radius-circle",
					onActivated = var85
				}, {
					CloseIcon = reactModule.createElement(icon, {
						name = "icons/navigation/close_small",
						ZIndex = 2,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.fromScale(0.5, 0.5),
						size = foundationModule.Enums.IconSize.Small,
						style = var36.Color.ActionEmphasis.Foreground
					})
				})
			}),
			MainViewContainer = reactModule.createElement(view, { tag = "size-full" }, {
				MainView = reactModule.createElement(view, { tag = "size-full col align-x-center" }, {
					PreviewContainer = reactModule.createElement("CanvasGroup", {
						LayoutOrder = 1,
						Size = UDim2.fromScale(1, 1),
						BackgroundTransparency = var36.Color.None.Transparency
					}, {
						UIFlexItem = reactModule.createElement("UIFlexItem", {
							FlexMode = Enum.UIFlexMode.Custom,
							ShrinkRatio = if var51 then 1 else 2
						}),
						UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var36.Radius.Large) }),
						ClickCapture = reactModule.createElement(view, {
							tag = "size-full",
							ZIndex = 0,
							onActivated = var40,
							stateLayer = {
								affordance = foundationModule.Enums.StateLayerAffordance.None
							}
						}),
						PreviewMediaOverlay = reactModule.createElement(view, {
							tag = "auto-y anchor-bottom-center col position-bottom-center size-full-0",
							ZIndex = 5
						}, {
							OtherControls = reactModule.createElement(view, {
								tag = "auto-y padding-x-large padding-bottom-large size-full-0",
								LayoutOrder = 1
							}, {
								Padding = reactModule.createElement("UIPadding", {
									PaddingLeft = UDim.new(0, math.max(var35.right, var36.Padding.Large)),
									PaddingRight = UDim.new(0, math.max(var35.right, var36.Padding.Large))
								}),
								MusicIndicator = if var54 and (var50 == creationFlowStateModule.Preview or var50 == creationFlowStateModule.Description) then reactModule.createElement(view, { tag = "anchor-bottom-left auto-xy position-bottom-left" }, {
									MusicChip = reactModule.createElement(musicChipModule, { musicAssetId = var54.assetId, onActivated = var82 })
								}) else nil
							}),
							PlaybackControls = if var51 and var51.CaptureType == Enum.CaptureType.Video and var39 and (var50 == creationFlowStateModule.Gallery or var50 == creationFlowStateModule.Preview) then reactModule.createElement(playbackControlsModule, {
								layoutOrder = 2,
								playbackController = var64,
								toggleFitMode = var38.toggle,
								isFitMode = var38.enabled
							}) else nil
						}),
						TextOverlayEditor = if var50 == creationFlowStateModule.TextOverlay then reactModule.createElement(textOverlayEditorModule, {
							layoutOrder = 2,
							onTextOverlayDiscard = var77,
							onTextOverlaySave = var78,
							onTextOverlayUpdated = var79,
							textOverlayEdits = var56
						}) else nil,
						CaptureView = reactModule.createElement(captureViewModule, {
							capture = var51,
							playbackController = var64,
							onAbsoluteSizeChanged = var48,
							onRenderFailed = var84,
							onResolutionChanged = var43,
							scaleType = if var38.enabled then Enum.ScaleType.Fit else Enum.ScaleType.Crop
						}, {
							TextOverlayDisplay = reactModule.createElement(textOverlayDisplay, {
								zIndex = 3,
								draggable = var50 == creationFlowStateModule.Preview,
								editable = var50 == creationFlowStateModule.TextOverlay,
								itemResolution = var42,
								itemSize = var44,
								scaleType = if var38.enabled then Enum.ScaleType.Fit else Enum.ScaleType.Crop,
								onTextOverlayActivated = var81,
								onTextOverlayDragEnd = var80,
								textOverlayEdits = var52
							})
						}),
						EditCTABar = if var50 == creationFlowStateModule.Preview then reactModule.createElement(editCTABarModule, {
							zIndex = 4,
							captureType = if var51 then var51.CaptureType else nil,
							showText = var39
						}) else nil
					}),
					GalleryView = if var50 == creationFlowStateModule.Gallery then reactModule.createElement(galleryViewModule, {
						layoutOrder = 2,
						captures = captures,
						selectedCapture = var51,
						onCaptureSelected = var83,
						onNextCallback = var65
					}) else nil,
					PreviewView = if var50 == creationFlowStateModule.Preview then reactModule.createElement(previewViewModule, {
						layoutOrder = 2,
						onContinueCallback = var66,
						onReturnToGalleryCallback = if not p0.excludeGallery then var70 else nil
					}) else nil,
					TrimmingView = if var50 == creationFlowStateModule.Trimming then reactModule.createElement(trimmingViewModule, {
						layoutOrder = 2,
						playbackController = var64,
						onTrimDiscard = var71,
						onTrimSave = var72,
						onTrimUpdate = var73,
						selectedCapture = var51,
						trimEdit = var63
					}) else nil,
					TextOverlayView = if var50 == creationFlowStateModule.TextOverlay then reactModule.createElement(textOverlayViewModule, {
						layoutOrder = 2,
						onTextOverlayDiscard = var77,
						onTextOverlaySave = var78
					}) else nil,
					DescriptionView = if var50 == creationFlowStateModule.Description then reactModule.createElement(descriptionViewModule, {
						layoutOrder = 2,
						onPublish = var68,
						onReturnToEditing = var69
					}) else nil
				}),
				MusicView = if var50 == creationFlowStateModule.Music then reactModule.createElement(view, { LayoutOrder = 2, Size = UDim2.fromScale(1, 1) }, {
					MusicOverlay = reactModule.createElement(musicOverlayModule, {
						musicEdit = var62,
						playbackController = var64,
						onMusicDiscard = var74,
						onMusicSave = var75,
						onMusicUpdate = var76
					})
				}) else nil
			})
		}),
		Modal = reactModule.useCallback(function()
			-- upvalues: var46 (ref), dialogTypeModule (copy), reactModule (copy), exitConfirmationDialogModule (copy), textFilteredDialogModule (copy)
			return if var46 then if var46.modalType == dialogTypeModule.ExitCreationConfirmation then reactModule.createElement(exitConfirmationDialogModule, var46.modalProps) elseif var46.modalType == dialogTypeModule.TextFiltered then reactModule.createElement(textFilteredDialogModule, var46.modalProps) else nil else nil
		end, { var46 })()
	})
end