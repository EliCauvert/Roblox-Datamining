local parent = script.Parent
local parent_1 = parent.Parent
local internalHttpStoreModule = require(parent_1.InternalHttpStore)
local _ = require(parent_1.Signals)
local createErrorStatusHandlerModule = require(parent.Handlers.createErrorStatusHandler)
local getHttpStore = internalHttpStoreModule.GetHttpStore
local _ = require(parent.Types)
local httpSessionTrackerModule = require(parent.HttpSessionTracker)

return function(p0, p1)
	-- upvalues: getHttpStore (ref), httpSessionTrackerModule (ref), createErrorStatusHandlerModule (ref)
	local var3 = getHttpStore(p1)
	local t = {}
	
	return {
		fetch = function(p2, p3)
			-- upvalues: httpSessionTrackerModule (copy), t (ref), var3 (ref), createErrorStatusHandlerModule (copy), p0 (ref)
			local var5 = httpSessionTrackerModule.currentSession()
			
			if t[var5] == nil then
				t[var5] = {}
			end
			local var6, var7 = var3.fetch(p2, p3)
			local var8 = createErrorStatusHandlerModule(p0)(var6)
			t[var5][p2] = { getFetchSignal = var8, cancelRequest = var7 }
			
			return var8, var7
		end,
		cancelAll = function()
			-- upvalues: httpSessionTrackerModule (copy), t (ref)
			local var9 = httpSessionTrackerModule.currentSession()
			
			if t[var9] then
				for i, v in t[var9] do
					v.cancelRequest()
				end
			end
			t[var9] = nil
			httpSessionTrackerModule.cancelAll()
			t[httpSessionTrackerModule.currentSession()] = {}
		end
	}
end