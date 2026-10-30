local NotificationsOrchestrator = script:FindFirstAncestor("NotificationsOrchestrator")
local PromiseModule = require(NotificationsOrchestrator.Parent.Promise)
local FFlagEnableOrchestratorDebugLoggingModule = require(NotificationsOrchestrator.Flags.FFlagEnableOrchestratorDebugLogging)

return {
	log = function(p1)
		-- upvalues: FFlagEnableOrchestratorDebugLoggingModule (copy)
		if FFlagEnableOrchestratorDebugLoggingModule then
			print("[NotifOrchDebug]", p1)
		end
	end,
	logLazy = function(Callback)
		-- upvalues: FFlagEnableOrchestratorDebugLoggingModule (copy)
		if FFlagEnableOrchestratorDebugLoggingModule then
			print("[NotifOrchDebug]", Callback())
		end
	end,
	startTimer = function()
		-- upvalues: FFlagEnableOrchestratorDebugLoggingModule (copy)
		return if FFlagEnableOrchestratorDebugLoggingModule then os.clock() else nil
	end,
	logElapsed = function(p1, p2)
		-- upvalues: FFlagEnableOrchestratorDebugLoggingModule (copy)
		if FFlagEnableOrchestratorDebugLoggingModule and p2 ~= nil then
			print("[NotifOrchDebug]", p1, string.format("(%.3fs)", os.clock() - p2))
		end
	end,
	logElapsedLazy = function(Callback, p1)
		-- upvalues: FFlagEnableOrchestratorDebugLoggingModule (copy)
		if FFlagEnableOrchestratorDebugLoggingModule and p1 ~= nil then
			print("[NotifOrchDebug]", Callback(), string.format("(%.3fs)", os.clock() - p1))
		end
	end,
	tracePromise = function(Promise, p1)
		-- upvalues: FFlagEnableOrchestratorDebugLoggingModule (copy), PromiseModule (copy)
		if not FFlagEnableOrchestratorDebugLoggingModule then
			return Promise
		end
		local Promise1 = Promise
		
		if p1.onSuccess then
			local OnSuccessFunction = p1.onSuccess
			Promise1 = Promise1:andThen(function(Result)
				-- upvalues: OnSuccessFunction (copy)
				OnSuccessFunction(Result)
				
				return Result
			end)
		end
		if p1.onError then
			local OnErrorFunction = p1.onError
			Promise1 = Promise1:catch(function(Err)
				-- upvalues: OnErrorFunction (copy), PromiseModule (upval)
				OnErrorFunction(Err)
				
				return PromiseModule.reject(Err)
			end)
		end
		return Promise1
	end
}