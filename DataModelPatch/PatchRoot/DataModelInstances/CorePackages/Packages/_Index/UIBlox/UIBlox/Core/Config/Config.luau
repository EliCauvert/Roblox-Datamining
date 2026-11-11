local Config = {}

function Config.new(DefaultConfig)
	-- upvalues: Config (copy)
	local config = { defaultConfig = DefaultConfig, defaultConfigKeys = {} }
	
	for i in pairs(DefaultConfig) do
		table.insert(config.defaultConfigKeys, i)
	end
	config._currentConfig = setmetatable({}, {
		__index = function(_, p1)
			-- upvalues: config (copy)
			error(("Invalid global configuration key %q. Valid configuration keys are: %s"):format(tostring(p1), table.concat(config.defaultConfigKeys, ", ")), 3)
		end
	})
	
	function config.set(...)
		-- upvalues: Config (upval), config (copy)
		return Config.set(config, ...)
	end
	
	function config.get(...)
		-- upvalues: Config (upval), config (copy)
		return Config.get(config, ...)
	end
	
	function config.scoped(...)
		-- upvalues: Config (upval), config (copy)
		return Config.scoped(config, ...)
	end
	
	config.set(DefaultConfig)
	
	return config
end

function Config.set(p1, List)
	local List1 = {}
	local List2 = {}
	
	for i, value in pairs(List) do
		if p1.defaultConfig[i] == nil then
			table.insert(List1, i)
		elseif typeof(value) == "boolean" then
			p1._currentConfig[i] = value
		else
			table.insert(List2, tostring(i) .. " (type " .. typeof(value) .. ")")
		end
	end
	if next(List1) ~= nil then
		error(("Invalid global configuration keys %s. Valid configuration keys are: %s"):format(table.concat(List1, ", "), table.concat(p1.defaultConfigKeys, ", ")), 3)
	end
	if next(List2) ~= nil then
		error(("Invalid global configuration types for keys %s. All configuration values must be boolean."):format(table.concat(List2, ", ")), 3)
	end
end

function Config.get(p2)
	return p2._currentConfig
end

return Config