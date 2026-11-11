local AppStoreAgeSignalsManager = script:FindFirstAncestor("AppStoreAgeSignalsManager")
local PromiseModule = require(AppStoreAgeSignalsManager.Parent.Promise)
local AppAgeSignalsServiceWrapperModule = require(script.Parent.AppAgeSignalsServiceWrapper)
local AppStoreAgeSignalsProviderModule = require(AppStoreAgeSignalsManager.Utils.AppStoreAgeSignalsProvider)
local AppAgeSignalsTelemetryConfigsModule = require(AppStoreAgeSignalsManager.Telemetry.AppAgeSignalsTelemetryConfigs)

return {
	requestAppAgeSignals = function()
		-- upvalues: AppAgeSignalsServiceWrapperModule (copy), PromiseModule (copy), AppStoreAgeSignalsProviderModule (copy), AppAgeSignalsTelemetryConfigsModule (copy)
		return if AppAgeSignalsServiceWrapperModule.isAvailable() then AppStoreAgeSignalsProviderModule.checkEligibility():andThen(function(Result)
			-- upvalues: PromiseModule (upval), AppAgeSignalsServiceWrapperModule (upval), AppStoreAgeSignalsProviderModule (upval), AppAgeSignalsTelemetryConfigsModule (upval)
			return if Result.eligible then AppAgeSignalsServiceWrapperModule.getAppAgeSignalsAsync():andThen(function(Result1)
				-- upvalues: AppStoreAgeSignalsProviderModule (upval), Result (copy)
				return AppStoreAgeSignalsProviderModule.publishResult(Result.signalSource, Result1, "Complete")
			end):catch(function(Err)
				-- upvalues: AppAgeSignalsTelemetryConfigsModule (upval), Result (copy), PromiseModule (upval)
				AppAgeSignalsTelemetryConfigsModule.reportError({
					error = tostring(Err),
					signalSource = Result.signalSource
				})
				
				return PromiseModule.reject(Err)
			end) else PromiseModule.reject("User is not eligible for app age signals")
		end) else PromiseModule.reject("AppAgeSignalsService is not available")
	end
}