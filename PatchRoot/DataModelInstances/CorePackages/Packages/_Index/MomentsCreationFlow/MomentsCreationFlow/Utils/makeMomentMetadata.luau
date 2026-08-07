-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:51 2026 Pacific Standard Time.

local momentsCommonModule = require(script:FindFirstAncestor("MomentsCreationFlow").Parent.MomentsCommon)

return function(p0, p1, p2) --[[ line: 9 | named "makeMomentMetadata" ]]
	-- upvalues: momentsCommonModule (ref)
	return {
		assetTotalDuration = if p0.CaptureType == Enum.CaptureType.Screenshot then momentsCommonModule.Constants.ScreenshotMusicDuration else p0.TimeLength,
		captureType = p0.CaptureType,
		description = p1,
		universeId = p0.SourceUniverseId,
		placeId = p0.SourcePlaceId,
		edits = p2
	}
end