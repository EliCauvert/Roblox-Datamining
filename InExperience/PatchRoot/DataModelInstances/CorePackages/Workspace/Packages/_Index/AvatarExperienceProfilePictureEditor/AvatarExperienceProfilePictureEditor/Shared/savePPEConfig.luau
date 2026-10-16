local ConstantsModule = require(script.Parent.Parent.Constants)

local function buildApplyConfig(p1) --[[ Line: 32 ]]
	-- upvalues: ConstantsModule (copy)
	local Number: number = p1.emoteAssetId and tonumber(p1.emoteAssetId) or 0
	local config = {
		ThumbnailCustomizations = {
			{
				ThumbnailType = Enum.AvatarThumbnailCustomizationType.Closeup.Value,
				EmoteAssetId = Number,
				Camera = {
					FieldOfViewDeg = p1.fieldOfViewDeg,
					YRotDeg = p1.cameraYRotDeg,
					DistanceScale = p1.cameraDistanceScale
				}
			},
			{
				ThumbnailType = Enum.AvatarThumbnailCustomizationType.FullBody.Value,
				EmoteAssetId = Number,
				Camera = {
					FieldOfViewDeg = p1.fieldOfViewDeg,
					YRotDeg = p1.cameraYRotDeg,
					DistanceScale = ConstantsModule.FullBodyDistanceScale
				}
			}
		}
	}
	
	if p1.profileFrameAssetId ~= nil then
		config.FrameAssetId = p1.profileFrameAssetId
	end
	return config
end

local function applyProfileConfiguration(AvatarEditorService, ProfileConfiguration): boolean --[[ Line: 65 ]]
	local NoPromptApplyProfileConfigurationResult = AvatarEditorService:NoPromptApplyProfileConfiguration(ProfileConfiguration)
	while not NoPromptApplyProfileConfigurationResult do
		AvatarEditorService.PromptApplyProfileConfigurationCompleted:Wait()
		NoPromptApplyProfileConfigurationResult = AvatarEditorService:NoPromptApplyProfileConfiguration(ProfileConfiguration)
	end
	return AvatarEditorService.PromptApplyProfileConfigurationCompleted:Wait() == Enum.AvatarPromptResult.Success
end

return {
	saveCloseupAndFullBody = function(p1) --[[ Line: 83 ]]
		-- upvalues: buildApplyConfig (copy), applyProfileConfiguration (copy)
		local AvatarEditorService = p1.avatarEditorService or game:GetService("AvatarEditorService")
		
		return if applyProfileConfiguration(AvatarEditorService, (buildApplyConfig(p1))) then { ok = true } else { ok = false }
	end
}