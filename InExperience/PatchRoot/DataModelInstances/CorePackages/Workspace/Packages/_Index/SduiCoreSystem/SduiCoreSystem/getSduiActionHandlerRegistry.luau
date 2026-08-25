local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local _ = require(sduiCoreSystem.SduiActionType)
local _ = require(sduiCoreSystem.SduiBuilderTypes)

local function createSduiActionHandlerRegistry()
	local t = {}
	
	return {
		getActionHandlerConfig = function(p0)
			-- upvalues: t (ref)
			local var4 = t[p0]
			
			if var4 and not var4.handler and var4.lazyHandler then
				var4.handler = var4.lazyHandler()
			end
			if var4 and not var4.telemetryHandler then
				local lazyTelemetryHandler = var4.lazyTelemetryHandler
				
				if lazyTelemetryHandler then
					var4.telemetryHandler = lazyTelemetryHandler()
				end
			end
			return var4
		end,
		registerActionHandlerConfig = function(p1, p2)
			-- upvalues: t (ref)
			t[p1] = p2
		end,
		registerActionHandlerConfigs = function(p3)
			-- upvalues: t (ref)
			for i, v in p3 do
				t[i] = v
			end
		end,
		debug_clear = function()
			-- upvalues: t (ref)
			table.clear(t)
		end,
		debug_getRegisteredActionHandlerConfigs = function()
			-- upvalues: t (ref)
			return t
		end
	}
end

local var2 = nil

return function()
	-- upvalues: var2 (write), createSduiActionHandlerRegistry (ref)
	if var2 == nil then
		var2 = createSduiActionHandlerRegistry()
	end
	return var2
end