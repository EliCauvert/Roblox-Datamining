local SduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local _ = require(SduiSharedUtilities.SduiLoadTimer)
local CreateTemplateApiPrewarmRequestConfigModule = require(SduiSharedUtilities.createTemplateApiPrewarmRequestConfig)
local GetSduiApiStoreModule = require(SduiSharedUtilities.getSduiApiStore)
local PromiseModule = require(SduiSharedUtilities.Parent.Promise)

return function(p1, p2)
	-- upvalues: CreateTemplateApiPrewarmRequestConfigModule (copy), PromiseModule (copy), GetSduiApiStoreModule (copy)
	local TemplateApiPrewarmRequestConfigModule = CreateTemplateApiPrewarmRequestConfigModule(p1)
	
	return if TemplateApiPrewarmRequestConfigModule == nil then PromiseModule.reject("No valid SDUI surfaceKeys provided") else GetSduiApiStoreModule().fetchIfNeeded(TemplateApiPrewarmRequestConfigModule, p2)
end