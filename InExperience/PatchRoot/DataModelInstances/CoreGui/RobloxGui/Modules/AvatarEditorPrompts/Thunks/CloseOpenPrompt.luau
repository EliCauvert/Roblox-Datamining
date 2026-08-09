local avatarEditorService = game:GetService("AvatarEditorService")
local corePackagesService = game:GetService("CorePackages")
local parent = script.Parent.Parent
local closeOpenPromptModule = require(parent.Actions.CloseOpenPrompt)
local promptTypeModule = require(parent.PromptType)
local fFlagAXAvatarTimeoutFlowIE = require(corePackagesService.Workspace.Packages.AvatarExperienceFlags).FFlagAXAvatarTimeoutFlowIE

return function(p0) --[[ line: 10 ]]
	-- upvalues: promptTypeModule (ref), avatarEditorService (ref), fFlagAXAvatarTimeoutFlowIE (ref), closeOpenPromptModule (ref)
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
	elseif fFlagAXAvatarTimeoutFlowIE and promptType == promptTypeModule.SaveAvatarTimeout then
		avatarEditorService:SignalSaveAvatarPermissionDenied()
	elseif promptType ~= nil then
		error("CloseOpenPrompt for unhandled prompt type " .. tostring(promptType))
	end
	p0:dispatch(closeOpenPromptModule())
end