local parent = script.Parent.Parent
local captureTypeModule = require(parent.Enums.CaptureType)
local _ = require(parent.Types)
local fFlagUseRbxstorageInGalleryModule = require(parent.Flags.FFlagUseRbxstorageInGallery)
local fFlagEnableCapturesGalleryRetrievalCoreScriptModule = require(parent.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript)
local dontAssertOnUserIDInCaptureMetadata = game:DefineFastFlag("DontAssertOnUserIDInCaptureMetadata", false)

return function(p0) --[[ line: 11 ]]
	-- upvalues: fFlagEnableCapturesGalleryRetrievalCoreScriptModule (ref), fFlagUseRbxstorageInGalleryModule (ref), captureTypeModule (ref), dontAssertOnUserIDInCaptureMetadata (ref)
	if fFlagEnableCapturesGalleryRetrievalCoreScriptModule and p0.CaptureTime ~= nil then
		return {
			userId = 0,
			placeId = p0.SourcePlaceId,
			unixTimestamp = p0.CaptureTime.UnixTimestampMillis
		}
	elseif fFlagUseRbxstorageInGalleryModule and p0.type == captureTypeModule.Video then
		local var4 = tonumber(p0.userId)
		
		if not dontAssertOnUserIDInCaptureMetadata then
			assert(var4 ~= nil, "userId should not be nil")
		end
		return {
			userId = var4 or 0,
			placeId = p0.placeId,
			unixTimestamp = p0.creationTimestamp
		}
	elseif fFlagUseRbxstorageInGalleryModule and p0.type ~= captureTypeModule.Screenshot then
		return nil
	end
	local match, match_1, match_2 = string.match(p0.filePath, "(%d+)_(%d+)_(%d+)%.?%w*$")
	
	if match == nil or match_1 == nil or match_2 == nil then
		return nil
	end
	local var8 = tonumber(match)
	local var9 = tonumber(match_1)
	local var10 = tonumber(match_2)
	
	if not dontAssertOnUserIDInCaptureMetadata then
		assert(var8 ~= nil, "userId should not be nil")
	end
	assert(var9 ~= nil, "placeId should not be nil")
	assert(var10 ~= nil, "unixTimestamp should not be nil")
	
	return {
		userId = var8 or 0,
		placeId = var9,
		unixTimestamp = var10
	}
end