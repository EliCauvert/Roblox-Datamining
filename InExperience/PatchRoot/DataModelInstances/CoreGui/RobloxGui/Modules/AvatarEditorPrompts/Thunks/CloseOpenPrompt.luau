local avatarEditorService = game:GetService("AvatarEditorService")
local parent = script.Parent.Parent
local closeOpenPromptModule = require(parent.Actions.CloseOpenPrompt)
local promptTypeModule = require(parent.PromptType)

return function(p0) --[[ line: 8 ]]
	-- upvalues: promptTypeModule (ref), avatarEditorService (ref), closeOpenPromptModule (ref)
	local promptType = p0:getState().promptInfo.promptType
	
	if promptType == promptTypeModule.AllowInventoryReadAccess then
		avatarEditorService:SetAllowInventoryReadAccess(false)
	elseif promptType == promptTypeModule.SaveAvatar then
		avatarEditorService:SignalSaveAvatarPermissionDenied()
	elseif promptType == promptTypeModule.CreateOutfit then
		avatarEditorService:SignalCreateOutfitPermissionDenied()
	elseif promptType == promptTypeModule.EnterOutfitName then
		avatarEditorService:SignalCreateOutfitPermissionDenied()
	elseif promptType == promptTypeModule.SetFavorite then
		avatarEditorService:SignalSetFavoritePermissionDenied()
	elseif promptType == promptTypeModule.DeleteOutfit then
		avatarEditorService:SignalDeleteOutfitPermissionDenied()
	elseif promptType == promptTypeModule.RenameOutfit then
		avatarEditorService:SignalRenameOutfitPermissionDenied()
	elseif promptType == promptTypeModule.UpdateOutfit then
		avatarEditorService:SignalUpdateOutfitPermissionDenied()
	elseif promptType == promptTypeModule.SaveAvatarTimeout then
		avatarEditorService:SignalSaveAvatarPermissionDenied()
	elseif promptType ~= nil then
		error("CloseOpenPrompt for unhandled prompt type " .. tostring(promptType))
	end
	p0:dispatch(closeOpenPromptModule())
end