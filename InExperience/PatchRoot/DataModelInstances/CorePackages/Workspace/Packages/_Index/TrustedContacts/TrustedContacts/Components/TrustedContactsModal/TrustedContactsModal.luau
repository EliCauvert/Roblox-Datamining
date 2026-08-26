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
local inputHandlersModule = require(parent.InputHandlers)
local _ = require(parent.ReactFocusNavigation)
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
local fFlagTCModalUseFoundationOverlay = require(parent.SharedFlags).FFlagTCModalUseFoundationOverlay
local fFlagTrustedFriendsUseEnumCTA = require(parent.SharedFlags).FFlagTrustedFriendsUseEnumCTA
local fFlagTrustedFriendsUseFoundationSheet = require(parent.SharedFlags).FFlagTrustedFriendsUseFoundationSheet
local _ = require(script.Parent.useModalButtonActions)

return function(p1)
	-- upvalues: useLayerCollector (ref), useScreenSize (ref), responsiveModule (ref), fFlagTrustedContactsModalFixFocusNavigationModule (ref), reactModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), useFocusOnMount (ref), TCMountMinLoadingTimeMs (ref), useTokens (ref), loading (ref), iconSize (ref), fFlagTrustedFriendsUseFoundationSheet (ref), sheet (ref), text (ref), fFlagTCLearnMoreLinkModule (ref), view (ref), socialMetadataSectionModule (ref), button (ref), buttonVariant (ref), fillBehavior (ref), fFlagTrustedFriendsUseEnumCTA (ref), dialog (ref), dialogSize (ref), fFlagTCModalUseFoundationOverlay (ref), onCloseCallbackReason (ref), TCDialogCloseBtn (ref), fullPageModal (ref), partialPageModal (ref), scrollView (ref), foundationModule (ref), sources (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref)
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
	local var5 = if fFlagTrustedContactsModalFixFocusNavigationModule then useFocusOnMount() else nil
	local var6 = var3 == responsiveModule.DefaultKey
	local var7, var8 = reactModule.useState(var6)
	local var9 = reactModule.useRef(os.clock())
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), var9 (ref), TCMountMinLoadingTimeMs (copy), var8 (ref)
		if not var6 then
			local var10 = os.clock() - var9.current
			local var11 = TCMountMinLoadingTimeMs / 1000
			
			if var10 < var11 then
				delay(var11 - var10, function()
					-- upvalues: var8 (copy)
					var8(false)
				end)
				
				return
			end
			var8(false)
		end
	end, { var6, var8 })
	
	if var1 and var1.absoluteSize and var1.absoluteSize ~= Vector2.new(0, 0) then
		var2 = var1.absoluteSize
	end
	local var10 = var3 == responsiveModule.BreakpointConfig.Enum.Landscape
	local var11 = useTokens()
	
	if var7 then
		return reactModule.createElement(loading, {
			size = iconSize.Large,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5)
		})
	end
	local createElement
	local var12 = if p1.modalButtonActions then p1.modalButtonActions[1] else nil
	local var13 = if p1.modalButtonActions then p1.modalButtonActions[2] else nil
	
	if fFlagTrustedFriendsUseFoundationSheet then
		createElement = reactModule.createElement
		createElement = createElement(sheet.Root, { preferCenterSheet = true, onClose = p1.onCloseModal }, {
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
			Actions = if var12 or var13 then reactModule.createElement(sheet.Actions, nil, {
				First = var12 and reactModule.createElement(button, {
					LayoutOrder = 1,
					text = var12.text or "",
					onActivated = var12.onActivated,
					icon = var12.icon,
					isLoading = var12.isLoading,
					variant = buttonVariant.Emphasis,
					fillBehavior = fillBehavior.Fill,
					width = UDim.new(1, 0),
					ref = var5,
					isDisabled = if fFlagTrustedFriendsUseEnumCTA then var12.isDisabled else nil
				}) or nil,
				Second = var13 and reactModule.createElement(button, {
					LayoutOrder = 2,
					text = var13.text or "",
					onActivated = var13.onActivated,
					icon = var13.icon,
					isLoading = var13.isLoading,
					variant = buttonVariant.Standard,
					fillBehavior = fillBehavior.Fill,
					width = UDim.new(1, 0),
					isDisabled = if fFlagTrustedFriendsUseEnumCTA then var13.isDisabled else nil
				}) or nil
			}) else nil
		})
	elseif var10 then
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
					if var12 then {
						variant = buttonVariant.Emphasis,
						text = var12.text,
						onActivated = var12.onActivated,
						icon = var12.icon,
						isLoading = var12.isLoading,
						ref = var5,
						isDisabled = if fFlagTrustedFriendsUseEnumCTA then var12.isDisabled else nil
					} else nil,
					if var13 then {
						variant = buttonVariant.Standard,
						text = var13.text,
						onActivated = var13.onActivated,
						icon = var13.icon,
						isLoading = var13.isLoading,
						isDisabled = if fFlagTrustedFriendsUseEnumCTA then var13.isDisabled else nil
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
					PaddingTop = UDim.new(0, if isVerticallyConstrained then var11.Padding.XSmall else var11.Padding.Large),
					PaddingBottom = UDim.new(0, if isVerticallyConstrained then var11.Padding.Small else 0)
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
				ActionButtons = if var12 or var13 then reactModule.createElement(view, {
					LayoutOrder = 3,
					tag = "row gap-small size-full-0 auto-y padding-top-small"
				}, {
					First = var12 and reactModule.createElement(button, {
						LayoutOrder = 1,
						text = var12.text or "",
						onActivated = var12.onActivated,
						icon = var12.icon,
						isLoading = var12.isLoading,
						variant = buttonVariant.Emphasis,
						fillBehavior = fillBehavior.Fill,
						ref = var5,
						isDisabled = if fFlagTrustedFriendsUseEnumCTA then var12.isDisabled else nil
					}) or nil,
					Second = var13 and reactModule.createElement(button, {
						LayoutOrder = 2,
						text = var13.text or "",
						onActivated = var13.onActivated,
						icon = var13.icon,
						isLoading = var13.isLoading,
						variant = buttonVariant.Standard,
						fillBehavior = fillBehavior.Fill,
						isDisabled = if fFlagTrustedFriendsUseEnumCTA then var13.isDisabled else nil
					}) or nil
				}) else nil
			})
		})
	end
	local var14 = if fFlagTrustedFriendsUseFoundationSheet or not fFlagTCModalUseFoundationOverlay and p1.source ~= sources.StreamNotification then createElement else reactModule.createElement("TextButton", {
		Selectable = false,
		AutoButtonColor = false,
		Text = "",
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = var11.Color.Common.Scrim.Color3,
		BackgroundTransparency = if fFlagTCModalUseFoundationOverlay and var10 then 1 else var11.Color.Common.Scrim.Transparency,
		ZIndex = if fFlagTCModalUseFoundationOverlay then 300 else nil
	}, { TrustedContactModalComponent = createElement })
	
	return if fFlagTrustedContactsModalFixFocusNavigationModule then reactModule.createElement(focusRoot, {
		isAutoFocusRoot = true,
		isIsolated = true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
		eventHandlers = var4
	}, { Modal = var14 }) else var14
end