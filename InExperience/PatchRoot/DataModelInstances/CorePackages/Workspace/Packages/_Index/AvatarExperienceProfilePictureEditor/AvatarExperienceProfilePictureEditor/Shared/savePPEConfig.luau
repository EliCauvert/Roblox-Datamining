local constantsModule = require(script.Parent.Parent.Constants)

local function buildApplyConfig(p1)
	-- upvalues: constantsModule (ref)
	local var1 = if p1.emoteAssetId then tonumber(p1.emoteAssetId) or 0 else 0
	local t = {
		ThumbnailCustomizations = {
			{
				ThumbnailType = Enum.AvatarThumbnailCustomizationType.Closeup.Value,
				EmoteAssetId = var1,
				Camera = {
					FieldOfViewDeg = p1.fieldOfViewDeg,
					YRotDeg = p1.cameraYRotDeg,
					DistanceScale = p1.cameraDistanceScale
				}
			},
			{
				ThumbnailType = Enum.AvatarThumbnailCustomizationType.FullBody.Value,
				EmoteAssetId = var1,
				Camera = {
					FieldOfViewDeg = p1.fieldOfViewDeg,
					YRotDeg = p1.cameraYRotDeg,
					DistanceScale = constantsModule.FullBodyDistanceScale
				}
			}
		}
	}
	
	if p1.profileFrameAssetId ~= nil then
		t.FrameAssetId = p1.profileFrameAssetId
	end
	return t
end

local function applyProfileConfiguration(p1, p2)
	local var1 = p1:NoPromptApplyProfileConfiguration(p2)
	while not var1 do
		p1.PromptApplyProfileConfigurationCompleted:Wait()
		var1 = p1:NoPromptApplyProfileConfiguration(p2)
	end
	return p1.PromptApplyProfileConfigurationCompleted:Wait() == Enum.AvatarPromptResult.Success
end

return {
	saveCloseupAndFullBody = function(p3)
		-- upvalues: buildApplyConfig (ref), applyProfileConfiguration (ref)
		return if applyProfileConfiguration(p3.avatarEditorService or game:GetService("AvatarEditorService"), buildApplyConfig(p3)) then { ok = true } else { ok = false }
	end
}