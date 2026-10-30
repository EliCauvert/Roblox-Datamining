local Parent = script.Parent.Parent
local CaptureServiceModule = require(Parent.Services.CaptureService)
local CaptureTypeModule = require(Parent.Enums.CaptureType)
local CapturesToastTypeModule = require(Parent.Enums.CapturesToastType)
local ToastTriggeredModule = require(Parent.Actions.ToastTriggered)
local _ = require(Parent.Types)
local FFlagCapturesVideoBulkManagerStopGapModule = require(Parent.Flags.FFlagCapturesVideoBulkManagerStopGap)
local FFlagUseRbxstorageInGalleryModule = require(Parent.Flags.FFlagUseRbxstorageInGallery)
local FFlagEnableCapturesGalleryRetrievalCoreScriptModule = require(Parent.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript)
local FFlagCapturesInExpMomentsToastDownloadButtonModule = require(Parent.Flags.FFlagCapturesInExpMomentsToastDownloadButton)

return function(Entry)
	-- upvalues: FFlagCapturesInExpMomentsToastDownloadButtonModule (copy), FFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), FFlagCapturesVideoBulkManagerStopGapModule (copy), CaptureServiceModule (copy), FFlagUseRbxstorageInGalleryModule (copy), CaptureTypeModule (copy), ToastTriggeredModule (copy), CapturesToastTypeModule (copy)
	local List = {}
	
	for _, value in ipairs(Entry) do
		if FFlagCapturesInExpMomentsToastDownloadButtonModule and not FFlagEnableCapturesGalleryRetrievalCoreScriptModule and typeof(value) ~= "table" then
			table.insert(List, value)
			continue
		end
		if FFlagEnableCapturesGalleryRetrievalCoreScriptModule then
			if FFlagCapturesVideoBulkManagerStopGapModule then
				table.insert(List, (CaptureServiceModule:PreCaptureShared(value)))
			else
				table.insert(List, value)
			end
		elseif FFlagUseRbxstorageInGalleryModule and value.type == CaptureTypeModule.Video then
			table.insert(List, (CaptureServiceModule:PreVideoCaptureShared(value.videoCapture)))
		elseif value.type == CaptureTypeModule.Screenshot then
			table.insert(List, value.filePath)
		end
	end
	return function(p1)
		-- upvalues: CaptureServiceModule (upval), List (copy), ToastTriggeredModule (upval), CapturesToastTypeModule (upval), Entry (copy)
		CaptureServiceModule:SaveCapturesToExternalStorageAsync(List)
		p1:dispatch(ToastTriggeredModule(CapturesToastTypeModule.CaptureSavedToDevice, { captureInfo = Entry[1] }))
	end
end