local trustedContacts = script:FindFirstAncestor("TrustedContacts")
local parent = trustedContacts.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local partialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local fullPageModal = UIBloxModule.App.Dialog.Modal.FullPageModal
local useLayerCollector = UIBloxModule.Core.Layout.LayerCollector.useLayerCollector
local useScreenSize = require(parent.RobloxAppHooks).useScreenSize
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusRoot = focusNavigationUtilsModule.FocusRoot
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local useFocusOnMount = focusNavigationUtilsModule.useFocusOnMount
local useFocusRoot = focusNavigationUtilsModule.useFocusRoot
local inputHandlersModule = require(parent.InputHandlers)
local useMostRecentOrDefaultFocusBehavior = require(parent.ReactFocusNavigation).useMostRecentOrDefaultFocusBehavior
local responsiveModule = require(parent.Responsive)
local foundationModule = require(parent.Foundation)
local iconSize = foundationModule.Enums.IconSize
local loading = foundationModule.Loading
local text = foundationModule.Text
local button = foundationModule.Button
local useTokens = foundationModule.Hooks.useTokens
local view = foundationModule.View
local scrollView = foundationModule.ScrollView
local sheet = foundationModule.Sheet
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local dialog = foundationModule.Dialog
local dialogSize = foundationModule.Enums.DialogSize
local onCloseCallbackReason = foundationModule.Enums.OnCloseCallbackReason
local sources = require(parent.SocialLuaAnalytics).Analytics.Enums.Sources
local socialMetadataSectionModule = require(trustedContacts.Components.SocialMetadataSection)
local TCMountMinLoadingTimeMs = game:DefineFastInt("TCMountMinLoadingTimeMs", 0)
local TCDialogCloseBtn = game:DefineFastFlag("TCDialogCloseBtn", false)
local fFlagTCLearnMoreLinkModule = require(trustedContacts.Flags.FFlagTCLearnMoreLink)
local fFlagTrustedContactsModalFixFocusNavigationModule = require(trustedContacts.Flags.FFlagTrustedContactsModalFixFocusNavigation)
local fFlagTrustedContactsSheetFocusNavigationModule = require(trustedContacts.Flags.FFlagTrustedContactsSheetFocusNavigation)
local fFlagTCModalUseFoundationOverlay = require(parent.SharedFlags).FFlagTCModalUseFoundationOverlay
local fFlagTrustedFriendsUseEnumCTA = require(parent.SharedFlags).FFlagTrustedFriendsUseEnumCTA
local fFlagTrustedFriendsUseFoundationSheet = require(parent.SharedFlags).FFlagTrustedFriendsUseFoundationSheet
local _ = require(script.Parent.useModalButtonActions)
local t = {
	[Enum.KeyCode.ButtonB] = focusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = focusNavigationEventNameEnum.NavigateBack
}

