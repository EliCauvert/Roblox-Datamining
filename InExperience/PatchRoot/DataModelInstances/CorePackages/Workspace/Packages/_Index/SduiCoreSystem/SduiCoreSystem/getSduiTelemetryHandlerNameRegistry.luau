local _ = require(script:FindFirstAncestor("SduiCoreSystem").SduiBuilderTypes)

local function createSduiTelemetryHandlerNameRegistry() --[[ Line: 23 ]]
	local Tbl = {}
	
	return {
		getTelemetryHandler = function(p1) --[[ Line: 26 ]]
			-- upvalues: Tbl (copy)
			local Entry = Tbl[p1]
			
			if Entry == nil then
				return nil
			end
			if not Entry.handler and Entry.lazyHandler then
				Entry.handler = Entry.lazyHandler()
			end
			return Entry.handler
		end,
		registerTelemetryHandler = function(Key, p1) --[[ Line: 38 ]]
			-- upvalues: Tbl (copy)
			Tbl[Key] = p1
		end,
		registerTelemetryHandlers = function(List) --[[ Line: 42 ]]
			-- upvalues: Tbl (copy)
			for i, value in List do
				Tbl[i] = value
			end
		end,
		debug_clear = function() --[[ Line: 48 ]]
			-- upvalues: Tbl (copy)
			table.clear(Tbl)
		end,
		debug_getRegisteredConfigs = function() --[[ Line: 52 ]]
			-- upvalues: Tbl (copy)
			return Tbl
		end
	}
end

local v1 = nil

return function() --[[ Line: 67 | Named "getSduiTelemetryHandlerNameRegistry" ]]
	-- upvalues: v1 (ref), createSduiTelemetryHandlerNameRegistry (copy)
	if v1 == nil then
		v1 = createSduiTelemetryHandlerNameRegistry()
	end
	return v1
end