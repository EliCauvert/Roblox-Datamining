local SymbolsModule = require(script.Parent.symbols)
local SpyModule = require(script.Parent.Spy)
local MagicMockModule = {}
local config = {
	__index = function(p1, p2) --[[ Line: 7 ]]
		-- upvalues: SymbolsModule (copy), MagicMockModule (copy)
		local Meta = getmetatable(p1)
		local Entry = Meta[SymbolsModule.Children][p2]
		
		if Entry == nil then
			Entry = MagicMockModule.new()
			Meta[SymbolsModule.Children][p2] = Entry
			
			return Entry
		else
			return if Entry == SymbolsModule.None then nil else Entry
		end
	end,
	__newindex = function(p1, ReturnValue, NoneFunction) --[[ Line: 22 ]]
		-- upvalues: SpyModule (copy), SymbolsModule (copy)
		local Meta = getmetatable(p1)
		
		if type(NoneFunction) == "function" then
			local _, NewSpy2 = SpyModule.new(NoneFunction)
			NoneFunction = NewSpy2
		elseif NoneFunction == nil then
			NoneFunction = SymbolsModule.None
		end
		if ReturnValue == SymbolsModule.ReturnValue then
			Meta[SymbolsModule.ReturnValue] = { NoneFunction, n = 1 }
			
			return
		else
			Meta[SymbolsModule.Children][ReturnValue] = NoneFunction
		end
	end,
	__call = function(p1, ...) --[[ Line: 39 ]]
		-- upvalues: SymbolsModule (copy), MagicMockModule (copy)
		local Meta = getmetatable(p1)
		local config = {
			args = table.pack(...),
			result = Meta[SymbolsModule.ReturnValue]
		}
		
		if config.result == nil then
			config.result = { MagicMockModule.new(), n = 1 }
			Meta[SymbolsModule.ReturnValue] = config.result
		elseif config.result == SymbolsModule.None then
			config.result = { n = 1 }
		end
		table.insert(Meta[SymbolsModule.Calls], config)
		
		return table.unpack(config.result)
	end
}

function MagicMockModule.new(None) --[[ Line: 60 ]]
	-- upvalues: SymbolsModule (copy), config (copy)
	local config1 = {
		[SymbolsModule.Calls] = {},
		[SymbolsModule.Children] = {},
		[SymbolsModule.Lock] = None,
		[SymbolsModule.ReturnValue] = nil
	}
	
	for i, value in pairs(config) do
		config1[i] = value
	end
	return (setmetatable({}, config1))
end

return MagicMockModule