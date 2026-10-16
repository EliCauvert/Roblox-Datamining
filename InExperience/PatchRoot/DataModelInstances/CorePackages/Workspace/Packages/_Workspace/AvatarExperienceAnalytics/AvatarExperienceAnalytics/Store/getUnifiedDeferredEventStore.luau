local SignalsModule = require(script:FindFirstAncestor("AvatarExperienceAnalytics").Parent.Signals)
local CreateSignalFunction = SignalsModule.createSignal

return SignalsModule.createComputed(function() --[[ Line: 18 | Named "createUnifiedLoggingDeferredEventStore" ]]
	-- upvalues: CreateSignalFunction (copy)
	local Signal, Signal2 = CreateSignalFunction(false)
	local T = {}
	
	return {
		isEntered = Signal,
		enqueue = function(Key, p1) --[[ Line: 24 ]]
			-- upvalues: T (ref)
			local Entry = T[Key]
			
			if not Entry then
				Entry = {}
				T[Key] = Entry
			end
			table.insert(Entry, p1)
		end,
		takePending = function(Key) --[[ Line: 32 ]]
			-- upvalues: T (ref)
			if Key ~= nil then
				T[Key] = nil
				
				return T[Key] or {}
			end
			local List = {}
			
			for _, value in T do
				for _, value1 in value do
					table.insert(List, value1)
				end
			end
			T = {}
			
			return List
		end,
		markEntered = function() --[[ Line: 48 ]]
			-- upvalues: Signal2 (copy)
			Signal2(true)
		end,
		reset = function() --[[ Line: 51 ]]
			-- upvalues: Signal2 (copy), T (ref)
			Signal2(false)
			T = {}
		end
	}
end)