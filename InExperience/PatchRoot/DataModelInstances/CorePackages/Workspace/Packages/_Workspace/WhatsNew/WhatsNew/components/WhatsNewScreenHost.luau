local whatsNew = script:FindFirstAncestor("WhatsNew")
local reactModule = require(whatsNew.Parent.React)
local getWhatsNewStoreModule = require(whatsNew.store.GetWhatsNewStore)
local ensureWhatsNewStoreInitializedModule = require(whatsNew.store.ensureWhatsNewStoreInitialized)
local _ = require(whatsNew.registry.ScopeActions)
local whatsNewTourtipModule = require(script.Parent.WhatsNewTourtip)

return reactModule.memo(function(p0) --[[ line: 26 | named "WhatsNewScreenHost" ]]
	-- upvalues: getWhatsNewStoreModule (ref), reactModule (ref), ensureWhatsNewStoreInitializedModule (ref), whatsNewTourtipModule (ref)
	local screenScopeId = p0.screenScopeId
	local scopeActions = p0.scopeActions
	local var5 = p0.isEnabled == true
	local onReady = p0.onReady
	local var6 = getWhatsNewStoreModule()
	reactModule.useEffect(function() --[[ line: 33 ]]
		-- upvalues: var5 (ref), var6 (ref), ensureWhatsNewStoreInitializedModule (copy), scopeActions (ref), onReady (ref), screenScopeId (ref)
		if not var5 then
			var6.stopTour()
			
			return
		end
		ensureWhatsNewStoreInitializedModule.ensureWhatsNewStoreInitialized({ scopeActions = scopeActions })
		
		if onReady ~= nil then
			onReady()
		end
		var6.startEligibleTour(screenScopeId)
		
		return function() --[[ line: 49 ]]
			-- upvalues: var6 (copy)
			var6.stopTour()
		end
	end, {
		var5,
		onReady,
		screenScopeId,
		scopeActions,
		var6
	})
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Children = reactModule.createElement(reactModule.Fragment, nil, p0.children),
		Tooltip = reactModule.createElement(whatsNewTourtipModule)
	})
end)