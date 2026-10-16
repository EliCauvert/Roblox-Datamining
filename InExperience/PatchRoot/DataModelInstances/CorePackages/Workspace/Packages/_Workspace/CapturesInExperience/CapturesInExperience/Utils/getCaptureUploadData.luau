local Parent = script.Parent.Parent
local CaptureService = game:GetService("CaptureService")
local CaptureTypeModule = require(Parent.Enums.CaptureType)
local _ = require(Parent.Types)
local FFlagUseRbxstorageInGalleryModule = require(Parent.Flags.FFlagUseRbxstorageInGallery)

return function(p1) --[[ Line: 9 | Named "getCaptureUploadData" ]]
	-- upvalues: FFlagUseRbxstorageInGalleryModule (copy), CaptureTypeModule (copy), CaptureService (copy)
	if FFlagUseRbxstorageInGalleryModule and p1.type == CaptureTypeModule.Video then
		return nil
	else
		local Success, Result = pcall(function() --[[ Line: 14 ]]
			-- upvalues: CaptureService (upval), p1 (copy)
			return CaptureService:GetCaptureUploadDataAsync(p1.filePath)
		end)
		
		return if Success then Result else nil
	end
end