local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Tabs = FoundationModule.Tabs
local FillBehavior = FoundationModule.Enums.FillBehavior
local TopBarModule = require(InExperienceShop.Components.TopBar)
local ShopAbuseReportOverlayModule = if require(Parent.SharedFlags).FFlagEnableReportingFlowForExperienceShop then require(InExperienceShop.Components.ShopAbuseReportOverlay) else nil
local SearchInputContainerModule = require(InExperienceShop.Components.SearchInput.SearchInputContainer)
local ShopHomePageContainerModule = require(InExperienceShop.Components.ShopHomePage.ShopHomePageContainer)
local CategoryPageContainerModule = require(InExperienceShop.Components.CategoryPage.CategoryPageContainer)
local SearchResultsContainerModule = require(InExperienceShop.Components.SearchResultsPage.SearchResultsContainer)
local ItemDetailsContainerModule = require(InExperienceShop.Components.ItemDetails.ItemDetailsContainer)
local CreatorEarlyAccessBannerModule = require(InExperienceShop.Components.CreatorEarlyAccessBanner)
local _ = require(InExperienceShop.Types)
local FindSectionModule = require(InExperienceShop.Utils.findSection)
local FFlagEnableCreatorEarlyAccessBannerInShopModule = require(InExperienceShop.Flags.FFlagEnableCreatorEarlyAccessBannerInShop)
local FFlagRemoveBottomPaddingInExperienceShopModule = require(InExperienceShop.Flags.FFlagRemoveBottomPaddingInExperienceShop)
local _ = require(InExperienceShop.Hooks.useShopReportOverflow)

return function(p1)
	-- upvalues: FindSectionModule (copy), ReactModule (copy), View (copy), SearchInputContainerModule (copy), TopBarModule (copy), FFlagRemoveBottomPaddingInExperienceShopModule (copy), FFlagEnableCreatorEarlyAccessBannerInShopModule (copy), CreatorEarlyAccessBannerModule (copy), Tabs (copy), FillBehavior (copy), SearchResultsContainerModule (copy), ShopHomePageContainerModule (copy), CategoryPageContainerModule (copy), ItemDetailsContainerModule (copy), ShopAbuseReportOverlayModule (copy)
	local IsSearchOpen = p1.isSearchOpen
	local v1: boolean = not IsSearchOpen and #p1.tabs > 0
	local SelectedItem = p1.selectedItem
	local IsHome: boolean = p1.selectedCategoryId == "home" or FindSectionModule(p1.sections, p1.selectedCategoryId) == nil
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
			onMenuItemActivated = p1.onMenuItemActivated
		})
	})
	local FFlagRemoveBottomPaddingInExperienceShopModuleResult = FFlagRemoveBottomPaddingInExperienceShopModule()
	
	return ReactModule.createElement(View, {
		tag = {
			["data-testid=ShopView"] = true,
			["size-full"] = true,
			["padding-x-large padding-top-medium"] = p1.fullScreen and FFlagRemoveBottomPaddingInExperienceShopModuleResult,
			["padding-x-large padding-bottom-xlarge padding-top-medium"] = p1.fullScreen and not FFlagRemoveBottomPaddingInExperienceShopModuleResult
		}
	}, {
		Content = ReactModule.createElement(View, {
			tag = "size-full radius-medium clip",
			backgroundStyle = {
				Color3 = p1.overMediaColor,
				Transparency = p1.overMediaTransparency
			}
		}, {
			ShopLayer = ReactModule.createElement(View, { tag = "col size-full", Visible = SelectedItem == nil }, {
				TopRow = Element,
				EarlyAccessBanner = if FFlagEnableCreatorEarlyAccessBannerInShopModule() and not IsSearchOpen then ReactModule.createElement(View, {
					tag = "size-full-0 auto-y padding-x-xlarge",
					LayoutOrder = 2
				}, {
					Banner = ReactModule.createElement(CreatorEarlyAccessBannerModule)
				}) else nil,
				Categories = if v1 then ReactModule.createElement(View, {
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
				PageSlot = ReactModule.createElement(View, {
					tag = "col fill size-full-0 padding-top-medium",
					LayoutOrder = 4,
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
		ReportOverlay = if p1.topBarReportSession and ShopAbuseReportOverlayModule then ReactModule.createElement(ShopAbuseReportOverlayModule, {
			abuseVector = p1.topBarReportSession.abuseVector,
			targetId = p1.topBarReportSession.targetId,
			onClose = p1.onTopBarReportClose
		}) else nil
	})
end