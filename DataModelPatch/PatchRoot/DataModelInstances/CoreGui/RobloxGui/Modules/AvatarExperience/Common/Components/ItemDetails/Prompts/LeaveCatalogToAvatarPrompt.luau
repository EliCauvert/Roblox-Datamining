local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local MutedErrorModule = require(Modules.LuaApp.mutedError)
local AnalyticsModule = require(Modules.AvatarExperience.AvatarEditor.Services.Analytics)
local AnalyticsModule1 = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local WithMappedNavigationParamsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams)
local WithOverlayFocusHandlingModule = require(Modules.AvatarExperience.Common.Components.withOverlayFocusHandling)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local SetCategoryAndSubcategoryModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.SetCategoryAndSubcategory)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local GoToCustomizeToEditPrompt = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).Components.Prompts.GoToCustomizeToEditPrompt
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local GetAvatarEditorStructureModule = require(Modules.AvatarExperience.AvatarEditor.GetAvatarEditorStructure)
local LeaveCatalogToAvatarPrompt = RoactModule.PureComponent:extend("LeaveCatalogToAvatarPrompt")
local FFlagAXFixBundleRedirectFromCatalogForSlotsModule = require(Modules.AvatarExperience.Flags.FFlagAXFixBundleRedirectFromCatalogForSlots)
local FFlagAXFixEmoteRedirectFromCatalogForSlotsModule = require(Modules.AvatarExperience.Flags.FFlagAXFixEmoteRedirectFromCatalogForSlots)
local FFlagAXLeaveCatalogToAvatarPromptHandleSubcategoryFilters = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXLeaveCatalogToAvatarPromptHandleSubcategoryFilters
local FFlagAXMISEnableMultiShopping = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXMISEnableMultiShopping

function LeaveCatalogToAvatarPrompt.init(p1)
	-- upvalues: FFlagAXFixEmoteRedirectFromCatalogForSlotsModule (copy), ConstantsModule (copy), AvatarScreen (copy), NavigationUtilsModule (copy), GetAvatarEditorStructureModule (copy), FFlagAXLeaveCatalogToAvatarPromptHandleSubcategoryFilters (copy), FFlagAXFixBundleRedirectFromCatalogForSlotsModule (copy), MutedErrorModule (copy)
	function p1.openAvatarPage()
		-- upvalues: p1 (copy), FFlagAXFixEmoteRedirectFromCatalogForSlotsModule (upval), ConstantsModule (upval), AvatarScreen (upval), NavigationUtilsModule (upval), GetAvatarEditorStructureModule (upval), FFlagAXLeaveCatalogToAvatarPromptHandleSubcategoryFilters (upval), FFlagAXFixBundleRedirectFromCatalogForSlotsModule (upval), MutedErrorModule (upval)
		local ItemType = p1.props.itemType
		local ItemSubType = p1.props.itemSubType
		local Category = nil
		local Subcategory = nil
		local SubcategoryFilter = nil
		
		if FFlagAXFixEmoteRedirectFromCatalogForSlotsModule and ItemSubType == ConstantsModule.AssetTypeIdStrings.EmoteAnimation then
			p1.props.navigation.navigate(AvatarScreen.AvatarEditor)
			NavigationUtilsModule.navigateFromOverlay(p1.props.navigation, AvatarScreen.EditEmotes)
			
			return
		end
		if p1.props.categoryOverride then
			Category = p1.props.categoryOverride
			Subcategory = p1.props.subcategoryOverride
		else
			local AvatarEditorStructureModule = GetAvatarEditorStructureModule()
			
			if ItemType == ConstantsModule.ItemType.Asset then
				local AssetTypeToCategorySubcategoryEntry = AvatarEditorStructureModule.AssetTypeToCategorySubcategory[ItemSubType]
				
				if AssetTypeToCategorySubcategoryEntry then
					Category = AssetTypeToCategorySubcategoryEntry.category
					Subcategory = AssetTypeToCategorySubcategoryEntry.subcategory
					
					if FFlagAXLeaveCatalogToAvatarPromptHandleSubcategoryFilters then
						SubcategoryFilter = AssetTypeToCategorySubcategoryEntry.subcategoryFilter
					end
				end
			elseif ItemType == ConstantsModule.ItemType.Bundle then
				if FFlagAXFixBundleRedirectFromCatalogForSlotsModule then
					Category = AvatarEditorStructureModule.BundleToCategorySubcategory[ItemSubType].category
					Subcategory = AvatarEditorStructureModule.BundleToCategorySubcategory[ItemSubType].subcategory
					
					if FFlagAXLeaveCatalogToAvatarPromptHandleSubcategoryFilters then
						SubcategoryFilter = AvatarEditorStructureModule.BundleToCategorySubcategory[ItemSubType].subcategoryFilter
					end
				else
					Category = AvatarEditorStructureModule.BundleToCategorySubcategory.category
					Subcategory = AvatarEditorStructureModule.BundleToCategorySubcategory.subcategory
				end
			end
		end
		local AvatarAnalytics = p1.props.avatarAnalytics
		
		if Category == nil then
			MutedErrorModule("[AvatarExperience] No category for itemType: " .. tostring(ItemType) .. " / " .. tostring(ItemSubType))
		else
			p1.props.setCategoryAndSubcategory(Category, Subcategory, AvatarAnalytics, SubcategoryFilter)
		end
		NavigationUtilsModule.navigateFromOverlay(p1.props.navigation, AvatarScreen.AvatarEditor)
		p1.props.catalogAnalytics.clickCustomizeAvatarFromItemDetailPage()
	end
	
	function p1.closePrompt()
		-- upvalues: NavigationUtilsModule (upval), p1 (copy)
		NavigationUtilsModule.closeOverlay(p1.props.navigation)
	end
