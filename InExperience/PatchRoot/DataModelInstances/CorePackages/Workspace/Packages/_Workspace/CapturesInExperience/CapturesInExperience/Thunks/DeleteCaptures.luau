local parent = script.Parent.Parent
local captureService = game:GetService("CaptureService")
local captureTypeModule = require(parent.Enums.CaptureType)
local retrieveCapturesModule = require(parent.Thunks.RetrieveCaptures)
local _ = require(parent.Types)
local fFlagUseRbxstorageInGalleryModule = require(parent.Flags.FFlagUseRbxstorageInGallery)
local fFlagEnableCapturesGalleryRetrievalCoreScriptModule = require(parent.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript)

return function(p1)
	-- upvalues: fFlagEnableCapturesGalleryRetrievalCoreScriptModule (ref), fFlagUseRbxstorageInGalleryModule (ref), captureTypeModule (ref), captureService (ref), retrieveCapturesModule (ref)
	local t = {}
	
	for i, v in ipairs(p1) do
		if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then
			table.insert(t, v)
		elseif fFlagUseRbxstorageInGalleryModule and v.type == captureTypeModule.Video then
			table.insert(t, v.videoCapture)
		elseif v.type == captureTypeModule.Screenshot then
			table.insert(t, v.filePath)
		end
	end
	return function(p2)
		-- upvalues: captureService (copy), t (ref), retrieveCapturesModule (copy)
		captureService:DeleteCapturesAsync(t)
		p2:dispatch(retrieveCapturesModule())
	end
end