local AppStoreAgeSignalsManager = script:FindFirstAncestor("AppStoreAgeSignalsManager")
local PromiseModule = require(AppStoreAgeSignalsManager.Parent.Promise)
local AppAgeSignalsTelemetryConfigsModule = require(AppStoreAgeSignalsManager.Telemetry.AppAgeSignalsTelemetryConfigs)
local EnableAppAgeSignalsService = game:DefineFastFlag("EnableAppAgeSignalsService", false)

return {
	isAvailable = function() --[[ Line: 10 ]]
		-- upvalues: EnableAppAgeSignalsService (copy), AppAgeSignalsTelemetryConfigsModule (copy)
		if not EnableAppAgeSignalsService then
			return false
		end
		local Success, Result = pcall(function() --[[ Line: 14 ]]
			return game:GetService("AppAgeSignalsService")
		end)
		
		if not Success or not Result then
			return false
		end
		local Success1, Result1 = pcall(function() --[[ Line: 20 ]]
			-- upvalues: Result (copy)
			return Result:IsAvailable()
		end)
		
		if Success1 then
			return Result1
		else
			AppAgeSignalsTelemetryConfigsModule.reportError({
				signalSource = "unknown",
				error = "IsAvailable threw: " .. tostring(Result1)
			})
			
			return false
		end
	end,
	getAppAgeSignalsAsync = function() --[[ Line: 32 ]]
		-- upvalues: PromiseModule (copy)
		return PromiseModule.new(function(Callback1: (any) -> (), Callback: (any) -> ()) --[[ Line: 33 ]]
			local Success, Result = pcall(function() --[[ Line: 34 ]]
				return game:GetService("AppAgeSignalsService"):GetAppAgeSignalsAsync()
			end)
			
			if not Success then
				Callback(Result)
				
				return
			end
			if Result.Error and Result.Error ~= "" then
				Callback(Result.Error)
				
				return
			else
				Callback1(Result.PlatformPayload)
			end
		end)
	end
}