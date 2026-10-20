local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ResponsiveModule = require(Parent.Responsive)
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local TutilsModule = require(Parent.tutils)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local RobloxSubscriptionPurchaseAppModule = require(Parent.RobloxSubscriptionPurchaseApp)
local BlackbirdUpsellBanner = RobloxSubscriptionPurchaseAppModule.Components.BlackbirdUpsellBanner
local SurfaceName = RobloxSubscriptionPurchaseAppModule.SurfaceName
local SurfaceContext = RobloxSubscriptionPurchaseAppModule.SurfaceContext
local Constants = require(Parent.AvatarExperienceCommon).Constants
local CheckoutPageHeaderModule = require(AvatarExperienceCatalog.Components.Checkout.CheckoutPageHeader)
local CheckoutPageBodyModule = require(AvatarExperienceCatalog.Components.Checkout.CheckoutPageBody)
local CheckoutBuyButtonModule = require(AvatarExperienceCatalog.Components.Checkout.CheckoutBuyButton)
local CheckoutTotalLinesModule = require(AvatarExperienceCatalog.Components.Checkout.CheckoutTotalLines)
local CheckoutUnavailableButtonModule = require(AvatarExperienceCatalog.Components.Checkout.CheckoutUnavailableButton)
local _ = require(AvatarExperienceCatalog.Api.PostCartPricingForOffers.CartPricingForOffersTypes)
local FFlagAXMISWithBlackbird = require(Parent.SharedFlags).FFlagAXMISWithBlackbird
local FFlagAXEnableExpiredUserLookCheckout = AvatarExperienceFlagsModule.FFlagAXEnableExpiredUserLookCheckout
local FFlagAXMISSmallUIChanges = AvatarExperienceFlagsModule.FFlagAXMISSmallUIChanges
local FFlagAXMISWithOffers = AvatarExperienceFlagsModule.FFlagAXMISWithOffers
local FFlagAXDurables2Option = AvatarExperienceFlagsModule.FFlagAXDurables2Option

local function selectDeviceOrientation(p1)
	return p1.DeviceOrientation
end

local function selectStatusBarHeight(p1)
	return if p1 and p1.TopBar and p1.TopBar.statusBarHeight then p1.TopBar.statusBarHeight else 0
end

local function OnActivated()
	-- upvalues: RobloxSubscriptionPurchaseAppModule (copy), SurfaceName (copy), SurfaceContext (copy)
	RobloxSubscriptionPurchaseAppModule.initiateRobloxSubscriptionPurchase({ showBackButton = true }, { onFlowComplete = function(_) end }, nil, SurfaceName.CatalogMultiItemCheckoutPage, SurfaceContext.InApp, nil, nil)
end

