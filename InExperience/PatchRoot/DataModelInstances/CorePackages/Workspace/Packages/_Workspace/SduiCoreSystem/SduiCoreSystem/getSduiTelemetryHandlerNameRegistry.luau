local _ = require(script:FindFirstAncestor("SduiCoreSystem").SduiBuilderTypes)

local function createSduiTelemetryHandlerNameRegistry()
	local Tbl = {}
	
	return {
		getTelemetryHandler = function(p1)
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
		registerTelemetryHandler = function(Key, p1)
			-- upvalues: Tbl (copy)
			Tbl[Key] = p1
		end,
		registerTelemetryHandlers = function(List)
			-- upvalues: Tbl (copy)
			for i, value in List do
				Tbl[i] = value
			end
		end,
		debug_clear = function()
			-- upvalues: Tbl (copy)
			table.clear(Tbl)
		end,
		debug_getRegisteredConfigs = function()
			-- upvalues: Tbl (copy)
			return Tbl
		end
	}
end

local v1 = nil

return function()
	-- upvalues: v1 (ref), createSduiTelemetryHandlerNameRegistry (copy)
	if v1 == nil then
		v1 = createSduiTelemetryHandlerNameRegistry()
	end
	return v1
end