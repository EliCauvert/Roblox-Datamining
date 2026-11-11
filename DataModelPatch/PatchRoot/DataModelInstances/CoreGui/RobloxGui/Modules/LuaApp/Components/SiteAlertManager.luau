local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactRoduxModule = require(Modules.Common.RoactRodux)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local ApiFetchSiteMessageModule = require(Modules.LuaApp.Thunks.ApiFetchSiteMessage)
local RefreshSiteAlertInfoModule = require(Modules.LuaApp.Actions.RefreshSiteAlertInfo)
local FFlagSignalsNavP3Final = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Final
local ReactModule = require(CorePackages.Packages.React)
local CreateEffectFunction = require(CorePackages.Packages.Signals).createEffect
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local AppNavigationModule = require(Modules.LuaApp.Navigation.AppNavigation)
local SiteAlertManager = require(Modules.Common.Roact).PureComponent:extend("SiteAlertManager")

function SiteAlertManager:render() end

function SiteAlertManager.didUpdate(p1, p2)
	if not p2.updateRequested and p1.props.updateRequested then
		local Timestamp = os.time()
		local MessageTime: number = p1.props.messageTime
		
		if MessageTime and Timestamp - MessageTime < p1.props.alertRateLimit then
			p1.props.dismissRefresh()
			
			return
		end
		p1.props.refresh(p1.props.networking)
	end
end

local v1 = RoactAppPolicy.connect(function(p1, _)
	return { alertRateLimit = p1.getAlertRateLimit() }
end)((RoactServices.connect({ networking = RoactNetworkingModule })((RoactRoduxModule.connect(function(p1, _)
	return {
		messageTime = p1.SiteMessage.timestamp,
		updateRequested = p1.SiteMessage.updateRequested
	}
end, function(Callback)
	-- upvalues: ApiFetchSiteMessageModule (copy), RefreshSiteAlertInfoModule (copy)
	return {
		refresh = function(p1)
			-- upvalues: Callback (copy), ApiFetchSiteMessageModule (upval)
			Callback(ApiFetchSiteMessageModule(p1))
		end,
		dismissRefresh = function()
			-- upvalues: Callback (copy), RefreshSiteAlertInfoModule (upval)
			Callback(RefreshSiteAlertInfoModule({ updateRequested = false }))
		end
	}
end)(SiteAlertManager)))))

return if FFlagSignalsNavP3Final then function(p1)
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), CreateEffectFunction (copy), AppNavigationModule (copy), RefreshSiteAlertInfoModule (copy), v1 (ref)
	local UseDispatchResult = UseDispatchFunction()
	ReactModule.useEffect(function()
		-- upvalues: CreateEffectFunction (upval), AppNavigationModule (upval), UseDispatchResult (copy), RefreshSiteAlertInfoModule (upval)
		return CreateEffectFunction(function(p2)
			-- upvalues: AppNavigationModule (upval), UseDispatchResult (upval), RefreshSiteAlertInfoModule (upval)
			if AppNavigationModule.getIsNavigating(p2) then
				UseDispatchResult(RefreshSiteAlertInfoModule({ updateRequested = true }))
			end
		end)
	end, { UseDispatchResult })
	
	return ReactModule.createElement(v1, p1)
end else v1