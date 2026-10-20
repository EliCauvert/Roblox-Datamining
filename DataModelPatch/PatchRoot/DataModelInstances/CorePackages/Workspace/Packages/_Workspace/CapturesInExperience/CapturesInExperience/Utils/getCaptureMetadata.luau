local Parent = script.Parent.Parent
local CaptureTypeModule = require(Parent.Enums.CaptureType)
local _ = require(Parent.Types)
local FFlagUseRbxstorageInGalleryModule = require(Parent.Flags.FFlagUseRbxstorageInGallery)
local FFlagEnableCapturesGalleryRetrievalCoreScriptModule = require(Parent.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript)
local DontAssertOnUserIDInCaptureMetadata = game:DefineFastFlag("DontAssertOnUserIDInCaptureMetadata", false)

return function(Capture)
	-- upvalues: FFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), FFlagUseRbxstorageInGalleryModule (copy), CaptureTypeModule (copy), DontAssertOnUserIDInCaptureMetadata (copy)
	if FFlagEnableCapturesGalleryRetrievalCoreScriptModule and Capture.CaptureTime ~= nil then
		return {
			userId = 0,
			placeId = Capture.SourcePlaceId,
			unixTimestamp = Capture.CaptureTime.UnixTimestampMillis
		}
	end
	if FFlagUseRbxstorageInGalleryModule and Capture.type == CaptureTypeModule.Video then
		local Number: number? = tonumber(Capture.userId)
		
		if not DontAssertOnUserIDInCaptureMetadata then
			assert(Number ~= nil, "userId should not be nil")
		end
		return {
			userId = Number or 0,
			placeId = Capture.placeId,
			unixTimestamp = Capture.creationTimestamp
		}
	else
		if FFlagUseRbxstorageInGalleryModule and Capture.type ~= CaptureTypeModule.Screenshot then
			return nil
		end
		local Match, Match2, Match3 = string.match(Capture.filePath, "(%d+)_(%d+)_(%d+)%.?%w*$")
		
		if Match == nil or Match2 == nil or Match3 == nil then
			return nil
		end
		local Number: number? = tonumber(Match)
		local Number1: number? = tonumber(Match2)
		local Number2: number? = tonumber(Match3)
		
		if not DontAssertOnUserIDInCaptureMetadata then
			assert(Number ~= nil, "userId should not be nil")
		end
		assert(Number1 ~= nil, "placeId should not be nil")
		assert(Number2 ~= nil, "unixTimestamp should not be nil")
		
		return {
			userId = Number or 0,
			placeId = Number1,
			unixTimestamp = Number2
		}
	end
end