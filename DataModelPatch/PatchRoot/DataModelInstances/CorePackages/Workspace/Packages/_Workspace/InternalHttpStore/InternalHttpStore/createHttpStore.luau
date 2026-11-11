local Parent = script.Parent
local SignalsModule = require(Parent.Parent.Signals)
local HttpSessionTrackerModule = require(Parent.HttpSessionTracker)
local CreateFetchSignalModule = require(Parent.createFetchSignal)
local CreateCancelRequestHandlerModule = require(Parent.GlobalHandlers.createCancelRequestHandler)
local CreateNetworkStatsHandlerModule = require(Parent.GlobalHandlers.createNetworkStatsHandler)
local CreateGrafanaLoggingHandlerModule = require(Parent.GlobalHandlers.createGrafanaLoggingHandler)
local _ = require(Parent.HttpStoreTypes)
local t = {}

return function()
	-- upvalues: t (ref), CreateFetchSignalModule (copy), CreateCancelRequestHandlerModule (copy), CreateNetworkStatsHandlerModule (copy), CreateGrafanaLoggingHandlerModule (copy), SignalsModule (copy), HttpSessionTrackerModule (copy)
	return {
		fetch = function(Key, p1)
			-- upvalues: t (upval), CreateFetchSignalModule (upval), CreateCancelRequestHandlerModule (upval), CreateNetworkStatsHandlerModule (upval), CreateGrafanaLoggingHandlerModule (upval), SignalsModule (upval)
			if Key and t[Key] then
				return t[Key].getFetchSignal, t[Key].cancelRequest
			end
			local FetchSignalModule, FetchSignalModule2 = CreateFetchSignalModule(p1)
			local CancelRequestHandlerModule = CreateCancelRequestHandlerModule(FetchSignalModule)
			local NetworkStatsHandlerModule = CreateNetworkStatsHandlerModule(CancelRequestHandlerModule)
			local GrafanaLoggingHandlerModule = CreateGrafanaLoggingHandlerModule(CancelRequestHandlerModule)
			
			local function CancelRequest()
				-- upvalues: NetworkStatsHandlerModule (copy), GrafanaLoggingHandlerModule (copy), FetchSignalModule2 (copy)
				NetworkStatsHandlerModule()
				GrafanaLoggingHandlerModule()
				FetchSignalModule2()
			end
			
			if Key then
				local Effect = SignalsModule.createEffect(function(p2)
					-- upvalues: CancelRequestHandlerModule (ref), t (upval), Key (copy)
					local CancelRequestHandlerModuleResult = CancelRequestHandlerModule(p2)
					
					if CancelRequestHandlerModuleResult.status == "Success" or CancelRequestHandlerModuleResult.status == "Failed" then
						t[Key] = nil
					end
				end)
				
				CancelRequest = function()
					-- upvalues: Effect (copy), NetworkStatsHandlerModule (copy), GrafanaLoggingHandlerModule (copy), FetchSignalModule2 (copy), t (upval), Key (copy)
					Effect()
					NetworkStatsHandlerModule()
					GrafanaLoggingHandlerModule()
					FetchSignalModule2()
					t[Key] = nil
				end
				
				t[Key] = {
					getFetchSignal = CancelRequestHandlerModule,
					cancelRequest = CancelRequest
				}
			end
			return CancelRequestHandlerModule, CancelRequest
		end,
		cancelAll = function()
			-- upvalues: t (upval), HttpSessionTrackerModule (upval)
			for _, value in t do
				value.cancelRequest()
			end
			t = {}
			HttpSessionTrackerModule.cancelAll()
		end
	}
end