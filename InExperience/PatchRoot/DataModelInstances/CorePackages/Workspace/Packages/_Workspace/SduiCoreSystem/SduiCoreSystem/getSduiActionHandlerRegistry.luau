local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local _ = require(SduiCoreSystem.SduiActionType)
local _ = require(SduiCoreSystem.SduiBuilderTypes)

local function createSduiActionHandlerRegistry()
	local Tbl = {}
	
	return {
		getActionHandlerConfig = function(p1)
			-- upvalues: Tbl (copy)
			local Entry = Tbl[p1]
			
			if Entry and not Entry.handler and Entry.lazyHandler then
				Entry.handler = Entry.lazyHandler()
			end
			if Entry and not Entry.telemetryHandler then
				local LazyTelemetryHandlerFunction = Entry.lazyTelemetryHandler
				
				if LazyTelemetryHandlerFunction then
					Entry.telemetryHandler = LazyTelemetryHandlerFunction()
				end
			end
			return Entry
		end,
		registerActionHandlerConfig = function(Key, p1)
			-- upvalues: Tbl (copy)
			Tbl[Key] = p1
		end,
		registerActionHandlerConfigs = function(List)
			-- upvalues: Tbl (copy)
			for i, value in List do
				Tbl[i] = value
			end
		end,
		getRegisteredActionTypes = function()
			-- upvalues: Tbl (copy)
			local List = {}
			
			for i in Tbl do
				table.insert(List, i)
			end
			table.sort(List)
			
			return List
		end,
		debug_clear = function()
			-- upvalues: Tbl (copy)
			table.clear(Tbl)
		end,
		debug_getRegisteredActionHandlerConfigs = function()
			-- upvalues: Tbl (copy)
			return Tbl
		end
	}
end

local v1 = nil

return function()
	-- upvalues: v1 (ref), createSduiActionHandlerRegistry (copy)
	if v1 == nil then
		v1 = createSduiActionHandlerRegistry()
	end
	return v1
end