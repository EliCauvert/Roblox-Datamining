game:DefineFastFlag("UploadMakeupSupport", false)
local getFFlagSingleUploadMakeupSupportModule = require(script.Parent.GetFFlagSingleUploadMakeupSupport)

return function() --[[ line: 5 ]]
	-- upvalues: getFFlagSingleUploadMakeupSupportModule (ref)
	return getFFlagSingleUploadMakeupSupportModule() and game:GetFastFlag("UploadMakeupSupport")
end