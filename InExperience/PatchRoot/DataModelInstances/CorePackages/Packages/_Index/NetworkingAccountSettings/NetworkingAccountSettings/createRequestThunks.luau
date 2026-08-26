local parent = script.Parent
local createGetEmailSettingsModule = require(parent.networkRequests.createGetEmailSettings)
local _ = require(parent.Types.networkRequestsTypes)

return function(p1)
	-- upvalues: createGetEmailSettingsModule (ref)
	return { GetEmailSettings = createGetEmailSettingsModule(p1) }
end