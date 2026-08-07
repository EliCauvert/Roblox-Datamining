local appStoreAgeSignalsManager = script:FindFirstAncestor("AppStoreAgeSignalsManager")
local promiseModule = require(appStoreAgeSignalsManager.Parent.Promise)
local appAgeSignalsTelemetryConfigsModule = require(appStoreAgeSignalsManager.Telemetry.AppAgeSignalsTelemetryConfigs)
local enableAppAgeSignalsService = game:DefineFastFlag("EnableAppAgeSignalsService", false)

return {
	isAvailable = function() --[[ line: 10 ]]
		-- upvalues: enableAppAgeSignalsService (ref), appAgeSignalsTelemetryConfigsModule (ref)
		if not enableAppAgeSignalsService then
			return false
		end
		local ok, status = pcall(function() --[[ line: 14 ]]
			return game:GetService("AppAgeSignalsService")
		end)
		
		if not ok or not status then
			return false
		end
		local ok_1, status_1 = pcall(function() --[[ line: 20 ]]
			-- upvalues: status (ref)
			return status:IsAvailable()
		end)
		
		if ok_1 then
			return status_1
		end
		appAgeSignalsTelemetryConfigsModule.reportError({
			signalSource = "unknown",
			error = "IsAvailable threw: " .. tostring(status_1)
		})
		
		return false
	end,
	getAppAgeSignalsAsync = function() --[[ line: 32 ]]
		-- upvalues: promiseModule (ref)
		return promiseModule.new(function(p0, p1) --[[ line: 33 ]]
			local ok, status = pcall(function() --[[ line: 34 ]]
				return game:GetService("AppAgeSignalsService"):GetAppAgeSignalsAsync()
			end)
			
			if not ok then
				p1(status)
				
				return
			elseif status.Error and status.Error ~= "" then
				p1(status.Error)
				
				return
			end
			p0(status.PlatformPayload)
		end)
	end
}