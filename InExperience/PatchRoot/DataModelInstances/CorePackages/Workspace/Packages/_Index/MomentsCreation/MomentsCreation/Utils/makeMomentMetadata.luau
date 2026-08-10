local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local _ = require(momentsCreation.Parent.MomentsTypes)
local constantsModule = require(momentsCreation.Constants)

return function(p0, p1, p2, p3) --[[ line: 27 | named "makeMomentMetadata" ]]
	-- upvalues: constantsModule (ref)
	return {
		assetTotalDuration = if p0.CaptureType == Enum.CaptureType.Screenshot then constantsModule.ScreenshotMusicDuration elseif p3 == nil or p3 <= 0 then p0.TimeLength else p3,
		captureType = p0.CaptureType,
		description = p1,
		universeId = p0.SourceUniverseId,
		placeId = p0.SourcePlaceId,
		edits = p2
	}
end