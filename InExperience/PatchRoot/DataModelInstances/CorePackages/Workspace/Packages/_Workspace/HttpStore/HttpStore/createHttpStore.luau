local Parent = script.Parent
local Parent1 = Parent.Parent
local _ = require(Parent1.Signals)
local CreateErrorStatusHandlerModule = require(Parent.Handlers.createErrorStatusHandler)
local GetHttpStoreFunction = require(Parent1.InternalHttpStore).GetHttpStore
local _ = require(Parent.Types)
local HttpSessionTrackerModule = require(Parent.HttpSessionTracker)

return function(p1, p2) --[[ Line: 25 | Named "createHttpStore" ]]
	-- upvalues: GetHttpStoreFunction (copy), HttpSessionTrackerModule (copy), CreateErrorStatusHandlerModule (copy)
	local HttpStore = GetHttpStoreFunction(p2)
	local t = {}
	
	return {
		fetch = function(p3, p4) --[[ Line: 30 ]]
			-- upvalues: HttpSessionTrackerModule (upval), t (copy), HttpStore (copy), CreateErrorStatusHandlerModule (upval), p1 (copy)
			local CurrentSessionResult = HttpSessionTrackerModule.currentSession()
			
			if t[CurrentSessionResult] == nil then
				t[CurrentSessionResult] = {}
			end
			local FetchResult, FetchResult2 = HttpStore.fetch(p3, p4)
			local GetFetchSignal = CreateErrorStatusHandlerModule(p1)(FetchResult)
			t[CurrentSessionResult][p3] = {
				getFetchSignal = GetFetchSignal,
				cancelRequest = FetchResult2
			}
			
			return GetFetchSignal, FetchResult2
		end,
		cancelAll = function() --[[ Line: 46 ]]
			-- upvalues: HttpSessionTrackerModule (upval), t (copy)
			local CurrentSessionResult = HttpSessionTrackerModule.currentSession()
			
			if t[CurrentSessionResult] then
				for _, value in t[CurrentSessionResult] do
					value.cancelRequest()
				end
			end
			t[CurrentSessionResult] = nil
			HttpSessionTrackerModule.cancelAll()
			t[HttpSessionTrackerModule.currentSession()] = {}
		end
	}
end