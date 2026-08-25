game:DefineFastFlag("UploadMakeupSupport", false)
local getFFlagSingleUploadMakeupSupportModule = require(script.Parent.GetFFlagSingleUploadMakeupSupport)

return function()
	-- upvalues: getFFlagSingleUploadMakeupSupportModule (ref)
	return getFFlagSingleUploadMakeupSupportModule() and game:GetFastFlag("UploadMakeupSupport")
end