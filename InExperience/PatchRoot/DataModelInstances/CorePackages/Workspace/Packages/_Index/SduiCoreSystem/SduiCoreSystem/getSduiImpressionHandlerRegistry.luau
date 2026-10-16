local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local _ = require(SduiCoreSystem.SduiImpressionEventType)
local _ = require(SduiCoreSystem.SduiBuilderTypes)

local function createSduiImpressionHandlerRegistry() --[[ Line: 32 ]]
	local Tbl = {}
	
	return {
		getImpressionHandlerConfig = function(p1) --[[ Line: 36 ]]
			-- upvalues: Tbl (copy)
			local Entry = Tbl[p1]
			
			if Entry and not Entry.handler and Entry.lazyHandler then
				Entry.handler = Entry.lazyHandler()
			end
			return Entry
		end,
		registerImpressionHandlerConfig = function(Key, p1) --[[ Line: 48 ]]
			-- upvalues: Tbl (copy)
			Tbl[Key] = p1
		end,
		registerImpressionHandlerConfigs = function(List) --[[ Line: 55 ]]
			-- upvalues: Tbl (copy)
			for i, value in List do
				Tbl[i] = value
			end
		end,
		debug_clear = function() --[[ Line: 63 ]]
			-- upvalues: Tbl (copy)
			table.clear(Tbl)
		end,
		debug_getRegisteredImpressionHandlerConfigs = function() --[[ Line: 67 ]]
			-- upvalues: Tbl (copy)
			return Tbl
		end
	}
end

local v1 = nil

return function() --[[ Line: 85 | Named "getSduiImpressionHandlerRegistry" ]]
	-- upvalues: v1 (ref), createSduiImpressionHandlerRegistry (copy)
	if v1 == nil then
		v1 = createSduiImpressionHandlerRegistry()
	end
	return v1
end