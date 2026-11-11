local TrustedContacts = script:FindFirstAncestor("TrustedContacts")
local Parent = TrustedContacts.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local PartialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local FullPageModal = UIBloxModule.App.Dialog.Modal.FullPageModal
local UseLayerCollectorFunction = UIBloxModule.Core.Layout.LayerCollector.useLayerCollector
local UseScreenSizeFunction = require(Parent.RobloxAppHooks).useScreenSize
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusRoot = FocusNavigationUtilsModule.FocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local UseFocusOnMountFunction = FocusNavigationUtilsModule.useFocusOnMount
local InputHandlersModule = require(Parent.InputHandlers)
local _ = require(Parent.ReactFocusNavigation)
local ResponsiveModule = require(Parent.Responsive)
local FoundationModule = require(Parent.Foundation)
local IconSize = FoundationModule.Enums.IconSize
local Loading = FoundationModule.Loading
local Text = FoundationModule.Text
local Button = FoundationModule.Button
local UseTokensFunction = FoundationModule.Hooks.useTokens
local View = FoundationModule.View
local ScrollView = FoundationModule.ScrollView
local Sheet = FoundationModule.Sheet
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local Dialog = FoundationModule.Dialog
local DialogSize = FoundationModule.Enums.DialogSize
local OnCloseCallbackReason = FoundationModule.Enums.OnCloseCallbackReason
local Sources = require(Parent.SocialLuaAnalytics).Analytics.Enums.Sources
local SocialMetadataSectionModule = require(TrustedContacts.Components.SocialMetadataSection)
local TCMountMinLoadingTimeMs = game:DefineFastInt("TCMountMinLoadingTimeMs", 0)
local TCDialogCloseBtn = game:DefineFastFlag("TCDialogCloseBtn", false)
local FFlagTCLearnMoreLinkModule = require(TrustedContacts.Flags.FFlagTCLearnMoreLink)
local FFlagTrustedContactsModalFixFocusNavigationModule = require(TrustedContacts.Flags.FFlagTrustedContactsModalFixFocusNavigation)
local FFlagTCModalUseFoundationOverlay = require(Parent.SharedFlags).FFlagTCModalUseFoundationOverlay
local FFlagTrustedFriendsUseEnumCTA = require(Parent.SharedFlags).FFlagTrustedFriendsUseEnumCTA
local FFlagTrustedFriendsUseFoundationSheet = require(Parent.SharedFlags).FFlagTrustedFriendsUseFoundationSheet
local _ = require(script.Parent.useModalButtonActions)

