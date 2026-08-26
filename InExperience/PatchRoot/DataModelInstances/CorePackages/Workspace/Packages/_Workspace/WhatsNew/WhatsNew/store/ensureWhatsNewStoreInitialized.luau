local whatsNew = script:FindFirstAncestor("WhatsNew")
local _ = require(whatsNew.Types)
local getWhatsNewStoreModule = require(whatsNew.store.GetWhatsNewStore)
local loadWhatsNewRegistryModule = require(whatsNew.registry.LoadWhatsNewRegistry)
local _ = require(whatsNew.registry.ScopeActions)
local createResolveDepsModule = require(whatsNew.storage.createResolveDeps)
local var1 = false

return {
	ensureWhatsNewStoreInitialized = function(p1)
		-- upvalues: var1 (write), createResolveDepsModule (ref), loadWhatsNewRegistryModule (ref), getWhatsNewStoreModule (ref)
		if var1 then
			return
		end
		getWhatsNewStoreModule().initialize({
			rootTourMap = loadWhatsNewRegistryModule.loadBundledRegistry(p1.deps or createResolveDepsModule.createResolveDeps(), { scopeActions = p1.scopeActions }),
			scopeActions = p1.scopeActions
		})
		var1 = true
	end,
	resetForTests = function()
		-- upvalues: var1 (write), getWhatsNewStoreModule (ref)
		var1 = false
		getWhatsNewStoreModule().resetForTests()
	end
}