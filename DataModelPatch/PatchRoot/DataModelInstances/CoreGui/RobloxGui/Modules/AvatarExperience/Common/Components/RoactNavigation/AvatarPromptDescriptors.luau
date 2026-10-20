local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local UrlBuilderModule = require(CorePackages.Packages.UrlBuilder)
local AppPageModule = require(Modules.LuaApp.AppPage)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local FFlagSignalsNavP3Dispatch = SharedFlagsModule.FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local PurchaseLookPromptModule = require(Modules.AvatarExperience.Common.Components.ItemDetails.Prompts.PurchaseLookPrompt)
local PurchaseLookPromptMISModule = require(Modules.AvatarExperience.Common.Components.ItemDetails.Prompts.PurchaseLookPromptMIS)
local CatalogReportContainerModule = require(Modules.LuaApp.Components.AbuseReporting.CatalogReportContainer)
local CollectiblesInfoPromptModule = require(Modules.AvatarExperience.Common.Components.ItemDetails.Prompts.CollectiblesInfoPrompt)
local SlotEditorClearAllConfirmationPromptModule = require(Modules.AvatarExperience.SlotBasedEditor.Components.Prompts.SlotEditorClearAllConfirmationPrompt)
local SaveAvatarOnLeaveAvatarExperiencePromptModule = require(Modules.AvatarExperience.SlotBasedEditor.Components.SaveAvatarOnLeaveAvatarExperiencePrompt)
local EnhancedAvatarHeadsFtuxPrompt = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Components.Prompts.EnhancedAvatarHeadsFtuxPrompt
local WearAvatarReplaceAllItemsPrompt = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).Components.Prompts.WearAvatarReplaceAllItemsPrompt
local ClearAllItemsOnAvatarPrompt = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).Components.Prompts.ClearAllItemsOnAvatarPrompt
local CartUnavailableItemsPrompt = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).Components.Prompts.CartUnavailableItemsPrompt
local ItemReplacedOnAvatarPrompt = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).Components.Prompts.ItemReplacedOnAvatarPrompt
local ItemsUnavailablePrompt = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).Components.Prompts.ItemsUnavailablePrompt
local MakeupMax6LayersPromptModule = require(Modules.AvatarExperience.Catalog.Components.Prompts.MakeupMax6LayersPrompt)
local TimeoutStatusPrompt = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).Components.Prompts.TimeoutStatusPrompt
local MakeupReleaseFtuxPromptModule = require(Modules.AvatarExperience.Catalog.Components.Prompts.MakeupReleaseFtuxPrompt)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local GetFFlagLuafiedReportEntryPointsFunction = SharedFlagsModule.GetFFlagLuafiedReportEntryPoints
local FFlagAXEnableClearAllConfirmationPromptModule = require(Modules.AvatarExperience.Flags.FFlagAXEnableClearAllConfirmationPrompt)
local FFlagAXEnableManualSavingBlockingPrompt = AvatarExperienceFlagsModule.FFlagAXEnableManualSavingBlockingPrompt
local FFlagAXEnableEnhancedAvatarHeadsFtux = AvatarExperienceFlagsModule.FFlagAXEnableEnhancedAvatarHeadsFtux
local FFlagAXMISEnableMultiShopping = AvatarExperienceFlagsModule.FFlagAXMISEnableMultiShopping
local FFlagAXAvatarTimeoutFlow = AvatarExperienceFlagsModule.FFlagAXAvatarTimeoutFlow
local FFlagAXCatalogMakeupSupport = AvatarExperienceFlagsModule.FFlagAXCatalogMakeupSupport
local FFlagAXMakeupReleaseFTUX = AvatarExperienceFlagsModule.FFlagAXMakeupReleaseFTUX
local FFlagAXOutfitPageRevamp = AvatarExperienceFlagsModule.FFlagAXOutfitPageRevamp
local AddOutfitDialogContainerModule = if FFlagAXOutfitPageRevamp then require(Modules.AvatarExperience.OutfitSwitcher.Dialogs.AddOutfitDialog.AddOutfitDialogContainer) else nil
local DuplicateOutfitDialogContainerModule = if FFlagAXOutfitPageRevamp then require(Modules.AvatarExperience.OutfitSwitcher.Dialogs.DuplicateOutfitDialog.DuplicateOutfitDialogContainer) else nil
local DuplicateOutfitNameDialogContainerModule = if FFlagAXOutfitPageRevamp then require(Modules.AvatarExperience.OutfitSwitcher.Dialogs.DuplicateOutfitNameDialog.DuplicateOutfitNameDialogContainer) else nil
local AvatarPromptDescriptorsModule = {
	{
		[AvatarScreen.PremiumUpsellPrompt] = require(Modules.LuaApp.Components.PremiumUpsell.PremiumUpsellContainer)
	},
	{
		[AvatarScreen.CatalogReport] = require(Modules.AvatarExperience.Common.Components.ItemDetails.Prompts.CatalogReport)
	},
	{
		[AvatarScreen.SaveOutfitPrompt] = require(Modules.AvatarExperience.AvatarEditor.Components.Prompts.SaveOutfitPrompt)
	},
	{
		[AvatarScreen.RenameOutfitPrompt] = require(Modules.AvatarExperience.AvatarEditor.Components.Prompts.RenameOutfitPrompt)
	},
	{
		[AvatarScreen.DeleteOutfitPrompt] = require(Modules.AvatarExperience.AvatarEditor.Components.Prompts.DeleteOutfitPrompt)
	},
	{
		[AvatarScreen.DuplicateOutfitNamePrompt] = require(Modules.AvatarExperience.AvatarEditor.Components.Prompts.DuplicateOutfitNamePrompt)
	},
	{
		[AvatarScreen.DuplicateOutfitInfoPrompt] = require(Modules.AvatarExperience.AvatarEditor.Components.Prompts.DuplicateOutfitInfoPrompt)
	},
	{
		[AvatarScreen.LayeredClothingR6SwitchPrompt] = require(Modules.AvatarExperience.AvatarEditor.Components.Prompts.LayeredClothingR6SwitchPrompt)
	},
	{
		[AvatarScreen.EquipOutfitConfirmation] = require(Modules.AvatarExperience.AvatarEditor.Components.Prompts.EquipOutfitConfirmation)
	},
	{
		[AvatarScreen.LeaveCatalogToAvatarPrompt] = require(Modules.AvatarExperience.Common.Components.ItemDetails.Prompts.LeaveCatalogToAvatarPrompt)
	},
	{
		[AvatarScreen.InsufficientRobuxPrompt] = require(Modules.AvatarExperience.Common.Components.ItemDetails.Prompts.InsufficientRobuxPrompt)
	},
	{
		[AvatarScreen.RobuxUpsellPrompt] = require(Modules.LuaApp.Components.RobuxUpsell.RobuxUpsellContainer)
	},
	{
		[AvatarScreen.PremiumSellOnlyPrompt] = require(Modules.AvatarExperience.Common.Components.ItemDetails.Prompts.PremiumSellOnlyPrompt)
	},
	{
		[AvatarScreen.SellItemPrompt] = require(Modules.AvatarExperience.Common.Components.ItemDetails.Prompts.SellItemPrompt)
	},
	{
		[AvatarScreen.RemoveCurrentlySellingItemPrompt] = require(Modules.AvatarExperience.Common.Components.ItemDetails.Prompts.RemoveCurrentlySellingItemPrompt)
	},
	{
		[AvatarScreen.RemoveItemPrompt] = require(Modules.AvatarExperience.LayeredClothingSort.Components.Prompts.RemoveItemPrompt)
	},
	{
		[AvatarScreen.ResetLayeredItemsSortPrompt] = require(Modules.AvatarExperience.LayeredClothingSort.Components.Prompts.ResetLayeredItemsSortPrompt)
	},
	{
		[AvatarScreen.ResetToNewCharacterPrompt] = require(Modules.AvatarExperience.Common.Components.ItemDetails.Prompts.ResetToNewCharacterPrompt)
	},
	{
		[AvatarScreen.OutfitIncompletePrompt] = require(Modules.AvatarExperience.Common.Components.ItemDetails.Prompts.OutfitIncompletePrompt)
	},
	{
		[AvatarScreen.PurchaseOutfitPrompt] = require(Modules.AvatarExperience.Common.Components.ItemDetails.Prompts.PurchaseOutfitPrompt)
	},
	{
		[AvatarScreen.PurchaseCatalogItem] = require(Modules.AvatarExperience.Common.Components.ItemDetails.Prompts.PurchasePrompt)
	},
	{
		[AvatarScreen.CreateOrUpdateOutfitMenu] = require(Modules.AvatarExperience.AvatarEditor.Components.Prompts.CreateOrUpdateOutfitMenu)
	},
	{
		[AvatarScreen.AvatarExperienceQuickMenu] = require(Modules.AvatarExperience.Common.Components.AvatarExperienceQuickMenu)
	},
	{
		[AvatarScreen.CatalogContextMenu] = {
			screen = require(Modules.AvatarExperience.Common.Components.ItemDetails.CatalogContextFrame),
			navigationOptions = { overlayTransparency = 1 }
		}
	},
	{
		[AvatarScreen.LCSortContextMenu] = {
			screen = require(Modules.AvatarExperience.LayeredClothingSort.Components.Prompts.LCSortContextFrame),
			navigationOptions = { overlayTransparency = 1 }
		}
	},
	{
		[AvatarScreen.AXTransitionContextualMenu] = {
			screen = require(Modules.AvatarExperience.Common.Components.AXTransitionContextualMenu),
			navigationOptions = { overlayTransparency = 1 }
		}
	},
	{
		[AvatarScreen.R15UpgradePrompt] = require(Modules.AvatarExperience.Common.Components.Prompts.R15UpgradePrompt)
	},
	{
		[AvatarScreen.AccessoryAdjustmentResetPrompt] = require(Modules.AvatarExperience.AccessoryAdjustment.Components.AccessoryAdjustmentResetPrompt)
	},
	{
		[AvatarScreen.AccessoryAdjustmentUnsavedPrompt] = require(Modules.AvatarExperience.AccessoryAdjustment.Components.AccessoryAdjustmentUnsavedPrompt)
	},
	{
		[AvatarScreen.ItemExperiencesMenu] = require(Modules.AvatarExperience.Catalog.Components.ItemToExperienceModal)
	},
	{
		[AvatarScreen.CommunityAvatarEntryMenu] = require(Modules.AvatarExperience.AvatarEditor.Components.Prompts.CommunityAvatarEntryMenu)
	},
	{
		[AvatarScreen.ResaleFeePolicyPrompt] = require(Modules.AvatarExperience.Common.Components.ItemDetails.Prompts.ResaleFeePolicyPrompt)
	},
	{
		[AvatarScreen.GenericPrompt] = require(Modules.AvatarExperience.Common.Components.ItemDetails.Prompts.GenericPrompt)
	},
	{
		[AvatarScreen.ContextMenu] = {
			screen = require(Modules.AvatarExperience.Common.Components.ItemDetails.Prompts.ContextFrame),
			navigationOptions = { overlayTransparency = 1 }
		}
	},
	{
		[AvatarScreen.PurchaseLookPrompt] = if FFlagAXMISEnableMultiShopping then PurchaseLookPromptMISModule else PurchaseLookPromptModule
	},
	{
		[AvatarScreen.OpenExperienceTraversalPrompt] = require(Modules.AvatarExperience.Common.Components.ItemDetails.Prompts.OpenExperienceTraversalPrompt)
	},
	{
		[AvatarScreen.CommunityAvatarSharePrompt] = require(Modules.AvatarExperience.Catalog.Components.LookDetails.CommunityAvatarSharePrompt)
	},
	{
		[AvatarScreen.DeleteAvatarConfirmationPrompt] = require(Modules.AvatarExperience.Catalog.Components.LookDetails.DeleteAvatarConfirmationPrompt)
	},
	{
		[AvatarScreen.ProfilePictureEditorRevertToDefaultPrompt] = require(Modules.AvatarExperience.ProfilePictureEditor.Components.ProfilePictureEditorRevertToDefaultPrompt)
	},
	{
		[AvatarScreen.ItemInfoRowPrompt] = require(Modules.AvatarExperience.Common.Components.ItemDetails.Prompts.ItemInfoRowPrompt)
	},
	{
		[AvatarScreen.LooksConfirmationPrompt] = require(Modules.AvatarExperience.AvatarEditor.Components.LookComposer.LooksConfirmationPrompt)
	}
}

