local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local _ = require(sduiCoreSystem.SduiImpressionEventType)
local _ = require(sduiCoreSystem.SduiBuilderTypes)

local function createSduiImpressionHandlerRegistry()
	local t = {}
	
	return {
		getImpressionHandlerConfig = function(p1)
			-- upvalues: t (ref)
			local var1 = t[p1]
			
			if var1 and not var1.handler and var1.lazyHandler then
				var1.handler = var1.lazyHandler()
			end
			return var1
		end,
		registerImpressionHandlerConfig = function(p1, p2)
			-- upvalues: t (ref)
			t[p1] = p2
		end,
		registerImpressionHandlerConfigs = function(p1)
			-- upvalues: t (ref)
			for i, v in p1 do
				t[i] = v
			end
		end,
		debug_clear = function()
			-- upvalues: t (ref)
			table.clear(t)
		end,
		debug_getRegisteredImpressionHandlerConfigs = function()
			-- upvalues: t (ref)
			return t
		end
	}
end

local var1 = nil

return function()
	-- upvalues: var1 (write), createSduiImpressionHandlerRegistry (ref)
	if var1 == nil then
		var1 = createSduiImpressionHandlerRegistry()
	end
	return var1
end