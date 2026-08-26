local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local _ = require(sduiCoreSystem.Parent.React)
local _ = require(sduiCoreSystem.SduiComponentType)
local _ = require(sduiCoreSystem.SduiBuilderTypes)

local function createSduiComponentRegistry()
	local t = {}
	
	return {
		getComponent = function(p1)
			-- upvalues: t (ref)
			local var1
			local var2 = t[p1]
			
			if var2 then
				if not var2.component and var2.getLazyComponent then
					var2.component = var2.getLazyComponent()
				end
				var1 = var2
			else
				var1 = nil
			end
			return if var1 then var1.component else nil
		end,
		getComponentDefinition = function(p1)
			-- upvalues: t (ref)
			local var1 = t[p1]
			
			if not var1 then
				return nil
			elseif not var1.component and var1.getLazyComponent then
				var1.component = var1.getLazyComponent()
			end
			return var1
		end,
		registerComponentDefinition = function(p1, p2)
			-- upvalues: t (ref)
			t[p1] = p2
		end,
		registerComponentDefinitions = function(p1)
			-- upvalues: t (ref)
			for i, v in p1 do
				t[i] = v
			end
		end
	}
end

local var1 = nil

return function()
	-- upvalues: var1 (write), createSduiComponentRegistry (ref)
	if var1 == nil then
		var1 = createSduiComponentRegistry()
	end
	return var1
end