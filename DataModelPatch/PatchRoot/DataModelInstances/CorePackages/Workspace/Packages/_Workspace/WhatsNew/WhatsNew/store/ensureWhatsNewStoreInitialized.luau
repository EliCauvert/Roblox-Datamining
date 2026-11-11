local WhatsNew = script:FindFirstAncestor("WhatsNew")
local _ = require(WhatsNew.Types)
local GetWhatsNewStoreModule = require(WhatsNew.store.GetWhatsNewStore)
local LoadWhatsNewRegistryModule = require(WhatsNew.registry.LoadWhatsNewRegistry)
local _ = require(WhatsNew.registry.ScopeActions)
local Flag = false

return {
	ensureWhatsNewStoreInitialized = function(p1)
		-- upvalues: Flag (ref), LoadWhatsNewRegistryModule (copy), GetWhatsNewStoreModule (copy)
		if not Flag then
			GetWhatsNewStoreModule().initialize({
				rootTourMap = LoadWhatsNewRegistryModule.loadBundledRegistry(p1.deps, { scopeActions = p1.scopeActions }),
				scopeActions = p1.scopeActions
			})
			Flag = true
			
			return
		end
	end,
	resetForTests = function()
		-- upvalues: Flag (ref), GetWhatsNewStoreModule (copy)
		Flag = false
		GetWhatsNewStoreModule().resetForTests()
	end
}