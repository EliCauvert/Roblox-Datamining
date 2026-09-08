local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local responsiveModule = require(parent.Responsive)
local avatarExperienceCommonModule = require(parent.AvatarExperienceCommon)
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local tutilsModule = require(parent.tutils)
local sharedFlagsModule = require(parent.SharedFlags)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local robloxSubscriptionPurchaseAppModule = require(parent.RobloxSubscriptionPurchaseApp)
local blackbirdUpsellBanner = robloxSubscriptionPurchaseAppModule.Components.BlackbirdUpsellBanner
local surfaceName = robloxSubscriptionPurchaseAppModule.SurfaceName
local surfaceContext = robloxSubscriptionPurchaseAppModule.SurfaceContext
local constants = avatarExperienceCommonModule.Constants
local checkoutPageHeaderModule = require(avatarExperienceCatalog.Components.Checkout.CheckoutPageHeader)
local checkoutPageBodyModule = require(avatarExperienceCatalog.Components.Checkout.CheckoutPageBody)
local checkoutBuyButtonModule = require(avatarExperienceCatalog.Components.Checkout.CheckoutBuyButton)
local checkoutTotalLinesModule = require(avatarExperienceCatalog.Components.Checkout.CheckoutTotalLines)
local checkoutUnavailableButtonModule = require(avatarExperienceCatalog.Components.Checkout.CheckoutUnavailableButton)
local _ = require(avatarExperienceCatalog.Api.PostCartPricingForOffers.CartPricingForOffersTypes)
local fFlagAXMISWithBlackbird = sharedFlagsModule.FFlagAXMISWithBlackbird
local fFlagAXEnableExpiredUserLookCheckout = avatarExperienceFlagsModule.FFlagAXEnableExpiredUserLookCheckout
local fFlagAXMISSmallUIChanges = avatarExperienceFlagsModule.FFlagAXMISSmallUIChanges
local fFlagAXMISWithOffers = avatarExperienceFlagsModule.FFlagAXMISWithOffers
local fFlagAXDurables2Option = avatarExperienceFlagsModule.FFlagAXDurables2Option

local function selectDeviceOrientation(p1)
	return p1.DeviceOrientation
end

local function selectStatusBarHeight(p1)
	return if p1 and p1.TopBar and p1.TopBar.statusBarHeight then p1.TopBar.statusBarHeight else 0
end

local var1 = function()
	-- upvalues: robloxSubscriptionPurchaseAppModule (ref), surfaceName (ref), surfaceContext (ref)
	robloxSubscriptionPurchaseAppModule.initiateRobloxSubscriptionPurchase({ showBackButton = true }, { onFlowComplete = function(_) end }, nil, surfaceName.CatalogMultiItemCheckoutPage, surfaceContext.InApp, nil, nil)
end

