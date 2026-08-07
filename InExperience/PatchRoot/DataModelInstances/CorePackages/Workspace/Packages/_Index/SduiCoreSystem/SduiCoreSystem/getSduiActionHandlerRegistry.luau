local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local _ = require(sduiCoreSystem.SduiActionType)
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local fFlagSduiActionTelemetryHandler = require(parent.SharedFlags).FFlagSduiActionTelemetryHandler

local function createSduiActionHandlerRegistry() --[[ line: 33 ]]
	-- upvalues: fFlagSduiActionTelemetryHandler (ref)
	local t = {}
	
	return {
		getActionHandlerConfig = function(p0) --[[ line: 36 ]]
			-- upvalues: t (ref), fFlagSduiActionTelemetryHandler (copy)
			local var4 = t[p0]
			
			if var4 and not var4.handler and var4.lazyHandler then
				var4.handler = var4.lazyHandler()
			end
			if fFlagSduiActionTelemetryHandler and var4 and not var4.telemetryHandler then
				local lazyTelemetryHandler = var4.lazyTelemetryHandler
				
				if lazyTelemetryHandler then
					var4.telemetryHandler = lazyTelemetryHandler()
				end
			end
			return var4
		end,
		registerActionHandlerConfig = function(p1, p2) --[[ line: 54 ]]
			-- upvalues: t (ref)
			t[p1] = p2
		end,
		registerActionHandlerConfigs = function(p3) --[[ line: 61 ]]
			-- upvalues: t (ref)
			for i, v in p3 do
				t[i] = v
			end
		end,
		debug_clear = function() --[[ line: 69 ]]
			-- upvalues: t (ref)
			table.clear(t)
		end,
		debug_getRegisteredActionHandlerConfigs = function() --[[ line: 73 ]]
			-- upvalues: t (ref)
			return t
		end
	}
end

local var2 = nil

return function() --[[ line: 91 | named "getSduiActionHandlerRegistry" ]]
	-- upvalues: var2 (write), createSduiActionHandlerRegistry (ref)
	if var2 == nil then
		var2 = createSduiActionHandlerRegistry()
	end
	return var2
end