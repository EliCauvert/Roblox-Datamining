local parent = script.Parent.Parent
local captureServiceModule = require(parent.Services.CaptureService)
local captureTypeModule = require(parent.Enums.CaptureType)
local capturesToastTypeModule = require(parent.Enums.CapturesToastType)
local toastTriggeredModule = require(parent.Actions.ToastTriggered)
local _ = require(parent.Types)
local fFlagUseRbxstorageInGalleryModule = require(parent.Flags.FFlagUseRbxstorageInGallery)
local fFlagEnableCapturesGalleryRetrievalCoreScriptModule = require(parent.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript)

return function(p0)
	-- upvalues: fFlagEnableCapturesGalleryRetrievalCoreScriptModule (ref), captureServiceModule (ref), fFlagUseRbxstorageInGalleryModule (ref), captureTypeModule (ref), toastTriggeredModule (ref), capturesToastTypeModule (ref)
	return function(p1)
		-- upvalues: fFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), captureServiceModule (copy), p0 (ref), fFlagUseRbxstorageInGalleryModule (copy), captureTypeModule (copy), toastTriggeredModule (copy), capturesToastTypeModule (copy)
		if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then
			captureServiceModule:SaveCapturesToExternalStorageAsync({ p0 })
		elseif fFlagUseRbxstorageInGalleryModule and p0.type == captureTypeModule.Video then
			captureServiceModule:SaveVideoCaptureToExternalStorage(p0.videoCapture)
		else
			captureServiceModule:SaveCaptureToExternalStorage(p0.filePath)
		end
		p1:dispatch(toastTriggeredModule(capturesToastTypeModule.CaptureSavedToDevice, { captureInfo = p0 }))
	end
end