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
local view = foundationModule.View
local text = foundationModule.Text
local iconButton = foundationModule.IconButton
local divider = foundationModule.Divider
local skeleton = foundationModule.Skeleton
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local buttonVariant = foundationModule.Enums.ButtonVariant
local useLocalization = require(parent.Localization).Hooks.useLocalization
local _ = require(profilePlatform.Common.Types)
local itemDisplayHelpersModule = require(script.Parent.ItemDisplayHelpers)
local catalogItemRowCardContainerModule = require(script.Parent.CatalogItemRowCardContainer)
local isItemPurchasable = require(script.Parent.InspectAvatarUtils).isItemPurchasable

return function(p0) --[[ line: 69 | named "InspectAvatarSheet" ]]
	-- upvalues: useLocalization (ref), itemDisplayHelpersModule (ref), reactModule (ref), dashModule (ref), catalogItemRowCardContainerModule (ref), isItemPurchasable (ref), fFlagSocialEnableProfileInspectAndBuyConsoleFocusNav (ref), inputHandlersModule (ref), view (ref), displayBackground (ref), iconButton (ref), iconName (ref), iconSize (ref), buttonVariant (ref), text (ref), skeleton (ref), divider (ref), buyActionBar (ref), fFlagProfileInspectAvatarBuyAllModule (ref), appFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), focusNavigationEventNameEnum (ref)
	local var9 = useLocalization({
		buyItems = "Feature.Catalog.Label.BuyItems",
		buyWholeLook = "Feature.Profile.Header.BuyWholeLook",
		bundle = "Feature.Catalog.Label.Bundle",
		title = {
			"Feature.Profile.Header.InspectAndBuy",
			username = p0.username
		},
		buyHeader = {
			"Feature.Profile.Header.InspectAndBuy.BuySection",
			numberOfSelectedItems = p0.purchaseSummary.count,
			totalNumberOfItems = #p0.displayItems
		}
	})
	local var10 = useLocalization(itemDisplayHelpersModule.PRICE_STATUS_LOCALIZATION_KEYS)
	local var11 = useLocalization(itemDisplayHelpersModule.ASSET_TYPE_LOCALIZATION_KEYS)
	local var12 = useLocalization(itemDisplayHelpersModule.BUNDLE_TYPE_LOCALIZATION_KEYS)
	local var13 = reactModule.useMemo(function() --[[ line: 87 ]]
		-- upvalues: var9 (ref), dashModule (copy), var11 (ref), var12 (ref)
		return {
			bundleParts = nil,
			bundle = var9.bundle,
			assetTypeNames = dashModule.join(var11, var12)
		}
	end, { var9.bundle, var11, var12 })
	local t = {}
	
	for i, v in p0.displayItems do
		local id = v.id
		t[`item_{id}`] = reactModule.createElement(catalogItemRowCardContainerModule, {
			rowHeight = 72,
			asset = v,
			index = i,
			isChecked = p0.selectedItems[id] == true,
			isPurchasable = isItemPurchasable(v),
			localizedStrings = var13,
			priceStatusLocalized = var10,
			onToggleItem = p0.onToggleItem,
			openItemDetails = p0.openItemDetails
		})
	end
	local t_1 = {
		Scrim = reactModule.createElement("TextButton", {
			Size = UDim2.new(1, -p0.cardWidth, 1, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Text = "",
			AutoButtonColor = false,
			Selectable = if fFlagSocialEnableProfileInspectAndBuyConsoleFocusNav then false else nil,
			[reactModule.Event.Activated] = p0.onDismiss
		}),
		Sheet = reactModule.createElement(view, {
			tag = "col position-top-right anchor-top-right margin-bottom-small padding-x-xlarge bg-surface-0",
			Size = UDim2.new(0, p0.cardWidth, 1, 0)
		}, {
			StatusBarSpacer = if p0.topOffset > 0 then reactModule.createElement(view, {
				tag = "bg-surface-0",
				LayoutOrder = 0,
				Size = UDim2.new(1, 0, 0, p0.topOffset)
			}) else nil,
			AvatarViewport = reactModule.createElement(view, {
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, p0.avatarViewportHeight)
			}, {
				Background = reactModule.createElement(displayBackground, {
					height = p0.avatarViewportHeight,
					userId = tonumber(p0.profileId),
					userThumbnail = p0.avatarThumbnail
				}),
				TopBar = reactModule.createElement(view, {
					tag = "row align-y-center size-full-0 auto-y padding-small",
					ZIndex = 2
				}, {
					BackButton = reactModule.createElement(iconButton, {
						isCircular = true,
						icon = iconName.ChevronLargeLeft,
						size = iconSize.Medium,
						variant = buttonVariant.Utility,
						onActivated = p0.onClose
					})
				})
			}),
			Title = reactModule.createElement(text, {
				tag = "size-full-0 auto-y padding-y-small text-heading-small text-align-x-left",
				LayoutOrder = 2,
				Text = var9.title
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
					ItemList = if not p0.isLoading then reactModule.createElement(view, {
						tag = "col gap-large size-full-0 auto-y padding-bottom-large padding-top-medium"
					}, t) else nil,
					LoadingShimmer = if p0.isLoading then reactModule.createElement(view, { tag = "col size-full-0 auto-y" }, (function() --[[ line: 193 ]]
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
						leftLabel = var9.buyHeader,
						priceInRobux = tostring(p0.purchaseSummary.totalPrice)
					},
					purchaseButtonProps = {
						purchaseButtonText = if fFlagProfileInspectAvatarBuyAllModule then var9.buyWholeLook else var9.buyItems,
						onPurchase = p0.onBuyAll,
						isDisabled = p0.isLoading or p0.purchaseSummary.count == 0,
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
				handler = if fFlagSocialEnableProfileInspectAndBuyConsoleFocusNav then reactModule.useMemo(function() --[[ line: 114 ]]
					-- upvalues: inputHandlersModule (copy), p0 (ref)
					return inputHandlersModule.onRelease(function(p1) --[[ line: 115 ]]
						-- upvalues: p0 (copy)
						p1:cancel()
						p0.onClose()
					end)
				end, { p0.onClose }) else nil
			}
		}
	}, t_1) else reactModule.createElement(view, { Size = UDim2.fromScale(1, 1) }, t_1)
end