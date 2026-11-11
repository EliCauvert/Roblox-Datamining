local EnableChatNewMessage = game:DefineFastFlag("EnableChatNewMessage", false)
local GetFFlagEnableAppChatInExperienceModule = require(script.Parent.GetFFlagEnableAppChatInExperience)

return function()
	-- upvalues: EnableChatNewMessage (copy), GetFFlagEnableAppChatInExperienceModule (copy)
	return EnableChatNewMessage and GetFFlagEnableAppChatInExperienceModule()
end