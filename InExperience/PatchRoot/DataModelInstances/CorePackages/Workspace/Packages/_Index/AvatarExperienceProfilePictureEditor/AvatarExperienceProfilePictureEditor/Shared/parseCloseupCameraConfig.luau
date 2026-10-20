local ConstantsModule = require(script.Parent.Parent.Constants)

return function(p1)
	-- upvalues: ConstantsModule (copy)
	local DefaultDistanceScale = ConstantsModule.DefaultDistanceScale
	local DefaultYRotDeg = ConstantsModule.DefaultYRotDeg
	local DefaultFieldOfViewDeg = ConstantsModule.DefaultFieldOfViewDeg
	local EmoteAssetId: string? = nil
	local AvatarThumbnailCustomizations = p1 and p1.avatarThumbnailCustomizations
	
	if AvatarThumbnailCustomizations then
		for _, avatarThumbnailCustomization in AvatarThumbnailCustomizations do
			if avatarThumbnailCustomization.thumbnailType == ConstantsModule.CloseupThumbnailTypeApi then
				if avatarThumbnailCustomization.emoteAssetId and avatarThumbnailCustomization.emoteAssetId ~= 0 then
					EmoteAssetId = tostring(avatarThumbnailCustomization.emoteAssetId)
				end
				local Camera = avatarThumbnailCustomization.camera
				
				if not Camera then break end
				local DistanceScale = Camera.distanceScale
				
				if typeof(DistanceScale) == "number" and DistanceScale ~= -1 then
					DefaultDistanceScale = DistanceScale
				end
				if typeof(Camera.yRotDeg) == "number" then
					DefaultYRotDeg = Camera.yRotDeg
				end
				if typeof(Camera.fieldOfViewDeg) ~= "number" or Camera.fieldOfViewDeg <= 0 then break end
				DefaultFieldOfViewDeg = Camera.fieldOfViewDeg
				break
			else
				continue
			end
		end
	end
	return {
		distanceScale = DefaultDistanceScale,
		yRotDeg = DefaultYRotDeg,
		fieldOfViewDeg = DefaultFieldOfViewDeg,
		emoteAssetId = EmoteAssetId
	}
end