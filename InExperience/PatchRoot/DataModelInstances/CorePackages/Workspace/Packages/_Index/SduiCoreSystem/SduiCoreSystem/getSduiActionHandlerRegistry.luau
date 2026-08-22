local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local _ = require(sduiCoreSystem.SduiActionType)
local _ = require(sduiCoreSystem.SduiBuilderTypes)

local function createSduiActionHandlerRegistry() --[[ line: 30 ]]
	local t = {}
	
	return {
		getActionHandlerConfig = function(p0) --[[ line: 33 ]]
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
		registerActionHandlerConfig = function(p1, p2) --[[ line: 49 ]]
			-- upvalues: t (ref)
			t[p1] = p2
		end,
		registerActionHandlerConfigs = function(p3) --[[ line: 56 ]]
			-- upvalues: t (ref)
			for i, v in p3 do
				t[i] = v
			end
		end,
		debug_clear = function() --[[ line: 64 ]]
			-- upvalues: t (ref)
			table.clear(t)
		end,
		debug_getRegisteredActionHandlerConfigs = function() --[[ line: 68 ]]
			-- upvalues: t (ref)
			return t
		end
	}
end

local var2 = nil

return function() --[[ line: 86 | named "getSduiActionHandlerRegistry" ]]
	-- upvalues: var2 (write), createSduiActionHandlerRegistry (ref)
	if var2 == nil then
		var2 = createSduiActionHandlerRegistry()
	end
	return var2
end