local Parent = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local _ = require(script.Parent.OutfitDetailsActionBar)
local AvatarScreen = require(Parent.AvatarExperienceNavigation).Enums.AvatarScreen

return function(Frame) --[[ Line: 17 | Named "useOutfitDetailsActionBarProps" ]]
	-- upvalues: UseNavigationFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), AvatarScreen (copy)
	local UseNavigationResult = UseNavigationFunction()
	local OutfitId = Frame.outfitId
	local UseLocalizationResult = UseLocalizationFunction({
		rename = "Feature.Avatar.Action.Rename",
		delete = "Feature.Avatar.Action.Delete"
	})
	
	return {
		renameText = UseLocalizationResult.rename,
		deleteText = UseLocalizationResult.delete,
		onRenameOutfit = ReactModule.useCallback(function() --[[ Line: 26 ]]
			-- upvalues: UseNavigationResult (copy), AvatarScreen (upval), OutfitId (copy)
			UseNavigationResult.navigate(AvatarScreen.RenameOutfitDialog, { outfitId = OutfitId })
		end, { UseNavigationResult, OutfitId }),
		onDeleteOutfit = ReactModule.useCallback(function() --[[ Line: 32 ]]
			-- upvalues: UseNavigationResult (copy), AvatarScreen (upval), OutfitId (copy)
			UseNavigationResult.navigate(AvatarScreen.DeleteOutfitDialog, { outfitIds = { OutfitId } })
		end, { UseNavigationResult, OutfitId }),
		LayoutOrder = Frame.LayoutOrder
	}
end