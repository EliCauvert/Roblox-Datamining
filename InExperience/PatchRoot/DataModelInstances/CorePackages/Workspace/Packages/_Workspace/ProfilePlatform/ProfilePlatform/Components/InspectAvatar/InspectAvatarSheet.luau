local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local displayBackground = require(parent.EditProfileBackground).DisplayBackground
local buyActionBar = require(parent.AvatarExperienceInspectAndBuy).Components.BuyActionBar
local dashModule = require(parent.Dash)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local appFocusRoot = focusNavigationUtilsModule.AppFocusRoot
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local inputHandlersModule = require(parent.InputHandlers)
local fFlagSocialEnableProfileInspectAndBuyConsoleFocusNav = require(parent.SharedFlags).FFlagSocialEnableProfileInspectAndBuyConsoleFocusNav
local fFlagProfileInspectAvatarBuyAllModule = require(profilePlatform.Flags.FFlagProfileInspectAvatarBuyAll)
local fFlagProfileInspectAvatarBackgroundModule = require(profilePlatform.Flags.FFlagProfileInspectAvatarBackground)
local view = foundationModule.View
local image = foundationModule.Image
local text = foundationModule.Text
local iconButton = foundationModule.IconButton
local divider = foundationModule.Divider
local skeleton = foundationModule.Skeleton
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local buttonVariant = foundationModule.Enums.ButtonVariant
local useTokens = foundationModule.Hooks.useTokens
local useLocalization = require(parent.Localization).Hooks.useLocalization
local _ = require(profilePlatform.Common.Types)
local itemDisplayHelpersModule = require(script.Parent.ItemDisplayHelpers)
local catalogItemRowCardContainerModule = require(script.Parent.CatalogItemRowCardContainer)
local isItemPurchasable = require(script.Parent.InspectAvatarUtils).isItemPurchasable

