local WhatsNew = script:FindFirstAncestor("WhatsNew")
local ReactModule = require(WhatsNew.Parent.React)
local GetWhatsNewStoreModule = require(WhatsNew.store.GetWhatsNewStore)
local EnsureWhatsNewStoreInitializedModule = require(WhatsNew.store.ensureWhatsNewStoreInitialized)
local _ = require(WhatsNew.registry.ScopeActions)
local WhatsNewTourtipModule = require(script.Parent.WhatsNewTourtip)

return ReactModule.memo(function(p1)
	-- upvalues: GetWhatsNewStoreModule (copy), ReactModule (copy), EnsureWhatsNewStoreInitializedModule (copy), WhatsNewTourtipModule (copy)
	local ScreenScopeId = p1.screenScopeId
	local ScopeActions = p1.scopeActions
	local IsIsEnabled = p1.isEnabled == true
	local OnReadyFunction = p1.onReady
	local WhatsNewStoreModule = GetWhatsNewStoreModule()
	ReactModule.useEffect(function()
		-- upvalues: IsIsEnabled (copy), WhatsNewStoreModule (copy), EnsureWhatsNewStoreInitializedModule (upval), ScopeActions (copy), OnReadyFunction (copy), ScreenScopeId (copy)
		if not IsIsEnabled then
			WhatsNewStoreModule.stopTour()
			
			return
		end
		EnsureWhatsNewStoreInitializedModule.ensureWhatsNewStoreInitialized({ scopeActions = ScopeActions })
		
		if OnReadyFunction ~= nil then
			OnReadyFunction()
		end
		WhatsNewStoreModule.startEligibleTour(ScreenScopeId)
		
		return function()
			-- upvalues: WhatsNewStoreModule (upval)
			WhatsNewStoreModule.stopTour()
		end
	end, {
		IsIsEnabled,
		OnReadyFunction,
		ScreenScopeId,
		ScopeActions,
		WhatsNewStoreModule
	})
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Children = ReactModule.createElement(ReactModule.Fragment, nil, p1.children),
		Tooltip = ReactModule.createElement(WhatsNewTourtipModule)
	})
end)