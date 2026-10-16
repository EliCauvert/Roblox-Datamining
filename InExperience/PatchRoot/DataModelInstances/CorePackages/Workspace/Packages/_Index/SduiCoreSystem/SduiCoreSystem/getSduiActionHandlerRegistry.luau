local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local _ = require(SduiCoreSystem.SduiActionType)
local _ = require(SduiCoreSystem.SduiBuilderTypes)

local function createSduiActionHandlerRegistry() --[[ Line: 31 ]]
	local Tbl = {}
	
	return {
		getActionHandlerConfig = function(p1) --[[ Line: 34 ]]
			-- upvalues: Tbl (copy)
			local Entry = Tbl[p1]
			
			if Entry and not Entry.handler and Entry.lazyHandler then
				Entry.handler = Entry.lazyHandler()
			end
			if Entry and not Entry.telemetryHandler then
				local LazyTelemetryHandlerFunction = Entry.lazyTelemetryHandler
				
				if LazyTelemetryHandlerFunction then
					Entry.telemetryHandler = LazyTelemetryHandlerFunction()
				end
			end
			return Entry
		end,
		registerActionHandlerConfig = function(Key, p1) --[[ Line: 50 ]]
			-- upvalues: Tbl (copy)
			Tbl[Key] = p1
		end,
		registerActionHandlerConfigs = function(List) --[[ Line: 57 ]]
			-- upvalues: Tbl (copy)
			for i, value in List do
				Tbl[i] = value
			end
		end,
		getRegisteredActionTypes = function() --[[ Line: 65 ]]
			-- upvalues: Tbl (copy)
			local List = {}
			
			for i in Tbl do
				table.insert(List, i)
			end
			table.sort(List)
			
			return List
		end,
		debug_clear = function() --[[ Line: 74 ]]
			-- upvalues: Tbl (copy)
			table.clear(Tbl)
		end,
		debug_getRegisteredActionHandlerConfigs = function() --[[ Line: 78 ]]
			-- upvalues: Tbl (copy)
			return Tbl
		end
	}
end

local v1 = nil

return function() --[[ Line: 97 | Named "getSduiActionHandlerRegistry" ]]
	-- upvalues: v1 (ref), createSduiActionHandlerRegistry (copy)
	if v1 == nil then
		v1 = createSduiActionHandlerRegistry()
	end
	return v1
end