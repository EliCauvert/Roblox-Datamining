local _ = require(script:FindFirstAncestor("ProfilePlatform").Parent.DataHydration.MomentsStoreTypes)

return function(p1): boolean
	return p1.metadata.isMomentScene ~= true and p1.metadata.captureType == Enum.CaptureType.Video
end