local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local _ = require(SduiCoreSystem.Parent.React)
local _ = require(SduiCoreSystem.SduiComponentType)
local _ = require(SduiCoreSystem.SduiBuilderTypes)

local function createSduiComponentRegistry() --[[ Line: 28 ]]
	local t = {}
	
	return {
		getComponent = function(p1) --[[ Line: 43 ]]
			-- upvalues: t (copy)
			local Entry = t[p1]
			local v1 = nil
			
			if Entry then
				if not Entry.component and Entry.getLazyComponent then
					Entry.component = Entry.getLazyComponent()
				end
				v1 = Entry
			else
				v1 = nil
			end
			return if v1 then v1.component else nil
		end,
		getComponentDefinition = function(p1) --[[ Line: 31 ]]
			-- upvalues: t (copy)
			local Entry = t[p1]
			
			if not Entry then
				return nil
			end
			if not Entry.component and Entry.getLazyComponent then
				Entry.component = Entry.getLazyComponent()
			end
			return Entry
		end,
		registerComponentDefinition = function(Key, p1) --[[ Line: 53 ]]
			-- upvalues: t (copy)
			t[Key] = p1
		end,
		registerComponentDefinitions = function(List) --[[ Line: 60 ]]
			-- upvalues: t (copy)
			for i, value in List do
				t[i] = value
			end
		end,
		getRegisteredComponentTypes = function() --[[ Line: 68 ]]
			-- upvalues: t (copy)
			local List = {}
			
			for i in t do
				table.insert(List, i)
			end
			table.sort(List)
			
			return List
		end
	}
end

local v1 = nil

return function() --[[ Line: 87 | Named "getSduiComponentRegistry" ]]
	-- upvalues: v1 (ref), createSduiComponentRegistry (copy)
	if v1 == nil then
		v1 = createSduiComponentRegistry()
	end
	return v1
end