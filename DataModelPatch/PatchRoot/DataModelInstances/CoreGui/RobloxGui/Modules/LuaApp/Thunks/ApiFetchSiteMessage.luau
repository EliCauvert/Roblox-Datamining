local CryoModule = require(game:GetService("CorePackages").Packages.Cryo)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PromiseModule = require(Modules.LuaApp.Promise)
local AlertsGetAlertInfoModule = require(Modules.LuaApp.Http.Requests.AlertsGetAlertInfo)
local ProcessSiteAlertInfoPayloadModule = require(Modules.LuaApp.Actions.ProcessSiteAlertInfoPayload)

return function(p1)
	-- upvalues: AlertsGetAlertInfoModule (copy), CryoModule (copy), ProcessSiteAlertInfoPayloadModule (copy), PromiseModule (copy)
	return function(p2)
		-- upvalues: AlertsGetAlertInfoModule (upval), p1 (copy), CryoModule (upval), ProcessSiteAlertInfoPayloadModule (upval), PromiseModule (upval)
		return AlertsGetAlertInfoModule(p1):andThen(function(Result)
			-- upvalues: CryoModule (upval), p2 (copy), ProcessSiteAlertInfoPayloadModule (upval)
			return p2:dispatch(ProcessSiteAlertInfoPayloadModule((CryoModule.Dictionary.join(Result.responseBody or {}, { timestamp = os.time() }))))
		end, function(p3)
			-- upvalues: p2 (copy), ProcessSiteAlertInfoPayloadModule (upval), PromiseModule (upval)
			p2:dispatch(ProcessSiteAlertInfoPayloadModule({ timestamp = os.time() }))
			
			return PromiseModule.reject(p3)
		end)
	end
end