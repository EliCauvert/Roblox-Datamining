local MomentsCommonModule = require(script:FindFirstAncestor("MomentsCreationFlow").Parent.MomentsCommon)

return function(Sound, Description, Edits) --[[ Line: 9 | Named "makeMomentMetadata" ]]
	-- upvalues: MomentsCommonModule (copy)
	return {
		assetTotalDuration = if Sound.CaptureType == Enum.CaptureType.Screenshot then MomentsCommonModule.Constants.ScreenshotMusicDuration else Sound.TimeLength,
		captureType = Sound.CaptureType,
		description = Description,
		universeId = Sound.SourceUniverseId,
		placeId = Sound.SourcePlaceId,
		edits = Edits
	}
end