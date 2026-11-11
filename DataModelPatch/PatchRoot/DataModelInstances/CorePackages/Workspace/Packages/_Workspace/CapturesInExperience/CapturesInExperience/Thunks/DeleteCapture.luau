local Parent = script.Parent.Parent
local CaptureService = game:GetService("CaptureService")
local RetrieveCapturesModule = require(Parent.Thunks.RetrieveCaptures)
local CaptureTypeModule = require(Parent.Enums.CaptureType)
local _ = require(Parent.Types)
local FFlagUseRbxstorageInGalleryModule = require(Parent.Flags.FFlagUseRbxstorageInGallery)
local FFlagCapturesVideoDeleteAsyncModule = require(Parent.Flags.FFlagCapturesVideoDeleteAsync)
local FFlagEnableCapturesGalleryRetrievalCoreScriptModule = require(Parent.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript)

return function(p1)
	-- upvalues: FFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), CaptureService (copy), FFlagUseRbxstorageInGalleryModule (copy), CaptureTypeModule (copy), FFlagCapturesVideoDeleteAsyncModule (copy), RetrieveCapturesModule (copy)
	return function(p2)
		-- upvalues: FFlagEnableCapturesGalleryRetrievalCoreScriptModule (upval), p1 (copy), CaptureService (upval), FFlagUseRbxstorageInGalleryModule (upval), CaptureTypeModule (upval), FFlagCapturesVideoDeleteAsyncModule (upval), RetrieveCapturesModule (upval)
		if FFlagEnableCapturesGalleryRetrievalCoreScriptModule then
			CaptureService:DeleteCapturesAsync({ p1 })
		elseif FFlagUseRbxstorageInGalleryModule and p1.type == CaptureTypeModule.Video then
			if FFlagCapturesVideoDeleteAsyncModule then
				CaptureService:DeleteVideoCaptureAsync(p1.videoCapture)
			else
				CaptureService:DeleteVideoCapture(p1.videoCapture)
			end
		else
			CaptureService:DeleteCapture(p1.filePath)
		end
		p2:dispatch(RetrieveCapturesModule())
	end
end