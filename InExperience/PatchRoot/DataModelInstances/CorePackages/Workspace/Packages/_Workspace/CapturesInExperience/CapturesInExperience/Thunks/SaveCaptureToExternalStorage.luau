local Parent = script.Parent.Parent
local CaptureServiceModule = require(Parent.Services.CaptureService)
local CaptureTypeModule = require(Parent.Enums.CaptureType)
local CapturesToastTypeModule = require(Parent.Enums.CapturesToastType)
local ToastTriggeredModule = require(Parent.Actions.ToastTriggered)
local _ = require(Parent.Types)
local FFlagUseRbxstorageInGalleryModule = require(Parent.Flags.FFlagUseRbxstorageInGallery)
local FFlagEnableCapturesGalleryRetrievalCoreScriptModule = require(Parent.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript)

return function(CaptureInfo) --[[ Line: 15 ]]
	-- upvalues: FFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), CaptureServiceModule (copy), FFlagUseRbxstorageInGalleryModule (copy), CaptureTypeModule (copy), ToastTriggeredModule (copy), CapturesToastTypeModule (copy)
	return function(p1) --[[ Line: 16 ]]
		-- upvalues: FFlagEnableCapturesGalleryRetrievalCoreScriptModule (upval), CaptureServiceModule (upval), CaptureInfo (copy), FFlagUseRbxstorageInGalleryModule (upval), CaptureTypeModule (upval), ToastTriggeredModule (upval), CapturesToastTypeModule (upval)
		if FFlagEnableCapturesGalleryRetrievalCoreScriptModule then
			CaptureServiceModule:SaveCapturesToExternalStorageAsync({ CaptureInfo })
		elseif FFlagUseRbxstorageInGalleryModule and CaptureInfo.type == CaptureTypeModule.Video then
			CaptureServiceModule:SaveVideoCaptureToExternalStorage(CaptureInfo.videoCapture)
		else
			CaptureServiceModule:SaveCaptureToExternalStorage(CaptureInfo.filePath)
		end
		p1:dispatch(ToastTriggeredModule(CapturesToastTypeModule.CaptureSavedToDevice, { captureInfo = CaptureInfo }))
	end
end