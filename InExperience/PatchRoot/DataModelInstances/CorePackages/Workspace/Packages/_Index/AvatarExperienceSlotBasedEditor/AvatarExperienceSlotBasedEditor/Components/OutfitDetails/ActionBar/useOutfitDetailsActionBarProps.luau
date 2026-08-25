local parent = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useNavigation = require(parent.Navigation).useNavigation
local _ = require(script.Parent.OutfitDetailsActionBar)
local avatarScreen = require(parent.AvatarExperienceNavigation).Enums.AvatarScreen

return function(p0)
	-- upvalues: useNavigation (ref), useLocalization (ref), reactModule (ref), avatarScreen (ref)
	local var1 = useNavigation()
	local outfitId = p0.outfitId
	local var2 = useLocalization({
		rename = "Feature.Avatar.Action.Rename",
		delete = "Feature.Avatar.Action.Delete"
	})
	
	return {
		renameText = var2.rename,
		deleteText = var2.delete,
		onRenameOutfit = reactModule.useCallback(function()
			-- upvalues: var1 (ref), avatarScreen (copy), outfitId (ref)
			var1.navigate(avatarScreen.RenameOutfitDialog, { outfitId = outfitId })
		end, { var1, outfitId }),
		onDeleteOutfit = reactModule.useCallback(function()
			-- upvalues: var1 (ref), avatarScreen (copy), outfitId (ref)
			var1.navigate(avatarScreen.DeleteOutfitDialog, { outfitIds = { outfitId } })
		end, { var1, outfitId }),
		LayoutOrder = p0.LayoutOrder
	}
end