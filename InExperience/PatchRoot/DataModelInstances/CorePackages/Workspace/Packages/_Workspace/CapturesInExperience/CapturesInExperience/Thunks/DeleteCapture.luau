local parent = script.Parent.Parent
local captureService = game:GetService("CaptureService")
local retrieveCapturesModule = require(parent.Thunks.RetrieveCaptures)
local captureTypeModule = require(parent.Enums.CaptureType)
local _ = require(parent.Types)
local fFlagUseRbxstorageInGalleryModule = require(parent.Flags.FFlagUseRbxstorageInGallery)
local fFlagCapturesVideoDeleteAsyncModule = require(parent.Flags.FFlagCapturesVideoDeleteAsync)
local fFlagEnableCapturesGalleryRetrievalCoreScriptModule = require(parent.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript)

return function(p0)
	-- upvalues: fFlagEnableCapturesGalleryRetrievalCoreScriptModule (ref), captureService (ref), fFlagUseRbxstorageInGalleryModule (ref), captureTypeModule (ref), fFlagCapturesVideoDeleteAsyncModule (ref), retrieveCapturesModule (ref)
	return function(p1)
		-- upvalues: fFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), p0 (ref), captureService (copy), fFlagUseRbxstorageInGalleryModule (copy), captureTypeModule (copy), fFlagCapturesVideoDeleteAsyncModule (copy), retrieveCapturesModule (copy)
		if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then
			captureService:DeleteCapturesAsync({ p0 })
		elseif not fFlagUseRbxstorageInGalleryModule or p0.type ~= captureTypeModule.Video then
			captureService:DeleteCapture(p0.filePath)
		elseif fFlagCapturesVideoDeleteAsyncModule then
			captureService:DeleteVideoCaptureAsync(p0.videoCapture)
		else
			captureService:DeleteVideoCapture(p0.videoCapture)
		end
		p1:dispatch(retrieveCapturesModule())
	end
end