end

function LeaveCatalogToAvatarPrompt.renderAlertLocalized(p1, p2)
	-- upvalues: RoactModule (copy), InteractiveAlert (copy), ButtonType (copy)
	return RoactModule.createElement(InteractiveAlert, {
		title = p2.titleText,
		bodyText = p2.messageText,
		buttonStackInfo = {
			buttons = {
				{
					isDefaultChild = true,
					props = { onActivated = p1.closePrompt, text = p2.cancelButtonText }
				},
				{
					buttonType = ButtonType.PrimarySystem,
					props = {
						onActivated = p1.openAvatarPage,
						text = p2.confirmButtonText
					}
				}
			}
		},
		screenSize = p1.props.screenSize,
		defaultChildRef = p1.props.defaultChildRef
	})
end

if FFlagAXMISEnableMultiShopping then
	function LeaveCatalogToAvatarPrompt.renderGoToCustomizePrompt(p1)
		-- upvalues: RoactModule (copy), GoToCustomizeToEditPrompt (copy)
		return RoactModule.createElement(GoToCustomizeToEditPrompt, {
			onConfirm = p1.openAvatarPage,
			navigation = p1.props.navigation
		})
	end
end
function LeaveCatalogToAvatarPrompt.render(p1)
	-- upvalues: FFlagAXMISEnableMultiShopping (copy), WithLocalizationFunction (copy)
	return if FFlagAXMISEnableMultiShopping then p1:renderGoToCustomizePrompt() else WithLocalizationFunction({
		titleText = "Feature.Catalog.Action.Customize",
		messageText = "Feature.Catalog.Label.MarketplaceToAvatarPage",
		confirmButtonText = "Feature.Catalog.Action.Customize",
		cancelButtonText = "Feature.Catalog.Action.Cancel"
	})(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderAlertLocalized(p2)
	end)
end

return (WithMappedNavigationParamsModule((WithOverlayFocusHandlingModule((RoactServices.connect({
	avatarAnalytics = AnalyticsModule,
	catalogAnalytics = AnalyticsModule1
})((RoactRoduxModule.connect(function(p1, _)
	return { screenSize = p1.ScreenSize }
end, function(Callback)
	-- upvalues: SetCategoryAndSubcategoryModule (copy)
	return {
		setCategoryAndSubcategory = function(p1, p2, p3, p4)
			-- upvalues: Callback (copy), SetCategoryAndSubcategoryModule (upval)
			Callback(SetCategoryAndSubcategoryModule(p1, p2, p3, p4))
		end
	}
end)(LeaveCatalogToAvatarPrompt))))))))