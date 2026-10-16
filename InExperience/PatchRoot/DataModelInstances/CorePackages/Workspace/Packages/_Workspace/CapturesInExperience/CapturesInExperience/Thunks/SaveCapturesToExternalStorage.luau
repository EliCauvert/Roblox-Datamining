local Parent = script.Parent.Parent
local CaptureService = game:GetService("CaptureService")
local CaptureTypeModule = require(Parent.Enums.CaptureType)
local CapturesToastTypeModule = require(Parent.Enums.CapturesToastType)
local ToastTriggeredModule = require(Parent.Actions.ToastTriggered)
local _ = require(Parent.Types)
local FFlagCapturesVideoBulkManagerStopGapModule = require(Parent.Flags.FFlagCapturesVideoBulkManagerStopGap)
local FFlagUseRbxstorageInGalleryModule = require(Parent.Flags.FFlagUseRbxstorageInGallery)
local FFlagEnableCapturesGalleryRetrievalCoreScriptModule = require(Parent.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript)

return function(Entry) --[[ Line: 16 ]]
	-- upvalues: FFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), FFlagCapturesVideoBulkManagerStopGapModule (copy), CaptureService (copy), FFlagUseRbxstorageInGalleryModule (copy), CaptureTypeModule (copy), ToastTriggeredModule (copy), CapturesToastTypeModule (copy)
	local List = {}
	
	for _, value in ipairs(Entry) do
		if FFlagEnableCapturesGalleryRetrievalCoreScriptModule then
			if FFlagCapturesVideoBulkManagerStopGapModule then
				table.insert(List, (CaptureService:PreCaptureShared(value)))
			else
				table.insert(List, value)
			end
		elseif FFlagUseRbxstorageInGalleryModule and value.type == CaptureTypeModule.Video then
			table.insert(List, (CaptureService:PreVideoCaptureShared(value.videoCapture)))
		elseif value.type == CaptureTypeModule.Screenshot then
			table.insert(List, value.filePath)
		end
	end
	return function(p1) --[[ Line: 34 ]]
		-- upvalues: CaptureService (upval), List (copy), ToastTriggeredModule (upval), CapturesToastTypeModule (upval), Entry (copy)
		CaptureService:SaveCapturesToExternalStorageAsync(List)
		p1:dispatch(ToastTriggeredModule(CapturesToastTypeModule.CaptureSavedToDevice, { captureInfo = Entry[1] }))
	end
end