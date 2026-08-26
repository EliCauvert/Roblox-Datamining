local whatsNew = script:FindFirstAncestor("WhatsNew")
local reactModule = require(whatsNew.Parent.React)
local getWhatsNewStoreModule = require(whatsNew.store.GetWhatsNewStore)
local ensureWhatsNewStoreInitializedModule = require(whatsNew.store.ensureWhatsNewStoreInitialized)
local _ = require(whatsNew.registry.ScopeActions)
local whatsNewTourtipModule = require(script.Parent.WhatsNewTourtip)

return reactModule.memo(function(p1)
	-- upvalues: getWhatsNewStoreModule (ref), reactModule (ref), ensureWhatsNewStoreInitializedModule (ref), whatsNewTourtipModule (ref)
	local screenScopeId = p1.screenScopeId
	local scopeActions = p1.scopeActions
	local var1 = p1.isEnabled == true
	local onReady = p1.onReady
	local var2 = getWhatsNewStoreModule()
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var2 (ref), ensureWhatsNewStoreInitializedModule (copy), scopeActions (ref), onReady (ref), screenScopeId (ref)
		if not var1 then
			var2.stopTour()
			
			return
		end
		ensureWhatsNewStoreInitializedModule.ensureWhatsNewStoreInitialized({ scopeActions = scopeActions })
		
		if onReady ~= nil then
			onReady()
		end
		var2.startEligibleTour(screenScopeId)
		
		return function()
			-- upvalues: var2 (copy)
			var2.stopTour()
		end
	end, {
		var1,
		onReady,
		screenScopeId,
		scopeActions,
		var2
	})
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Children = reactModule.createElement(reactModule.Fragment, nil, p1.children),
		Tooltip = reactModule.createElement(whatsNewTourtipModule)
	})
end)