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
		fetch = function(p0, p1)
			-- upvalues: t (copy), createFetchSignalModule (copy), createCancelRequestHandlerModule (copy), createNetworkStatsHandlerModule (copy), createGrafanaLoggingHandlerModule (copy), signalsModule (copy)
			if p0 and t[p0] then
				return t[p0].getFetchSignal, t[p0].cancelRequest
			end
			local var7, var8 = createFetchSignalModule(p1)
			var7 = createCancelRequestHandlerModule(var7)
			local var9 = createNetworkStatsHandlerModule(var7)
			local var10 = createGrafanaLoggingHandlerModule(var7)
			
			local var11 = function()
				-- upvalues: var9 (ref), var10 (ref), var8 (ref)
				var9()
				var10()
				var8()
			end
			
			if p0 then
				local var12 = signalsModule.createEffect(function(p2)
					-- upvalues: var7 (write), t (copy), p0 (ref)
					local var13 = var7(p2)
					
					if var13.status == "Success" or var13.status == "Failed" then
						t[p0] = nil
					end
				end)
				
				var11 = function()
					-- upvalues: var12 (ref), var9 (ref), var10 (ref), var8 (ref), t (copy), p0 (ref)
					var12()
					var9()
					var10()
					var8()
					t[p0] = nil
				end
				
				t[p0] = { getFetchSignal = var7, cancelRequest = var11 }
			end
			return var7, var11
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