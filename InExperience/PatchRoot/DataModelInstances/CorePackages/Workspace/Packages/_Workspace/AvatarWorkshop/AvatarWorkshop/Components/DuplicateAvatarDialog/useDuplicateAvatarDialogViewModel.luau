local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local UseLocalizationFunction = require(AvatarWorkshop.Parent.Localization).Hooks.useLocalization
local UseCanUseCustomOutfitNamesModule = require(AvatarWorkshop.Hooks.useCanUseCustomOutfitNames)
local EscapeRichTextModule = require(AvatarWorkshop.Utils.escapeRichText)
local _ = require(script.Parent.DuplicateAvatarDialogView)

return function(p1)
	-- upvalues: UseCanUseCustomOutfitNamesModule (copy), UseLocalizationFunction (copy), EscapeRichTextModule (copy)
	local IsNotOutfitNameMatch: boolean = UseCanUseCustomOutfitNamesModule() and p1.outfitName ~= ""
	local UseLocalizationResult = UseLocalizationFunction({
		title = "Feature.Avatar.Label.Title.DuplicateAvatar",
		add = "Feature.Avatar.Label.Add",
		cancel = "Feature.Avatar.Action.Cancel",
		body = if IsNotOutfitNameMatch then {
			"Feature.Avatar.Message.AddAvatarAgain",
			prevAvatar = EscapeRichTextModule(p1.outfitName)
		} else "Feature.Avatar.Label.Message.DuplicateAvatar"
	})
	
	return {
		title = UseLocalizationResult.title,
		body = UseLocalizationResult.body,
		addText = UseLocalizationResult.add,
		cancelText = UseLocalizationResult.cancel,
		onConfirm = p1.onConfirm,
		onCancel = p1.onCancel
	}
end