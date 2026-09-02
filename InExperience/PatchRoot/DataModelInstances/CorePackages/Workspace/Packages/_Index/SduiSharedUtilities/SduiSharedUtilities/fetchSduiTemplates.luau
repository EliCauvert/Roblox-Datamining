local sduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local parent = sduiSharedUtilities.Parent
local _ = require(sduiSharedUtilities.SduiLoadTimer)
local createTemplateApiPrewarmRequestConfigModule = require(sduiSharedUtilities.createTemplateApiPrewarmRequestConfig)
local getSduiApiStoreModule = require(sduiSharedUtilities.getSduiApiStore)
local promiseModule = require(parent.Promise)

return function(p1, p2)
	-- upvalues: createTemplateApiPrewarmRequestConfigModule (ref), promiseModule (ref), getSduiApiStoreModule (ref)
	local var1 = createTemplateApiPrewarmRequestConfigModule(p1)
	
	return if var1 == nil then promiseModule.reject("No valid SDUI surfaceKeys provided") else getSduiApiStoreModule().fetchIfNeeded(var1, p2)
end