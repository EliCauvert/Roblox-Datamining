-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:02 2026 Pacific Standard Time.

local t = {}

function t.new(p0) --[[ line: 19 ]]
	-- upvalues: t (ref)
	local t_1 = { defaultConfig = p0, defaultConfigKeys = {} }
	
	for i in pairs(p0) do
		table.insert(t_1.defaultConfigKeys, i)
	end
	t_1._currentConfig = setmetatable({}, {
		__index = function(_, p1) --[[ line: 29 ]]
			-- upvalues: t_1 (ref)
			error(("Invalid global configuration key %q. Valid configuration keys are: %s"):format(tostring(p1), table.concat(t_1.defaultConfigKeys, ", ")), 3)
		end
	})
	
	function t_1.set(...) --[[ line: 42 ]]
		-- upvalues: t (copy), t_1 (ref)
		return t.set(t_1, ...)
	end
	
	function t_1.get(...) --[[ line: 46 ]]
		-- upvalues: t (copy), t_1 (ref)
		return t.get(t_1, ...)
	end
	
	function t_1.scoped(...) --[[ line: 50 ]]
		-- upvalues: t (copy), t_1 (ref)
		return t.scoped(t_1, ...)
	end
	
	t_1.set(p0)
	
	return t_1
end

function t.set(value, p2) --[[ line: 59 ]]
	local t = {}
	local t_1 = {}
	
	for i, v in pairs(p2) do
		if value.defaultConfig[i] == nil then
			table.insert(t, i)
		elseif typeof(v) == "boolean" then
			value._currentConfig[i] = v
		else
			table.insert(t_1, tostring(i) .. " (type " .. typeof(v) .. ")")
		end
	end
	if next(t) ~= nil then
		error(("Invalid global configuration keys %s. Valid configuration keys are: %s"):format(table.concat(t, ", "), table.concat(value.defaultConfigKeys, ", ")), 3)
	end
	if next(t_1) ~= nil then
		error(("Invalid global configuration types for keys %s. All configuration values must be boolean."):format(table.concat(t_1, ", ")), 3)
	end
end

function t.get(p3) --[[ line: 98 ]]
	return p3._currentConfig
end

return t