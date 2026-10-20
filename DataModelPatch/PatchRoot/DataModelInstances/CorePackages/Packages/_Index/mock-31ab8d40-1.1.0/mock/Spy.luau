local SymbolsModule = require(script.Parent.symbols)
local IsAMagicMockModule = require(script.Parent.isAMagicMock)
local SpyModule = {}
SpyModule.__index = SpyModule

function SpyModule:__call(...)
	return self.inner(...)
end

local t = {}
setmetatable(t, { __mode = "kv" })

function SpyModule.new(Callback)
	-- upvalues: SymbolsModule (copy), SpyModule (copy), t (copy)
	local config = { [SymbolsModule.isSpy] = true, [SymbolsModule.Calls] = {} }
	setmetatable(config, SpyModule)
	
	local function Inner(...)
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

function SpyModule.lookup(p1)
	-- upvalues: t (copy)
	return t[p1]
end

function SpyModule:is(): boolean
	-- upvalues: IsAMagicMockModule (copy), SymbolsModule (copy)
	return not IsAMagicMockModule(self) and (type(self) == "table" and self[SymbolsModule.isSpy] ~= nil)
end

return SpyModule