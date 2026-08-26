local parent = script.Parent
local parent_1 = parent.Parent
local internalHttpStoreModule = require(parent_1.InternalHttpStore)
local _ = require(parent_1.Signals)
local createErrorStatusHandlerModule = require(parent.Handlers.createErrorStatusHandler)
local getHttpStore = internalHttpStoreModule.GetHttpStore
local _ = require(parent.Types)
local httpSessionTrackerModule = require(parent.HttpSessionTracker)

return function(p1, p2)
	-- upvalues: getHttpStore (ref), httpSessionTrackerModule (ref), createErrorStatusHandlerModule (ref)
	local var1 = getHttpStore(p2)
	local t = {}
	
	return {
		fetch = function(p3, p4)
			-- upvalues: httpSessionTrackerModule (copy), t (ref), var1 (ref), createErrorStatusHandlerModule (copy), p1 (ref)
			local var2 = httpSessionTrackerModule.currentSession()
			
			if t[var2] == nil then
				t[var2] = {}
			end
			local var3, var4 = var1.fetch(p3, p4)
			local var5 = createErrorStatusHandlerModule(p1)(var3)
			t[var2][p3] = { getFetchSignal = var5, cancelRequest = var4 }
			
			return var5, var4
		end,
		cancelAll = function()
			-- upvalues: httpSessionTrackerModule (copy), t (ref)
			local var2 = httpSessionTrackerModule.currentSession()
			
			if t[var2] then
				for i, v in t[var2] do
					v.cancelRequest()
				end
			end
			t[var2] = nil
			httpSessionTrackerModule.cancelAll()
			t[httpSessionTrackerModule.currentSession()] = {}
		end
	}
end