return function(p1)
	-- upvalues: useLayerCollector (ref), useScreenSize (ref), responsiveModule (ref), fFlagTrustedContactsModalFixFocusNavigationModule (ref), reactModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), fFlagTrustedContactsSheetFocusNavigationModule (ref), fFlagTrustedFriendsUseFoundationSheet (ref), useFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), t (ref), useMostRecentOrDefaultFocusBehavior (ref), useFocusOnMount (ref), TCMountMinLoadingTimeMs (ref), useTokens (ref), loading (ref), iconSize (ref), sheet (ref), text (ref), fFlagTCLearnMoreLinkModule (ref), view (ref), socialMetadataSectionModule (ref), button (ref), buttonVariant (ref), fillBehavior (ref), fFlagTrustedFriendsUseEnumCTA (ref), dialog (ref), dialogSize (ref), fFlagTCModalUseFoundationOverlay (ref), onCloseCallbackReason (ref), TCDialogCloseBtn (ref), fullPageModal (ref), partialPageModal (ref), scrollView (ref), foundationModule (ref), sources (ref), focusRoot (ref)
	local isVerticallyConstrained = p1.isVerticallyConstrained
	local var1 = useLayerCollector()
	local var2 = useScreenSize()
	local var3 = responsiveModule.useOrientation()
	local onCloseModal = p1.onCloseModal
	local var4 = if fFlagTrustedContactsModalFixFocusNavigationModule then reactModule.useMemo(function()
		-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), onCloseModal (ref)
		return {
			[focusNavigationEventNameEnum.NavigateBack] = {
				handler = inputHandlersModule.onRelease(function(p2)
					-- upvalues: onCloseModal (copy)
					onCloseModal()
					p2:cancel()
				end)
			}
		}
	end, { onCloseModal }) else nil
	local fFlagTrustedFriendsUseFoundationSheet_1 = fFlagTrustedContactsSheetFocusNavigationModule and (fFlagTrustedContactsModalFixFocusNavigationModule and fFlagTrustedFriendsUseFoundationSheet)
	local var5 = nil
	local var6 = nil
	
	if fFlagTrustedContactsSheetFocusNavigationModule then
		local var7, var8 = useMostRecentOrDefaultFocusBehavior(useFocusRoot({
			isAutoFocusRoot = true,
			shouldRestoreFocus = false,
			surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
			eventMap = t,
			eventHandlers = var4,
			isFocusable = fFlagTrustedFriendsUseFoundationSheet_1
		}))
		var5 = var7
		var6 = var8
	end
	local var9 = if fFlagTrustedContactsModalFixFocusNavigationModule then useFocusOnMount(if fFlagTrustedFriendsUseFoundationSheet_1 then var5 else nil) else nil
	local var10 = var3 == responsiveModule.DefaultKey
	local var11, var12 = reactModule.useState(var10)
	local var13 = reactModule.useRef(os.clock())
	reactModule.useEffect(function()
		-- upvalues: var10 (ref), var13 (ref), TCMountMinLoadingTimeMs (copy), var12 (ref)
		if not var10 then
			local var14 = os.clock() - var13.current
			local var15 = TCMountMinLoadingTimeMs / 1000
			
			if var14 < var15 then
				delay(var15 - var14, function()
					-- upvalues: var12 (copy)
					var12(false)
				end)
				
				return
			end
			var12(false)
		end
	end, { var10, var12 })
	
	if var1 and var1.absoluteSize and var1.absoluteSize ~= Vector2.new(0, 0) then
		var2 = var1.absoluteSize
	end
	local var14 = var3 == responsiveModule.BreakpointConfig.Enum.Landscape
	local var15 = useTokens()
	
	if var11 then
		return reactModule.createElement(loading, {
			size = iconSize.Large,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5)
		})
	end
	local createElement
	local var16 = if p1.modalButtonActions then p1.modalButtonActions[1] else nil
	local var17 = if p1.modalButtonActions then p1.modalButtonActions[2] else nil
	
	if fFlagTrustedFriendsUseFoundationSheet then
		createElement = reactModule.createElement
		createElement = createElement(sheet.Root, {
			preferCenterSheet = true,
			onClose = p1.onCloseModal,
			ref = if fFlagTrustedFriendsUseFoundationSheet_1 then var6 else nil
		}, {
			Header = reactModule.createElement(sheet.Header, nil, {
				Title = reactModule.createElement(text, {
					tag = "auto-xy text-heading-small text-align-x-left content-default",
					Text = p1.headerText
				})
			}),
			Content = reactModule.createElement(sheet.Content, { LayoutOrder = 2 }, {
				TextIntro = if fFlagTCLearnMoreLinkModule then reactModule.createElement(view, {
					LayoutOrder = 1,
					tag = "col gap-small size-full-0 auto-y"
				}, {
					Text = reactModule.createElement(text, {
						LayoutOrder = 1,
						tag = "size-full-0 auto-y text-wrap text-align-x-left",
						Text = p1.descriptionText
					}),
					LearnMore = reactModule.createElement(text, {
						LayoutOrder = 2,
						tag = "size-0 auto-xy text-wrap text-align-x-left",
						RichText = true,
						Text = `<u>{p1.learnMoreText}</u>`,
						onActivated = p1.onLearnMoreClick
					})
				}) else reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y text-wrap text-align-x-left",
					Text = p1.descriptionText
				}),
				Insights = reactModule.createElement(socialMetadataSectionModule, {
					layoutOrder = 2,
					userId = p1.userId,
					isVerticallyConstrained = isVerticallyConstrained
				})
			}),
			Actions = if var16 or var17 then reactModule.createElement(sheet.Actions, nil, {
				First = var16 and reactModule.createElement(button, {
					LayoutOrder = 1,
					text = var16.text or "",
					onActivated = var16.onActivated,
					icon = var16.icon,
					isLoading = var16.isLoading,
					variant = buttonVariant.Emphasis,
					fillBehavior = fillBehavior.Fill,
					width = UDim.new(1, 0),
					ref = var9,
					isDisabled = if fFlagTrustedFriendsUseEnumCTA then var16.isDisabled else nil
				}) or nil,
				Second = var17 and reactModule.createElement(button, {
					LayoutOrder = 2,
					text = var17.text or "",
					onActivated = var17.onActivated,
					icon = var17.icon,
					isLoading = var17.isLoading,
					variant = buttonVariant.Standard,
					fillBehavior = fillBehavior.Fill,
					width = UDim.new(1, 0),
					isDisabled = if fFlagTrustedFriendsUseEnumCTA then var17.isDisabled else nil
				}) or nil
			}) else nil
		})
	elseif var14 then
		createElement = reactModule.createElement
		createElement = createElement(dialog.Root, {
			size = dialogSize.Medium,
			onClose = if fFlagTCModalUseFoundationOverlay then function(p2)
				-- upvalues: onCloseCallbackReason (copy), p1 (ref)
				if p2 == onCloseCallbackReason.BackdropClick then
					return
				end
				p1.onCloseModal()
			end elseif TCDialogCloseBtn then p1.onCloseModal else nil,
			hasBackdrop = if fFlagTCModalUseFoundationOverlay then true else nil
		}, {
			Title = reactModule.createElement(dialog.Title, { LayoutOrder = 1, text = p1.headerText }),
			Contents = reactModule.createElement("ScrollingFrame", {
				LayoutOrder = 2,
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Size = isVerticallyConstrained and UDim2.new(1, -4, 0.3, 0) or UDim2.fromScale(1, 0),
				AutomaticSize = if not isVerticallyConstrained then Enum.AutomaticSize.Y else nil,
				VerticalScrollBarInset = Enum.ScrollBarInset.None,
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.fromScale(0, 0),
				ScrollingDirection = Enum.ScrollingDirection.Y,
				ScrollingEnabled = isVerticallyConstrained,
				ScrollBarThickness = if fFlagTCModalUseFoundationOverlay and not isVerticallyConstrained then 0 else nil
			}, {
				UIListLayout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				TextIntro = if fFlagTCLearnMoreLinkModule then reactModule.createElement(view, {
					LayoutOrder = 1,
					tag = "col size-full-0 auto-y padding-bottom-large"
				}, {
					reactModule.createElement(text, {
						LayoutOrder = 1,
						tag = "size-full-0 auto-y text-wrap text-align-x-left",
						Text = p1.descriptionText
					}),
					LearnMore = reactModule.createElement(text, {
						LayoutOrder = 2,
						tag = "size-0 auto-xy text-wrap text-align-x-left",
						RichText = true,
						Text = `<u>{p1.learnMoreText}</u>`,
						onActivated = p1.onLearnMoreClick
					})
				}) else reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y padding-bottom-large text-wrap text-align-x-left",
					Text = p1.descriptionText
				}),
				Insights = reactModule.createElement(socialMetadataSectionModule, { layoutOrder = 2, userId = p1.userId })
			}),
			DialogActions = reactModule.createElement(dialog.Actions, {
				LayoutOrder = 4,
				actions = {
					if var16 then {
						variant = buttonVariant.Emphasis,
						text = var16.text,
						onActivated = var16.onActivated,
						icon = var16.icon,
						isLoading = var16.isLoading,
						ref = var9,
						isDisabled = if fFlagTrustedFriendsUseEnumCTA then var16.isDisabled else nil
					} else nil,
					if var17 then {
						variant = buttonVariant.Standard,
						text = var17.text,
						onActivated = var17.onActivated,
						icon = var17.icon,
						isLoading = var17.isLoading,
						isDisabled = if fFlagTrustedFriendsUseEnumCTA then var17.isDisabled else nil
					} else nil
				}
			})
		})
	else
		createElement = reactModule.createElement
		createElement = createElement(if isVerticallyConstrained then fullPageModal else partialPageModal, {
			title = p1.headerText,
			screenSize = var2,
			onCloseClicked = p1.onCloseModal
		}, {
			Contents = reactModule.createElement(if isVerticallyConstrained then scrollView else view, {
				tag = {
					["col align-x-center size-full-0 auto-y"] = true,
					["shrink gap-medium"] = isVerticallyConstrained,
					["gap-large"] = not isVerticallyConstrained
				},
				scroll = isVerticallyConstrained and {
					scrollBarVisibility = foundationModule.Enums.ScrollBarVisibility.Always,
					ScrollingDirection = Enum.ScrollingDirection.Y
				}
			}, {
				UIListLayout = if fFlagTCLearnMoreLinkModule then reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder
				}) else nil,
				OuterPadding = reactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, if isVerticallyConstrained then var15.Padding.XSmall else var15.Padding.Large),
					PaddingBottom = UDim.new(0, if isVerticallyConstrained then var15.Padding.Small else 0)
				}),
				TextIntro = if fFlagTCLearnMoreLinkModule then reactModule.createElement(view, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y",
					grow = not isVerticallyConstrained
				}, {
					UIListLayout = reactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					Text = reactModule.createElement(text, {
						LayoutOrder = 1,
						tag = {
							["size-full-0 auto-y text-wrap text-align-x-left"] = true,
							grow = not isVerticallyConstrained
						},
						Text = p1.descriptionText
					}),
					LearnMore = reactModule.createElement(text, {
						LayoutOrder = 2,
						tag = "size-0 auto-xy text-wrap text-align-x-left",
						RichText = true,
						Text = `<u>{p1.learnMoreText}</u>`,
						onActivated = p1.onLearnMoreClick
					})
				}) else reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = {
						["size-full-0 auto-y text-wrap text-align-x-left"] = true,
						grow = not isVerticallyConstrained
					},
					Text = p1.descriptionText
				}),
				Insights = reactModule.createElement(socialMetadataSectionModule, {
					layoutOrder = 2,
					userId = p1.userId,
					isVerticallyConstrained = isVerticallyConstrained
				}),
				ActionButtons = if var16 or var17 then reactModule.createElement(view, {
					LayoutOrder = 3,
					tag = "row gap-small size-full-0 auto-y padding-top-small"
				}, {
					First = var16 and reactModule.createElement(button, {
						LayoutOrder = 1,
						text = var16.text or "",
						onActivated = var16.onActivated,
						icon = var16.icon,
						isLoading = var16.isLoading,
						variant = buttonVariant.Emphasis,
						fillBehavior = fillBehavior.Fill,
						ref = var9,
						isDisabled = if fFlagTrustedFriendsUseEnumCTA then var16.isDisabled else nil
					}) or nil,
					Second = var17 and reactModule.createElement(button, {
						LayoutOrder = 2,
						text = var17.text or "",
						onActivated = var17.onActivated,
						icon = var17.icon,
						isLoading = var17.isLoading,
						variant = buttonVariant.Standard,
						fillBehavior = fillBehavior.Fill,
						isDisabled = if fFlagTrustedFriendsUseEnumCTA then var17.isDisabled else nil
					}) or nil
				}) else nil
			})
		})
	end
	local var18 = if fFlagTrustedFriendsUseFoundationSheet or not fFlagTCModalUseFoundationOverlay and p1.source ~= sources.StreamNotification then createElement else reactModule.createElement("TextButton", {
		Selectable = false,
		AutoButtonColor = false,
		Text = "",
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = var15.Color.Common.Scrim.Color3,
		BackgroundTransparency = if fFlagTCModalUseFoundationOverlay and var14 then 1 else var15.Color.Common.Scrim.Transparency,
		ZIndex = if fFlagTCModalUseFoundationOverlay then 300 else nil
	}, { TrustedContactModalComponent = createElement })
	
	return if fFlagTrustedFriendsUseFoundationSheet_1 then var18 elseif fFlagTrustedContactsModalFixFocusNavigationModule then reactModule.createElement(focusRoot, {
		isAutoFocusRoot = true,
		isIsolated = true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
		eventHandlers = var4
	}, { Modal = var18 }) else var18
end