return ReactModule.memo(function(p1)
	-- upvalues: Parent (copy), FoundationModule (copy), UseSelectorFunction (copy), selectDeviceOrientation (copy), ResponsiveModule (copy), selectStatusBarHeight (copy), UseLocalizationFunction (copy), FFlagAXMISWithOffers (copy), ReactModule (copy), Constants (copy), FFlagAXMISWithBlackbird (copy), CheckoutPageHeaderModule (copy), CheckoutPageBodyModule (copy), FFlagAXEnableExpiredUserLookCheckout (copy), FFlagAXDurables2Option (copy), CryoModule (copy), CheckoutTotalLinesModule (copy), TutilsModule (copy), FFlagAXMISSmallUIChanges (copy), CheckoutBuyButtonModule (copy), CheckoutUnavailableButtonModule (copy), BlackbirdUpsellBanner (copy), OnActivated (copy)
	local IAPExperienceModule = require(Parent.IAPExperience)
	local PurchasePromptModule = require(Parent.PurchasePrompt)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local IsUseSelectorResultMatch = UseSelectorFunction(selectDeviceOrientation) == ResponsiveModule.Keys.Portrait
	local UseSelectorResult = UseSelectorFunction(selectStatusBarHeight)
	local UseLocalizationResult = UseLocalizationFunction({
		buyLabel = "Feature.Catalog.Action.Buy",
		wearAfterPurchaseLabel = "Feature.Catalog.Checkout.WearAfterPurchase",
		addToMyAvatarsLabel = "Feature.Avatar.Label.Title.AddToMyAvatars",
		addToMyMakeupLooksLabel = "Feature.Avatar.Label.Title.AddToMyMakeupLooks",
		saveOptionsLabel = if FFlagAXMISWithOffers then "Feature.Catalog.Label.SaveOptions" else nil
	})
	local UseMemoResult = ReactModule.useMemo(function(): boolean
		-- upvalues: p1 (copy), Constants (upval)
		for _, cartItem in p1.cartItems do
			if not Constants.MAKEUP_LOOK_ASSET_TYPES[cartItem.itemSubType] then
				return true
			end
		end
		return false
	end, { p1.cartItems })
	local _UDim2: UDim2 = if IsUseSelectorResultMatch then UDim2.fromScale(1, 1) else UDim2.fromScale(Constants.LANDSCAPE_SCENE_WIDTH_PERCENTAGE, 1)
	local _UDim2_1: UDim2 = if IsUseSelectorResultMatch then UDim2.fromScale(0, 0) else UDim2.fromScale(Constants.LANDSCAPE_UI_WIDTH_PERCENTAGE, 0)
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: FFlagAXMISWithOffers (upval), p1 (copy), ReactModule (upval), FoundationModule (upval), UseTokensResult (copy)
		if not FFlagAXMISWithOffers then
			return nil
		end
		local TextButtons = {}
		
		if p1.offersAvailable then
			for i, value in p1.offersAvailable do
				TextButtons["Offer_" .. i] = ReactModule.createElement("TextButton", {
					Text = "",
					AutomaticSize = Enum.AutomaticSize.XY,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Selectable = false,
					LayoutOrder = 0,
					[ReactModule.Event.Activated] = function()
						-- upvalues: p1 (upval), i (copy)
						if p1.handleDeselectOfferId then
							p1.handleDeselectOfferId(i)
						end
					end
				}, {
					Content = ReactModule.createElement(FoundationModule.View, {
						tag = "row gap-medium auto-xy align-y-center",
						Position = UDim2.fromOffset(UseTokensResult.Stroke.Standard, 0)
					}, {
						Checkbox = ReactModule.createElement(FoundationModule.Checkbox, {
							label = "",
							LayoutOrder = 1,
							isChecked = value.selected,
							onActivated = function()
								-- upvalues: p1 (upval), i (copy)
								if p1.handleDeselectOfferId then
									p1.handleDeselectOfferId(i)
								end
							end,
							size = FoundationModule.Enums.InputSize.Small
						}),
						Label = ReactModule.createElement(FoundationModule.Text, {
							RichText = true,
							tag = "text-body-small content-default auto-xy",
							LayoutOrder = 2,
							Text = "<b>" .. value.localizedDescription .. "</b>"
						})
					})
				})
			end
		end
		return TextButtons
	end, { p1.offersAvailable, p1.handleDeselectOfferId })
	
	if FFlagAXMISWithBlackbird then
		local BlackbirdUpsellBannerProductInfo = PurchasePromptModule.Utils.getBlackbirdUpsellBannerProductInfo(p1.robloxSubscriptionProducts)
		
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			Transparency = 1,
			Active = true,
			SelectionGroup = true,
			BackgroundColor3 = UseTokensResult.Color.Surface.Surface_0.Color3,
			Size = _UDim2,
			Position = _UDim2_1,
			Visible = p1.isVisible,
			SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
			SelectionBehaviorDown = Enum.SelectionBehavior.Stop
		}, {
			UIPadding = ReactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, UseSelectorResult) }),
			ListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			CheckoutPageHeader = ReactModule.createElement(FoundationModule.View, {
				tag = "size-full-0 auto-y",
				LayoutOrder = 1,
				testId = "CheckoutPageHeaderContainer",
				isDisabled = not p1.isVisible
			}, {
				Header = ReactModule.createElement(CheckoutPageHeaderModule)
			}),
			CheckoutPageBodyScrollView = ReactModule.createElement(FoundationModule.ScrollView, {
				LayoutOrder = 2,
				isDisabled = p1.isPurchasing,
				scroll = {
					scrollBarVisibility = FoundationModule.Enums.Visibility.None,
					ScrollingDirection = Enum.ScrollingDirection.Y,
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.fromScale(0, 1)
				},
				flexItem = { FlexMode = Enum.UIFlexMode.Fill },
				Size = UDim2.fromScale(1, 1),
				selection = { Selectable = false }
			}, {
				ListLayout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				CheckoutPageBody = ReactModule.createElement(FoundationModule.View, { tag = "size-full-0 auto-y", LayoutOrder = 1 }, {
					Body = ReactModule.createElement(CheckoutPageBodyModule, {
						cartItems = p1.cartItems,
						erroredItemCount = p1.erroredItemCount
					})
				}),
				CheckoutPageBuyOptions = if FFlagAXEnableExpiredUserLookCheckout and p1.hideBuyOptions then ReactModule.createElement(FoundationModule.View, {
					LayoutOrder = 3,
					tag = if FFlagAXDurables2Option then "col gap-medium size-full-0 auto-y padding-x-xxlarge padding-bottom-medium" else "col gap-medium size-full-0 auto-y padding-x-xxlarge padding-bottom-medium padding-top-xxlarge"
				}, {
					OfferCheckboxes = if FFlagAXMISWithOffers and UseMemoResult1 and #CryoModule.Dictionary.keys(UseMemoResult1) > 0 then ReactModule.createElement(ReactModule.Fragment, nil, UseMemoResult1) else nil
				}) else ReactModule.createElement(FoundationModule.View, {
					LayoutOrder = 3,
					tag = if FFlagAXDurables2Option then "col gap-medium size-full-0 auto-y padding-x-xxlarge padding-bottom-medium" else "col gap-medium size-full-0 auto-y padding-x-xxlarge padding-bottom-medium padding-top-xxlarge"
				}, {
					OfferCheckboxes = if FFlagAXMISWithOffers and UseMemoResult1 and #CryoModule.Dictionary.keys(UseMemoResult1) > 0 then ReactModule.createElement(ReactModule.Fragment, nil, UseMemoResult1) else nil,
					CheckoutPageWearAfterPurchase = if FFlagAXMISWithOffers then nil else ReactModule.createElement(FoundationModule.Checkbox, {
						LayoutOrder = 1,
						label = UseLocalizationResult.wearAfterPurchaseLabel,
						size = FoundationModule.Enums.InputSize.Small,
						isChecked = p1.isWearAfterPurchaseChecked,
						onActivated = p1.onWearAfterPurchaseToggle,
						isDisabled = p1.isPurchasing
					}),
					AddToMyAvatars = if FFlagAXMISWithOffers then nil else ReactModule.createElement(FoundationModule.Checkbox, {
						LayoutOrder = 2,
						label = if UseMemoResult then UseLocalizationResult.addToMyAvatarsLabel else UseLocalizationResult.addToMyMakeupLooksLabel,
						size = FoundationModule.Enums.InputSize.Small,
						isChecked = p1.isAddToMyAvatarsChecked,
						onActivated = p1.onAddToMyAvatarsToggle,
						isDisabled = p1.isPurchasing
					}),
					SaveOptions = if FFlagAXMISWithOffers then ReactModule.createElement(FoundationModule.View, {
						tag = "row align-y-center auto-xy",
						LayoutOrder = 1,
						onActivated = p1.onSaveOptionsOpenToggle,
						stateLayer = {
							affordance = FoundationModule.Enums.StateLayerAffordance.None
						}
					}, {
						Label = ReactModule.createElement(FoundationModule.Text, {
							tag = "auto-xy text-body-small",
							LayoutOrder = 1,
							Text = UseLocalizationResult.saveOptionsLabel
						}),
						Chevron = ReactModule.createElement(FoundationModule.Icon, {
							LayoutOrder = 2,
							name = if p1.isSaveOptionsOpen then FoundationModule.Enums.IconName.ChevronSmallUp else FoundationModule.Enums.IconName.ChevronSmallDown,
							size = FoundationModule.Enums.IconSize.Medium
						})
					}) else nil,
					WearAfterPurchaseCheckbox = if FFlagAXMISWithOffers and p1.isSaveOptionsOpen then ReactModule.createElement(FoundationModule.Checkbox, {
						LayoutOrder = 2,
						label = UseLocalizationResult.wearAfterPurchaseLabel,
						size = FoundationModule.Enums.InputSize.Small,
						isChecked = p1.isWearAfterPurchaseChecked,
						onActivated = p1.onWearAfterPurchaseToggle,
						isDisabled = p1.isPurchasing
					}) else nil,
					AddToMyAvatarsCheckbox = if FFlagAXMISWithOffers and p1.isSaveOptionsOpen then ReactModule.createElement(FoundationModule.Checkbox, {
						LayoutOrder = 3,
						label = if UseMemoResult then UseLocalizationResult.addToMyAvatarsLabel else UseLocalizationResult.addToMyMakeupLooksLabel,
						size = FoundationModule.Enums.InputSize.Small,
						isChecked = p1.isAddToMyAvatarsChecked,
						onActivated = p1.onAddToMyAvatarsToggle,
						isDisabled = p1.isPurchasing
					}) else nil
				})
			}),
			CheckoutPageBuySection = ReactModule.createElement(FoundationModule.View, {
				tag = "col gap-medium size-full-0 auto-y padding-x-xxlarge padding-bottom-xxlarge padding-top-medium",
				LayoutOrder = 4,
				isDisabled = p1.isPurchasing
			}, {
				CheckoutTotalLines = ReactModule.createElement(CheckoutTotalLinesModule, {
					userRobuxBalance = 0,
					itemCount = TutilsModule.fieldCount(p1.cartItems),
					totalPrice = p1.purchasableItemsTotalPriceInRobux,
					totalOriginalPrice = p1.purchasableItemsTotalOriginalPriceInRobux,
					LayoutOrder = if FFlagAXMISSmallUIChanges then 2 else 1
				}),
				DiscountSummary = if p1.discountSummaryProps then ReactModule.createElement(FoundationModule.View, {
					tag = "size-full-0 auto-y",
					LayoutOrder = if FFlagAXMISSmallUIChanges then 1 else 2
				}, {
					Content = ReactModule.createElement(IAPExperienceModule.DiscountSummary, p1.discountSummaryProps)
				}) else nil,
				CheckoutBuyButton = if p1.canPurchase then ReactModule.createElement(CheckoutBuyButtonModule, {
					LayoutOrder = 3,
					onCheckoutButtonActivated = p1.onCheckoutButtonActivated,
					isPurchasing = p1.isPurchasing,
					label = UseLocalizationResult.buyLabel
				}) else ReactModule.createElement(CheckoutUnavailableButtonModule, {
					LayoutOrder = 3,
					onActivated = p1.onUnavailableButtonActivated,
					label = UseLocalizationResult.buyLabel
				}),
				BlackbirdUpsellBanner = if p1.shouldShowBlackbirdUpsellBanner and BlackbirdUpsellBannerProductInfo then ReactModule.createElement(BlackbirdUpsellBanner, {
					LayoutOrder = 4,
					productInfo = BlackbirdUpsellBannerProductInfo,
					onActivated = OnActivated
				}) else nil
			})
		})
	else
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			Transparency = 1,
			Active = true,
			SelectionGroup = true,
			BackgroundColor3 = UseTokensResult.Color.Surface.Surface_0.Color3,
			Size = _UDim2,
			Position = _UDim2_1,
			Visible = p1.isVisible,
			SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
			SelectionBehaviorDown = Enum.SelectionBehavior.Stop
		}, {
			UIPadding = ReactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, UseSelectorResult) }),
			ListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			CheckoutPageHeader = ReactModule.createElement(FoundationModule.View, {
				tag = "size-full-0 auto-y",
				LayoutOrder = 1,
				testId = "CheckoutPageHeaderContainer",
				isDisabled = not p1.isVisible
			}, {
				Header = ReactModule.createElement(CheckoutPageHeaderModule)
			}),
			CheckoutPageBodyScrollView = ReactModule.createElement(FoundationModule.ScrollView, {
				LayoutOrder = 2,
				isDisabled = p1.isPurchasing,
				scroll = {
					scrollBarVisibility = FoundationModule.Enums.Visibility.None,
					ScrollingDirection = Enum.ScrollingDirection.Y,
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.fromScale(0, 1)
				},
				flexItem = { FlexMode = Enum.UIFlexMode.Fill },
				Size = UDim2.fromScale(1, 1),
				selection = { Selectable = false }
			}, {
				CheckoutPageBody = ReactModule.createElement(CheckoutPageBodyModule, {
					cartItems = p1.cartItems,
					erroredItemCount = p1.erroredItemCount
				})
			}),
			CheckoutPageBuyOptions = if FFlagAXEnableExpiredUserLookCheckout and p1.hideBuyOptions then nil else ReactModule.createElement(FoundationModule.View, {
				tag = "size-full-0 auto-y col gap-medium padding-x-xxlarge padding-y-medium",
				LayoutOrder = 3
			}, {
				CheckoutPageWearAfterPurchase = ReactModule.createElement(FoundationModule.Checkbox, {
					LayoutOrder = 1,
					label = UseLocalizationResult.wearAfterPurchaseLabel,
					size = FoundationModule.Enums.InputSize.Small,
					isChecked = p1.isWearAfterPurchaseChecked,
					onActivated = p1.onWearAfterPurchaseToggle,
					isDisabled = p1.isPurchasing
				}),
				AddToMyAvatars = ReactModule.createElement(FoundationModule.Checkbox, {
					LayoutOrder = 2,
					label = if UseMemoResult then UseLocalizationResult.addToMyAvatarsLabel else UseLocalizationResult.addToMyMakeupLooksLabel,
					size = FoundationModule.Enums.InputSize.Small,
					isChecked = p1.isAddToMyAvatarsChecked,
					onActivated = p1.onAddToMyAvatarsToggle,
					isDisabled = p1.isPurchasing
				})
			}),
			CheckoutPageBuyBorder = ReactModule.createElement(FoundationModule.View, {
				LayoutOrder = 4,
				Size = UDim2.new(1, 0, 0, 1),
				backgroundStyle = UseTokensResult.Color.Stroke.Muted
			}),
			CheckoutPageBuySection = ReactModule.createElement(FoundationModule.View, {
				tag = "size-full-0 auto-y col gap-medium padding-xxlarge",
				LayoutOrder = 5,
				isDisabled = p1.isPurchasing
			}, {
				CheckoutTotalLines = ReactModule.createElement(CheckoutTotalLinesModule, {
					userRobuxBalance = 0,
					itemCount = TutilsModule.fieldCount(p1.cartItems),
					totalPrice = p1.purchasableItemsTotalPriceInRobux,
					totalOriginalPrice = p1.purchasableItemsTotalOriginalPriceInRobux
				}),
				CheckoutBuyButton = if p1.canPurchase then ReactModule.createElement(CheckoutBuyButtonModule, {
					onCheckoutButtonActivated = p1.onCheckoutButtonActivated,
					isPurchasing = p1.isPurchasing,
					label = UseLocalizationResult.buyLabel
				}) else ReactModule.createElement(CheckoutUnavailableButtonModule, {
					onActivated = p1.onUnavailableButtonActivated,
					label = UseLocalizationResult.buyLabel
				})
			})
		})
	end
end, TutilsModule.deepEqual)