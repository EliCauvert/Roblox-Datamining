local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local _ = require(momentsCreation.Parent.MomentsTypes)
local constantsModule = require(momentsCreation.Constants)

return function(p1, p2, p3, p4)
	-- upvalues: constantsModule (ref)
	return {
		assetTotalDuration = if p1.CaptureType == Enum.CaptureType.Screenshot then constantsModule.ScreenshotMusicDuration elseif p4 == nil or p4 <= 0 then p1.TimeLength else p4,
		captureType = p1.CaptureType,
		description = p2,
		universeId = p1.SourceUniverseId,
		placeId = p1.SourcePlaceId,
		edits = p3
	}
end