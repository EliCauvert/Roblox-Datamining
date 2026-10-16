local WhatsNew = script:FindFirstAncestor("WhatsNew")
local _ = require(WhatsNew.Types)
local GetWhatsNewStoreModule = require(WhatsNew.store.GetWhatsNewStore)
local LoadWhatsNewRegistryModule = require(WhatsNew.registry.LoadWhatsNewRegistry)
local _ = require(WhatsNew.registry.ScopeActions)
local CreateResolveDepsModule = require(WhatsNew.storage.createResolveDeps)
local Flag = false

return {
	ensureWhatsNewStoreInitialized = function(p1) --[[ Line: 23 ]]
		-- upvalues: Flag (ref), CreateResolveDepsModule (copy), LoadWhatsNewRegistryModule (copy), GetWhatsNewStoreModule (copy)
		if not Flag then
			GetWhatsNewStoreModule().initialize({
				rootTourMap = LoadWhatsNewRegistryModule.loadBundledRegistry(p1.deps or CreateResolveDepsModule.createResolveDeps(), { scopeActions = p1.scopeActions }),
				scopeActions = p1.scopeActions
			})
			Flag = true
			
			return
		end
	end,
	resetForTests = function() --[[ Line: 42 ]]
		-- upvalues: Flag (ref), GetWhatsNewStoreModule (copy)
		Flag = false
		GetWhatsNewStoreModule().resetForTests()
	end
}