if require(Modules.AvatarExperience.Flags.GetFFlagEnableCollectiblesInfoPrompt)() then
	table.insert(AvatarPromptDescriptorsModule, {
		[AvatarScreen.CollectiblesInfoPrompt] = CollectiblesInfoPromptModule
	})
end
if GetFFlagLuafiedReportEntryPointsFunction() then
	table.insert(AvatarPromptDescriptorsModule, {
		[AvatarScreen.ReportDialog] = CatalogReportContainerModule
	})
end
if FFlagAXEnableClearAllConfirmationPromptModule then
	table.insert(AvatarPromptDescriptorsModule, {
		[AvatarScreen.SlotEditorClearAllConfirmationPrompt] = SlotEditorClearAllConfirmationPromptModule
	})
end
if FFlagAXEnableManualSavingBlockingPrompt then
	table.insert(AvatarPromptDescriptorsModule, {
		[AvatarScreen.SaveAvatarOnLeaveAvatarExperiencePrompt] = SaveAvatarOnLeaveAvatarExperiencePromptModule
	})
end
if FFlagAXEnableEnhancedAvatarHeadsFtux then
	table.insert(AvatarPromptDescriptorsModule, {
		[AvatarScreen.EnhancedAvatarHeadsFtuxPrompt] = EnhancedAvatarHeadsFtuxPrompt
	})
