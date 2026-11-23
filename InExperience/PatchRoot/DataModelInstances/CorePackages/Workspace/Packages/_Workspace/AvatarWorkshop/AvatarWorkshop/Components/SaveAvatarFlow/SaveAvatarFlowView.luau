local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local ReactModule = require(AvatarWorkshop.Parent.React)
local AddAvatarDialogModule = require(AvatarWorkshop.Components.AddAvatarDialog.AddAvatarDialog)
local DuplicateAvatarDialogModule = require(AvatarWorkshop.Components.DuplicateAvatarDialog.DuplicateAvatarDialog)
local NameAvatarDialogModule = require(AvatarWorkshop.Components.NameAvatarDialog.NameAvatarDialog)
local _ = require(AvatarWorkshop.Stores.AvatarStateTypes)
local SaveAvatarFlowStepEnumModule = require(AvatarWorkshop.Enums.SaveAvatarFlowStepEnum)

return function(p1)
	-- upvalues: SaveAvatarFlowStepEnumModule (copy), ReactModule (copy), DuplicateAvatarDialogModule (copy), AddAvatarDialogModule (copy), NameAvatarDialogModule (copy)
	return if p1.step == SaveAvatarFlowStepEnumModule.DuplicateNotice then ReactModule.createElement(DuplicateAvatarDialogModule, {
		outfitName = p1.duplicateOutfitName,
		onConfirm = p1.onConfirmDuplicate,
		onCancel = p1.onCancel
	}) elseif p1.step == SaveAvatarFlowStepEnumModule.AddAvatar then ReactModule.createElement(AddAvatarDialogModule, { onConfirm = p1.onConfirmAvatar, onCancel = p1.onCancel }) elseif p1.step == SaveAvatarFlowStepEnumModule.NameAvatar then ReactModule.createElement(NameAvatarDialogModule, {
		defaultName = p1.defaultName,
		onConfirm = p1.onConfirmName,
		onCancel = p1.onCancel
	}) else nil
end