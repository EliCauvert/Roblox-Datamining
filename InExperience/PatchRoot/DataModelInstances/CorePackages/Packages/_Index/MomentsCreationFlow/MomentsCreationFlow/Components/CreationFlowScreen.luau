local MomentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local Parent = MomentsCreationFlow.Parent
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local Icon = FoundationModule.Icon
local View = FoundationModule.View
local CaptureViewModule = require(MomentsCreationFlow.Components.CaptureView)
local DescriptionViewModule = require(MomentsCreationFlow.Components.DescriptionView)
local EditCTABarModule = require(MomentsCreationFlow.Components.EditCTABar)
local GalleryViewModule = require(MomentsCreationFlow.Components.GalleryView)
local MusicChipModule = require(MomentsCreationFlow.Components.MusicChip)
local MusicOverlayModule = require(MomentsCreationFlow.Components.MusicOverlay)
local PlaybackControlsModule = require(MomentsCreationFlow.Components.PlaybackControls)
local PreviewViewModule = require(MomentsCreationFlow.Components.PreviewView)
local TextOverlayDisplay = MomentsCommonModule.TextOverlayDisplay
local ExitConfirmationDialogModule = require(MomentsCreationFlow.Components.Dialogs.ExitConfirmationDialog)
local TextFilteredDialogModule = require(MomentsCreationFlow.Components.Dialogs.TextFilteredDialog)
local TextOverlayEditorModule = require(MomentsCreationFlow.Components.TextOverlay.TextOverlayEditor)
local TextOverlayViewModule = require(MomentsCreationFlow.Components.TextOverlay.TextOverlayView)
local TrimmingViewModule = require(MomentsCreationFlow.Components.TrimmingView)
local ClearEditsModule = require(MomentsCreationFlow.Actions.ClearEdits)
local CreationFlowStateUpdatedModule = require(MomentsCreationFlow.Actions.CreationFlowStateUpdated)
local MusicEditUpdatedModule = require(MomentsCreationFlow.Actions.MusicEditUpdated)
local SelectedCaptureUpdatedModule = require(MomentsCreationFlow.Actions.SelectedCaptureUpdated)
local TextOverlayEditsUpdatedModule = require(MomentsCreationFlow.Actions.TextOverlayEditsUpdated)
local TrimEditUpdatedModule = require(MomentsCreationFlow.Actions.TrimEditUpdated)
local UseAutoDismissStateModule = require(MomentsCreationFlow.Hooks.useAutoDismissState)
local UseCallbackFunction = ReactModule.useCallback
local UseDeviceInsetsFunction = MomentsCommonModule.Hooks.useDeviceInsets
local UseDispatchFunction = MomentsCommonModule.Hooks.useDispatch
local UseFormFactorFunction = MomentsCommonModule.Hooks.useFormFactor
local UseMemoFunction = ReactModule.useMemo
local UseRefFunction = ReactModule.useRef
local UseSelectorFunction = MomentsCommonModule.Hooks.useSelector
local UseToggleStateFunction = MomentsCommonModule.Hooks.useToggleState
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseUnifiedPlaybackFunction = MomentsCommonModule.Hooks.useUnifiedPlayback
local CreationFlowContextModule = require(MomentsCreationFlow.Context.CreationFlowContext)
local GetContentFromCaptureModule = require(MomentsCreationFlow.Utils.getContentFromCapture)
local MakeMomentMetadataModule = require(MomentsCreationFlow.Utils.makeMomentMetadata)
local MakeRegistrationInfoModule = require(MomentsCreationFlow.Utils.makeRegistrationInfo)
local CreationFlowStateModule = require(MomentsCreationFlow.Enums.CreationFlowState)
local DialogTypeModule = require(MomentsCreationFlow.Enums.DialogType)
local FormFactor = MomentsCommonModule.Enums.FormFactor
local ConstantsModule = require(MomentsCreationFlow.Constants)
local CreationFlowLocalizationModule = require(MomentsCreationFlow.Enums.CreationFlowLocalization)
local EventNamesModule = require(MomentsCreationFlow.Analytics.EventNames)
local config = {
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

return function(p1) --[[ Line: 86 ]]
	-- upvalues: UseDispatchFunction (copy), UseDeviceInsetsFunction (copy), UseTokensFunction (copy), UseFormFactorFunction (copy), UseToggleStateFunction (copy), UseAutoDismissStateModule (copy), ReactModule (copy), CreationFlowContextModule (copy), UseCallbackFunction (copy), UseRefFunction (copy), UseSelectorFunction (copy), ConstantsModule (copy), UseMemoFunction (copy), UseUnifiedPlaybackFunction (copy), GetContentFromCaptureModule (copy), EventNamesModule (copy), CreationFlowStateUpdatedModule (copy), CreationFlowStateModule (copy), DialogTypeModule (copy), MakeMomentMetadataModule (copy), MakeRegistrationInfoModule (copy), ClearEditsModule (copy), TrimEditUpdatedModule (copy), MusicEditUpdatedModule (copy), TextOverlayEditsUpdatedModule (copy), config (copy), SelectedCaptureUpdatedModule (copy), View (copy), FoundationModule (copy), CreationFlowLocalizationModule (copy), ExitConfirmationDialogModule (copy), TextFilteredDialogModule (copy), FormFactor (copy), Icon (copy), MusicChipModule (copy), PlaybackControlsModule (copy), TextOverlayEditorModule (copy), CaptureViewModule (copy), TextOverlayDisplay (copy), EditCTABarModule (copy), GalleryViewModule (copy), PreviewViewModule (copy), TrimmingViewModule (copy), TextOverlayViewModule (copy), DescriptionViewModule (copy), MusicOverlayModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local UseTokensResult = UseTokensFunction()
	local UseFormFactorResult = UseFormFactorFunction()
	local UseToggleStateResult = UseToggleStateFunction(false)
	local UseAutoDismissStateModuleResult, UseAutoDismissStateModuleResult2 = UseAutoDismissStateModule()
	local UseContextResult = ReactModule.useContext(CreationFlowContextModule)
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.new(0, 0))
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(Vector2.new(0, 0))
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState({ modalType = nil, modalProps = nil })
	local UseCallbackResult = UseCallbackFunction(function(Frame) --[[ Line: 99 ]]
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(Frame.AbsoluteSize)
	end, {})
	local Captures = UseContextResult.captures
	local UseRefResult = UseRefFunction(0)
	local UseSelectorResult = UseSelectorFunction(function(p2) --[[ Line: 107 ]]
		-- upvalues: ConstantsModule (upval)
		return p2[ConstantsModule.RoduxKey].CreationFlow.currentState
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p2) --[[ Line: 111 ]]
		-- upvalues: ConstantsModule (upval)
		return p2[ConstantsModule.RoduxKey].CreationFlow.capture
	end)
	local UseSelectorResult2 = UseSelectorFunction(function(p2) --[[ Line: 115 ]]
		-- upvalues: ConstantsModule (upval)
		return p2[ConstantsModule.RoduxKey].CreationFlow.textOverlayEdits
	end)
	local UseSelectorResult3 = UseSelectorFunction(function(p2) --[[ Line: 119 ]]
		-- upvalues: ConstantsModule (upval)
		return p2[ConstantsModule.RoduxKey].CreationFlow.trimEdit
	end)
	local UseSelectorResult4 = UseSelectorFunction(function(p2) --[[ Line: 123 ]]
		-- upvalues: ConstantsModule (upval)
		return p2[ConstantsModule.RoduxKey].CreationFlow.musicEdit
	end)
	local UseSelectorResult5 = UseSelectorFunction(function(p2) --[[ Line: 127 ]]
		-- upvalues: ConstantsModule (upval)
		return p2[ConstantsModule.RoduxKey].CreationFlow.description
	end)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(nil)
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(nil)
	local UseStateResult6, UseStateResult2_5 = ReactModule.useState(nil)
	local UseMemoResult = UseMemoFunction(function() --[[ Line: 136 ]]
		-- upvalues: UseStateResult6 (copy), UseSelectorResult4 (copy)
		return UseStateResult6 or UseSelectorResult4
	end, { UseStateResult6, UseSelectorResult4 })
	local UseMemoResult1 = UseMemoFunction(function() --[[ Line: 140 ]]
		-- upvalues: UseStateResult5 (copy), UseSelectorResult3 (copy)
		return UseStateResult5 or UseSelectorResult3
	end, { UseStateResult5, UseSelectorResult3 })
	local UseUnifiedPlaybackResult = UseUnifiedPlaybackFunction(true, {
		autoplay = true,
		looping = true,
		edits = { trim = UseMemoResult1, music = UseMemoResult },
		content = if UseSelectorResult1 then GetContentFromCaptureModule(UseSelectorResult1) else nil,
		captureType = if UseSelectorResult1 then UseSelectorResult1.CaptureType else nil
	})
	local UseCallbackResult1 = UseCallbackFunction(function() --[[ Line: 155 ]]
		-- upvalues: UseContextResult (copy), EventNamesModule (upval), UseSelectorResult (copy), UseDispatchResult (copy), CreationFlowStateUpdatedModule (upval), CreationFlowStateModule (upval), UseAutoDismissStateModuleResult2 (copy)
		UseContextResult.fireEvent(EventNamesModule.EditingFlowNextButtonPressed, { editFlowState = UseSelectorResult })
		UseDispatchResult(CreationFlowStateUpdatedModule(CreationFlowStateModule.Preview))
		UseAutoDismissStateModuleResult2()
		UseContextResult.fireEvent(EventNamesModule.MomentsEditingFlowContinueToEditButtonPressed)
	end, { UseAutoDismissStateModuleResult2, UseSelectorResult })
	local UseCallbackResult2 = UseCallbackFunction(function() --[[ Line: 164 ]]
		-- upvalues: UseContextResult (copy), EventNamesModule (upval), UseSelectorResult (copy), UseDispatchResult (copy), CreationFlowStateUpdatedModule (upval), CreationFlowStateModule (upval), UseToggleStateResult (copy)
		UseContextResult.fireEvent(EventNamesModule.EditingFlowNextButtonPressed, { editFlowState = UseSelectorResult })
		UseDispatchResult(CreationFlowStateUpdatedModule(CreationFlowStateModule.Description))
		UseToggleStateResult.disable()
		UseContextResult.fireEvent(EventNamesModule.MomentsEditingFlowContinueToDescriptionButtonPressed)
	end, { UseSelectorResult })
	local UseCallbackResult3 = UseCallbackFunction(function(p2) --[[ Line: 174 ]]
		-- upvalues: UseContextResult (copy), UseStateResult2_2 (copy), DialogTypeModule (upval)
		local IsTextFiltered = UseContextResult.isTextFiltered(p2)
		
		if IsTextFiltered then
			UseStateResult2_2({
				modalType = DialogTypeModule.TextFiltered,
				modalProps = {
					onConfirm = function() --[[ Line: 180 ]]
						-- upvalues: UseStateResult2_2 (upval)
						UseStateResult2_2(nil)
					end
				}
			})
		end
		return IsTextFiltered
	end, {})
	local UseCallbackResult4 = UseCallbackFunction(function() --[[ Line: 189 ]]
		-- upvalues: UseCallbackResult3 (copy), UseSelectorResult5 (copy), UseRefResult (copy), UseSelectorResult3 (copy), UseSelectorResult4 (copy), UseSelectorResult2 (copy), MakeMomentMetadataModule (upval), UseSelectorResult1 (copy), MakeRegistrationInfoModule (upval), UseContextResult (copy), p1 (copy), UseDispatchResult (copy), ClearEditsModule (upval), CreationFlowStateModule (upval), EventNamesModule (upval)
		if UseCallbackResult3(UseSelectorResult5) then return end
		local ClockTime = os.clock()
		
		if ClockTime - UseRefResult.current < 0.5 then return end
		UseRefResult.current = ClockTime
		local MomentMetadataModule = MakeMomentMetadataModule(UseSelectorResult1, UseSelectorResult5, {
			trim = UseSelectorResult3,
			music = UseSelectorResult4,
			textOverlays = UseSelectorResult2
		})
		UseContextResult.createMoment(UseSelectorResult1, MomentMetadataModule, (MakeRegistrationInfoModule(UseSelectorResult1, MomentMetadataModule)))
		
		if p1.excludeGallery then
			UseDispatchResult(ClearEditsModule(CreationFlowStateModule.Preview))
		else
			UseDispatchResult(ClearEditsModule(CreationFlowStateModule.Gallery))
		end
		UseContextResult.fireEvent(EventNamesModule.MomentsEditingFlowPublished)
		UseContextResult.exitCreationFlow()
	end, {
		UseSelectorResult1, UseSelectorResult5, UseSelectorResult4, UseContextResult,
		UseSelectorResult2, UseSelectorResult3, p1.excludeGallery
	})
	local UseCallbackResult5 = UseCallbackFunction(function() --[[ Line: 227 ]]
		-- upvalues: UseContextResult (copy), EventNamesModule (upval), UseSelectorResult (copy), UseDispatchResult (copy), CreationFlowStateUpdatedModule (upval), CreationFlowStateModule (upval)
		UseContextResult.fireEvent(EventNamesModule.EditingFlowReturnButtonPressed, { editFlowState = UseSelectorResult })
		UseDispatchResult(CreationFlowStateUpdatedModule(CreationFlowStateModule.Preview))
	end, { UseSelectorResult })
	local UseCallbackResult6 = UseCallbackFunction(function() --[[ Line: 235 ]]
		-- upvalues: UseContextResult (copy), EventNamesModule (upval), UseSelectorResult (copy), UseStateResult2_2 (copy), UseDispatchResult (copy), ClearEditsModule (upval), CreationFlowStateModule (upval), UseToggleStateResult (copy), DialogTypeModule (upval)
		UseContextResult.fireEvent(EventNamesModule.EditingFlowReturnButtonPressed, { editFlowState = UseSelectorResult })
		UseStateResult2_2({
			modalType = DialogTypeModule.ExitCreationConfirmation,
			modalProps = {
				onCancel = function() --[[ Line: 249 ]]
					-- upvalues: UseStateResult2_2 (upval)
					UseStateResult2_2(nil)
				end,
				onConfirm = function() --[[ Line: 240 ]]
					-- upvalues: UseStateResult2_2 (upval), UseDispatchResult (upval), ClearEditsModule (upval), CreationFlowStateModule (upval), UseToggleStateResult (upval)
					UseStateResult2_2(nil)
					UseDispatchResult(ClearEditsModule(CreationFlowStateModule.Gallery))
					UseToggleStateResult.disable()
				end
			}
		})
	end, { UseSelectorResult })
	local UseCallbackResult7 = UseCallbackFunction(function() --[[ Line: 257 ]]
		-- upvalues: UseStateResult2_4 (copy), UseDispatchResult (copy), CreationFlowStateUpdatedModule (upval), CreationFlowStateModule (upval), UseContextResult (copy), EventNamesModule (upval)
		UseStateResult2_4(nil)
		UseDispatchResult(CreationFlowStateUpdatedModule(CreationFlowStateModule.Preview))
		UseContextResult.fireEvent(EventNamesModule.EditingFlowTrimBackButtonPressed)
	end, { UseContextResult })
	local UseCallbackResult8 = UseCallbackFunction(function() --[[ Line: 263 ]]
		-- upvalues: UseDispatchResult (copy), TrimEditUpdatedModule (upval), UseStateResult5 (copy), UseStateResult2_4 (copy), CreationFlowStateUpdatedModule (upval), CreationFlowStateModule (upval), UseContextResult (copy), EventNamesModule (upval)
		UseDispatchResult(TrimEditUpdatedModule(UseStateResult5))
		UseStateResult2_4(nil)
		UseDispatchResult(CreationFlowStateUpdatedModule(CreationFlowStateModule.Preview))
		UseContextResult.fireEvent(EventNamesModule.EditingFlowTrimDoneButtonPressed)
	end, { UseStateResult5, UseContextResult })
	local UseCallbackResult9 = UseCallbackFunction(function(p2) --[[ Line: 270 ]]
		-- upvalues: UseStateResult2_4 (copy)
		UseStateResult2_4(p2)
	end, {})
	local UseCallbackResult10 = UseCallbackFunction(function() --[[ Line: 274 ]]
		-- upvalues: UseStateResult2_5 (copy), UseDispatchResult (copy), CreationFlowStateUpdatedModule (upval), CreationFlowStateModule (upval), UseContextResult (copy), EventNamesModule (upval)
		UseStateResult2_5(nil)
		UseDispatchResult(CreationFlowStateUpdatedModule(CreationFlowStateModule.Preview))
		UseContextResult.fireEvent(EventNamesModule.EditingFlowMusicBackButtonPressed)
	end, {})
	local UseCallbackResult11 = UseCallbackFunction(function() --[[ Line: 280 ]]
		-- upvalues: UseDispatchResult (copy), MusicEditUpdatedModule (upval), UseStateResult6 (copy), UseStateResult2_5 (copy), CreationFlowStateUpdatedModule (upval), CreationFlowStateModule (upval), UseContextResult (copy), EventNamesModule (upval)
		UseDispatchResult(MusicEditUpdatedModule(UseStateResult6))
		UseStateResult2_5(nil)
		UseDispatchResult(CreationFlowStateUpdatedModule(CreationFlowStateModule.Preview))
		UseContextResult.fireEvent(EventNamesModule.EditingFlowMusicDoneButtonPressed)
	end, { UseStateResult6 })
	local UseCallbackResult12 = UseCallbackFunction(function(p2) --[[ Line: 287 ]]
		-- upvalues: UseStateResult2_5 (copy)
		UseStateResult2_5(p2)
	end, {})
	local UseCallbackResult13 = UseCallbackFunction(function() --[[ Line: 291 ]]
		-- upvalues: UseStateResult2_3 (copy), UseDispatchResult (copy), CreationFlowStateUpdatedModule (upval), CreationFlowStateModule (upval), UseContextResult (copy), EventNamesModule (upval)
		UseStateResult2_3(nil)
		UseDispatchResult(CreationFlowStateUpdatedModule(CreationFlowStateModule.Preview))
		UseContextResult.fireEvent(EventNamesModule.EditingFlowTextOverlayBackButtonPressed)
	end, { UseStateResult4, UseContextResult })
	local UseCallbackResult14 = UseCallbackFunction(function() --[[ Line: 297 ]]
		-- upvalues: UseStateResult4 (copy), UseDispatchResult (copy), TextOverlayEditsUpdatedModule (upval), UseCallbackResult3 (copy), CreationFlowStateUpdatedModule (upval), CreationFlowStateModule (upval), UseContextResult (copy), EventNamesModule (upval), UseStateResult2_3 (copy)
		local Text = UseStateResult4 and (UseStateResult4[1] and UseStateResult4[1].text)
		
		if Text == "" then
			UseDispatchResult(TextOverlayEditsUpdatedModule(nil))
		else
			if UseCallbackResult3(Text) then return end
			UseDispatchResult(TextOverlayEditsUpdatedModule(UseStateResult4))
		end
		UseDispatchResult(CreationFlowStateUpdatedModule(CreationFlowStateModule.Preview))
		UseContextResult.fireEvent(EventNamesModule.EditingFlowTextOverlayDoneButtonPressed)
		UseStateResult2_3(nil)
	end, { UseStateResult4, UseContextResult, UseCallbackResult3 })
	local UseCallbackResult15 = UseCallbackFunction(function(p2) --[[ Line: 312 ]]
		-- upvalues: UseStateResult2_3 (copy)
		UseStateResult2_3(p2)
	end, {})
	local UseCallbackResult16 = UseCallbackFunction(function(p2) --[[ Line: 316 ]]
		-- upvalues: UseDispatchResult (copy), TextOverlayEditsUpdatedModule (upval)
		UseDispatchResult(TextOverlayEditsUpdatedModule(p2))
	end, {})
	local UseCallbackResult17 = UseCallbackFunction(function() --[[ Line: 320 ]]
		-- upvalues: UseStateResult2_3 (copy), UseSelectorResult2 (copy), UseDispatchResult (copy), CreationFlowStateUpdatedModule (upval), CreationFlowStateModule (upval)
		UseStateResult2_3(UseSelectorResult2)
		UseDispatchResult(CreationFlowStateUpdatedModule(CreationFlowStateModule.TextOverlay))
	end, { UseSelectorResult2 })
	ReactModule.useEffect(function() --[[ Line: 325 ]]
		-- upvalues: UseSelectorResult (copy), CreationFlowStateModule (upval), UseStateResult2_3 (copy), UseSelectorResult2 (copy), config (upval)
		if UseSelectorResult == CreationFlowStateModule.TextOverlay then
			UseStateResult2_3(UseSelectorResult2 or { config })
		end
	end, { UseSelectorResult2, UseSelectorResult })
	local UseCallbackResult18 = UseCallbackFunction(function() --[[ Line: 331 ]]
		-- upvalues: UseDispatchResult (copy), CreationFlowStateUpdatedModule (upval), CreationFlowStateModule (upval), UseContextResult (copy), EventNamesModule (upval)
		UseDispatchResult(CreationFlowStateUpdatedModule(CreationFlowStateModule.Music))
		UseContextResult.fireEvent(EventNamesModule.EditingFlowMusicButtonPressed)
	end, {})
	local UseCallbackResult19 = UseCallbackFunction(function(p2) --[[ Line: 336 ]]
		-- upvalues: UseDispatchResult (copy), SelectedCaptureUpdatedModule (upval), UseAutoDismissStateModuleResult2 (copy), UseContextResult (copy), EventNamesModule (upval)
		UseDispatchResult(SelectedCaptureUpdatedModule(p2))
		UseAutoDismissStateModuleResult2()
		UseContextResult.fireEvent(EventNamesModule.EditingFlowGalleryItemSelected)
	end, { UseAutoDismissStateModuleResult2, UseContextResult })
	local UseResult = ReactModule.useCallback(function() --[[ Line: 342 ]]
		-- upvalues: ReactModule (upval), View (upval), FoundationModule (upval), UseContextResult (copy), CreationFlowLocalizationModule (upval), UseTokensResult (copy)
		return (ReactModule.createElement(View, {
			Size = UDim2.fromScale(1, 1),
			stateLayer = {
				affordance = FoundationModule.Enums.StateLayerAffordance.None
			}
		}, {
			ModeratedText = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.fromScale(1, 1),
				Text = UseContextResult.getLocalization(CreationFlowLocalizationModule.PostRemovedTitle),
				TextColor3 = UseTokensResult.Color.Extended.White.White_70
			})
		}))
	end, {})
	local UseCallbackResult20 = UseCallbackFunction(function() --[[ Line: 358 ]]
		-- upvalues: UseContextResult (copy), EventNamesModule (upval), UseStateResult2_2 (copy), p1 (copy), UseDispatchResult (copy), ClearEditsModule (upval), CreationFlowStateModule (upval), UseSelectorResult1 (copy), DialogTypeModule (upval)
		local function onExitCreation() --[[ Line: 359 ]]
			-- upvalues: UseContextResult (upval), EventNamesModule (upval), UseStateResult2_2 (upval), p1 (upval), UseDispatchResult (upval), ClearEditsModule (upval), CreationFlowStateModule (upval)
			UseContextResult.fireEvent(EventNamesModule.MomentsEditingFlowExited)
			UseStateResult2_2(nil)
			
			if p1.excludeGallery then
				UseDispatchResult(ClearEditsModule(CreationFlowStateModule.Preview))
			else
				UseDispatchResult(ClearEditsModule(CreationFlowStateModule.Gallery))
			end
			UseContextResult.exitCreationFlow()
		end
		
		if UseSelectorResult1 then
			UseStateResult2_2({
				modalType = DialogTypeModule.ExitCreationConfirmation,
				modalProps = {
					onCancel = function() --[[ Line: 374 ]]
						-- upvalues: UseStateResult2_2 (upval)
						UseStateResult2_2(nil)
					end,
					onConfirm = onExitCreation
				}
			})
			
			return
		else
			onExitCreation()
		end
	end, { UseSelectorResult1, UseContextResult, p1.excludeGallery })
	ReactModule.useEffect(function() --[[ Line: 385 ]]
		-- upvalues: UseContextResult (copy)
		UseContextResult.setScreenOrientation(Enum.ScreenOrientation.Portrait)
		
		return function() --[[ Line: 388 ]]
			-- upvalues: UseContextResult (upval)
			UseContextResult.setScreenOrientation(Enum.ScreenOrientation.Sensor)
		end
	end, {})
	ReactModule.useEffect(function() --[[ Line: 393 ]]
		-- upvalues: UseSelectorResult (copy), CreationFlowStateModule (upval), UseToggleStateResult (copy)
		if UseSelectorResult == CreationFlowStateModule.Gallery or UseSelectorResult == CreationFlowStateModule.Music or UseSelectorResult == CreationFlowStateModule.Description then
			UseToggleStateResult.disable()
		end
	end, { UseSelectorResult })
	
	return ReactModule.createElement(View, {
		tag = "anchor-center-center position-center-center size-full-full",
		backgroundStyle = UseTokensResult.Color.Common.Scrim
	}, {
		CreationFlowView = ReactModule.createElement(View, {
			tag = "anchor-center-center bg-surface-0 position-center-center radius-large size-full-full",
			sizeConstraint = {
				MaxSize = if UseFormFactorResult == FormFactor.Wide then Vector2.new(600, 700) else nil
			}
		}, {
			CloseButtonContainer = ReactModule.createElement(View, { tag = "auto-xy anchor-top-right position-top-right" }, {
				Padding = ReactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, UseDeviceInsetsResult.top + UseTokensResult.Padding.Medium),
					PaddingRight = UDim.new(0, UseDeviceInsetsResult.right + UseTokensResult.Padding.Medium)
				}),
				CloseButton = ReactModule.createElement(View, {
					LayoutOrder = 1,
					tag = "size-1100-1100 bg-over-media-0 padding-medium radius-circle",
					onActivated = UseCallbackResult20
				}, {
					CloseIcon = ReactModule.createElement(Icon, {
						name = "icons/navigation/close_small",
						ZIndex = 2,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.fromScale(0.5, 0.5),
						size = FoundationModule.Enums.IconSize.Small,
						style = UseTokensResult.Color.ActionEmphasis.Foreground
					})
				})
			}),
			MainViewContainer = ReactModule.createElement(View, { tag = "size-full" }, {
				MainView = ReactModule.createElement(View, { tag = "size-full col align-x-center" }, {
					PreviewContainer = ReactModule.createElement("CanvasGroup", {
						LayoutOrder = 1,
						Size = UDim2.fromScale(1, 1),
						BackgroundTransparency = UseTokensResult.Color.None.Transparency
					}, {
						UIFlexItem = ReactModule.createElement("UIFlexItem", {
							FlexMode = Enum.UIFlexMode.Custom,
							ShrinkRatio = if UseSelectorResult1 then 1 else 2
						}),
						UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, UseTokensResult.Radius.Large) }),
						ClickCapture = ReactModule.createElement(View, {
							tag = "size-full",
							ZIndex = 0,
							onActivated = UseAutoDismissStateModuleResult2,
							stateLayer = {
								affordance = FoundationModule.Enums.StateLayerAffordance.None
							}
						}),
						PreviewMediaOverlay = ReactModule.createElement(View, {
							tag = "auto-y anchor-bottom-center col position-bottom-center size-full-0",
							ZIndex = 5
						}, {
							OtherControls = ReactModule.createElement(View, {
								tag = "auto-y padding-x-large padding-bottom-large size-full-0",
								LayoutOrder = 1
							}, {
								Padding = ReactModule.createElement("UIPadding", {
									PaddingLeft = UDim.new(0, (math.max(UseDeviceInsetsResult.right, UseTokensResult.Padding.Large))),
									PaddingRight = UDim.new(0, (math.max(UseDeviceInsetsResult.right, UseTokensResult.Padding.Large)))
								}),
								MusicIndicator = if UseSelectorResult4 and (UseSelectorResult == CreationFlowStateModule.Preview or UseSelectorResult == CreationFlowStateModule.Description) then ReactModule.createElement(View, { tag = "anchor-bottom-left auto-xy position-bottom-left" }, {
									MusicChip = ReactModule.createElement(MusicChipModule, {
										musicAssetId = UseSelectorResult4.assetId,
										onActivated = UseCallbackResult18
									})
								}) else nil
							}),
							PlaybackControls = if UseSelectorResult1 and UseSelectorResult1.CaptureType == Enum.CaptureType.Video and UseAutoDismissStateModuleResult and (UseSelectorResult == CreationFlowStateModule.Gallery or UseSelectorResult == CreationFlowStateModule.Preview) then ReactModule.createElement(PlaybackControlsModule, {
								layoutOrder = 2,
								playbackController = UseUnifiedPlaybackResult,
								toggleFitMode = UseToggleStateResult.toggle,
								isFitMode = UseToggleStateResult.enabled
							}) else nil
						}),
						TextOverlayEditor = if UseSelectorResult == CreationFlowStateModule.TextOverlay then ReactModule.createElement(TextOverlayEditorModule, {
							layoutOrder = 2,
							onTextOverlayDiscard = UseCallbackResult13,
							onTextOverlaySave = UseCallbackResult14,
							onTextOverlayUpdated = UseCallbackResult15,
							textOverlayEdits = UseStateResult4
						}) else nil,
						CaptureView = ReactModule.createElement(CaptureViewModule, {
							capture = UseSelectorResult1,
							playbackController = UseUnifiedPlaybackResult,
							onAbsoluteSizeChanged = UseCallbackResult,
							onRenderFailed = UseResult,
							onResolutionChanged = UseStateResult2,
							scaleType = if UseToggleStateResult.enabled then Enum.ScaleType.Fit else Enum.ScaleType.Crop
						}, {
							TextOverlayDisplay = ReactModule.createElement(TextOverlayDisplay, {
								zIndex = 3,
								draggable = UseSelectorResult == CreationFlowStateModule.Preview,
								editable = UseSelectorResult == CreationFlowStateModule.TextOverlay,
								itemResolution = UseStateResult,
								itemSize = UseStateResult1,
								scaleType = if UseToggleStateResult.enabled then Enum.ScaleType.Fit else Enum.ScaleType.Crop,
								onTextOverlayActivated = UseCallbackResult17,
								onTextOverlayDragEnd = UseCallbackResult16,
								textOverlayEdits = UseSelectorResult2
							})
						}),
						EditCTABar = if UseSelectorResult == CreationFlowStateModule.Preview then ReactModule.createElement(EditCTABarModule, {
							zIndex = 4,
							captureType = if UseSelectorResult1 then UseSelectorResult1.CaptureType else nil,
							showText = UseAutoDismissStateModuleResult
						}) else nil
					}),
					GalleryView = if UseSelectorResult == CreationFlowStateModule.Gallery then ReactModule.createElement(GalleryViewModule, {
						layoutOrder = 2,
						captures = Captures,
						selectedCapture = UseSelectorResult1,
						onCaptureSelected = UseCallbackResult19,
						onNextCallback = UseCallbackResult1
					}) else nil,
					PreviewView = if UseSelectorResult == CreationFlowStateModule.Preview then ReactModule.createElement(PreviewViewModule, {
						layoutOrder = 2,
						onContinueCallback = UseCallbackResult2,
						onReturnToGalleryCallback = if p1.excludeGallery then nil else UseCallbackResult6
					}) else nil,
					TrimmingView = if UseSelectorResult == CreationFlowStateModule.Trimming then ReactModule.createElement(TrimmingViewModule, {
						layoutOrder = 2,
						playbackController = UseUnifiedPlaybackResult,
						onTrimDiscard = UseCallbackResult7,
						onTrimSave = UseCallbackResult8,
						onTrimUpdate = UseCallbackResult9,
						selectedCapture = UseSelectorResult1,
						trimEdit = UseMemoResult1
					}) else nil,
					TextOverlayView = if UseSelectorResult == CreationFlowStateModule.TextOverlay then ReactModule.createElement(TextOverlayViewModule, {
						layoutOrder = 2,
						onTextOverlayDiscard = UseCallbackResult13,
						onTextOverlaySave = UseCallbackResult14
					}) else nil,
					DescriptionView = if UseSelectorResult == CreationFlowStateModule.Description then ReactModule.createElement(DescriptionViewModule, {
						layoutOrder = 2,
						onPublish = UseCallbackResult4,
						onReturnToEditing = UseCallbackResult5
					}) else nil
				}),
				MusicView = if UseSelectorResult == CreationFlowStateModule.Music then ReactModule.createElement(View, { LayoutOrder = 2, Size = UDim2.fromScale(1, 1) }, {
					MusicOverlay = ReactModule.createElement(MusicOverlayModule, {
						musicEdit = UseMemoResult,
						playbackController = UseUnifiedPlaybackResult,
						onMusicDiscard = UseCallbackResult10,
						onMusicSave = UseCallbackResult11,
						onMusicUpdate = UseCallbackResult12
					})
				}) else nil
			})
		}),
		Modal = ReactModule.useCallback(function() --[[ Line: 403 ]]
			-- upvalues: UseStateResult3 (copy), DialogTypeModule (upval), ReactModule (upval), ExitConfirmationDialogModule (upval), TextFilteredDialogModule (upval)
			return if UseStateResult3 then if UseStateResult3.modalType == DialogTypeModule.ExitCreationConfirmation then ReactModule.createElement(ExitConfirmationDialogModule, UseStateResult3.modalProps) elseif UseStateResult3.modalType == DialogTypeModule.TextFiltered then ReactModule.createElement(TextFilteredDialogModule, UseStateResult3.modalProps) else nil else nil
		end, { UseStateResult3 })()
	})
end