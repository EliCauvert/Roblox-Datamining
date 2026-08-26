local parent = script.Parent
local signalsModule = require(parent.Parent.Signals)
local httpSessionTrackerModule = require(parent.HttpSessionTracker)
local createFetchSignalModule = require(parent.createFetchSignal)
local createCancelRequestHandlerModule = require(parent.GlobalHandlers.createCancelRequestHandler)
local createNetworkStatsHandlerModule = require(parent.GlobalHandlers.createNetworkStatsHandler)
local createGrafanaLoggingHandlerModule = require(parent.GlobalHandlers.createGrafanaLoggingHandler)
local _ = require(parent.HttpStoreTypes)
local t = {}

return function()
	-- upvalues: t (write), createFetchSignalModule (ref), createCancelRequestHandlerModule (ref), createNetworkStatsHandlerModule (ref), createGrafanaLoggingHandlerModule (ref), signalsModule (ref), httpSessionTrackerModule (ref)
	return {
		fetch = function(p1, p2)
			-- upvalues: t (copy), createFetchSignalModule (copy), createCancelRequestHandlerModule (copy), createNetworkStatsHandlerModule (copy), createGrafanaLoggingHandlerModule (copy), signalsModule (copy)
			if p1 and t[p1] then
				return t[p1].getFetchSignal, t[p1].cancelRequest
			end
			local var1, var2 = createFetchSignalModule(p2)
			var1 = createCancelRequestHandlerModule(var1)
			local var3 = createNetworkStatsHandlerModule(var1)
			local var4 = createGrafanaLoggingHandlerModule(var1)
			
			local var5 = function()
				-- upvalues: var3 (ref), var4 (ref), var2 (ref)
				var3()
				var4()
				var2()
			end
			
			if p1 then
				local var6 = signalsModule.createEffect(function(p3)
					-- upvalues: var1 (write), t (copy), p1 (ref)
					local var7 = var1(p3)
					
					if var7.status == "Success" or var7.status == "Failed" then
						t[p1] = nil
					end
				end)
				
				var5 = function()
					-- upvalues: var6 (ref), var3 (ref), var4 (ref), var2 (ref), t (copy), p1 (ref)
					var6()
					var3()
					var4()
					var2()
					t[p1] = nil
				end
				
				t[p1] = { getFetchSignal = var1, cancelRequest = var5 }
			end
			return var1, var5
		end,
		cancelAll = function()
			-- upvalues: t (copy), httpSessionTrackerModule (copy)
			for i, v in t do
				v.cancelRequest()
			end
			t = {}
			httpSessionTrackerModule.cancelAll()
		end
	}
end