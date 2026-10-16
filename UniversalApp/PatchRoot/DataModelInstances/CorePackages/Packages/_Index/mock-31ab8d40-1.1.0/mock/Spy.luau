local SymbolsModule = require(script.Parent.symbols)
local IsAMagicMockModule = require(script.Parent.isAMagicMock)
local SpyModule = {}
SpyModule.__index = SpyModule

function SpyModule:__call(...) --[[ Line: 9 ]]
	return self.inner(...)
end

local t = {}
setmetatable(t, { __mode = "kv" })

function SpyModule.new(Callback) --[[ Line: 16 ]]
	-- upvalues: SymbolsModule (copy), SpyModule (copy), t (copy)
	local config = { [SymbolsModule.isSpy] = true, [SymbolsModule.Calls] = {} }
	setmetatable(config, SpyModule)
	
	local function Inner(...) --[[ Line: 23 ]]
		-- upvalues: Callback (copy), config (copy), SymbolsModule (upval)
		local config1 = {
			args = table.pack(...),
			result = table.pack(Callback(...))
		}
		table.insert(config[SymbolsModule.Calls], config1)
		
		return table.unpack(config1.result)
	end
	
	config.inner = Inner
	t[Inner] = config
	
	return config, Inner
end

function SpyModule.lookup(p1) --[[ Line: 38 ]]
	-- upvalues: t (copy)
	return t[p1]
end

function SpyModule:is(): boolean --[[ Line: 42 ]]
	-- upvalues: IsAMagicMockModule (copy), SymbolsModule (copy)
	return not IsAMagicMockModule(self) and (type(self) == "table" and self[SymbolsModule.isSpy] ~= nil)
end

return SpyModule