return function(p1)
	-- upvalues: useLocalization (ref), itemDisplayHelpersModule (ref), fFlagProfileInspectAvatarBackgroundModule (ref), useTokens (ref), reactModule (ref), dashModule (ref), catalogItemRowCardContainerModule (ref), isItemPurchasable (ref), fFlagSocialEnableProfileInspectAndBuyConsoleFocusNav (ref), inputHandlersModule (ref), view (ref), image (ref), displayBackground (ref), iconButton (ref), iconName (ref), iconSize (ref), buttonVariant (ref), text (ref), skeleton (ref), divider (ref), buyActionBar (ref), fFlagProfileInspectAvatarBuyAllModule (ref), appFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), focusNavigationEventNameEnum (ref)
	local var1 = useLocalization({
		buyItems = "Feature.Catalog.Label.BuyItems",
		buyWholeLook = "Feature.Profile.Header.BuyWholeLook",
		bundle = "Feature.Catalog.Label.Bundle",
		title = {
			"Feature.Profile.Header.InspectAndBuy",
			username = p1.username
		},
		buyHeader = {
			"Feature.Profile.Header.InspectAndBuy.BuySection",
			numberOfSelectedItems = p1.purchaseSummary.count,
			totalNumberOfItems = #p1.displayItems
		}
	})
	local var2 = useLocalization(itemDisplayHelpersModule.PRICE_STATUS_LOCALIZATION_KEYS)
	local var3 = if fFlagProfileInspectAvatarBackgroundModule then useTokens().Padding.XLarge else nil
	local var4 = useLocalization(itemDisplayHelpersModule.ASSET_TYPE_LOCALIZATION_KEYS)
	local var5 = useLocalization(itemDisplayHelpersModule.BUNDLE_TYPE_LOCALIZATION_KEYS)
	local var6 = reactModule.useMemo(function()
		-- upvalues: var1 (ref), dashModule (copy), var4 (ref), var5 (ref)
		return {
			bundleParts = nil,
			bundle = var1.bundle,
			assetTypeNames = dashModule.join(var4, var5)
		}
	end, { var1.bundle, var4, var5 })
	local t = {}
	
	for i, v in p1.displayItems do
		local id = v.id
		t[`item_{id}`] = reactModule.createElement(catalogItemRowCardContainerModule, {
			rowHeight = 72,
			asset = v,
			index = i,
			isChecked = p1.selectedItems[id] == true,
			isPurchasable = isItemPurchasable(v),
			localizedStrings = var6,
			priceStatusLocalized = var2,
			onToggleItem = p1.onToggleItem,
			openItemDetails = p1.openItemDetails
		})
	end
	local t_1 = {
		Scrim = reactModule.createElement("TextButton", {
			Size = UDim2.new(1, -p1.cardWidth, 1, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Text = "",
			AutoButtonColor = false,
			Selectable = if fFlagSocialEnableProfileInspectAndBuyConsoleFocusNav then false else nil,
			[reactModule.Event.Activated] = p1.onDismiss
		}),
		Sheet = reactModule.createElement(view, {
			tag = "col position-top-right anchor-top-right margin-bottom-small padding-x-xlarge bg-surface-0",
			Size = UDim2.new(0, p1.cardWidth, 1, 0)
		}, {
			StatusBarSpacer = if p1.topOffset > 0 then reactModule.createElement(view, {
				tag = "bg-surface-0",
				LayoutOrder = 0,
				Size = UDim2.new(1, 0, 0, p1.topOffset)
			}) else nil,
			AvatarViewport = reactModule.createElement(view, {
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, p1.avatarViewportHeight)
			}, {
				BackgroundClipper = if fFlagProfileInspectAvatarBackgroundModule and p1.avatarBackgroundImage ~= nil then reactModule.createElement(view, {
					ClipsDescendants = true,
					ZIndex = 1,
					Size = UDim2.new(1, var3 * 2, 1, 0),
					Position = UDim2.new(0, -var3, 0, 0)
				}, {
					BackgroundImage = reactModule.createElement(image, {
						Size = UDim2.fromScale(1.35, 1.35),
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.fromScale(0.5, 0.5),
						Image = p1.avatarBackgroundImage,
						ScaleType = Enum.ScaleType.Crop
					})
				}) else nil,
				Background = reactModule.createElement(displayBackground, {
					height = p1.avatarViewportHeight,
					userId = tonumber(p1.profileId),
					userThumbnail = p1.avatarThumbnail
				}),
				TopBar = reactModule.createElement(view, {
					ZIndex = 2,
					tag = {
						["row align-y-center"] = fFlagProfileInspectAvatarBackgroundModule,
						["row align-y-center size-full-0 auto-y padding-small"] = not fFlagProfileInspectAvatarBackgroundModule
					},
					Size = if fFlagProfileInspectAvatarBackgroundModule then UDim2.new(1, 0, 0, 56) else nil,
					Position = if fFlagProfileInspectAvatarBackgroundModule then UDim2.new(0, 10 - var3, 0, 0) else nil
				}, {
					BackButtonCircle = if fFlagProfileInspectAvatarBackgroundModule then reactModule.createElement(view, {
						tag = "radius-circle bg-over-media-0",
						Size = UDim2.fromOffset(36, 36)
					}, {
						BackButton = reactModule.createElement(iconButton, {
							isCircular = true,
							icon = iconName.ChevronLargeLeft,
							size = iconSize.Small,
							variant = buttonVariant.Utility,
							onActivated = p1.onClose,
							AnchorPoint = Vector2.new(0.5, 0.5),
							Position = UDim2.fromScale(0.5, 0.5)
						})
					}) else nil,
					BackButton = if not fFlagProfileInspectAvatarBackgroundModule then reactModule.createElement(iconButton, {
						isCircular = true,
						icon = iconName.ChevronLargeLeft,
						size = iconSize.Medium,
						variant = buttonVariant.Utility,
						onActivated = p1.onClose
					}) else nil
				})
			}),
			Title = reactModule.createElement(text, {
				tag = "size-full-0 auto-y padding-y-small text-heading-small text-align-x-left",
				LayoutOrder = 2,
				Text = var1.title
			}),
			ScrollWrapper = reactModule.createElement(view, { tag = "fill size-full-0", LayoutOrder = 3 }, {
				ScrollContent = reactModule.createElement("ScrollingFrame", {
					ScrollBarThickness = 0,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.fromScale(1, 1),
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.new(0, 0, 0, 0)
				}, {
					ItemList = if not p1.isLoading then reactModule.createElement(view, {
						tag = "col gap-large size-full-0 auto-y padding-bottom-large padding-top-medium"
					}, t) else nil,
					LoadingShimmer = if p1.isLoading then reactModule.createElement(view, { tag = "col size-full-0 auto-y" }, (function()
						-- upvalues: reactModule (copy), skeleton (copy)
						local t = {}
						
						for i = 1, 4 do
							t[`Shimmer{i}`] = reactModule.createElement(skeleton, { Size = UDim2.new(1, 0, 0, 72), LayoutOrder = i })
						end
						return t
					end)()) else nil
				})
			}),
			FooterDivider = reactModule.createElement(divider, { LayoutOrder = 4, Size = UDim2.new(1, 0, 0, 1) }),
			Footer = reactModule.createElement(view, { tag = "size-full-2500 bg-surface-0", LayoutOrder = 5 }, {
				ActionBar = reactModule.createElement(buyActionBar, {
					priceLabel = {
						leftLabel = var1.buyHeader,
						priceInRobux = tostring(p1.purchaseSummary.totalPrice)
					},
					purchaseButtonProps = {
						purchaseButtonText = if fFlagProfileInspectAvatarBuyAllModule then var1.buyWholeLook else var1.buyItems,
						onPurchase = p1.onBuyAll,
						isDisabled = p1.isLoading or p1.purchaseSummary.count == 0,
						variant = buttonVariant.Emphasis
					}
				})
			})
		})
	}
	
	return if fFlagSocialEnableProfileInspectAndBuyConsoleFocusNav then reactModule.createElement(appFocusRoot, {
		isAutoFocusRoot = true,
		isIsolated = true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
		customEventHandlers = {
			[focusNavigationEventNameEnum.NavigateBack] = {
				handler = if fFlagSocialEnableProfileInspectAndBuyConsoleFocusNav then reactModule.useMemo(function()
					-- upvalues: inputHandlersModule (copy), p1 (ref)
					return inputHandlersModule.onRelease(function(p2)
						-- upvalues: p1 (copy)
						p2:cancel()
						p1.onClose()
					end)
				end, { p1.onClose }) else nil
			}
		}
	}, t_1) else reactModule.createElement(view, { Size = UDim2.fromScale(1, 1) }, t_1)
end