end
if FFlagAXMISEnableMultiShopping then
	table.insert(AvatarPromptDescriptorsModule, {
		[AvatarScreen.WearAvatarReplaceAllItemsPrompt] = WearAvatarReplaceAllItemsPrompt
	})
	table.insert(AvatarPromptDescriptorsModule, {
		[AvatarScreen.ClearAllItemsOnAvatarPrompt] = ClearAllItemsOnAvatarPrompt
	})
	table.insert(AvatarPromptDescriptorsModule, {
		[AvatarScreen.CartUnavailableItemsPrompt] = CartUnavailableItemsPrompt
	})
	table.insert(AvatarPromptDescriptorsModule, {
		[AvatarScreen.ItemReplacedOnAvatarPrompt] = ItemReplacedOnAvatarPrompt
	})
end
if FFlagAXMakeupReleaseFTUX then
	table.insert(AvatarPromptDescriptorsModule, {
		[AvatarScreen.MakeupReleaseFtuxPrompt] = MakeupReleaseFtuxPromptModule
	})
end
table.insert(AvatarPromptDescriptorsModule, {
	[AvatarScreen.ItemsUnavailablePrompt] = RoactRoduxModule.connect(nil, function(Callback)
		-- upvalues: AppPageModule (copy), UrlBuilderModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownModule (copy)
		return {
			navigateDown = function()
				-- upvalues: AppPageModule (upval), UrlBuilderModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownModule (upval)
				local config = {
					name = AppPageModule.GenericWebPage,
					detail = UrlBuilderModule.UrlBuilder.static.messages(),
					extraProps = { titleKey = "CommonUI.Features.Label.Messages" }
				}
				
				if FFlagSignalsNavP3Dispatch then
					NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
					
					return
				else
					return Callback(NavigateDownModule(config))
				end
			end
		}
	end)(ItemsUnavailablePrompt)
})

if FFlagAXCatalogMakeupSupport then
	table.insert(AvatarPromptDescriptorsModule, {
		[AvatarScreen.MakeupMax6LayersPrompt] = MakeupMax6LayersPromptModule
	})
end
if FFlagAXAvatarTimeoutFlow then
	table.insert(AvatarPromptDescriptorsModule, { [AvatarScreen.TimeoutStatusPrompt] = TimeoutStatusPrompt })
end
if FFlagAXOutfitPageRevamp then
	table.insert(AvatarPromptDescriptorsModule, {
		[AvatarScreen.AddOutfitDialog] = AddOutfitDialogContainerModule
	})
	table.insert(AvatarPromptDescriptorsModule, {
		[AvatarScreen.DuplicateOutfitDialog] = DuplicateOutfitDialogContainerModule
	})
	table.insert(AvatarPromptDescriptorsModule, {
		[AvatarScreen.DuplicateOutfitNameDialog] = DuplicateOutfitNameDialogContainerModule
	})
end
return AvatarPromptDescriptorsModule