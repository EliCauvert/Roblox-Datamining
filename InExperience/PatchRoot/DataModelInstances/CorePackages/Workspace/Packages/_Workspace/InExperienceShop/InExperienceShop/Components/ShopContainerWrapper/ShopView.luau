local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UnifiedPurchaseCompletionModal = require(Parent.IAPExperience).UnifiedPurchaseCompletionModal
local FFlagShopRobuxPurchaseCompletionModalModule = require(InExperienceShop.Flags.FFlagShopRobuxPurchaseCompletionModal)
local View = FoundationModule.View
local Tabs = FoundationModule.Tabs
local FillBehavior = FoundationModule.Enums.FillBehavior
local UseTokensFunction = FoundationModule.Hooks.useTokens
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagEnableUserOffers = SharedFlagsModule.FFlagEnableUserOffers
local IsSubjectToDesktopPoliciesFunction = SharedFlagsModule.isSubjectToDesktopPolicies
local FFlagHideHeaderForBuyRobuxInExperienceShop = SharedFlagsModule.FFlagHideHeaderForBuyRobuxInExperienceShop
local TopBarModule = require(InExperienceShop.Components.TopBar)
local ShopAbuseReportOverlayModule = if SharedFlagsModule.FFlagEnableReportingFlowForExperienceShop then require(InExperienceShop.Components.ShopAbuseReportOverlay) else nil
local SearchInputContainerModule = require(InExperienceShop.Components.SearchInput.SearchInputContainer)
local OfferDetailsDialogModule = require(InExperienceShop.Components.OfferDialogs.OfferDetailsDialog)
local OfferTermsDialogModule = require(InExperienceShop.Components.OfferDialogs.OfferTermsDialog)
local ShopHomePageContainerModule = require(InExperienceShop.Components.ShopHomePage.ShopHomePageContainer)
local CategoryPageContainerModule = require(InExperienceShop.Components.CategoryPage.CategoryPageContainer)
local SearchResultsContainerModule = require(InExperienceShop.Components.SearchResultsPage.SearchResultsContainer)
local ItemDetailsContainerModule = require(InExperienceShop.Components.ItemDetails.ItemDetailsContainer)
local CreatorEarlyAccessBannerModule = require(InExperienceShop.Components.CreatorEarlyAccessBanner)
local DesktopOfferBannerModule = require(InExperienceShop.Components.DesktopOfferBanner)
local _ = require(InExperienceShop.Types)
local FindSectionModule = require(InExperienceShop.Utils.findSection)
local OfferDialogStateModule = require(InExperienceShop.Components.OfferDialogs.OfferDialogState)
local _ = require(InExperienceShop.Hooks.useShopOfferChip)
local FFlagEnableCreatorEarlyAccessBannerInShopModule = require(InExperienceShop.Flags.FFlagEnableCreatorEarlyAccessBannerInShop)
local FFlagRemoveBottomPaddingInExperienceShopModule = require(InExperienceShop.Flags.FFlagRemoveBottomPaddingInExperienceShop)
local FFlagShopBlockClickPassThroughModule = require(InExperienceShop.Flags.FFlagShopBlockClickPassThrough)
local FFlagShowLargerOfferBannerOnDesktop2Module = require(InExperienceShop.Flags.FFlagShowLargerOfferBannerOnDesktop2)
local _ = require(InExperienceShop.Hooks.useShopReportOverflow)

