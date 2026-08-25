local parent = script.Parent.Parent
local captureService = game:GetService("CaptureService")
local captureTypeModule = require(parent.Enums.CaptureType)
local _ = require(parent.Types)
local fFlagUseRbxstorageInGalleryModule = require(parent.Flags.FFlagUseRbxstorageInGallery)

return function(p0)
	-- upvalues: fFlagUseRbxstorageInGalleryModule (ref), captureTypeModule (ref), captureService (ref)
	if fFlagUseRbxstorageInGalleryModule and p0.type == captureTypeModule.Video then
		return nil
	end
	local ok, status = pcall(function()
		-- upvalues: captureService (copy), p0 (ref)
		return captureService:GetCaptureUploadDataAsync(p0.filePath)
	end)
	
	return if ok then status else nil
end