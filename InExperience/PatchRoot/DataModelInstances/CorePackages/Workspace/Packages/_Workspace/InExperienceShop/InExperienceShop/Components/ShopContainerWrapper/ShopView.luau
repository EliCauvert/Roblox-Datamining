local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local tabs = foundationModule.Tabs
local fillBehavior = foundationModule.Enums.FillBehavior
local useTokens = foundationModule.Hooks.useTokens
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagEnableUserOffers = sharedFlagsModule.FFlagEnableUserOffers
local isSubjectToDesktopPolicies = sharedFlagsModule.isSubjectToDesktopPolicies
local topBarModule = require(inExperienceShop.Components.TopBar)
local var1 = if sharedFlagsModule.FFlagEnableReportingFlowForExperienceShop then require(inExperienceShop.Components.ShopAbuseReportOverlay) else nil
local searchInputContainerModule = require(inExperienceShop.Components.SearchInput.SearchInputContainer)
local offerDetailsDialogModule = require(inExperienceShop.Components.OfferDialogs.OfferDetailsDialog)
local offerTermsDialogModule = require(inExperienceShop.Components.OfferDialogs.OfferTermsDialog)
local shopHomePageContainerModule = require(inExperienceShop.Components.ShopHomePage.ShopHomePageContainer)
local categoryPageContainerModule = require(inExperienceShop.Components.CategoryPage.CategoryPageContainer)
local searchResultsContainerModule = require(inExperienceShop.Components.SearchResultsPage.SearchResultsContainer)
local itemDetailsContainerModule = require(inExperienceShop.Components.ItemDetails.ItemDetailsContainer)
local creatorEarlyAccessBannerModule = require(inExperienceShop.Components.CreatorEarlyAccessBanner)
local desktopOfferBannerModule = require(inExperienceShop.Components.DesktopOfferBanner)
local _ = require(inExperienceShop.Types)
local findSectionModule = require(inExperienceShop.Utils.findSection)
local offerDialogStateModule = require(inExperienceShop.Components.OfferDialogs.OfferDialogState)
local _ = require(inExperienceShop.Hooks.useShopOfferChip)
local fFlagEnableCreatorEarlyAccessBannerInShopModule = require(inExperienceShop.Flags.FFlagEnableCreatorEarlyAccessBannerInShop)
local fFlagRemoveBottomPaddingInExperienceShopModule = require(inExperienceShop.Flags.FFlagRemoveBottomPaddingInExperienceShop)
local fFlagShopBlockClickPassThroughModule = require(inExperienceShop.Flags.FFlagShopBlockClickPassThrough)
local fFlagShowLargerOfferBannerOnDesktopModule = require(inExperienceShop.Flags.FFlagShowLargerOfferBannerOnDesktop)
local _ = require(inExperienceShop.Hooks.useShopReportOverflow)

