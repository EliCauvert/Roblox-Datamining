local Parent = script.Parent.Parent
local GetCaptureMetadataModule = require(Parent.Utils.getCaptureMetadata)
local _ = require(Parent.Types)

return function(p1)
	-- upvalues: GetCaptureMetadataModule (copy)
	local CaptureMetadataModule = GetCaptureMetadataModule(p1)
	
	return if CaptureMetadataModule then CaptureMetadataModule.unixTimestamp else nil
end