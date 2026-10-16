local Parent = script.Parent
local CreateGetEmailSettingsModule = require(Parent.networkRequests.createGetEmailSettings)
local _ = require(Parent.Types.networkRequestsTypes)

return function(p1) --[[ Line: 6 ]]
	-- upvalues: CreateGetEmailSettingsModule (copy)
	return { GetEmailSettings = CreateGetEmailSettingsModule(p1) }
end