local parent = script.Parent.Parent
local captureTypeModule = require(parent.Enums.CaptureType)
local _ = require(parent.Types)
local fFlagUseRbxstorageInGalleryModule = require(parent.Flags.FFlagUseRbxstorageInGallery)
local fFlagEnableCapturesGalleryRetrievalCoreScriptModule = require(parent.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript)
local dontAssertOnUserIDInCaptureMetadata = game:DefineFastFlag("DontAssertOnUserIDInCaptureMetadata", false)

return function(p1)
	-- upvalues: fFlagEnableCapturesGalleryRetrievalCoreScriptModule (ref), fFlagUseRbxstorageInGalleryModule (ref), captureTypeModule (ref), dontAssertOnUserIDInCaptureMetadata (ref)
	if fFlagEnableCapturesGalleryRetrievalCoreScriptModule and p1.CaptureTime ~= nil then
		return {
			userId = 0,
			placeId = p1.SourcePlaceId,
			unixTimestamp = p1.CaptureTime.UnixTimestampMillis
		}
	elseif fFlagUseRbxstorageInGalleryModule and p1.type == captureTypeModule.Video then
		local var1 = tonumber(p1.userId)
		
		if not dontAssertOnUserIDInCaptureMetadata then
			assert(var1 ~= nil, "userId should not be nil")
		end
		return {
			userId = var1 or 0,
			placeId = p1.placeId,
			unixTimestamp = p1.creationTimestamp
		}
	elseif fFlagUseRbxstorageInGalleryModule and p1.type ~= captureTypeModule.Screenshot then
		return nil
	end
	local match, match_1, match_2 = string.match(p1.filePath, "(%d+)_(%d+)_(%d+)%.?%w*$")
	
	if match == nil or match_1 == nil or match_2 == nil then
		return nil
	end
	local var2 = tonumber(match)
	local var3 = tonumber(match_1)
	local var4 = tonumber(match_2)
	
	if not dontAssertOnUserIDInCaptureMetadata then
		assert(var2 ~= nil, "userId should not be nil")
	end
	assert(var3 ~= nil, "placeId should not be nil")
	assert(var4 ~= nil, "unixTimestamp should not be nil")
	
	return {
		userId = var2 or 0,
		placeId = var3,
		unixTimestamp = var4
	}
end