return function(p1)
	-- upvalues: FFlagHideHeaderForBuyRobuxInExperienceShop (copy), FindSectionModule (copy), FFlagEnableUserOffers (copy), FFlagShowLargerOfferBannerOnDesktop2Module (copy), IsSubjectToDesktopPoliciesFunction (copy), ReactModule (copy), View (copy), SearchInputContainerModule (copy), TopBarModule (copy), DesktopOfferBannerModule (copy), FFlagRemoveBottomPaddingInExperienceShopModule (copy), FFlagShopBlockClickPassThroughModule (copy), UseTokensFunction (copy), FFlagEnableCreatorEarlyAccessBannerInShopModule (copy), CreatorEarlyAccessBannerModule (copy), Tabs (copy), FillBehavior (copy), SearchResultsContainerModule (copy), ShopHomePageContainerModule (copy), CategoryPageContainerModule (copy), ItemDetailsContainerModule (copy), FFlagShopRobuxPurchaseCompletionModalModule (copy), UnifiedPurchaseCompletionModal (copy), ShopAbuseReportOverlayModule (copy), OfferDialogStateModule (copy), OfferDetailsDialogModule (copy), OfferTermsDialogModule (copy)
	local IsSearchOpen = p1.isSearchOpen
	local NoHideTabs: boolean = not IsSearchOpen and #p1.tabs > 0
	
	if FFlagHideHeaderForBuyRobuxInExperienceShop then
		NoHideTabs = NoHideTabs and not p1.hideTabs
	end
	local SelectedItem = p1.selectedItem
	local IsHome: boolean = p1.selectedCategoryId == "home" or FindSectionModule(p1.sections, p1.selectedCategoryId) == nil
	local OfferModal = if FFlagEnableUserOffers then p1.offer.offerModal else nil
	local IsSubjectToDesktopPolicies = FFlagEnableUserOffers and (FFlagShowLargerOfferBannerOnDesktop2Module and IsSubjectToDesktopPoliciesFunction())
	local HasOfferModal: boolean = IsSubjectToDesktopPolicies and (not IsSearchOpen and (IsHome and (p1.offer.showOfferChip and OfferModal ~= nil)))
	local Element = ReactModule.createElement(View, {
		tag = "row align-y-center size-full-1200",
		LayoutOrder = 1
	}, {
		Search = if IsSearchOpen then ReactModule.createElement(SearchInputContainerModule, {
			text = p1.searchQuery,
			onTextChanged = p1.onSearchQueryChanged,
			onSearchSubmit = p1.onSearchSubmit,
			onBack = p1.onSearchCancel
		}) else nil,
		TopBar = if IsSearchOpen then nil else ReactModule.createElement(TopBarModule, {
			onClose = p1.onClose,
			onSearchOpen = p1.onSearchOpen,
			isReportingEnabled = p1.isReportingEnabled,
			isOverflowMenuOpen = p1.isOverflowMenuOpen,
			onOverflowActivated = p1.onOverflowActivated,
			onOverflowMenuClosed = p1.onOverflowMenuClosed,
			onMenuItemActivated = p1.onMenuItemActivated,
			showOfferChip = if FFlagEnableUserOffers then p1.offer.showOfferChip and not IsSubjectToDesktopPolicies else false,
			offerChipText = if FFlagEnableUserOffers then p1.offer.offerChipText else nil,
			offerChipIcon = if FFlagEnableUserOffers then p1.offer.offerChipIcon else nil,
			onOfferChipActivated = if FFlagEnableUserOffers then p1.offer.onOfferChipActivated else nil
		})
	})
	local FFlagRemoveBottomPaddingInExperienceShopModuleResult = FFlagRemoveBottomPaddingInExperienceShopModule()
	local FFlagShopBlockClickPassThroughModuleResult = FFlagShopBlockClickPassThroughModule()
	local UseTokensResult = if FFlagShopBlockClickPassThroughModuleResult then UseTokensFunction() else nil
	
	return ReactModule.createElement(View, {
		tag = {
			["data-testid=ShopView"] = true,
			["size-full"] = true,
			["padding-x-large padding-top-medium"] = p1.fullScreen and FFlagRemoveBottomPaddingInExperienceShopModuleResult,
			["padding-x-large padding-bottom-xlarge padding-top-medium"] = p1.fullScreen and not FFlagRemoveBottomPaddingInExperienceShopModuleResult
		}
	}, {
		Content = ReactModule.createElement(if FFlagShopBlockClickPassThroughModuleResult then "Frame" else View, if FFlagShopBlockClickPassThroughModuleResult then {
			Active = true,
			ClipsDescendants = true,
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = p1.overMediaColor,
			BackgroundTransparency = p1.overMediaTransparency
		} else {
			tag = "size-full radius-medium clip",
			backgroundStyle = {
				Color3 = p1.overMediaColor,
				Transparency = p1.overMediaTransparency
			}
		}, {
			Corner = if FFlagShopBlockClickPassThroughModuleResult then ReactModule.createElement("UICorner", {
				CornerRadius = UDim.new(0, UseTokensResult.Radius.Medium)
			}) else nil,
			ShopLayer = ReactModule.createElement(View, { tag = "col size-full", Visible = SelectedItem == nil }, {
				TopRow = Element,
				EarlyAccessBanner = if FFlagEnableCreatorEarlyAccessBannerInShopModule() and not IsSearchOpen then ReactModule.createElement(View, {
					tag = "size-full-0 auto-y padding-x-xlarge",
					LayoutOrder = 2
				}, {
					Banner = ReactModule.createElement(CreatorEarlyAccessBannerModule)
				}) else nil,
				Categories = if NoHideTabs then ReactModule.createElement(View, {
					tag = "size-full-0 auto-y padding-x-xlarge",
					LayoutOrder = 3
				}, {
					Tabs = ReactModule.createElement(Tabs, {
						activeTabId = p1.selectedCategoryId,
						onActivated = p1.onCategorySelected,
						fillBehavior = FillBehavior.Fit,
						tabs = p1.tabs
					})
				}) else nil,
				OfferBanner = if HasOfferModal and OfferModal ~= nil then ReactModule.createElement(View, {
					tag = "size-full-0 auto-y padding-x-xlarge padding-top-medium",
					LayoutOrder = 4
				}, {
					Banner = ReactModule.createElement(DesktopOfferBannerModule, {
						testId = "DesktopOfferBanner",
						text = p1.offer.offerBodyText,
						icon = p1.offer.offerChipIcon,
						link = if OfferModal.termsAndConditions == nil then nil else {
							text = p1.offer.offerViewTermsText,
							onActivated = p1.offer.onOfferViewTerms
						}
					})
				}) else nil,
				PageSlot = ReactModule.createElement(View, {
					tag = "col fill size-full-0 padding-top-medium",
					LayoutOrder = if FFlagShowLargerOfferBannerOnDesktop2Module then 5 else 4,
					onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged
				}, {
					Search = if IsSearchOpen then ReactModule.createElement(SearchResultsContainerModule, {
						sections = p1.sections,
						committedQuery = p1.committedQuery,
						itemsPerRow = p1.itemsPerRow,
						onItemActivated = p1.onItemActivated
					}) else nil,
					Home = if IsSearchOpen then nil else ReactModule.createElement(ShopHomePageContainerModule, {
						sections = p1.sections,
						itemsPerRow = p1.itemsPerRow,
						onCategoryActivated = p1.onCategorySelected,
						onItemActivated = p1.onItemActivated,
						Visible = IsHome
					}),
					Category = if IsSearchOpen or IsHome then nil else ReactModule.createElement(CategoryPageContainerModule, {
						sections = p1.sections,
						sectionId = p1.selectedCategoryId,
						itemsPerRow = p1.itemsPerRow,
						onItemActivated = p1.onItemActivated
					})
				})
			}),
			Details = if SelectedItem == nil then nil else ReactModule.createElement(ItemDetailsContainerModule, {
				item = SelectedItem,
				disableBuy = p1.selectedItemDisableBuy,
				onClose = p1.onDetailsClose
			})
		}),
		RobuxPurchaseSuccess = if FFlagShopRobuxPurchaseCompletionModalModule and p1.robuxPurchaseSuccess ~= nil then ReactModule.createElement(UnifiedPurchaseCompletionModal, {
			bodyText = p1.robuxPurchaseSuccess.bodyText,
			buttons = {
				onActivated = p1.robuxPurchaseSuccess.onClose,
				onClose = p1.robuxPurchaseSuccess.onClose
			}
		}) else nil,
		ReportOverlay = if p1.topBarReportSession and ShopAbuseReportOverlayModule then ReactModule.createElement(ShopAbuseReportOverlayModule, {
			abuseVector = p1.topBarReportSession.abuseVector,
			targetId = p1.topBarReportSession.targetId,
			onClose = p1.onTopBarReportClose
		}) else nil,
		OfferDetails = if FFlagEnableUserOffers and p1.offer.offerDialog == OfferDialogStateModule.Details and p1.offer.offerModal ~= nil then ReactModule.createElement(OfferDetailsDialogModule, {
			modal = p1.offer.offerModal,
			expirationTimeInUTC = p1.offer.offerExpirationTimeInUTC,
			onShopNow = p1.offer.onOfferShopNow,
			onViewTerms = p1.offer.onOfferViewTerms,
			onClose = p1.offer.onOfferDetailsClose
		}) else nil,
		OfferTerms = if FFlagEnableUserOffers and p1.offer.offerDialog == OfferDialogStateModule.Terms and p1.offer.offerModal ~= nil and p1.offer.offerModal.termsAndConditions ~= nil then ReactModule.createElement(OfferTermsDialogModule, {
			terms = p1.offer.offerModal.termsAndConditions,
			onClose = p1.offer.onOfferTermsClose
		}) else nil
	})
end