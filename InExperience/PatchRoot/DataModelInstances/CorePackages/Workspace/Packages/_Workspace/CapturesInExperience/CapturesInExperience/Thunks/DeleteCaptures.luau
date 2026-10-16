local Parent = script.Parent.Parent
local CaptureService = game:GetService("CaptureService")
local CaptureTypeModule = require(Parent.Enums.CaptureType)
local RetrieveCapturesModule = require(Parent.Thunks.RetrieveCaptures)
local _ = require(Parent.Types)
local FFlagUseRbxstorageInGalleryModule = require(Parent.Flags.FFlagUseRbxstorageInGallery)
local FFlagEnableCapturesGalleryRetrievalCoreScriptModule = require(Parent.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript)

return function(List) --[[ Line: 14 ]]
	-- upvalues: FFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), FFlagUseRbxstorageInGalleryModule (copy), CaptureTypeModule (copy), CaptureService (copy), RetrieveCapturesModule (copy)
	local List1 = {}
	
	for _, value in ipairs(List) do
		if FFlagEnableCapturesGalleryRetrievalCoreScriptModule then
			table.insert(List1, value)
		elseif FFlagUseRbxstorageInGalleryModule and value.type == CaptureTypeModule.Video then
			table.insert(List1, value.videoCapture)
		elseif value.type == CaptureTypeModule.Screenshot then
			table.insert(List1, value.filePath)
		end
	end
	return function(p1) --[[ Line: 26 ]]
		-- upvalues: CaptureService (upval), List1 (copy), RetrieveCapturesModule (upval)
		CaptureService:DeleteCapturesAsync(List1)
		p1:dispatch(RetrieveCapturesModule())
	end
end