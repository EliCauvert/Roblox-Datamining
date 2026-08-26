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

return function(p1)
	-- upvalues: useDispatch (ref), useDeviceInsets (ref), useTokens (ref), useFormFactor (ref), useToggleState (ref), useAutoDismissStateModule (ref), reactModule (ref), creationFlowContextModule (ref), useCallback (ref), useRef (ref), useSelector (ref), constantsModule (ref), useMemo (ref), useUnifiedPlayback (ref), getContentFromCaptureModule (ref), eventNamesModule (ref), creationFlowStateUpdatedModule (ref), creationFlowStateModule (ref), dialogTypeModule (ref), makeMomentMetadataModule (ref), makeRegistrationInfoModule (ref), clearEditsModule (ref), trimEditUpdatedModule (ref), musicEditUpdatedModule (ref), textOverlayEditsUpdatedModule (ref), t (ref), selectedCaptureUpdatedModule (ref), view (ref), foundationModule (ref), creationFlowLocalizationModule (ref), exitConfirmationDialogModule (ref), textFilteredDialogModule (ref), formFactor (ref), icon (ref), musicChipModule (ref), playbackControlsModule (ref), textOverlayEditorModule (ref), captureViewModule (ref), textOverlayDisplay (ref), editCTABarModule (ref), galleryViewModule (ref), previewViewModule (ref), trimmingViewModule (ref), textOverlayViewModule (ref), descriptionViewModule (ref), musicOverlayModule (ref)
	local var1 = useDispatch()
	local var2 = useDeviceInsets()
	local var3 = useTokens()
	local var4 = useFormFactor()
	local var5 = useToggleState(false)
	local var6, var7 = useAutoDismissStateModule()
	local var8 = reactModule.useContext(creationFlowContextModule)
	local var9, var10 = reactModule.useState(Vector2.new(0, 0))
	local var11, var12 = reactModule.useState(Vector2.new(0, 0))
	local var13, var14 = reactModule.useState({ modalType = nil, modalProps = nil })
	local var15 = useCallback(function(p2)
		-- upvalues: var12 (ref)
		var12(p2.AbsoluteSize)
	end, {})
	local captures = var8.captures
	local var16 = useRef(0)
	local var17 = useSelector(function(p2)
		-- upvalues: constantsModule (copy)
		return p2[constantsModule.RoduxKey].CreationFlow.currentState
	end)
	local var18 = useSelector(function(p2)
		-- upvalues: constantsModule (copy)
		return p2[constantsModule.RoduxKey].CreationFlow.capture
	end)
	local var19 = useSelector(function(p2)
		-- upvalues: constantsModule (copy)
		return p2[constantsModule.RoduxKey].CreationFlow.textOverlayEdits
	end)
	local var20 = useSelector(function(p2)
		-- upvalues: constantsModule (copy)
		return p2[constantsModule.RoduxKey].CreationFlow.trimEdit
	end)
	local var21 = useSelector(function(p2)
		-- upvalues: constantsModule (copy)
		return p2[constantsModule.RoduxKey].CreationFlow.musicEdit
	end)
	local var22 = useSelector(function(p2)
		-- upvalues: constantsModule (copy)
		return p2[constantsModule.RoduxKey].CreationFlow.description
	end)
	local var23, var24 = reactModule.useState(nil)
	local var25, var26 = reactModule.useState(nil)
	local var27, var28 = reactModule.useState(nil)
	local var29 = useMemo(function()
		-- upvalues: var27 (ref), var21 (ref)
		return var27 or var21
	end, { var27, var21 })
	local var30 = useMemo(function()
		-- upvalues: var25 (ref), var20 (ref)
		return var25 or var20
	end, { var25, var20 })
	local var31 = useUnifiedPlayback(true, {
		autoplay = true,
		looping = true,
		edits = { trim = var30, music = var29 },
		content = if var18 then getContentFromCaptureModule(var18) else nil,
		captureType = if var18 then var18.CaptureType else nil
	})
	local var32 = useCallback(function()
		-- upvalues: var8 (ref), eventNamesModule (copy), var17 (ref), var1 (ref), creationFlowStateUpdatedModule (copy), creationFlowStateModule (copy), var7 (ref)
		var8.fireEvent(eventNamesModule.EditingFlowNextButtonPressed, { editFlowState = var17 })
		var1(creationFlowStateUpdatedModule(creationFlowStateModule.Preview))
		var7()
		var8.fireEvent(eventNamesModule.MomentsEditingFlowContinueToEditButtonPressed)
	end, { var7, var17 })
	local var33 = useCallback(function()
		-- upvalues: var8 (ref), eventNamesModule (copy), var17 (ref), var1 (ref), creationFlowStateUpdatedModule (copy), creationFlowStateModule (copy), var5 (ref)
		var8.fireEvent(eventNamesModule.EditingFlowNextButtonPressed, { editFlowState = var17 })
		var1(creationFlowStateUpdatedModule(creationFlowStateModule.Description))
		var5.disable()
		var8.fireEvent(eventNamesModule.MomentsEditingFlowContinueToDescriptionButtonPressed)
	end, { var17 })
	local var34 = useCallback(function(p2)
		-- upvalues: var8 (ref), var14 (ref), dialogTypeModule (copy)
		local var35 = var8.isTextFiltered(p2)
		
		if var35 then
			var14({
				modalType = dialogTypeModule.TextFiltered,
				modalProps = {
					onConfirm = function()
						-- upvalues: var14 (copy)
						var14(nil)
					end
				}
			})
		end
		return var35
	end, {})
	local var35 = useCallback(function()
		-- upvalues: var34 (ref), var22 (ref), var16 (ref), var20 (ref), var21 (ref), var19 (ref), makeMomentMetadataModule (copy), var18 (ref), makeRegistrationInfoModule (copy), var8 (ref), p1 (ref), var1 (ref), clearEditsModule (copy), creationFlowStateModule (copy), eventNamesModule (copy)
		if var34(var22) then return end
		local processTime = os.clock()
		
		if processTime - var16.current < 0.5 then return end
		var16.current = processTime
		local var36 = makeMomentMetadataModule(var18, var22, { trim = var20, music = var21, textOverlays = var19 })
		var8.createMoment(var18, var36, makeRegistrationInfoModule(var18, var36))
		
		if p1.excludeGallery then
			var1(clearEditsModule(creationFlowStateModule.Preview))
		else
			var1(clearEditsModule(creationFlowStateModule.Gallery))
		end
		var8.fireEvent(eventNamesModule.MomentsEditingFlowPublished)
		var8.exitCreationFlow()
	end, {
		var18, var22, var21, var8, var19, var20, p1.excludeGallery
	})
	local var36 = useCallback(function()
		-- upvalues: var8 (ref), eventNamesModule (copy), var17 (ref), var1 (ref), creationFlowStateUpdatedModule (copy), creationFlowStateModule (copy)
		var8.fireEvent(eventNamesModule.EditingFlowReturnButtonPressed, { editFlowState = var17 })
		var1(creationFlowStateUpdatedModule(creationFlowStateModule.Preview))
	end, { var17 })
	local var37 = useCallback(function()
		-- upvalues: var8 (ref), eventNamesModule (copy), var17 (ref), var14 (ref), var1 (ref), clearEditsModule (copy), creationFlowStateModule (copy), var5 (ref), dialogTypeModule (copy)
		var8.fireEvent(eventNamesModule.EditingFlowReturnButtonPressed, { editFlowState = var17 })
		var14({
			modalType = dialogTypeModule.ExitCreationConfirmation,
			modalProps = {
				onCancel = function()
					-- upvalues: var14 (copy)
					var14(nil)
				end,
				onConfirm = function()
					-- upvalues: var14 (copy), var1 (copy), clearEditsModule (copy), creationFlowStateModule (copy), var5 (copy)
					var14(nil)
					var1(clearEditsModule(creationFlowStateModule.Gallery))
					var5.disable()
				end
			}
		})
	end, { var17 })
	local var38 = useCallback(function()
		-- upvalues: var26 (ref), var1 (ref), creationFlowStateUpdatedModule (copy), creationFlowStateModule (copy), var8 (ref), eventNamesModule (copy)
		var26(nil)
		var1(creationFlowStateUpdatedModule(creationFlowStateModule.Preview))
		var8.fireEvent(eventNamesModule.EditingFlowTrimBackButtonPressed)
	end, { var8 })
	local var39 = useCallback(function()
		-- upvalues: var1 (ref), trimEditUpdatedModule (copy), var25 (ref), var26 (ref), creationFlowStateUpdatedModule (copy), creationFlowStateModule (copy), var8 (ref), eventNamesModule (copy)
		var1(trimEditUpdatedModule(var25))
		var26(nil)
		var1(creationFlowStateUpdatedModule(creationFlowStateModule.Preview))
		var8.fireEvent(eventNamesModule.EditingFlowTrimDoneButtonPressed)
	end, { var25, var8 })
	local var40 = useCallback(function(p2)
		-- upvalues: var26 (ref)
		var26(p2)
	end, {})
	local var41 = useCallback(function()
		-- upvalues: var28 (ref), var1 (ref), creationFlowStateUpdatedModule (copy), creationFlowStateModule (copy), var8 (ref), eventNamesModule (copy)
		var28(nil)
		var1(creationFlowStateUpdatedModule(creationFlowStateModule.Preview))
		var8.fireEvent(eventNamesModule.EditingFlowMusicBackButtonPressed)
	end, {})
	local var42 = useCallback(function()
		-- upvalues: var1 (ref), musicEditUpdatedModule (copy), var27 (ref), var28 (ref), creationFlowStateUpdatedModule (copy), creationFlowStateModule (copy), var8 (ref), eventNamesModule (copy)
		var1(musicEditUpdatedModule(var27))
		var28(nil)
		var1(creationFlowStateUpdatedModule(creationFlowStateModule.Preview))
		var8.fireEvent(eventNamesModule.EditingFlowMusicDoneButtonPressed)
	end, { var27 })
	local var43 = useCallback(function(p2)
		-- upvalues: var28 (ref)
		var28(p2)
	end, {})
	local var44 = useCallback(function()
		-- upvalues: var24 (ref), var1 (ref), creationFlowStateUpdatedModule (copy), creationFlowStateModule (copy), var8 (ref), eventNamesModule (copy)
		var24(nil)
		var1(creationFlowStateUpdatedModule(creationFlowStateModule.Preview))
		var8.fireEvent(eventNamesModule.EditingFlowTextOverlayBackButtonPressed)
	end, { var23, var8 })
	local var45 = useCallback(function()
		-- upvalues: var23 (ref), var1 (ref), textOverlayEditsUpdatedModule (copy), var34 (ref), creationFlowStateUpdatedModule (copy), creationFlowStateModule (copy), var8 (ref), eventNamesModule (copy), var24 (ref)
		local text = var23 and (var23[1] and var23[1].text)
		
		if text == "" then
			var1(textOverlayEditsUpdatedModule(nil))
		elseif var34(text) then return end
		var1(textOverlayEditsUpdatedModule(var23))
		var1(creationFlowStateUpdatedModule(creationFlowStateModule.Preview))
		var8.fireEvent(eventNamesModule.EditingFlowTextOverlayDoneButtonPressed)
		var24(nil)
	end, { var23, var8, var34 })
	local var46 = useCallback(function(p2)
		-- upvalues: var24 (ref)
		var24(p2)
	end, {})
	local var47 = useCallback(function(p2)
		-- upvalues: var1 (ref), textOverlayEditsUpdatedModule (copy)
		var1(textOverlayEditsUpdatedModule(p2))
	end, {})
	local var48 = useCallback(function()
		-- upvalues: var24 (ref), var19 (ref), var1 (ref), creationFlowStateUpdatedModule (copy), creationFlowStateModule (copy)
		var24(var19)
		var1(creationFlowStateUpdatedModule(creationFlowStateModule.TextOverlay))
	end, { var19 })
	reactModule.useEffect(function()
		-- upvalues: var17 (ref), creationFlowStateModule (copy), var24 (ref), var19 (ref), t (copy)
		if var17 == creationFlowStateModule.TextOverlay then
			var24(var19 or { t })
		end
	end, { var19, var17 })
	local var49 = useCallback(function()
		-- upvalues: var1 (ref), creationFlowStateUpdatedModule (copy), creationFlowStateModule (copy), var8 (ref), eventNamesModule (copy)
		var1(creationFlowStateUpdatedModule(creationFlowStateModule.Music))
		var8.fireEvent(eventNamesModule.EditingFlowMusicButtonPressed)
	end, {})
	local var50 = useCallback(function(p2)
		-- upvalues: var1 (ref), selectedCaptureUpdatedModule (copy), var7 (ref), var8 (ref), eventNamesModule (copy)
		var1(selectedCaptureUpdatedModule(p2))
		var7()
		var8.fireEvent(eventNamesModule.EditingFlowGalleryItemSelected)
	end, { var7, var8 })
	local var51 = reactModule.useCallback(function()
		-- upvalues: reactModule (copy), view (copy), foundationModule (copy), var8 (ref), creationFlowLocalizationModule (copy), var3 (ref)
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
				Text = var8.getLocalization(creationFlowLocalizationModule.PostRemovedTitle),
				TextColor3 = var3.Color.Extended.White.White_70
			})
		})
	end, {})
	local var52 = useCallback(function()
		-- upvalues: var8 (ref), eventNamesModule (copy), var14 (ref), p1 (ref), var1 (ref), clearEditsModule (copy), creationFlowStateModule (copy), var18 (ref), dialogTypeModule (copy)
		local function onExitCreation()
			-- upvalues: var8 (copy), eventNamesModule (copy), var14 (copy), p1 (copy), var1 (copy), clearEditsModule (copy), creationFlowStateModule (copy)
			var8.fireEvent(eventNamesModule.MomentsEditingFlowExited)
			var14(nil)
			
			if p1.excludeGallery then
				var1(clearEditsModule(creationFlowStateModule.Preview))
			else
				var1(clearEditsModule(creationFlowStateModule.Gallery))
			end
			var8.exitCreationFlow()
		end
		
		if var18 then
			var14({
				modalType = dialogTypeModule.ExitCreationConfirmation,
				modalProps = {
					onCancel = function()
						-- upvalues: var14 (copy)
						var14(nil)
					end,
					onConfirm = onExitCreation
				}
			})
			
			return
		end
		onExitCreation()
	end, { var18, var8, p1.excludeGallery })
	reactModule.useEffect(function()
		-- upvalues: var8 (ref)
		var8.setScreenOrientation(Enum.ScreenOrientation.Portrait)
		
		return function()
			-- upvalues: var8 (copy)
			var8.setScreenOrientation(Enum.ScreenOrientation.Sensor)
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var17 (ref), creationFlowStateModule (copy), var5 (ref)
		if var17 == creationFlowStateModule.Gallery or var17 == creationFlowStateModule.Music or var17 == creationFlowStateModule.Description then
			var5.disable()
		end
	end, { var17 })
	
	return reactModule.createElement(view, {
		tag = "anchor-center-center position-center-center size-full-full",
		backgroundStyle = var3.Color.Common.Scrim
	}, {
		CreationFlowView = reactModule.createElement(view, {
			tag = "anchor-center-center bg-surface-0 position-center-center radius-large size-full-full",
			sizeConstraint = {
				MaxSize = if var4 == formFactor.Wide then Vector2.new(600, 700) else nil
			}
		}, {
			CloseButtonContainer = reactModule.createElement(view, { tag = "auto-xy anchor-top-right position-top-right" }, {
				Padding = reactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, var2.top + var3.Padding.Medium),
					PaddingRight = UDim.new(0, var2.right + var3.Padding.Medium)
				}),
				CloseButton = reactModule.createElement(view, {
					LayoutOrder = 1,
					tag = "size-1100-1100 bg-over-media-0 padding-medium radius-circle",
					onActivated = var52
				}, {
					CloseIcon = reactModule.createElement(icon, {
						name = "icons/navigation/close_small",
						ZIndex = 2,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.fromScale(0.5, 0.5),
						size = foundationModule.Enums.IconSize.Small,
						style = var3.Color.ActionEmphasis.Foreground
					})
				})
			}),
			MainViewContainer = reactModule.createElement(view, { tag = "size-full" }, {
				MainView = reactModule.createElement(view, { tag = "size-full col align-x-center" }, {
					PreviewContainer = reactModule.createElement("CanvasGroup", {
						LayoutOrder = 1,
						Size = UDim2.fromScale(1, 1),
						BackgroundTransparency = var3.Color.None.Transparency
					}, {
						UIFlexItem = reactModule.createElement("UIFlexItem", {
							FlexMode = Enum.UIFlexMode.Custom,
							ShrinkRatio = if var18 then 1 else 2
						}),
						UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var3.Radius.Large) }),
						ClickCapture = reactModule.createElement(view, {
							tag = "size-full",
							ZIndex = 0,
							onActivated = var7,
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
									PaddingLeft = UDim.new(0, math.max(var2.right, var3.Padding.Large)),
									PaddingRight = UDim.new(0, math.max(var2.right, var3.Padding.Large))
								}),
								MusicIndicator = if var21 and (var17 == creationFlowStateModule.Preview or var17 == creationFlowStateModule.Description) then reactModule.createElement(view, { tag = "anchor-bottom-left auto-xy position-bottom-left" }, {
									MusicChip = reactModule.createElement(musicChipModule, { musicAssetId = var21.assetId, onActivated = var49 })
								}) else nil
							}),
							PlaybackControls = if var18 and var18.CaptureType == Enum.CaptureType.Video and var6 and (var17 == creationFlowStateModule.Gallery or var17 == creationFlowStateModule.Preview) then reactModule.createElement(playbackControlsModule, {
								layoutOrder = 2,
								playbackController = var31,
								toggleFitMode = var5.toggle,
								isFitMode = var5.enabled
							}) else nil
						}),
						TextOverlayEditor = if var17 == creationFlowStateModule.TextOverlay then reactModule.createElement(textOverlayEditorModule, {
							layoutOrder = 2,
							onTextOverlayDiscard = var44,
							onTextOverlaySave = var45,
							onTextOverlayUpdated = var46,
							textOverlayEdits = var23
						}) else nil,
						CaptureView = reactModule.createElement(captureViewModule, {
							capture = var18,
							playbackController = var31,
							onAbsoluteSizeChanged = var15,
							onRenderFailed = var51,
							onResolutionChanged = var10,
							scaleType = if var5.enabled then Enum.ScaleType.Fit else Enum.ScaleType.Crop
						}, {
							TextOverlayDisplay = reactModule.createElement(textOverlayDisplay, {
								zIndex = 3,
								draggable = var17 == creationFlowStateModule.Preview,
								editable = var17 == creationFlowStateModule.TextOverlay,
								itemResolution = var9,
								itemSize = var11,
								scaleType = if var5.enabled then Enum.ScaleType.Fit else Enum.ScaleType.Crop,
								onTextOverlayActivated = var48,
								onTextOverlayDragEnd = var47,
								textOverlayEdits = var19
							})
						}),
						EditCTABar = if var17 == creationFlowStateModule.Preview then reactModule.createElement(editCTABarModule, {
							zIndex = 4,
							captureType = if var18 then var18.CaptureType else nil,
							showText = var6
						}) else nil
					}),
					GalleryView = if var17 == creationFlowStateModule.Gallery then reactModule.createElement(galleryViewModule, {
						layoutOrder = 2,
						captures = captures,
						selectedCapture = var18,
						onCaptureSelected = var50,
						onNextCallback = var32
					}) else nil,
					PreviewView = if var17 == creationFlowStateModule.Preview then reactModule.createElement(previewViewModule, {
						layoutOrder = 2,
						onContinueCallback = var33,
						onReturnToGalleryCallback = if not p1.excludeGallery then var37 else nil
					}) else nil,
					TrimmingView = if var17 == creationFlowStateModule.Trimming then reactModule.createElement(trimmingViewModule, {
						layoutOrder = 2,
						playbackController = var31,
						onTrimDiscard = var38,
						onTrimSave = var39,
						onTrimUpdate = var40,
						selectedCapture = var18,
						trimEdit = var30
					}) else nil,
					TextOverlayView = if var17 == creationFlowStateModule.TextOverlay then reactModule.createElement(textOverlayViewModule, {
						layoutOrder = 2,
						onTextOverlayDiscard = var44,
						onTextOverlaySave = var45
					}) else nil,
					DescriptionView = if var17 == creationFlowStateModule.Description then reactModule.createElement(descriptionViewModule, {
						layoutOrder = 2,
						onPublish = var35,
						onReturnToEditing = var36
					}) else nil
				}),
				MusicView = if var17 == creationFlowStateModule.Music then reactModule.createElement(view, { LayoutOrder = 2, Size = UDim2.fromScale(1, 1) }, {
					MusicOverlay = reactModule.createElement(musicOverlayModule, {
						musicEdit = var29,
						playbackController = var31,
						onMusicDiscard = var41,
						onMusicSave = var42,
						onMusicUpdate = var43
					})
				}) else nil
			})
		}),
		Modal = reactModule.useCallback(function()
			-- upvalues: var13 (ref), dialogTypeModule (copy), reactModule (copy), exitConfirmationDialogModule (copy), textFilteredDialogModule (copy)
			return if var13 then if var13.modalType == dialogTypeModule.ExitCreationConfirmation then reactModule.createElement(exitConfirmationDialogModule, var13.modalProps) elseif var13.modalType == dialogTypeModule.TextFiltered then reactModule.createElement(textFilteredDialogModule, var13.modalProps) else nil else nil
		end, { var13 })()
	})
end