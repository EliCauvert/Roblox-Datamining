local appStoreAgeSignalsManager = script:FindFirstAncestor("AppStoreAgeSignalsManager")
local promiseModule = require(appStoreAgeSignalsManager.Parent.Promise)
local appAgeSignalsServiceWrapperModule = require(script.Parent.AppAgeSignalsServiceWrapper)
local appStoreAgeSignalsProviderModule = require(appStoreAgeSignalsManager.Utils.AppStoreAgeSignalsProvider)
local appAgeSignalsTelemetryConfigsModule = require(appStoreAgeSignalsManager.Telemetry.AppAgeSignalsTelemetryConfigs)

return {
	requestAppAgeSignals = function() --[[ line: 10 ]]
		-- upvalues: appAgeSignalsServiceWrapperModule (ref), promiseModule (ref), appStoreAgeSignalsProviderModule (ref), appAgeSignalsTelemetryConfigsModule (ref)
		return if appAgeSignalsServiceWrapperModule.isAvailable() then appStoreAgeSignalsProviderModule.checkEligibility():andThen(function(p0) --[[ line: 15 ]]
			-- upvalues: promiseModule (copy), appAgeSignalsServiceWrapperModule (copy), appStoreAgeSignalsProviderModule (copy), appAgeSignalsTelemetryConfigsModule (copy)
			return if p0.eligible then appAgeSignalsServiceWrapperModule.getAppAgeSignalsAsync():andThen(function(p2) --[[ line: 21 ]]
				-- upvalues: appStoreAgeSignalsProviderModule (copy), p0 (ref)
				return appStoreAgeSignalsProviderModule.publishResult(p0.signalSource, p2, "Complete")
			end):catch(function(p1) --[[ line: 24 ]]
				-- upvalues: appAgeSignalsTelemetryConfigsModule (copy), p0 (ref), promiseModule (copy)
				appAgeSignalsTelemetryConfigsModule.reportError({ error = tostring(p1), signalSource = p0.signalSource })
				
				return promiseModule.reject(p1)
			end) else promiseModule.reject("User is not eligible for app age signals")
		end) else promiseModule.reject("AppAgeSignalsService is not available")
	end
}