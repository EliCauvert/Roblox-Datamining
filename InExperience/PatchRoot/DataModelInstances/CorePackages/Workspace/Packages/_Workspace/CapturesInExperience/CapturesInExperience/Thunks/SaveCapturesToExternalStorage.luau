local parent = script.Parent.Parent
local captureService = game:GetService("CaptureService")
local captureTypeModule = require(parent.Enums.CaptureType)
local capturesToastTypeModule = require(parent.Enums.CapturesToastType)
local toastTriggeredModule = require(parent.Actions.ToastTriggered)
local _ = require(parent.Types)
local fFlagCapturesVideoBulkManagerStopGapModule = require(parent.Flags.FFlagCapturesVideoBulkManagerStopGap)
local capturesVideoSupportLegacyVideos = game:DefineFastFlag("CapturesVideoSupportLegacyVideos", false)
local fFlagUseRbxstorageInGalleryModule = require(parent.Flags.FFlagUseRbxstorageInGallery)
local fFlagEnableCapturesGalleryRetrievalCoreScriptModule = require(parent.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript)

return function(p0) --[[ line: 17 ]]
	-- upvalues: fFlagEnableCapturesGalleryRetrievalCoreScriptModule (ref), fFlagCapturesVideoBulkManagerStopGapModule (ref), captureService (ref), fFlagUseRbxstorageInGalleryModule (ref), captureTypeModule (ref), capturesVideoSupportLegacyVideos (ref), toastTriggeredModule (ref), capturesToastTypeModule (ref)
	local t = {}
	
	for i, v in ipairs(p0) do
		if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then
			if fFlagCapturesVideoBulkManagerStopGapModule then
				table.insert(t, captureService:PreCaptureShared(v))
			else
				table.insert(t, v)
			end
		elseif fFlagUseRbxstorageInGalleryModule and v.type == captureTypeModule.Video then
			if capturesVideoSupportLegacyVideos then
				table.insert(t, captureService:PreVideoCaptureShared(v.videoCapture))
			else
				table.insert(t, v.videoCapture)
			end
		elseif v.type == captureTypeModule.Screenshot then
			table.insert(t, v.filePath)
		end
	end
	return function(p1) --[[ line: 39 ]]
		-- upvalues: captureService (copy), t (ref), toastTriggeredModule (copy), capturesToastTypeModule (copy), p0 (ref)
		captureService:SaveCapturesToExternalStorageAsync(t)
		p1:dispatch(toastTriggeredModule(capturesToastTypeModule.CaptureSavedToDevice, { captureInfo = p0[1] }))
	end
end