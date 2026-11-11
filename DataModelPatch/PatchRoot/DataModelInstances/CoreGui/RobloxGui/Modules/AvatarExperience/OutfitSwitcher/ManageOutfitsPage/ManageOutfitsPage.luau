local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local NavOverlayScreenContainerModule = require(Modules.AvatarExperience.Common.Components.NavOverlayScreenContainer)
local OutfitSelectionGridContainerModule = require(Modules.AvatarExperience.AvatarEditor.Components.OutfitSelectionGrid.OutfitSelectionGridContainer)
local ManageActionBarModule = require(Modules.AvatarExperience.AvatarEditor.Components.AssetManagement.ManageActionBar)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local Button = FoundationModule.Button
local ButtonSize = FoundationModule.Enums.ButtonSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconButton = FoundationModule.IconButton
local IconName = FoundationModule.Enums.IconName
local View = FoundationModule.View

return function(p1)
	-- upvalues: ReactModule (copy), IconButton (copy), IconName (copy), ButtonVariant (copy), ButtonSize (copy), Button (copy), NavOverlayScreenContainerModule (copy), View (copy), OutfitSelectionGridContainerModule (copy), AvatarScreen (copy), ManageActionBarModule (copy)
	return ReactModule.createElement(NavOverlayScreenContainerModule, {
		ZIndex = 1,
		headerBarProps = {
			title = p1.titleText,
			renderLeft = ReactModule.useCallback(function()
				-- upvalues: ReactModule (upval), IconButton (upval), IconName (upval), ButtonVariant (upval), ButtonSize (upval), p1 (copy)
				return ReactModule.createElement(IconButton, {
					icon = IconName.ChevronLargeLeft,
					variant = ButtonVariant.Utility,
					size = ButtonSize.Medium,
					onActivated = p1.onBackActivated
				})
			end, { p1.onBackActivated }),
			renderRight = ReactModule.useCallback(function()
				-- upvalues: ReactModule (upval), Button (upval), p1 (copy), ButtonVariant (upval), ButtonSize (upval)
				return ReactModule.createElement(Button, {
					text = p1.selectActionText,
					variant = ButtonVariant.Link,
					size = ButtonSize.Medium,
					onActivated = p1.onSelectActivated
				})
			end, { p1.selectActionText, p1.onSelectActivated })
		}
	}, {
		Body = ReactModule.createElement(View, {
			tag = "fill size-full clip bg-surface-0",
			LayoutOrder = 1
		}, {
			OutfitSelectionGrid = ReactModule.createElement(OutfitSelectionGridContainerModule, {
				isEditable = true,
				outfitType = p1.outfitType,
				onToggleOutfitCard = p1.onToggleOutfitCard,
				selectedOutfits = p1.selectedOutfits,
				setSelectedOutfits = p1.setSelectedOutfits,
				setCanScroll = p1.setCanScroll,
				multiSelect = p1.multiSelect,
				goBack = p1.onBackActivated,
				pageOwner = AvatarScreen.ManageOutfitsPage,
				ref = p1.gridRef
			}),
			ManageActionBar = p1.multiSelect and ReactModule.createElement(ManageActionBarModule, {
				multiSelect = true,
				ZIndex = 2,
				gradientFade = p1.outfitGridCanScroll,
				selectedOutfits = p1.selectedOutfits,
				deleteOutfit = p1.deleteOutfit,
				renameOutfit = p1.renameOutfit,
				ref = p1.actionBarRef
			}) or nil
		})
	})
end