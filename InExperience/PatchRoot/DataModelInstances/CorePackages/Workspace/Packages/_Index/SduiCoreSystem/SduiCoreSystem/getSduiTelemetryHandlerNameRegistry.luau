local _ = require(script:FindFirstAncestor("SduiCoreSystem").SduiBuilderTypes)

local function createSduiTelemetryHandlerNameRegistry()
	local t = {}
	
	return {
		getTelemetryHandler = function(p1)
			-- upvalues: t (ref)
			local var1 = t[p1]
			
			if var1 == nil then
				return nil
			elseif not var1.handler and var1.lazyHandler then
				var1.handler = var1.lazyHandler()
			end
			return var1.handler
		end,
		registerTelemetryHandler = function(p1, p2)
			-- upvalues: t (ref)
			t[p1] = p2
		end,
		registerTelemetryHandlers = function(p1)
			-- upvalues: t (ref)
			for i, v in p1 do
				t[i] = v
			end
		end,
		debug_clear = function()
			-- upvalues: t (ref)
			table.clear(t)
		end,
		debug_getRegisteredConfigs = function()
			-- upvalues: t (ref)
			return t
		end
	}
end

local var1 = nil

return function()
	-- upvalues: var1 (write), createSduiTelemetryHandlerNameRegistry (ref)
	if var1 == nil then
		var1 = createSduiTelemetryHandlerNameRegistry()
	end
	return var1
end