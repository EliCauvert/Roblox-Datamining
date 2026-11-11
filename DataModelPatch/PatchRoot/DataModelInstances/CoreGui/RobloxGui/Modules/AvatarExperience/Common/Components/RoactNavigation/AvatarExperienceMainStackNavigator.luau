local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local Components = Modules.AvatarExperience.Common.Components
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local MySharedAvatarsPageModule = require(Modules.AvatarExperience.AvatarEditor.Components.MySharedAvatars.MySharedAvatarsPage)
local CreateAvatarExperienceStackNavigatorModule = require(Components.RoactNavigation.createAvatarExperienceStackNavigator)
local Components1 = Modules.AvatarExperience.Catalog.Components
local LookDetailsScreenModule = require(Components1.LookDetails.LookDetailsScreen)
local CheckoutScreenModule = require(Components.RoactNavigation.CheckoutScreen)
local ExpiredUserLookActionBarScreenModule = require(Components.RoactNavigation.ExpiredUserLookActionBarScreen)
local SearchLandingFocusedWidgetPageModule = require(Modules.AvatarExperience.Catalog.Components.Search.LandingPage.SearchLandingFocusedWidgetPage)
local Components2 = Modules.AvatarExperience.ProfilePictureEditor.Components
local Components3 = Modules.AvatarExperience.AvatarEditor.Components
local ManageOutfitPageModule = require(Components3.AssetManagement.ManageOutfitPage)
local ManageOutfitPageDEPRECATEDModule = require(Components3.AssetManagement.ManageOutfitPage_DEPRECATED)
local ManageOutfitsPageContainerModule = require(Modules.AvatarExperience.OutfitSwitcher.ManageOutfitsPage.ManageOutfitsPageContainer)
local LookComposerPageModule = require(Components3.LookComposer.LookComposerPage)
local SubcategoryFiltersDropdownModule = require(Modules.AvatarExperience.SlotBasedEditor.Components.SubcategoryFilters.SubcategoryFiltersDropdown)
local LayeredMakeupSortScreenModule = require(Modules.AvatarExperience.LayeredMakeupSort.Components.LayeredMakeupSortScreen)
local AvatarSwitcherPageContainerModule = require(Modules.AvatarExperience.AvatarSwitcher.AvatarSwitcherPageContainer)
local EditEmotesPageContainerModule = require(Modules.AvatarExperience.EditEmotes.EditEmotesPageContainer)
local PhotoboothPageContainerModule = require(Modules.AvatarExperience.Photobooth.PhotoboothPageContainer)
local FFlagAXPhotoboothFunctionality = AvatarExperienceFlagsModule.FFlagAXPhotoboothFunctionality
local TenFootUiCommonModule = require(CorePackages.Workspace.Packages.TenFootUiCommon)
local ScreenKind = TenFootUiCommonModule.TenFootUiRNTypes.ScreenKind
local GlobalNavDisplayOption = TenFootUiCommonModule.TenFootUiRNTypes.GlobalNavDisplayOption
local AXRecentlyViewedSearchItemsIXPTest = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Experiments.AXRecentlyViewedSearchItemsIXPTest
local GetFFlagAXEnableSlotBasedEditorModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor)
local FFlagAXEditorSubcategoryFilters = AvatarExperienceFlagsModule.FFlagAXEditorSubcategoryFilters
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local FFlagAXMISEnableMultiShopping = AvatarExperienceFlagsModule.FFlagAXMISEnableMultiShopping
local FFlagAXCustomizeMakeupSupport = AvatarExperienceFlagsModule.FFlagAXCustomizeMakeupSupport
local FFlagEnableBottomNavOnMarketplace = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableBottomNavOnMarketplace
local FFlagAXEnableExpiredUserLookCheckout = AvatarExperienceFlagsModule.FFlagAXEnableExpiredUserLookCheckout
local FFlagAXOutfitPageRevamp = AvatarExperienceFlagsModule.FFlagAXOutfitPageRevamp
local List = {
	{
		[AvatarScreen.LandingPageSwitchNavigator] = {
			screen = require(Components.RoactNavigation.LandingPageSwitchNavigator),
			navigationOptions = function(p1)
				-- upvalues: RoactNavigationModule (copy)
				local ActiveChildNavigationOptions = RoactNavigationModule.getActiveChildNavigationOptions(p1.navigation)
				
				return {
					tabBarVisible = ActiveChildNavigationOptions.tabBarVisible,
					backButtonAction = ActiveChildNavigationOptions.backButtonAction
				}
			end
		}
	},
	{
		[AvatarScreen.AvatarBackground] = {
			screen = require(Components.AvatarBackground),
			navigationOptions = {
				backButtonAction = require(Components.RoactNavigation.BackButtonAction).NoOp
			}
		}
	},
	{
		[AvatarScreen.ItemDetails] = require(Components.ItemDetails.ItemDetailsScreen)
	},
	{
		[AvatarScreen.CatalogSearch] = require(Components1.Search.CatalogSearchPage)
	},
	{
		[AvatarScreen.SellItemPage] = require(Components.ItemDetails.SellPage.SellPage)
	},
	{
		[AvatarScreen.ResellersPage] = require(Components1.Resellers.ResellersPage)
	},
	{
		[AvatarScreen.UpdateOutfitPage] = require(Components3.AssetManagement.UpdateOutfitPage)
	},
	{
		[AvatarScreen.ManageOutfitPage] = if require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then ManageOutfitPageModule else ManageOutfitPageDEPRECATEDModule
	},
	{
		[AvatarScreen.ProfilePictureEditorCamera] = require(Components2.ProfilePictureEditorCameraPage)
	},
	{
		[AvatarScreen.ProfilePictureEditorFinal] = require(Components2.ProfilePictureEditorFinalPage)
	},
	{
		[AvatarScreen.SortAndFilters] = if require(Modules.AvatarExperience.Flags.GetFFlagAXEnableInventorySortsAndFilters)() then require(Components1.Filters.SortAndFiltersScreenV2) else require(Components1.Filters.SortAndFiltersScreen)
	},
	{
		[AvatarScreen.ItemOwnershipPage] = require(Components.ItemDetails.ItemOwnershipPage.ItemOwnershipPage)
	},
	{
		[AvatarScreen.SellItemPeekView] = require(Components.ItemDetails.SellPage.SellItemPeekView)
	},
	{
		[AvatarScreen.LookDetails] = if FFlagEnableBottomNavOnMarketplace then {
			screen = LookDetailsScreenModule,
			navigationOptions = { tabBarVisible = true }
		} else LookDetailsScreenModule
	},
	{
		[AvatarScreen.AvatarRefinementSwitchNavigator] = {
			screen = require(Components.RoactNavigation.AvatarRefinementSwitchNavigator)
		}
	},
	{
		[AvatarScreen.OutfitDetails] = require(Modules.AvatarExperience.AvatarEditor.Components.AssetManagement.OutfitDetailsScreen)
	},
	{
		[AvatarScreen.CatalogSearchLanding] = require(Components1.Search.CatalogSearchLandingPage)
	}
}
table.insert(List, {
	[AvatarScreen.LayeredClothingSort] = require(Modules.AvatarExperience.LayeredClothingSort.Components.LayeredClothingSortPage)
})

