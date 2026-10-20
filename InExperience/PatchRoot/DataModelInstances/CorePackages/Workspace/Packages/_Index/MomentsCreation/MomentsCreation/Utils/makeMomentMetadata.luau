local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local _ = require(MomentsCreation.Parent.MomentsTypes)
local ConstantsModule = require(MomentsCreation.Constants)

return function(Sound, Description, Edits, p1: number, CommentsEnabled)
	-- upvalues: ConstantsModule (copy)
	return {
		assetTotalDuration = if Sound.CaptureType == Enum.CaptureType.Screenshot then ConstantsModule.ScreenshotMusicDuration elseif p1 == nil or p1 <= 0 then Sound.TimeLength else p1,
		captureType = Sound.CaptureType,
		description = Description,
		universeId = Sound.SourceUniverseId,
		placeId = Sound.SourcePlaceId,
		edits = Edits,
		commentsEnabled = CommentsEnabled
	}
end