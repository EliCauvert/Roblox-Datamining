local t = {}
local boolean = require(script.Parent.Parent.Parent.Parent.LuauPolyfill).Boolean
local default = require(script.Parent.Parent.common.global).default

local function _() --[[ line: 23 | named "getDEV" ]]
	-- upvalues: boolean (ref), default (ref)
	local _, status = xpcall(function() --[[ line: 25 ]]
		-- upvalues: boolean (copy)
		return boolean.toJSBoolean(_G.__DEV__)
	end, function() --[[ line: 27 ]]
		-- upvalues: default (copy)
		default.__DEV__ = true
		
		return default.__DEV__
	end)
	
	return status
end

local _, status = xpcall(function() --[[ line: 25 ]]
	-- upvalues: boolean (ref)
	return boolean.toJSBoolean(_G.__DEV__)
end, function() --[[ line: 27 ]]
	-- upvalues: default (ref)
	default.__DEV__ = true
	
	return default.__DEV__
end)
t.default = status

return t