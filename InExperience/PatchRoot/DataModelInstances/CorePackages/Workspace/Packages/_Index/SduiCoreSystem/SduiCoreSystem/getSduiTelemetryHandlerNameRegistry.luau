local _ = require(script:FindFirstAncestor("SduiCoreSystem").SduiBuilderTypes)

local function createSduiTelemetryHandlerNameRegistry()
	local t = {}
	
	return {
		getTelemetryHandler = function(p0)
			-- upvalues: t (ref)
			local var3 = t[p0]
			
			if var3 == nil then
				return nil
			elseif not var3.handler and var3.lazyHandler then
				var3.handler = var3.lazyHandler()
			end
			return var3.handler
		end,
		registerTelemetryHandler = function(p1, p2)
			-- upvalues: t (ref)
			t[p1] = p2
		end,
		registerTelemetryHandlers = function(p3)
			-- upvalues: t (ref)
			for i, v in p3 do
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