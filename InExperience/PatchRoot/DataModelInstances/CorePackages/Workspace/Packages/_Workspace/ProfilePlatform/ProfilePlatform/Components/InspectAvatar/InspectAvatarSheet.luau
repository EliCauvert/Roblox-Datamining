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
local FFlagProfileInspectAvatarBuyAllModule = require(ProfilePlatform.Flags.FFlagProfileInspectAvatarBuyAll)
local FFlagProfileInspectAvatarBackgroundModule = require(ProfilePlatform.Flags.FFlagProfileInspectAvatarBackground)
local View = FoundationModule.View
local Image = FoundationModule.Image
local Text = FoundationModule.Text
local IconButton = FoundationModule.IconButton
local Divider = FoundationModule.Divider
local Skeleton = FoundationModule.Skeleton
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local _ = require(ProfilePlatform.Common.Types)
local ItemDisplayHelpersModule = require(script.Parent.ItemDisplayHelpers)
local CatalogItemRowCardContainerModule = require(script.Parent.CatalogItemRowCardContainer)
local IsItemPurchasableFunction = require(script.Parent.InspectAvatarUtils).isItemPurchasable

return function(p1) --[[ Line: 78 | Named "InspectAvatarSheet" ]]
	-- upvalues: UseLocalizationFunction (copy), ItemDisplayHelpersModule (copy), FFlagProfileInspectAvatarBackgroundModule (copy), UseTokensFunction (copy), ReactModule (copy), DashModule (copy), CatalogItemRowCardContainerModule (copy), IsItemPurchasableFunction (copy), FFlagSocialEnableProfileInspectAndBuyConsoleFocusNav (copy), InputHandlersModule (copy), View (copy), Image (copy), DisplayBackground (copy), IconButton (copy), IconName (copy), IconSize (copy), ButtonVariant (copy), Text (copy), Skeleton (copy), Divider (copy), BuyActionBar (copy), FFlagProfileInspectAvatarBuyAllModule (copy), AppFocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy), FocusNavigationEventNameEnum (copy)
	local UseLocalizationResult = UseLocalizationFunction({
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
	local UseLocalizationResult1 = UseLocalizationFunction(ItemDisplayHelpersModule.PRICE_STATUS_LOCALIZATION_KEYS)
	local XLarge = if FFlagProfileInspectAvatarBackgroundModule then UseTokensFunction().Padding.XLarge else nil
	local UseLocalizationResult2 = UseLocalizationFunction(ItemDisplayHelpersModule.ASSET_TYPE_LOCALIZATION_KEYS)
	local UseLocalizationResult3 = UseLocalizationFunction(ItemDisplayHelpersModule.BUNDLE_TYPE_LOCALIZATION_KEYS)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 98 ]]
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
	local UseMemoResult1 = if FFlagSocialEnableProfileInspectAndBuyConsoleFocusNav then ReactModule.useMemo(function() --[[ Line: 125 ]]
		-- upvalues: InputHandlersModule (upval), p1 (copy)
		return InputHandlersModule.onRelease(function(p2) --[[ Line: 126 ]]
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
		})
	}
	local CreateElementFunction3 = ReactModule.createElement
	local config1 = {
		tag = "col position-top-right anchor-top-right margin-bottom-small padding-x-xlarge bg-surface-0",
		Size = UDim2.new(0, p1.cardWidth, 1, 0)
	}
	local config2 = {
		StatusBarSpacer = if p1.topOffset > 0 then ReactModule.createElement(View, {
			tag = "bg-surface-0",
			LayoutOrder = 0,
			Size = UDim2.new(1, 0, 0, p1.topOffset)
		}) else nil,
		AvatarViewport = ReactModule.createElement(View, {
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, p1.avatarViewportHeight)
		}, {
			BackgroundClipper = if FFlagProfileInspectAvatarBackgroundModule and p1.avatarBackgroundImage ~= nil then ReactModule.createElement(View, {
				ClipsDescendants = true,
				ZIndex = 1,
				Size = UDim2.new(1, XLarge * 2, 1, 0),
				Position = UDim2.new(0, -XLarge, 0, 0)
			}, {
				BackgroundImage = ReactModule.createElement(Image, {
					Size = UDim2.fromScale(1.35, 1.35),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					Image = p1.avatarBackgroundImage,
					ScaleType = Enum.ScaleType.Crop
				})
			}) else nil,
			Background = ReactModule.createElement(DisplayBackground, {
				height = p1.avatarViewportHeight,
				userId = tonumber(p1.profileId),
				userThumbnail = p1.avatarThumbnail
			}),
			TopBar = ReactModule.createElement(View, {
				ZIndex = 2,
				tag = {
					["row align-y-center"] = FFlagProfileInspectAvatarBackgroundModule,
					["row align-y-center size-full-0 auto-y padding-small"] = not FFlagProfileInspectAvatarBackgroundModule
				},
				Size = if FFlagProfileInspectAvatarBackgroundModule then UDim2.new(1, 0, 0, 56) else nil,
				Position = if FFlagProfileInspectAvatarBackgroundModule then UDim2.new(0, 10 - XLarge, 0, 0) else nil
			}, {
				BackButtonCircle = if FFlagProfileInspectAvatarBackgroundModule then ReactModule.createElement(View, {
					tag = "radius-circle bg-over-media-0",
					Size = UDim2.fromOffset(36, 36)
				}, {
					BackButton = ReactModule.createElement(IconButton, {
						isCircular = true,
						icon = IconName.ChevronLargeLeft,
						size = IconSize.Small,
						variant = ButtonVariant.Utility,
						onActivated = p1.onClose,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.fromScale(0.5, 0.5)
					})
				}) else nil,
				BackButton = if FFlagProfileInspectAvatarBackgroundModule then nil else ReactModule.createElement(IconButton, {
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
		})
	}
	local CreateElementFunction2 = ReactModule.createElement
	local config3 = { tag = "fill size-full-0", LayoutOrder = 3 }
	local t = {}
	local CreateElementFunction1 = ReactModule.createElement
	local v1 = "ScrollingFrame"
	local config4 = {
		ScrollBarThickness = 0,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 1),
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		CanvasSize = UDim2.new(0, 0, 0, 0)
	}
	local config5 = {
		ItemList = if p1.isLoading then nil else ReactModule.createElement(View, {
			tag = "col gap-large size-full-0 auto-y padding-bottom-large padding-top-medium"
		}, Elements)
	}
	local Element = nil
	
	if p1.isLoading then
		local CreateElementFunction = ReactModule.createElement
		local config6 = { tag = "col size-full-0 auto-y" }
		local Elements1 = {}
		
		for i = 1, 4 do
			Elements1[`Shimmer{i}`] = ReactModule.createElement(Skeleton, { Size = UDim2.new(1, 0, 0, 72), LayoutOrder = i })
		end
		Element = CreateElementFunction(View, config6, Elements1)
	else
		Element = nil
	end
	config5.LoadingShimmer = Element
	t.ScrollContent = CreateElementFunction1(v1, config4, config5)
	config2.ScrollWrapper = CreateElementFunction2(View, config3, t)
	config2.FooterDivider = ReactModule.createElement(Divider, { LayoutOrder = 4, Size = UDim2.new(1, 0, 0, 1) })
	config2.Footer = ReactModule.createElement(View, { tag = "size-full-2500 bg-surface-0", LayoutOrder = 5 }, {
		ActionBar = ReactModule.createElement(BuyActionBar, {
			priceLabel = {
				leftLabel = UseLocalizationResult.buyHeader,
				priceInRobux = tostring(p1.purchaseSummary.totalPrice)
			},
			purchaseButtonProps = {
				purchaseButtonText = if FFlagProfileInspectAvatarBuyAllModule then UseLocalizationResult.buyWholeLook else UseLocalizationResult.buyItems,
				onPurchase = p1.onBuyAll,
				isDisabled = p1.isLoading or p1.purchaseSummary.count == 0,
				variant = ButtonVariant.Emphasis
			}
		})
	})
	config.Sheet = CreateElementFunction3(View, config1, config2)
	
	return if FFlagSocialEnableProfileInspectAndBuyConsoleFocusNav then ReactModule.createElement(AppFocusRoot, {
		isAutoFocusRoot = true,
		isIsolated = true,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
		customEventHandlers = {
			[FocusNavigationEventNameEnum.NavigateBack] = { handler = UseMemoResult1 }
		}
	}, config) else ReactModule.createElement(View, { Size = UDim2.fromScale(1, 1) }, config)
end