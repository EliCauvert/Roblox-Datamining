local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local _ = require(sduiCoreSystem.Parent.React)
local _ = require(sduiCoreSystem.SduiComponentType)
local _ = require(sduiCoreSystem.SduiBuilderTypes)

local function createSduiComponentRegistry() --[[ line: 27 ]]
	local t = {}
	
	return {
		getComponent = function(p0) --[[ line: 42 ]]
			-- upvalues: t (ref)
			local var5
			local var4 = t[p0]
			
			if var4 then
				if not var4.component and var4.getLazyComponent then
					var4.component = var4.getLazyComponent()
				end
				var5 = var4
			else
				var5 = nil
			end
			return if var5 then var5.component else nil
		end,
		getComponentDefinition = function(p1) --[[ line: 30 ]]
			-- upvalues: t (ref)
			local var6 = t[p1]
			
			if not var6 then
				return nil
			elseif not var6.component and var6.getLazyComponent then
				var6.component = var6.getLazyComponent()
			end
			return var6
		end,
		registerComponentDefinition = function(p2, p3) --[[ line: 52 ]]
			-- upvalues: t (ref)
			t[p2] = p3
		end,
		registerComponentDefinitions = function(p4) --[[ line: 59 ]]
			-- upvalues: t (ref)
			for i, v in p4 do
				t[i] = v
			end
		end
	}
end

local var2 = nil

return function() --[[ line: 76 | named "getSduiComponentRegistry" ]]
	-- upvalues: var2 (write), createSduiComponentRegistry (ref)
	if var2 == nil then
		var2 = createSduiComponentRegistry()
	end
	return var2
end