if FFlagAXCustomizeMakeupSupport then
	table.insert(List, {
		[AvatarScreen.LayeredMakeupSort] = LayeredMakeupSortScreenModule
	})
end
if FFlagAXEnableExpiredUserLookCheckout then
	table.insert(List, {
		[AvatarScreen.ExpiredUserLookActionBar] = ExpiredUserLookActionBarScreenModule
	})
	table.insert(List, {
		[AvatarScreen.ExpiredUserLookCheckout] = CheckoutScreenModule
	})
end
table.insert(List, { [AvatarScreen.LookComposerPage] = LookComposerPageModule })
table.insert(List, {
	[AvatarScreen.MySharedAvatars] = MySharedAvatarsPageModule
})

if FFlagAXPhotoboothFunctionality then
	table.insert(List, {
		[AvatarScreen.Photobooth] = PhotoboothPageContainerModule
	})
end
if AXRecentlyViewedSearchItemsIXPTest.isEnabled() then
	table.insert(List, {
		[AvatarScreen.SearchLandingFocusedWidgetPage] = SearchLandingFocusedWidgetPageModule
	})
end
if FFlagAXOutfitPageRevamp then
	table.insert(List, {
		[AvatarScreen.ManageOutfitsPage] = ManageOutfitsPageContainerModule
	})
end
if GetFFlagAXEnableSlotBasedEditorModule() then
	table.insert(List, {
		[AvatarScreen.AvatarSwitcher] = AvatarSwitcherPageContainerModule
	})
	table.insert(List, {
		[AvatarScreen.EditEmotes] = EditEmotesPageContainerModule
	})
end
if FFlagAXEditorSubcategoryFilters then
	table.insert(List, {
		[AvatarScreen.SubcategoryFiltersDropdown] = SubcategoryFiltersDropdownModule
	})
end
if FFlagAXMISEnableMultiShopping then
	table.insert(List, { [AvatarScreen.Checkout] = CheckoutScreenModule })
end
return CreateAvatarExperienceStackNavigatorModule(List, {
	defaultNavigationOptions = {
		overlayEnabled = true,
		overlayTransparency = 1,
		absorbInput = false,
		screenKind = ScreenKind.FullScreen,
		globalNavDisplayOption = GlobalNavDisplayOption.HideAll,
		hasSelectionGroup = not FFlagAXMigrateAXToGlobalAutofocus and nil
	},
	mode = RoactNavigationModule.StackPresentationStyle.Overlay
})