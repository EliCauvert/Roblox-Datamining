local AvatarEditorService = game:GetService("AvatarEditorService")
local Parent = script.Parent.Parent
local CloseOpenPromptModule = require(Parent.Actions.CloseOpenPrompt)
local PromptTypeModule = require(Parent.PromptType)
local FFlagAXAvatarTimeoutFlowIE = require(game:GetService("CorePackages").Workspace.Packages.AvatarExperienceFlags).FFlagAXAvatarTimeoutFlowIE

return function(p1)
	-- upvalues: PromptTypeModule (copy), AvatarEditorService (copy), FFlagAXAvatarTimeoutFlowIE (copy), CloseOpenPromptModule (copy)
	local PromptType = p1:getState().promptInfo.promptType
	
	if PromptType == PromptTypeModule.AllowInventoryReadAccess then
		AvatarEditorService:SetAllowInventoryReadAccess(false)
	elseif PromptType == PromptTypeModule.SaveAvatar then
		AvatarEditorService:SignalSaveAvatarPermissionDenied()
	elseif PromptType == PromptTypeModule.CreateOutfit then
		AvatarEditorService:SignalCreateOutfitPermissionDenied()
	elseif PromptType == PromptTypeModule.EnterOutfitName then
		AvatarEditorService:SignalCreateOutfitPermissionDenied()
	elseif PromptType == PromptTypeModule.SetFavorite then
		AvatarEditorService:SignalSetFavoritePermissionDenied()
	elseif PromptType == PromptTypeModule.DeleteOutfit then
		AvatarEditorService:SignalDeleteOutfitPermissionDenied()
	elseif PromptType == PromptTypeModule.RenameOutfit then
		AvatarEditorService:SignalRenameOutfitPermissionDenied()
	elseif PromptType == PromptTypeModule.UpdateOutfit then
		AvatarEditorService:SignalUpdateOutfitPermissionDenied()
	elseif FFlagAXAvatarTimeoutFlowIE and PromptType == PromptTypeModule.SaveAvatarTimeout then
		AvatarEditorService:SignalSaveAvatarPermissionDenied()
	elseif PromptType ~= nil then
		error("CloseOpenPrompt for unhandled prompt type " .. tostring(PromptType))
	end
	p1:dispatch(CloseOpenPromptModule())
end