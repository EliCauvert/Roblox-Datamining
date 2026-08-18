local constantsModule = require(script.Parent.Constants)

return function(p0) --[[ line: 15 | named "parseCloseupCameraConfig" ]]
	-- upvalues: constantsModule (ref)
	local defaultDistanceScale = constantsModule.DefaultDistanceScale
	local defaultYRotDeg = constantsModule.DefaultYRotDeg
	local defaultFieldOfViewDeg = constantsModule.DefaultFieldOfViewDeg
	local var1 = nil
	local avatarThumbnailCustomizations = p0 and p0.avatarThumbnailCustomizations
	
	if avatarThumbnailCustomizations then
		for i, v in avatarThumbnailCustomizations do
			if v.thumbnailType == constantsModule.CloseupThumbnailTypeApi then
				if v.emoteAssetId and v.emoteAssetId ~= 0 then
					var1 = tostring(v.emoteAssetId)
				end
				local camera = v.camera
				
				if not camera then break end
				local distanceScale = camera.distanceScale
				
				if typeof(distanceScale) == "number" and distanceScale ~= -1 then
					defaultDistanceScale = distanceScale
				end
				if typeof(camera.yRotDeg) == "number" then
					defaultYRotDeg = camera.yRotDeg
				end
				if typeof(camera.fieldOfViewDeg) ~= "number" or camera.fieldOfViewDeg <= 0 then break end
				defaultFieldOfViewDeg = camera.fieldOfViewDeg
				break
			end
		end
	end
	return {
		distanceScale = defaultDistanceScale,
		yRotDeg = defaultYRotDeg,
		fieldOfViewDeg = defaultFieldOfViewDeg,
		emoteAssetId = var1
	}
end