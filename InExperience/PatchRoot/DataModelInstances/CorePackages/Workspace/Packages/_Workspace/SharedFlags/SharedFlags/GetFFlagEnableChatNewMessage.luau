local enableChatNewMessage = game:DefineFastFlag("EnableChatNewMessage", false)
local getFFlagEnableAppChatInExperienceModule = require(script.Parent.GetFFlagEnableAppChatInExperience)

return function() --[[ line: 5 ]]
	-- upvalues: enableChatNewMessage (ref), getFFlagEnableAppChatInExperienceModule (ref)
	return enableChatNewMessage and getFFlagEnableAppChatInExperienceModule()
end