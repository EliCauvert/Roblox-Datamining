local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local tabs = foundationModule.Tabs
local fillBehavior = foundationModule.Enums.FillBehavior
local useTokens = foundationModule.Hooks.useTokens
local topBarModule = require(inExperienceShop.Components.TopBar)
local var1 = if require(parent.SharedFlags).FFlagEnableReportingFlowForExperienceShop then require(inExperienceShop.Components.ShopAbuseReportOverlay) else nil
local searchInputContainerModule = require(inExperienceShop.Components.SearchInput.SearchInputContainer)
local shopHomePageContainerModule = require(inExperienceShop.Components.ShopHomePage.ShopHomePageContainer)
local categoryPageContainerModule = require(inExperienceShop.Components.CategoryPage.CategoryPageContainer)
local searchResultsContainerModule = require(inExperienceShop.Components.SearchResultsPage.SearchResultsContainer)
local itemDetailsContainerModule = require(inExperienceShop.Components.ItemDetails.ItemDetailsContainer)
local creatorEarlyAccessBannerModule = require(inExperienceShop.Components.CreatorEarlyAccessBanner)
local _ = require(inExperienceShop.Types)
local findSectionModule = require(inExperienceShop.Utils.findSection)
local fFlagEnableCreatorEarlyAccessBannerInShopModule = require(inExperienceShop.Flags.FFlagEnableCreatorEarlyAccessBannerInShop)
local fFlagRemoveBottomPaddingInExperienceShopModule = require(inExperienceShop.Flags.FFlagRemoveBottomPaddingInExperienceShop)
local fFlagShopBlockClickPassThroughModule = require(inExperienceShop.Flags.FFlagShopBlockClickPassThrough)
local _ = require(inExperienceShop.Hooks.useShopReportOverflow)

return function(p1)
	-- upvalues: findSectionModule (ref), reactModule (ref), view (ref), searchInputContainerModule (ref), topBarModule (ref), fFlagRemoveBottomPaddingInExperienceShopModule (ref), fFlagShopBlockClickPassThroughModule (ref), useTokens (ref), fFlagEnableCreatorEarlyAccessBannerInShopModule (ref), creatorEarlyAccessBannerModule (ref), tabs (ref), fillBehavior (ref), searchResultsContainerModule (ref), shopHomePageContainerModule (ref), categoryPageContainerModule (ref), itemDetailsContainerModule (ref), var1 (ref)
	local isSearchOpen = p1.isSearchOpen
	local var2 = not isSearchOpen and #p1.tabs > 0
	local selectedItem = p1.selectedItem
	local var3 = if p1.selectedCategoryId ~= "home" then findSectionModule(p1.sections, p1.selectedCategoryId) == nil else true
	local var4 = reactModule.createElement(view, {
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
			onMenuItemActivated = p1.onMenuItemActivated
		}) else nil
	})
	local var5 = fFlagRemoveBottomPaddingInExperienceShopModule()
	local var6 = fFlagShopBlockClickPassThroughModule()
	
	return reactModule.createElement(view, {
		tag = {
			["data-testid=ShopView"] = true,
			["size-full"] = true,
			["padding-x-large padding-top-medium"] = p1.fullScreen and var5,
			["padding-x-large padding-bottom-xlarge padding-top-medium"] = p1.fullScreen and not var5
		}
	}, {
		Content = reactModule.createElement(if var6 then "Frame" else view, if var6 then {
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
			Corner = if var6 then reactModule.createElement("UICorner", {
				CornerRadius = UDim.new(0, (if var6 then useTokens() else nil).Radius.Medium)
			}) else nil,
			ShopLayer = reactModule.createElement(view, { tag = "col size-full", Visible = selectedItem == nil }, {
				TopRow = var4,
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
				PageSlot = reactModule.createElement(view, {
					tag = "col fill size-full-0 padding-top-medium",
					LayoutOrder = 4,
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
		}) else nil
	})
end