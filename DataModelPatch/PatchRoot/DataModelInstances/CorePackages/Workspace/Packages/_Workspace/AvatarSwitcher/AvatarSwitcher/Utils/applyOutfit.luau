local AvatarEditorService = game:GetService("AvatarEditorService")
local Players = game:GetService("Players")

return function(OutfitId, RigType)
	-- upvalues: Players (copy), AvatarEditorService (copy)
	AvatarEditorService:NoPromptSaveAvatar(if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then Players:GetHumanoidDescriptionFromOutfitIdAsync(OutfitId) else Players:GetHumanoidDescriptionFromOutfitId(OutfitId), RigType, {
		BodyColors = true,
		AvatarType = true,
		Scales = true,
		Assets = true
	})
	AvatarEditorService.PromptSaveAvatarCompleted:Wait()
end