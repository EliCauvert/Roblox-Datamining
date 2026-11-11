local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local _ = require(SduiCoreSystem.SduiImpressionEventType)
local _ = require(SduiCoreSystem.SduiBuilderTypes)

local function createSduiImpressionHandlerRegistry()
	local Tbl = {}
	
	return {
		getImpressionHandlerConfig = function(p1)
			-- upvalues: Tbl (copy)
			local Entry = Tbl[p1]
			
			if Entry and not Entry.handler and Entry.lazyHandler then
				Entry.handler = Entry.lazyHandler()
			end
			return Entry
		end,
		registerImpressionHandlerConfig = function(Key, p1)
			-- upvalues: Tbl (copy)
			Tbl[Key] = p1
		end,
		registerImpressionHandlerConfigs = function(List)
			-- upvalues: Tbl (copy)
			for i, value in List do
				Tbl[i] = value
			end
		end,
		debug_clear = function()
			-- upvalues: Tbl (copy)
			table.clear(Tbl)
		end,
		debug_getRegisteredImpressionHandlerConfigs = function()
			-- upvalues: Tbl (copy)
			return Tbl
		end
	}
end

local v1 = nil

return function()
	-- upvalues: v1 (ref), createSduiImpressionHandlerRegistry (copy)
	if v1 == nil then
		v1 = createSduiImpressionHandlerRegistry()
	end
	return v1
end