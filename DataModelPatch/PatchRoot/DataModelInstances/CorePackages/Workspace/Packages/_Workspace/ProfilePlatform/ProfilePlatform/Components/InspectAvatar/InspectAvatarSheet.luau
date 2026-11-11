local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local DisplayBackground = require(Parent.EditProfileBackground).DisplayBackground
local BuyActionBar = require(Parent.AvatarExperienceInspectAndBuy).Components.BuyActionBar
local DashModule = require(Parent.Dash)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local AppFocusRoot = FocusNavigationUtilsModule.AppFocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local InputHandlersModule = require(Parent.InputHandlers)
local FFlagSocialEnableProfileInspectAndBuyConsoleFocusNav = require(Parent.SharedFlags).FFlagSocialEnableProfileInspectAndBuyConsoleFocusNav
local View = FoundationModule.View
local Text = FoundationModule.Text
local IconButton = FoundationModule.IconButton
local Divider = FoundationModule.Divider
local Skeleton = FoundationModule.Skeleton
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local _ = require(ProfilePlatform.Common.Types)
local ItemDisplayHelpersModule = require(script.Parent.ItemDisplayHelpers)
local CatalogItemRowCardContainerModule = require(script.Parent.CatalogItemRowCardContainer)
local IsItemPurchasableFunction = require(script.Parent.InspectAvatarUtils).isItemPurchasable

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), ItemDisplayHelpersModule (copy), ReactModule (copy), DashModule (copy), CatalogItemRowCardContainerModule (copy), IsItemPurchasableFunction (copy), FFlagSocialEnableProfileInspectAndBuyConsoleFocusNav (copy), InputHandlersModule (copy), View (copy), DisplayBackground (copy), IconButton (copy), IconName (copy), IconSize (copy), ButtonVariant (copy), Text (copy), Skeleton (copy), Divider (copy), BuyActionBar (copy), AppFocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy), FocusNavigationEventNameEnum (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		buyItems = "Feature.Catalog.Label.BuyItems",
		bundle = "Feature.Catalog.Label.Bundle",
		insufficientRobux = "Feature.Profile.Heading.InsufficientFunds",
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
	local UseLocalizationResult1 = UseLocalizationFunction(ItemDisplayHelpersModule.PRICE_STATUS_LOCALIZATION_KEYS)
	local UseLocalizationResult2 = UseLocalizationFunction(ItemDisplayHelpersModule.ASSET_TYPE_LOCALIZATION_KEYS)
	local UseLocalizationResult3 = UseLocalizationFunction(ItemDisplayHelpersModule.BUNDLE_TYPE_LOCALIZATION_KEYS)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseLocalizationResult (copy), DashModule (upval), UseLocalizationResult2 (copy), UseLocalizationResult3 (copy)
		return {
			bundleParts = nil,
			bundle = UseLocalizationResult.bundle,
			assetTypeNames = DashModule.join(UseLocalizationResult2, UseLocalizationResult3)
		}
	end, {
		UseLocalizationResult.bundle,
		UseLocalizationResult2,
		UseLocalizationResult3
	})
	local Elements = {}
	
	for Index, displayItem in p1.displayItems do
		local Id = displayItem.id
		Elements[`item_{Id}`] = ReactModule.createElement(CatalogItemRowCardContainerModule, {
			rowHeight = 72,
			asset = displayItem,
			index = Index,
			isChecked = p1.selectedItems[Id] == true,
			isPurchasable = IsItemPurchasableFunction(displayItem),
			localizedStrings = UseMemoResult,
			priceStatusLocalized = UseLocalizationResult1,
			onToggleItem = p1.onToggleItem,
			openItemDetails = p1.openItemDetails
		})
	end
	local UseMemoResult1 = if FFlagSocialEnableProfileInspectAndBuyConsoleFocusNav then ReactModule.useMemo(function()
		-- upvalues: InputHandlersModule (upval), p1 (copy)
		return InputHandlersModule.onRelease(function(p2)
			-- upvalues: p1 (upval)
			p2:cancel()
			p1.onClose()
		end)
	end, { p1.onClose }) else nil
	local config = {
		Scrim = ReactModule.createElement("TextButton", {
			Size = UDim2.new(1, -p1.cardWidth, 1, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Text = "",
			AutoButtonColor = false,
			Selectable = not FFlagSocialEnableProfileInspectAndBuyConsoleFocusNav and nil,
			[ReactModule.Event.Activated] = p1.onDismiss
		}),
		Sheet = ReactModule.createElement(View, {
			tag = "col position-top-right anchor-top-right margin-bottom-small padding-x-xlarge bg-surface-0",
			Size = UDim2.new(0, p1.cardWidth, 1, 0)
		}, {
			StatusBarSpacer = if p1.topOffset > 0 then ReactModule.createElement(View, {
				tag = "bg-surface-0",
				LayoutOrder = 0,
				Size = UDim2.new(1, 0, 0, p1.topOffset)
			}) else nil,
			AvatarViewport = ReactModule.createElement(View, {
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, p1.avatarViewportHeight)
			}, {
				Background = ReactModule.createElement(DisplayBackground, {
					height = p1.avatarViewportHeight,
					userId = tonumber(p1.profileId),
					userThumbnail = p1.avatarThumbnail
				}),
				TopBar = ReactModule.createElement(View, {
					tag = "row align-y-center size-full-0 auto-y padding-small",
					ZIndex = 2
				}, {
					BackButton = ReactModule.createElement(IconButton, {
						isCircular = true,
						icon = IconName.ChevronLargeLeft,
						size = IconSize.Medium,
						variant = ButtonVariant.Utility,
						onActivated = p1.onClose
					})
				})
			}),
			Title = ReactModule.createElement(Text, {
				tag = "size-full-0 auto-y padding-y-small text-heading-small text-align-x-left",
				LayoutOrder = 2,
				Text = UseLocalizationResult.title
			}),
			ScrollWrapper = ReactModule.createElement(View, { tag = "fill size-full-0", LayoutOrder = 3 }, {
				ScrollContent = ReactModule.createElement("ScrollingFrame", {
					ScrollBarThickness = 0,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.fromScale(1, 1),
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.new(0, 0, 0, 0)
				}, {
					ItemList = if p1.isLoading then nil else ReactModule.createElement(View, {
						tag = "col gap-large size-full-0 auto-y padding-bottom-large padding-top-medium"
					}, Elements),
					LoadingShimmer = if p1.isLoading then ReactModule.createElement(View, { tag = "col size-full-0 auto-y" }, ((function()
						-- upvalues: ReactModule (upval), Skeleton (upval)
						local Elements = {}
						
						for i = 1, 4 do
							Elements[`Shimmer{i}`] = ReactModule.createElement(Skeleton, { Size = UDim2.new(1, 0, 0, 72), LayoutOrder = i })
						end
						return Elements
					end)())) else nil
				})
			}),
			FooterDivider = ReactModule.createElement(Divider, { LayoutOrder = 4, Size = UDim2.new(1, 0, 0, 1) }),
			Footer = ReactModule.createElement(View, { tag = "size-full-2500 bg-surface-0", LayoutOrder = 5 }, {
				ActionBar = ReactModule.createElement(BuyActionBar, {
					priceLabel = {
						leftLabel = UseLocalizationResult.buyHeader,
						priceInRobux = tostring(p1.purchaseSummary.totalPrice)
					},
					purchaseButtonProps = {
						purchaseButtonText = if p1.hasInsufficientFunds then UseLocalizationResult.insufficientRobux else UseLocalizationResult.buyItems,
						onPurchase = p1.onBuyAll,
						isDisabled = p1.isLoading or (p1.purchaseSummary.count == 0 or p1.hasInsufficientFunds == true),
						variant = ButtonVariant.Emphasis
					}
				})
			})
		})
	}
	
	return if FFlagSocialEnableProfileInspectAndBuyConsoleFocusNav then ReactModule.createElement(AppFocusRoot, {
		isAutoFocusRoot = true,
		isIsolated = true,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
		customEventHandlers = {
			[FocusNavigationEventNameEnum.NavigateBack] = { handler = UseMemoResult1 }
		}
	}, config) else ReactModule.createElement(View, { Size = UDim2.fromScale(1, 1) }, config)
end