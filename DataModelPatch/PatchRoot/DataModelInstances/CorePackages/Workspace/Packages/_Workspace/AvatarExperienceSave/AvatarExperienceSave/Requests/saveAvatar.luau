local AvatarEditorService = game:GetService("AvatarEditorService")
local Parent = script:FindFirstAncestor("AvatarExperienceSave").Parent
local PromiseModule = require(Parent.Promise)
local _ = require(Parent.LuauPolyfill)

return function(HumanoidDescription, RigType, SaveDict, GearAssetId)
	-- upvalues: PromiseModule (copy), AvatarEditorService (copy)
	return PromiseModule.new(function(Callback: (any) -> (), Callback1: (any) -> ())
		-- upvalues: AvatarEditorService (upval), HumanoidDescription (copy), RigType (copy), SaveDict (copy), GearAssetId (copy)
		local NoPromptSaveAvatarResult = AvatarEditorService:NoPromptSaveAvatar(HumanoidDescription, RigType, SaveDict, GearAssetId)
		while not NoPromptSaveAvatarResult do
			AvatarEditorService.PromptSaveAvatarCompleted:Wait()
			NoPromptSaveAvatarResult = AvatarEditorService:NoPromptSaveAvatar(HumanoidDescription, RigType, SaveDict, GearAssetId)
		end
		local Result, HumanoidDescription1 = AvatarEditorService.PromptSaveAvatarCompleted:Wait()
		
		if Result == Enum.AvatarPromptResult.Success then
			Callback({
				avatarPromptResult = Result,
				humanoidDescriptionWithValidAssets = HumanoidDescription1
			})
			
			return
		else
			Callback1({ avatarPromptResult = Result })
		end
	end)
end