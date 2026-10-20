game:DefineFastFlag("UploadMakeupSupport", false)
local GetFFlagSingleUploadMakeupSupportModule = require(script.Parent.GetFFlagSingleUploadMakeupSupport)

return function()
	-- upvalues: GetFFlagSingleUploadMakeupSupportModule (copy)
	return GetFFlagSingleUploadMakeupSupportModule() and game:GetFastFlag("UploadMakeupSupport")
end