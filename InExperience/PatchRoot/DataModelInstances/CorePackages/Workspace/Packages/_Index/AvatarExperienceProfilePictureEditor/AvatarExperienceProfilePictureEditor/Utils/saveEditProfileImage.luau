local AvatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local ProfileRefreshSignal = require(AvatarExperienceProfilePictureEditor.Parent.ProfilePlatformCommon).Signals.ProfileRefreshSignal
local UserAvatarConfigurationsCacheModule = require(AvatarExperienceProfilePictureEditor.Api.userAvatarConfigurationsCache)
local SaveCloseupAndFullBodyFunction = require(AvatarExperienceProfilePictureEditor.Shared.savePPEConfig).saveCloseupAndFullBody

return function(p1): boolean
	-- upvalues: SaveCloseupAndFullBodyFunction (copy), UserAvatarConfigurationsCacheModule (copy), ProfileRefreshSignal (copy)
	local Success, Result = pcall(function()
		-- upvalues: SaveCloseupAndFullBodyFunction (upval), p1 (copy)
		return SaveCloseupAndFullBodyFunction({
			emoteAssetId = p1.emoteAssetId,
			cameraDistanceScale = p1.cameraDistanceScale,
			cameraYRotDeg = p1.cameraYRotDeg,
			fieldOfViewDeg = p1.fieldOfViewDeg,
			profileFrameAssetId = p1.profileFrameAssetId
		})
	end)
	
	if not Success or not Result.ok then
		return false
	end
	if p1.localUserId then
		UserAvatarConfigurationsCacheModule.invalidate(p1.localUserId)
	end
	ProfileRefreshSignal.notifyProfileRefresh()
	
	return true
end