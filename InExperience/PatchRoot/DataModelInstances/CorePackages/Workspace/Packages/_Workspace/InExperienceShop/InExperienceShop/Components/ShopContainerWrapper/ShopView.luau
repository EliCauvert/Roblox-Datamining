local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local tabs = foundationModule.Tabs
local fillBehavior = foundationModule.Enums.FillBehavior
local useTokens = foundationModule.Hooks.useTokens
local topBarModule = require(inExperienceShop.Components.TopBar)
local var4 = if require(parent.SharedFlags).FFlagEnableReportingFlowForExperienceShop then require(inExperienceShop.Components.ShopAbuseReportOverlay) else nil
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

return function(p0) --[[ line: 103 | named "ShopView" ]]
	-- upvalues: findSectionModule (ref), reactModule (ref), view (ref), searchInputContainerModule (ref), topBarModule (ref), fFlagRemoveBottomPaddingInExperienceShopModule (ref), fFlagShopBlockClickPassThroughModule (ref), useTokens (ref), fFlagEnableCreatorEarlyAccessBannerInShopModule (ref), creatorEarlyAccessBannerModule (ref), tabs (ref), fillBehavior (ref), searchResultsContainerModule (ref), shopHomePageContainerModule (ref), categoryPageContainerModule (ref), itemDetailsContainerModule (ref), var4 (ref)
	local isSearchOpen = p0.isSearchOpen
	local var15 = not isSearchOpen and #p0.tabs > 0
	local selectedItem = p0.selectedItem
	local var16 = if p0.selectedCategoryId ~= "home" then findSectionModule(p0.sections, p0.selectedCategoryId) == nil else true
	local var17 = reactModule.createElement(view, {
		tag = "row align-y-center size-full-1200",
		LayoutOrder = 1
	}, {
		Search = if isSearchOpen then reactModule.createElement(searchInputContainerModule, {
			text = p0.searchQuery,
			onTextChanged = p0.onSearchQueryChanged,
			onSearchSubmit = p0.onSearchSubmit,
			onBack = p0.onSearchCancel
		}) else nil,
		TopBar = if not isSearchOpen then reactModule.createElement(topBarModule, {
			onClose = p0.onClose,
			onSearchOpen = p0.onSearchOpen,
			isReportingEnabled = p0.isReportingEnabled,
			isOverflowMenuOpen = p0.isOverflowMenuOpen,
			onOverflowActivated = p0.onOverflowActivated,
			onOverflowMenuClosed = p0.onOverflowMenuClosed,
			onMenuItemActivated = p0.onMenuItemActivated
		}) else nil
	})
	local var18 = fFlagRemoveBottomPaddingInExperienceShopModule()
	local var19 = fFlagShopBlockClickPassThroughModule()
	
	return reactModule.createElement(view, {
		tag = {
			["data-testid=ShopView"] = true,
			["size-full"] = true,
			["padding-x-large padding-top-medium"] = p0.fullScreen and var18,
			["padding-x-large padding-bottom-xlarge padding-top-medium"] = p0.fullScreen and not var18
		}
	}, {
		Content = reactModule.createElement(if var19 then "Frame" else view, if var19 then {
			Active = true,
			ClipsDescendants = true,
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = p0.overMediaColor,
			BackgroundTransparency = p0.overMediaTransparency
		} else {
			tag = "size-full radius-medium clip",
			backgroundStyle = {
				Color3 = p0.overMediaColor,
				Transparency = p0.overMediaTransparency
			}
		}, {
			Corner = if var19 then reactModule.createElement("UICorner", {
				CornerRadius = UDim.new(0, (if var19 then useTokens() else nil).Radius.Medium)
			}) else nil,
			ShopLayer = reactModule.createElement(view, { tag = "col size-full", Visible = selectedItem == nil }, {
				TopRow = var17,
				EarlyAccessBanner = if fFlagEnableCreatorEarlyAccessBannerInShopModule() and not isSearchOpen then reactModule.createElement(view, {
					tag = "size-full-0 auto-y padding-x-xlarge",
					LayoutOrder = 2
				}, {
					Banner = reactModule.createElement(creatorEarlyAccessBannerModule)
				}) else nil,
				Categories = if var15 then reactModule.createElement(view, {
					tag = "size-full-0 auto-y padding-x-xlarge",
					LayoutOrder = 3
				}, {
					Tabs = reactModule.createElement(tabs, {
						activeTabId = p0.selectedCategoryId,
						onActivated = p0.onCategorySelected,
						fillBehavior = fillBehavior.Fit,
						tabs = p0.tabs
					})
				}) else nil,
				PageSlot = reactModule.createElement(view, {
					tag = "col fill size-full-0 padding-top-medium",
					LayoutOrder = 4,
					onAbsoluteSizeChanged = p0.onAbsoluteSizeChanged
				}, {
					Search = if isSearchOpen then reactModule.createElement(searchResultsContainerModule, {
						sections = p0.sections,
						committedQuery = p0.committedQuery,
						itemsPerRow = p0.itemsPerRow,
						onItemActivated = p0.onItemActivated
					}) else nil,
					Home = if not isSearchOpen then reactModule.createElement(shopHomePageContainerModule, {
						sections = p0.sections,
						itemsPerRow = p0.itemsPerRow,
						onCategoryActivated = p0.onCategorySelected,
						onItemActivated = p0.onItemActivated,
						Visible = var16
					}) else nil,
					Category = if isSearchOpen or var16 then nil else reactModule.createElement(categoryPageContainerModule, {
						sections = p0.sections,
						sectionId = p0.selectedCategoryId,
						itemsPerRow = p0.itemsPerRow,
						onItemActivated = p0.onItemActivated
					})
				})
			}),
			Details = if selectedItem ~= nil then nil else reactModule.createElement(itemDetailsContainerModule, {
				item = selectedItem,
				disableBuy = p0.selectedItemDisableBuy,
				onClose = p0.onDetailsClose
			})
		}),
		ReportOverlay = if p0.topBarReportSession and var4 then reactModule.createElement(var4, {
			abuseVector = p0.topBarReportSession.abuseVector,
			targetId = p0.topBarReportSession.targetId,
			onClose = p0.onTopBarReportClose
		}) else nil
	})
end