local parent = script.Parent.Parent
local getCaptureMetadataModule = require(parent.Utils.getCaptureMetadata)
local _ = require(parent.Types)

return function(p0)
	-- upvalues: getCaptureMetadataModule (ref)
	local var1 = getCaptureMetadataModule(p0)
	
	return if var1 then var1.placeId else nil
end