return function(p1)
	-- upvalues: UseLayerCollectorFunction (copy), UseScreenSizeFunction (copy), ResponsiveModule (copy), FFlagTrustedContactsModalFixFocusNavigationModule (copy), ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), UseFocusOnMountFunction (copy), TCMountMinLoadingTimeMs (copy), UseTokensFunction (copy), Loading (copy), IconSize (copy), FFlagTrustedFriendsUseFoundationSheet (copy), Sheet (copy), Text (copy), FFlagTCLearnMoreLinkModule (copy), View (copy), SocialMetadataSectionModule (copy), Button (copy), ButtonVariant (copy), FillBehavior (copy), FFlagTrustedFriendsUseEnumCTA (copy), Dialog (copy), DialogSize (copy), FFlagTCModalUseFoundationOverlay (copy), OnCloseCallbackReason (copy), TCDialogCloseBtn (copy), FullPageModal (copy), PartialPageModal (copy), ScrollView (copy), FoundationModule (copy), Sources (copy), FocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy)
	local IsVerticallyConstrained = p1.isVerticallyConstrained
	local UseLayerCollectorResult = UseLayerCollectorFunction()
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseOrientationResult = ResponsiveModule.useOrientation()
	local OnCloseModalFunction = p1.onCloseModal
	local UseMemoResult = if FFlagTrustedContactsModalFixFocusNavigationModule then ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), OnCloseModalFunction (copy)
		return {
			[FocusNavigationEventNameEnum.NavigateBack] = {
				handler = InputHandlersModule.onRelease(function(p2)
					-- upvalues: OnCloseModalFunction (upval)
					OnCloseModalFunction()
					p2:cancel()
				end)
			}
		}
	end, { OnCloseModalFunction }) else nil
	local UseFocusOnMountResult = if FFlagTrustedContactsModalFixFocusNavigationModule then UseFocusOnMountFunction() else nil
	local IsUseOrientationResultMatch = UseOrientationResult == ResponsiveModule.DefaultKey
	local UseStateResult, UseStateResult2 = ReactModule.useState(IsUseOrientationResultMatch)
	local UseRefResult = ReactModule.useRef(os.clock())
	ReactModule.useEffect(function()
		-- upvalues: IsUseOrientationResultMatch (copy), UseRefResult (copy), TCMountMinLoadingTimeMs (upval), UseStateResult2 (copy)
		if not IsUseOrientationResultMatch then
			local Elapsed = os.clock() - UseRefResult.current
			local TCMountMinLoadingTimeMsRatio = TCMountMinLoadingTimeMs / 1000
			
			if Elapsed < TCMountMinLoadingTimeMsRatio then
				delay(TCMountMinLoadingTimeMsRatio - Elapsed, function()
					-- upvalues: UseStateResult2 (upval)
					UseStateResult2(false)
				end)
				
				return
			end
			UseStateResult2(false)
		end
	end, { IsUseOrientationResultMatch, UseStateResult2 })
	
	if UseLayerCollectorResult and UseLayerCollectorResult.absoluteSize and UseLayerCollectorResult.absoluteSize ~= Vector2.new(0, 0) then
		UseScreenSizeResult = UseLayerCollectorResult.absoluteSize
	end
	local IsUseOrientationResultMatch1 = UseOrientationResult == ResponsiveModule.BreakpointConfig.Enum.Landscape
	local UseTokensResult = UseTokensFunction()
	
	if UseStateResult then
		return ReactModule.createElement(Loading, {
			size = IconSize.Large,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5)
		})
	else
		local ModalButtonAction = p1.modalButtonActions and p1.modalButtonActions[1] or nil
		local ModalButtonAction1 = p1.modalButtonActions and p1.modalButtonActions[2] or nil
		local Element = if FFlagTrustedFriendsUseFoundationSheet then ReactModule.createElement(Sheet.Root, { preferCenterSheet = true, onClose = p1.onCloseModal }, {
			Header = ReactModule.createElement(Sheet.Header, nil, {
				Title = ReactModule.createElement(Text, {
					tag = "auto-xy text-heading-small text-align-x-left content-default",
					Text = p1.headerText
				})
			}),
			Content = ReactModule.createElement(Sheet.Content, { LayoutOrder = 2 }, {
				TextIntro = if FFlagTCLearnMoreLinkModule then ReactModule.createElement(View, {
					LayoutOrder = 1,
					tag = "col gap-small size-full-0 auto-y"
				}, {
					Text = ReactModule.createElement(Text, {
						LayoutOrder = 1,
						tag = "size-full-0 auto-y text-wrap text-align-x-left",
						Text = p1.descriptionText
					}),
					LearnMore = ReactModule.createElement(Text, {
						LayoutOrder = 2,
						tag = "size-0 auto-xy text-wrap text-align-x-left",
						RichText = true,
						Text = `<u>{p1.learnMoreText}</u>`,
						onActivated = p1.onLearnMoreClick
					})
				}) else ReactModule.createElement(Text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y text-wrap text-align-x-left",
					Text = p1.descriptionText
				}),
				Insights = ReactModule.createElement(SocialMetadataSectionModule, {
					layoutOrder = 2,
					userId = p1.userId,
					isVerticallyConstrained = IsVerticallyConstrained
				})
			}),
			Actions = if ModalButtonAction or ModalButtonAction1 then ReactModule.createElement(Sheet.Actions, nil, {
				First = ModalButtonAction and ReactModule.createElement(Button, {
					LayoutOrder = 1,
					text = ModalButtonAction.text or "",
					onActivated = ModalButtonAction.onActivated,
					icon = ModalButtonAction.icon,
					isLoading = ModalButtonAction.isLoading,
					variant = ButtonVariant.Emphasis,
					fillBehavior = FillBehavior.Fill,
					width = UDim.new(1, 0),
					ref = UseFocusOnMountResult,
					isDisabled = if FFlagTrustedFriendsUseEnumCTA then ModalButtonAction.isDisabled else nil
				}) or nil,
				Second = ModalButtonAction1 and ReactModule.createElement(Button, {
					LayoutOrder = 2,
					text = ModalButtonAction1.text or "",
					onActivated = ModalButtonAction1.onActivated,
					icon = ModalButtonAction1.icon,
					isLoading = ModalButtonAction1.isLoading,
					variant = ButtonVariant.Standard,
					fillBehavior = FillBehavior.Fill,
					width = UDim.new(1, 0),
					isDisabled = if FFlagTrustedFriendsUseEnumCTA then ModalButtonAction1.isDisabled else nil
				}) or nil
			}) else nil
		}) elseif IsUseOrientationResultMatch1 then ReactModule.createElement(Dialog.Root, {
			size = DialogSize.Medium,
			onClose = if FFlagTCModalUseFoundationOverlay then function(BackdropClick)
				-- upvalues: OnCloseCallbackReason (upval), p1 (copy)
				if BackdropClick ~= OnCloseCallbackReason.BackdropClick then
					p1.onCloseModal()
					
					return
				end
			end elseif TCDialogCloseBtn then p1.onCloseModal else nil,
			hasBackdrop = if FFlagTCModalUseFoundationOverlay then true else nil
		}, {
			Title = ReactModule.createElement(Dialog.Title, { LayoutOrder = 1, text = p1.headerText }),
			Contents = ReactModule.createElement("ScrollingFrame", {
				LayoutOrder = 2,
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Size = IsVerticallyConstrained and UDim2.new(1, -4, 0.3, 0) or UDim2.fromScale(1, 0),
				AutomaticSize = if IsVerticallyConstrained then nil else Enum.AutomaticSize.Y or nil,
				VerticalScrollBarInset = Enum.ScrollBarInset.None,
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.fromScale(0, 0),
				ScrollingDirection = Enum.ScrollingDirection.Y,
				ScrollingEnabled = IsVerticallyConstrained,
				ScrollBarThickness = if FFlagTCModalUseFoundationOverlay and not IsVerticallyConstrained then 0 else nil
			}, {
				UIListLayout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				TextIntro = if FFlagTCLearnMoreLinkModule then ReactModule.createElement(View, {
					LayoutOrder = 1,
					tag = "col size-full-0 auto-y padding-bottom-large"
				}, {
					ReactModule.createElement(Text, {
						LayoutOrder = 1,
						tag = "size-full-0 auto-y text-wrap text-align-x-left",
						Text = p1.descriptionText
					}),
					LearnMore = ReactModule.createElement(Text, {
						LayoutOrder = 2,
						tag = "size-0 auto-xy text-wrap text-align-x-left",
						RichText = true,
						Text = `<u>{p1.learnMoreText}</u>`,
						onActivated = p1.onLearnMoreClick
					})
				}) else ReactModule.createElement(Text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y padding-bottom-large text-wrap text-align-x-left",
					Text = p1.descriptionText
				}),
				Insights = ReactModule.createElement(SocialMetadataSectionModule, { layoutOrder = 2, userId = p1.userId })
			}),
			DialogActions = ReactModule.createElement(Dialog.Actions, {
				LayoutOrder = 4,
				actions = {
					if ModalButtonAction then {
						variant = ButtonVariant.Emphasis,
						text = ModalButtonAction.text,
						onActivated = ModalButtonAction.onActivated,
						icon = ModalButtonAction.icon,
						isLoading = ModalButtonAction.isLoading,
						ref = UseFocusOnMountResult,
						isDisabled = if FFlagTrustedFriendsUseEnumCTA then ModalButtonAction.isDisabled else nil
					} else nil,
					if ModalButtonAction1 then {
						variant = ButtonVariant.Standard,
						text = ModalButtonAction1.text,
						onActivated = ModalButtonAction1.onActivated,
						icon = ModalButtonAction1.icon,
						isLoading = ModalButtonAction1.isLoading,
						isDisabled = if FFlagTrustedFriendsUseEnumCTA then ModalButtonAction1.isDisabled else nil
					} else nil
				}
			})
		}) else ReactModule.createElement(IsVerticallyConstrained and FullPageModal or PartialPageModal, {
			title = p1.headerText,
			screenSize = UseScreenSizeResult,
			onCloseClicked = p1.onCloseModal
		}, {
			Contents = ReactModule.createElement(IsVerticallyConstrained and ScrollView or View, {
				tag = {
					["col align-x-center size-full-0 auto-y"] = true,
					["shrink gap-medium"] = IsVerticallyConstrained,
					["gap-large"] = not IsVerticallyConstrained
				},
				scroll = IsVerticallyConstrained and {
					scrollBarVisibility = FoundationModule.Enums.ScrollBarVisibility.Always,
					ScrollingDirection = Enum.ScrollingDirection.Y
				}
			}, {
				UIListLayout = if FFlagTCLearnMoreLinkModule then ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder
				}) else nil,
				OuterPadding = ReactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, IsVerticallyConstrained and UseTokensResult.Padding.XSmall or UseTokensResult.Padding.Large),
					PaddingBottom = UDim.new(0, IsVerticallyConstrained and UseTokensResult.Padding.Small or 0)
				}),
				TextIntro = if FFlagTCLearnMoreLinkModule then ReactModule.createElement(View, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y",
					grow = not IsVerticallyConstrained
				}, {
					UIListLayout = ReactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					Text = ReactModule.createElement(Text, {
						LayoutOrder = 1,
						tag = {
							["size-full-0 auto-y text-wrap text-align-x-left"] = true,
							grow = not IsVerticallyConstrained
						},
						Text = p1.descriptionText
					}),
					LearnMore = ReactModule.createElement(Text, {
						LayoutOrder = 2,
						tag = "size-0 auto-xy text-wrap text-align-x-left",
						RichText = true,
						Text = `<u>{p1.learnMoreText}</u>`,
						onActivated = p1.onLearnMoreClick
					})
				}) else ReactModule.createElement(Text, {
					LayoutOrder = 1,
					tag = {
						["size-full-0 auto-y text-wrap text-align-x-left"] = true,
						grow = not IsVerticallyConstrained
					},
					Text = p1.descriptionText
				}),
				Insights = ReactModule.createElement(SocialMetadataSectionModule, {
					layoutOrder = 2,
					userId = p1.userId,
					isVerticallyConstrained = IsVerticallyConstrained
				}),
				ActionButtons = if ModalButtonAction or ModalButtonAction1 then ReactModule.createElement(View, {
					LayoutOrder = 3,
					tag = "row gap-small size-full-0 auto-y padding-top-small"
				}, {
					First = ModalButtonAction and ReactModule.createElement(Button, {
						LayoutOrder = 1,
						text = ModalButtonAction.text or "",
						onActivated = ModalButtonAction.onActivated,
						icon = ModalButtonAction.icon,
						isLoading = ModalButtonAction.isLoading,
						variant = ButtonVariant.Emphasis,
						fillBehavior = FillBehavior.Fill,
						ref = UseFocusOnMountResult,
						isDisabled = if FFlagTrustedFriendsUseEnumCTA then ModalButtonAction.isDisabled else nil
					}) or nil,
					Second = ModalButtonAction1 and ReactModule.createElement(Button, {
						LayoutOrder = 2,
						text = ModalButtonAction1.text or "",
						onActivated = ModalButtonAction1.onActivated,
						icon = ModalButtonAction1.icon,
						isLoading = ModalButtonAction1.isLoading,
						variant = ButtonVariant.Standard,
						fillBehavior = FillBehavior.Fill,
						isDisabled = if FFlagTrustedFriendsUseEnumCTA then ModalButtonAction1.isDisabled else nil
					}) or nil
				}) else nil
			})
		})
		local IsUseOrientationResultMatch1_1: boolean = FFlagTCModalUseFoundationOverlay and IsUseOrientationResultMatch1
		local Element1 = if FFlagTrustedFriendsUseFoundationSheet or not FFlagTCModalUseFoundationOverlay and p1.source ~= Sources.StreamNotification then Element else ReactModule.createElement("TextButton", {
			Selectable = false,
			AutoButtonColor = false,
			Text = "",
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = UseTokensResult.Color.Common.Scrim.Color3,
			BackgroundTransparency = if IsUseOrientationResultMatch1_1 then 1 else UseTokensResult.Color.Common.Scrim.Transparency,
			ZIndex = if FFlagTCModalUseFoundationOverlay then 300 else nil
		}, { TrustedContactModalComponent = Element })
		
		return if FFlagTrustedContactsModalFixFocusNavigationModule then ReactModule.createElement(FocusRoot, {
			isAutoFocusRoot = true,
			isIsolated = true,
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
			eventHandlers = UseMemoResult
		}, { Modal = Element1 }) else Element1
	end
end