return reactModule.memo(function(p1)
	-- upvalues: parent (ref), foundationModule (ref), useSelector (ref), selectDeviceOrientation (ref), responsiveModule (ref), selectStatusBarHeight (ref), useLocalization (ref), fFlagAXMISWithOffers (ref), reactModule (ref), constants (ref), fFlagAXMISWithBlackbird (ref), checkoutPageHeaderModule (ref), checkoutPageBodyModule (ref), fFlagAXEnableExpiredUserLookCheckout (ref), fFlagAXDurables2Option (ref), cryoModule (ref), checkoutTotalLinesModule (ref), tutilsModule (ref), fFlagAXMISSmallUIChanges (ref), checkoutBuyButtonModule (ref), checkoutUnavailableButtonModule (ref), blackbirdUpsellBanner (ref), var1 (ref)
	local IAPExperienceModule = require(parent.IAPExperience)
	local purchasePromptModule = require(parent.PurchasePrompt)
	local var2 = foundationModule.Hooks.useTokens()
	local var3 = useSelector(selectDeviceOrientation) == responsiveModule.Keys.Portrait
	local var4 = useSelector(selectStatusBarHeight)
	local var5 = useLocalization({
		buyLabel = "Feature.Catalog.Action.Buy",
		wearAfterPurchaseLabel = "Feature.Catalog.Checkout.WearAfterPurchase",
		addToMyAvatarsLabel = "Feature.Avatar.Label.Title.AddToMyAvatars",
		addToMyMakeupLooksLabel = "Feature.Avatar.Label.Title.AddToMyMakeupLooks",
		saveOptionsLabel = if fFlagAXMISWithOffers then "Feature.Catalog.Label.SaveOptions" else nil
	})
	local var6 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), constants (copy)
		for i, v in p1.cartItems do
			if not constants.MAKEUP_LOOK_ASSET_TYPES[v.itemSubType] then
				return true
			end
		end
		return false
	end, { p1.cartItems })
	local var7 = if var3 then UDim2.fromScale(1, 1) else UDim2.fromScale(constants.LANDSCAPE_SCENE_WIDTH_PERCENTAGE, 1)
	local var8 = if var3 then UDim2.fromScale(0, 0) else UDim2.fromScale(constants.LANDSCAPE_UI_WIDTH_PERCENTAGE, 0)
	local var9 = reactModule.useMemo(function()
		-- upvalues: fFlagAXMISWithOffers (copy), p1 (ref), reactModule (copy), foundationModule (copy), var2 (ref)
		if not fFlagAXMISWithOffers then
			return nil
		end
		local t = {}
		
		if p1.offersAvailable then
			for i, v in p1.offersAvailable do
				t["Offer_" .. i] = reactModule.createElement("TextButton", {
					Text = "",
					AutomaticSize = Enum.AutomaticSize.XY,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Selectable = false,
					LayoutOrder = 0,
					[reactModule.Event.Activated] = function()
						-- upvalues: p1 (copy), i (ref)
						if p1.handleDeselectOfferId then
							p1.handleDeselectOfferId(i)
						end
					end
				}, {
					Content = reactModule.createElement(foundationModule.View, {
						tag = "row gap-medium auto-xy align-y-center",
						Position = UDim2.fromOffset(var2.Stroke.Standard, 0)
					}, {
						Checkbox = reactModule.createElement(foundationModule.Checkbox, {
							label = "",
							LayoutOrder = 1,
							isChecked = v.selected,
							onActivated = function()
								-- upvalues: p1 (copy), i (ref)
								if p1.handleDeselectOfferId then
									p1.handleDeselectOfferId(i)
								end
							end,
							size = foundationModule.Enums.InputSize.Small
						}),
						Label = reactModule.createElement(foundationModule.Text, {
							RichText = true,
							tag = "text-body-small content-default auto-xy",
							LayoutOrder = 2,
							Text = "<b>" .. v.localizedDescription .. "</b>"
						})
					})
				})
			end
		end
		return t
	end, { p1.offersAvailable, p1.handleDeselectOfferId })
	
	if fFlagAXMISWithBlackbird then
		local createElement_2
		local blackbirdUpsellBannerProductInfo = purchasePromptModule.Utils.getBlackbirdUpsellBannerProductInfo(p1.robloxSubscriptionProducts)
		local createElement = reactModule.createElement
		local var10 = "Frame"
		local t = {
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			Transparency = 1,
			Active = true,
			SelectionGroup = true,
			BackgroundColor3 = var2.Color.Surface.Surface_0.Color3,
			Size = var7,
			Position = var8,
			Visible = p1.isVisible,
			SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
			SelectionBehaviorDown = Enum.SelectionBehavior.Stop
		}
		local t_1 = {
			UIPadding = reactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, var4) }),
			ListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			CheckoutPageHeader = reactModule.createElement(foundationModule.View, {
				tag = "size-full-0 auto-y",
				LayoutOrder = 1,
				testId = "CheckoutPageHeaderContainer",
				isDisabled = not p1.isVisible
			}, {
				Header = reactModule.createElement(checkoutPageHeaderModule)
			})
		}
		local createElement_1 = reactModule.createElement
		local scrollView = foundationModule.ScrollView
		local t_2 = {
			LayoutOrder = 2,
			isDisabled = p1.isPurchasing,
			scroll = {
				scrollBarVisibility = foundationModule.Enums.Visibility.None,
				ScrollingDirection = Enum.ScrollingDirection.Y,
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.fromScale(0, 1)
			},
			flexItem = { FlexMode = Enum.UIFlexMode.Fill },
			Size = UDim2.fromScale(1, 1),
			selection = { Selectable = false }
		}
		local t_3 = {
			ListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			CheckoutPageBody = reactModule.createElement(foundationModule.View, { tag = "size-full-0 auto-y", LayoutOrder = 1 }, {
				Body = reactModule.createElement(checkoutPageBodyModule, {
					cartItems = p1.cartItems,
					erroredItemCount = p1.erroredItemCount
				})
			})
		}
		
		if fFlagAXEnableExpiredUserLookCheckout and p1.hideBuyOptions then
			createElement_2 = reactModule.createElement
			createElement_2 = createElement_2(foundationModule.View, {
				LayoutOrder = 3,
				tag = if fFlagAXDurables2Option then "col gap-medium size-full-0 auto-y padding-x-xxlarge padding-bottom-medium" else "col gap-medium size-full-0 auto-y padding-x-xxlarge padding-bottom-medium padding-top-xxlarge"
			}, {
				OfferCheckboxes = if fFlagAXMISWithOffers and var9 and #cryoModule.Dictionary.keys(var9) > 0 then reactModule.createElement(reactModule.Fragment, nil, var9) else nil
			})
		else
			createElement_2 = reactModule.createElement
			createElement_2 = createElement_2(foundationModule.View, {
				LayoutOrder = 3,
				tag = if fFlagAXDurables2Option then "col gap-medium size-full-0 auto-y padding-x-xxlarge padding-bottom-medium" else "col gap-medium size-full-0 auto-y padding-x-xxlarge padding-bottom-medium padding-top-xxlarge"
			}, {
				OfferCheckboxes = if fFlagAXMISWithOffers and var9 and #cryoModule.Dictionary.keys(var9) > 0 then reactModule.createElement(reactModule.Fragment, nil, var9) else nil,
				CheckoutPageWearAfterPurchase = if not fFlagAXMISWithOffers then reactModule.createElement(foundationModule.Checkbox, {
					LayoutOrder = 1,
					label = var5.wearAfterPurchaseLabel,
					size = foundationModule.Enums.InputSize.Small,
					isChecked = p1.isWearAfterPurchaseChecked,
					onActivated = p1.onWearAfterPurchaseToggle,
					isDisabled = p1.isPurchasing
				}) else nil,
				AddToMyAvatars = if not fFlagAXMISWithOffers then reactModule.createElement(foundationModule.Checkbox, {
					LayoutOrder = 2,
					label = if var6 then var5.addToMyAvatarsLabel else var5.addToMyMakeupLooksLabel,
					size = foundationModule.Enums.InputSize.Small,
					isChecked = p1.isAddToMyAvatarsChecked,
					onActivated = p1.onAddToMyAvatarsToggle,
					isDisabled = p1.isPurchasing
				}) else nil,
				SaveOptions = if fFlagAXMISWithOffers then reactModule.createElement(foundationModule.View, {
					tag = "row align-y-center auto-xy",
					LayoutOrder = 1,
					onActivated = p1.onSaveOptionsOpenToggle,
					stateLayer = {
						affordance = foundationModule.Enums.StateLayerAffordance.None
					}
				}, {
					Label = reactModule.createElement(foundationModule.Text, {
						tag = "auto-xy text-body-small",
						LayoutOrder = 1,
						Text = var5.saveOptionsLabel
					}),
					Chevron = reactModule.createElement(foundationModule.Icon, {
						LayoutOrder = 2,
						name = if p1.isSaveOptionsOpen then foundationModule.Enums.IconName.ChevronSmallUp else foundationModule.Enums.IconName.ChevronSmallDown,
						size = foundationModule.Enums.IconSize.Medium
					})
				}) else nil,
				WearAfterPurchaseCheckbox = if fFlagAXMISWithOffers and p1.isSaveOptionsOpen then reactModule.createElement(foundationModule.Checkbox, {
					LayoutOrder = 2,
					label = var5.wearAfterPurchaseLabel,
					size = foundationModule.Enums.InputSize.Small,
					isChecked = p1.isWearAfterPurchaseChecked,
					onActivated = p1.onWearAfterPurchaseToggle,
					isDisabled = p1.isPurchasing
				}) else nil,
				AddToMyAvatarsCheckbox = if fFlagAXMISWithOffers and p1.isSaveOptionsOpen then reactModule.createElement(foundationModule.Checkbox, {
					LayoutOrder = 3,
					label = if var6 then var5.addToMyAvatarsLabel else var5.addToMyMakeupLooksLabel,
					size = foundationModule.Enums.InputSize.Small,
					isChecked = p1.isAddToMyAvatarsChecked,
					onActivated = p1.onAddToMyAvatarsToggle,
					isDisabled = p1.isPurchasing
				}) else nil
			})
		end
		t_3.CheckoutPageBuyOptions = createElement_2
		t_1.CheckoutPageBodyScrollView = createElement_1(scrollView, t_2, t_3)
		t_1.CheckoutPageBuySection = reactModule.createElement(foundationModule.View, {
			tag = "col gap-medium size-full-0 auto-y padding-x-xxlarge padding-bottom-xxlarge padding-top-medium",
			LayoutOrder = 4,
			isDisabled = p1.isPurchasing
		}, {
			CheckoutTotalLines = reactModule.createElement(checkoutTotalLinesModule, {
				userRobuxBalance = 0,
				itemCount = tutilsModule.fieldCount(p1.cartItems),
				totalPrice = p1.purchasableItemsTotalPriceInRobux,
				totalOriginalPrice = p1.purchasableItemsTotalOriginalPriceInRobux,
				LayoutOrder = if fFlagAXMISSmallUIChanges then 2 else 1
			}),
			DiscountSummary = if p1.discountSummaryProps then reactModule.createElement(foundationModule.View, {
				tag = "size-full-0 auto-y",
				LayoutOrder = if fFlagAXMISSmallUIChanges then 1 else 2
			}, {
				Content = reactModule.createElement(IAPExperienceModule.DiscountSummary, p1.discountSummaryProps)
			}) else nil,
			CheckoutBuyButton = if p1.canPurchase then reactModule.createElement(checkoutBuyButtonModule, {
				LayoutOrder = 3,
				onCheckoutButtonActivated = p1.onCheckoutButtonActivated,
				isPurchasing = p1.isPurchasing,
				label = var5.buyLabel
			}) else reactModule.createElement(checkoutUnavailableButtonModule, {
				LayoutOrder = 3,
				onActivated = p1.onUnavailableButtonActivated,
				label = var5.buyLabel
			}),
			BlackbirdUpsellBanner = if p1.shouldShowBlackbirdUpsellBanner and blackbirdUpsellBannerProductInfo then reactModule.createElement(blackbirdUpsellBanner, {
				LayoutOrder = 4,
				productInfo = blackbirdUpsellBannerProductInfo,
				onActivated = var1
			}) else nil
		})
		
		return createElement(var10, t, t_1)
	else
		return reactModule.createElement("Frame", {
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			Transparency = 1,
			Active = true,
			SelectionGroup = true,
			BackgroundColor3 = var2.Color.Surface.Surface_0.Color3,
			Size = var7,
			Position = var8,
			Visible = p1.isVisible,
			SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
			SelectionBehaviorDown = Enum.SelectionBehavior.Stop
		}, {
			UIPadding = reactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, var4) }),
			ListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			CheckoutPageHeader = reactModule.createElement(foundationModule.View, {
				tag = "size-full-0 auto-y",
				LayoutOrder = 1,
				testId = "CheckoutPageHeaderContainer",
				isDisabled = not p1.isVisible
			}, {
				Header = reactModule.createElement(checkoutPageHeaderModule)
			}),
			CheckoutPageBodyScrollView = reactModule.createElement(foundationModule.ScrollView, {
				LayoutOrder = 2,
				isDisabled = p1.isPurchasing,
				scroll = {
					scrollBarVisibility = foundationModule.Enums.Visibility.None,
					ScrollingDirection = Enum.ScrollingDirection.Y,
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.fromScale(0, 1)
				},
				flexItem = { FlexMode = Enum.UIFlexMode.Fill },
				Size = UDim2.fromScale(1, 1),
				selection = { Selectable = false }
			}, {
				CheckoutPageBody = reactModule.createElement(checkoutPageBodyModule, {
					cartItems = p1.cartItems,
					erroredItemCount = p1.erroredItemCount
				})
			}),
			CheckoutPageBuyOptions = if fFlagAXEnableExpiredUserLookCheckout and p1.hideBuyOptions then nil else reactModule.createElement(foundationModule.View, {
				tag = "size-full-0 auto-y col gap-medium padding-x-xxlarge padding-y-medium",
				LayoutOrder = 3
			}, {
				CheckoutPageWearAfterPurchase = reactModule.createElement(foundationModule.Checkbox, {
					LayoutOrder = 1,
					label = var5.wearAfterPurchaseLabel,
					size = foundationModule.Enums.InputSize.Small,
					isChecked = p1.isWearAfterPurchaseChecked,
					onActivated = p1.onWearAfterPurchaseToggle,
					isDisabled = p1.isPurchasing
				}),
				AddToMyAvatars = reactModule.createElement(foundationModule.Checkbox, {
					LayoutOrder = 2,
					label = if var6 then var5.addToMyAvatarsLabel else var5.addToMyMakeupLooksLabel,
					size = foundationModule.Enums.InputSize.Small,
					isChecked = p1.isAddToMyAvatarsChecked,
					onActivated = p1.onAddToMyAvatarsToggle,
					isDisabled = p1.isPurchasing
				})
			}),
			CheckoutPageBuyBorder = reactModule.createElement(foundationModule.View, {
				LayoutOrder = 4,
				Size = UDim2.new(1, 0, 0, 1),
				backgroundStyle = var2.Color.Stroke.Muted
			}),
			CheckoutPageBuySection = reactModule.createElement(foundationModule.View, {
				tag = "size-full-0 auto-y col gap-medium padding-xxlarge",
				LayoutOrder = 5,
				isDisabled = p1.isPurchasing
			}, {
				CheckoutTotalLines = reactModule.createElement(checkoutTotalLinesModule, {
					userRobuxBalance = 0,
					itemCount = tutilsModule.fieldCount(p1.cartItems),
					totalPrice = p1.purchasableItemsTotalPriceInRobux,
					totalOriginalPrice = p1.purchasableItemsTotalOriginalPriceInRobux
				}),
				CheckoutBuyButton = if p1.canPurchase then reactModule.createElement(checkoutBuyButtonModule, {
					onCheckoutButtonActivated = p1.onCheckoutButtonActivated,
					isPurchasing = p1.isPurchasing,
					label = var5.buyLabel
				}) else reactModule.createElement(checkoutUnavailableButtonModule, {
					onActivated = p1.onUnavailableButtonActivated,
					label = var5.buyLabel
				})
			})
		})
	end
end, tutilsModule.deepEqual)