return function(p1)
	-- upvalues: findSectionModule (ref), fFlagEnableUserOffers (ref), fFlagShowLargerOfferBannerOnDesktopModule (ref), isSubjectToDesktopPolicies (ref), reactModule (ref), view (ref), searchInputContainerModule (ref), topBarModule (ref), desktopOfferBannerModule (ref), fFlagRemoveBottomPaddingInExperienceShopModule (ref), fFlagShopBlockClickPassThroughModule (ref), useTokens (ref), fFlagEnableCreatorEarlyAccessBannerInShopModule (ref), creatorEarlyAccessBannerModule (ref), tabs (ref), fillBehavior (ref), searchResultsContainerModule (ref), shopHomePageContainerModule (ref), categoryPageContainerModule (ref), itemDetailsContainerModule (ref), var1 (ref), offerDialogStateModule (ref), offerDetailsDialogModule (ref), offerTermsDialogModule (ref)
	local isSearchOpen = p1.isSearchOpen
	local var2 = not isSearchOpen and #p1.tabs > 0
	local selectedItem = p1.selectedItem
	local var3 = if p1.selectedCategoryId ~= "home" then findSectionModule(p1.sections, p1.selectedCategoryId) == nil else true
	local var4 = if fFlagEnableUserOffers then p1.offer.offerModal else nil
	local var5 = fFlagEnableUserOffers and (fFlagShowLargerOfferBannerOnDesktopModule and (isSubjectToDesktopPolicies() and (not isSearchOpen and (p1.offer.showOfferChip and var4 ~= nil))))
	local var6 = reactModule.createElement(view, {
		tag = "row align-y-center size-full-1200",
		LayoutOrder = 1
	}, {
		Search = if isSearchOpen then reactModule.createElement(searchInputContainerModule, {
			text = p1.searchQuery,
			onTextChanged = p1.onSearchQueryChanged,
			onSearchSubmit = p1.onSearchSubmit,
			onBack = p1.onSearchCancel
		}) else nil,
		TopBar = if not isSearchOpen then reactModule.createElement(topBarModule, {
			onClose = p1.onClose,
			onSearchOpen = p1.onSearchOpen,
			isReportingEnabled = p1.isReportingEnabled,
			isOverflowMenuOpen = p1.isOverflowMenuOpen,
			onOverflowActivated = p1.onOverflowActivated,
			onOverflowMenuClosed = p1.onOverflowMenuClosed,
			onMenuItemActivated = p1.onMenuItemActivated,
			showOfferChip = if fFlagEnableUserOffers then p1.offer.showOfferChip and not var5 else false,
			offerChipText = if fFlagEnableUserOffers then p1.offer.offerChipText else nil,
			offerChipIcon = if fFlagEnableUserOffers then p1.offer.offerChipIcon else nil,
			onOfferChipActivated = if fFlagEnableUserOffers then p1.offer.onOfferChipActivated else nil
		}) else nil
	})
	local var7 = if var5 and var4 ~= nil then reactModule.createElement(view, {
		tag = "size-full-0 auto-y padding-x-xlarge padding-top-medium",
		LayoutOrder = 4
	}, {
		Banner = reactModule.createElement(desktopOfferBannerModule, {
			testId = "DesktopOfferBanner",
			text = p1.offer.offerBodyText,
			icon = p1.offer.offerChipIcon,
			link = if var4.termsAndConditions ~= nil then nil else {
				text = p1.offer.offerViewTermsText,
				onActivated = p1.offer.onOfferViewTerms
			}
		})
	}) else nil
	local var8 = fFlagRemoveBottomPaddingInExperienceShopModule()
	local var9 = fFlagShopBlockClickPassThroughModule()
	
	return reactModule.createElement(view, {
		tag = {
			["data-testid=ShopView"] = true,
			["size-full"] = true,
			["padding-x-large padding-top-medium"] = p1.fullScreen and var8,
			["padding-x-large padding-bottom-xlarge padding-top-medium"] = p1.fullScreen and not var8
		}
	}, {
		Content = reactModule.createElement(if var9 then "Frame" else view, if var9 then {
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
			Corner = if var9 then reactModule.createElement("UICorner", {
				CornerRadius = UDim.new(0, (if var9 then useTokens() else nil).Radius.Medium)
			}) else nil,
			ShopLayer = reactModule.createElement(view, { tag = "col size-full", Visible = selectedItem == nil }, {
				TopRow = var6,
				EarlyAccessBanner = if fFlagEnableCreatorEarlyAccessBannerInShopModule() and not isSearchOpen then reactModule.createElement(view, {
					tag = "size-full-0 auto-y padding-x-xlarge",
					LayoutOrder = 2
				}, {
					Banner = reactModule.createElement(creatorEarlyAccessBannerModule)
				}) else nil,
				Categories = if var2 then reactModule.createElement(view, {
					tag = "size-full-0 auto-y padding-x-xlarge",
					LayoutOrder = 3
				}, {
					Tabs = reactModule.createElement(tabs, {
						activeTabId = p1.selectedCategoryId,
						onActivated = p1.onCategorySelected,
						fillBehavior = fillBehavior.Fit,
						tabs = p1.tabs
					})
				}) else nil,
				OfferBanner = var7,
				PageSlot = reactModule.createElement(view, {
					tag = "col fill size-full-0 padding-top-medium",
					LayoutOrder = if fFlagShowLargerOfferBannerOnDesktopModule then 5 else 4,
					onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged
				}, {
					Search = if isSearchOpen then reactModule.createElement(searchResultsContainerModule, {
						sections = p1.sections,
						committedQuery = p1.committedQuery,
						itemsPerRow = p1.itemsPerRow,
						onItemActivated = p1.onItemActivated
					}) else nil,
					Home = if not isSearchOpen then reactModule.createElement(shopHomePageContainerModule, {
						sections = p1.sections,
						itemsPerRow = p1.itemsPerRow,
						onCategoryActivated = p1.onCategorySelected,
						onItemActivated = p1.onItemActivated,
						Visible = var3
					}) else nil,
					Category = if isSearchOpen or var3 then nil else reactModule.createElement(categoryPageContainerModule, {
						sections = p1.sections,
						sectionId = p1.selectedCategoryId,
						itemsPerRow = p1.itemsPerRow,
						onItemActivated = p1.onItemActivated
					})
				})
			}),
			Details = if selectedItem ~= nil then nil else reactModule.createElement(itemDetailsContainerModule, {
				item = selectedItem,
				disableBuy = p1.selectedItemDisableBuy,
				onClose = p1.onDetailsClose
			})
		}),
		ReportOverlay = if p1.topBarReportSession and var1 then reactModule.createElement(var1, {
			abuseVector = p1.topBarReportSession.abuseVector,
			targetId = p1.topBarReportSession.targetId,
			onClose = p1.onTopBarReportClose
		}) else nil,
		OfferDetails = if fFlagEnableUserOffers and p1.offer.offerDialog == offerDialogStateModule.Details and p1.offer.offerModal ~= nil then reactModule.createElement(offerDetailsDialogModule, {
			modal = p1.offer.offerModal,
			expirationTimeInUTC = p1.offer.offerExpirationTimeInUTC,
			onShopNow = p1.offer.onOfferShopNow,
			onViewTerms = p1.offer.onOfferViewTerms,
			onClose = p1.offer.onOfferDetailsClose
		}) else nil,
		OfferTerms = if fFlagEnableUserOffers and p1.offer.offerDialog == offerDialogStateModule.Terms and (p1.offer.offerModal ~= nil and p1.offer.offerModal.termsAndConditions ~= nil) then reactModule.createElement(offerTermsDialogModule, {
			terms = p1.offer.offerModal.termsAndConditions,
			onClose = p1.offer.onOfferTermsClose
		}) else nil
	})
end