local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local _ = require(sduiCoreSystem.SduiActionType)
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local fFlagSduiActionTelemetryHandler = require(parent.SharedFlags).FFlagSduiActionTelemetryHandler

local function createSduiActionHandlerRegistry()
	-- upvalues: fFlagSduiActionTelemetryHandler (ref)
	local t = {}
	
	return {
		getActionHandlerConfig = function(p1)
			-- upvalues: t (ref), fFlagSduiActionTelemetryHandler (copy)
			local var1 = t[p1]
			
			if var1 and not var1.handler and var1.lazyHandler then
				var1.handler = var1.lazyHandler()
			end
			if fFlagSduiActionTelemetryHandler and var1 and not var1.telemetryHandler then
				local lazyTelemetryHandler = var1.lazyTelemetryHandler
				
				if lazyTelemetryHandler then
					var1.telemetryHandler = lazyTelemetryHandler()
				end
			end
			return var1
		end,
		registerActionHandlerConfig = function(p1, p2)
			-- upvalues: t (ref)
			t[p1] = p2
		end,
		registerActionHandlerConfigs = function(p1)
			-- upvalues: t (ref)
			for i, v in p1 do
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

local var1 = nil

return function()
	-- upvalues: var1 (write), createSduiActionHandlerRegistry (ref)
	if var1 == nil then
		var1 = createSduiActionHandlerRegistry()
	end
	return var1
end