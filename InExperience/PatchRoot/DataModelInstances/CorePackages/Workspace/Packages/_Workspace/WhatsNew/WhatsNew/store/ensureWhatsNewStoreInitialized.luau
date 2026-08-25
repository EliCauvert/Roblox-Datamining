local whatsNew = script:FindFirstAncestor("WhatsNew")
local _ = require(whatsNew.Types)
local getWhatsNewStoreModule = require(whatsNew.store.GetWhatsNewStore)
local loadWhatsNewRegistryModule = require(whatsNew.registry.LoadWhatsNewRegistry)
local _ = require(whatsNew.registry.ScopeActions)
local createResolveDepsModule = require(whatsNew.storage.createResolveDeps)
local var4 = false

return {
	ensureWhatsNewStoreInitialized = function(p0)
		-- upvalues: var4 (write), createResolveDepsModule (ref), loadWhatsNewRegistryModule (ref), getWhatsNewStoreModule (ref)
		if var4 then
			return
		end
		getWhatsNewStoreModule().initialize({
			rootTourMap = loadWhatsNewRegistryModule.loadBundledRegistry(p0.deps or createResolveDepsModule.createResolveDeps(), { scopeActions = p0.scopeActions }),
			scopeActions = p0.scopeActions
		})
		var4 = true
	end,
	resetForTests = function()
		-- upvalues: var4 (write), getWhatsNewStoreModule (ref)
		var4 = false
		getWhatsNewStoreModule().resetForTests()
	end
}