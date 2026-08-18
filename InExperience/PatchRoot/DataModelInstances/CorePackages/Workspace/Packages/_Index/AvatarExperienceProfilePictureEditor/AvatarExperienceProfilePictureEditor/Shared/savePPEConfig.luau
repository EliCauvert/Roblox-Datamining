local constantsModule = require(script.Parent.Parent.Constants)

local function buildApplyConfig(p0) --[[ line: 32 ]]
	-- upvalues: constantsModule (ref)
	local var3 = if p0.emoteAssetId then tonumber(p0.emoteAssetId) or 0 else 0
	local t = {
		ThumbnailCustomizations = {
			{
				ThumbnailType = Enum.AvatarThumbnailCustomizationType.Closeup.Value,
				EmoteAssetId = var3,
				Camera = {
					FieldOfViewDeg = p0.fieldOfViewDeg,
					YRotDeg = p0.cameraYRotDeg,
					DistanceScale = p0.cameraDistanceScale
				}
			},
			{
				ThumbnailType = Enum.AvatarThumbnailCustomizationType.FullBody.Value,
				EmoteAssetId = var3,
				Camera = {
					FieldOfViewDeg = p0.fieldOfViewDeg,
					YRotDeg = p0.cameraYRotDeg,
					DistanceScale = constantsModule.FullBodyDistanceScale
				}
			}
		}
	}
	
	if p0.profileFrameAssetId ~= nil then
		t.FrameAssetId = p0.profileFrameAssetId
	end
	return t
end

local function applyProfileConfiguration(p1, p2) --[[ line: 65 ]]
	local var5 = p1:NoPromptApplyProfileConfiguration(p2)
	while not var5 do
		p1.PromptApplyProfileConfigurationCompleted:Wait()
		var5 = p1:NoPromptApplyProfileConfiguration(p2)
	end
	return p1.PromptApplyProfileConfigurationCompleted:Wait() == Enum.AvatarPromptResult.Success
end

return {
	saveCloseupAndFullBody = function(p3) --[[ line: 83 ]]
		-- upvalues: buildApplyConfig (ref), applyProfileConfiguration (ref)
		return if applyProfileConfiguration(p3.avatarEditorService or game:GetService("AvatarEditorService"), buildApplyConfig(p3)) then { ok = true } else { ok = false }
	end
}