local appStoreAgeSignalsManager = script:FindFirstAncestor("AppStoreAgeSignalsManager")
local promiseModule = require(appStoreAgeSignalsManager.Parent.Promise)
local appAgeSignalsServiceWrapperModule = require(script.Parent.AppAgeSignalsServiceWrapper)
local appStoreAgeSignalsProviderModule = require(appStoreAgeSignalsManager.Utils.AppStoreAgeSignalsProvider)
local appAgeSignalsTelemetryConfigsModule = require(appStoreAgeSignalsManager.Telemetry.AppAgeSignalsTelemetryConfigs)

return {
	requestAppAgeSignals = function()
		-- upvalues: appAgeSignalsServiceWrapperModule (ref), promiseModule (ref), appStoreAgeSignalsProviderModule (ref), appAgeSignalsTelemetryConfigsModule (ref)
		return if appAgeSignalsServiceWrapperModule.isAvailable() then appStoreAgeSignalsProviderModule.checkEligibility():andThen(function(p1)
			-- upvalues: promiseModule (copy), appAgeSignalsServiceWrapperModule (copy), appStoreAgeSignalsProviderModule (copy), appAgeSignalsTelemetryConfigsModule (copy)
			return if p1.eligible then appAgeSignalsServiceWrapperModule.getAppAgeSignalsAsync():andThen(function(p2)
				-- upvalues: appStoreAgeSignalsProviderModule (copy), p1 (ref)
				return appStoreAgeSignalsProviderModule.publishResult(p1.signalSource, p2, "Complete")
			end):catch(function(p2)
				-- upvalues: appAgeSignalsTelemetryConfigsModule (copy), p1 (ref), promiseModule (copy)
				appAgeSignalsTelemetryConfigsModule.reportError({ error = tostring(p2), signalSource = p1.signalSource })
				
				return promiseModule.reject(p2)
			end) else promiseModule.reject("User is not eligible for app age signals")
		end) else promiseModule.reject("AppAgeSignalsService is not available")
	end
}