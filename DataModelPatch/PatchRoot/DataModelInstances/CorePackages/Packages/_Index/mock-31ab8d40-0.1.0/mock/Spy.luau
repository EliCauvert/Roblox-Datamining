local SymbolsModule = require(script.Parent.symbols)
local SpyModule = {}
SpyModule.__index = SpyModule
local t = {}
setmetatable(t, { __mode = "kv" })

function SpyModule.new(Callback)
	-- upvalues: SymbolsModule (copy), SpyModule (copy), t (copy)
	local config = { [SymbolsModule.Calls] = {} }
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

return SpyModule