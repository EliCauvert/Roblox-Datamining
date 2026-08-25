local parent = script.Parent
local createGetEmailSettingsModule = require(parent.networkRequests.createGetEmailSettings)
local _ = require(parent.Types.networkRequestsTypes)

return function(p0)
	-- upvalues: createGetEmailSettingsModule (ref)
	return { GetEmailSettings = createGetEmailSettingsModule(p0) }
end