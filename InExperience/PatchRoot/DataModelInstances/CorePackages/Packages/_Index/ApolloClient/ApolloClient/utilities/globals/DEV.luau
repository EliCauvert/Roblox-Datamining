local Boolean = require(script.Parent.Parent.Parent.Parent.LuauPolyfill).Boolean
local Default = require(script.Parent.Parent.common.global).default

local function _() --[[ Line: 23 | Named "getDEV" ]]
	-- upvalues: Boolean (copy), Default (copy)
	local _, Result = xpcall(function() --[[ Line: 25 ]]
		-- upvalues: Boolean (upval)
		return Boolean.toJSBoolean(_G.__DEV__)
	end, function() --[[ Line: 27 ]]
		-- upvalues: Default (upval)
		Default.__DEV__ = true
		
		return Default.__DEV__
	end)
	
	return Result
end

local _, Result = xpcall(function() --[[ Line: 25 ]]
	-- upvalues: Boolean (copy)
	return Boolean.toJSBoolean(_G.__DEV__)
end, function() --[[ Line: 27 ]]
	-- upvalues: Default (copy)
	Default.__DEV__ = true
	
	return Default.__DEV__
end)

return { default = Result }