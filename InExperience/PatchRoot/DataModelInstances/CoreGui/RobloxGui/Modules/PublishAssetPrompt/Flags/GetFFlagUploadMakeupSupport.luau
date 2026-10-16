game:DefineFastFlag("UploadMakeupSupport", false)
local GetFFlagSingleUploadMakeupSupportModule = require(script.Parent.GetFFlagSingleUploadMakeupSupport)

return function() --[[ Line: 5 ]]
	-- upvalues: GetFFlagSingleUploadMakeupSupportModule (copy)
	return GetFFlagSingleUploadMakeupSupportModule() and game:GetFastFlag("UploadMakeupSupport")
end