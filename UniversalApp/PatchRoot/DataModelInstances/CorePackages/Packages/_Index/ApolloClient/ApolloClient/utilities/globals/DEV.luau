local Boolean = require(script.Parent.Parent.Parent.Parent.LuauPolyfill).Boolean
local Default = require(script.Parent.Parent.common.global).default

local function _()
	-- upvalues: Boolean (copy), Default (copy)
	local _, Result = xpcall(function()
		-- upvalues: Boolean (upval)
		return Boolean.toJSBoolean(_G.__DEV__)
	end, function()
		-- upvalues: Default (upval)
		Default.__DEV__ = true
		
		return Default.__DEV__
	end)
	
	return Result
end

local _, Result = xpcall(function()
	-- upvalues: Boolean (copy)
	return Boolean.toJSBoolean(_G.__DEV__)
end, function()
	-- upvalues: Default (copy)
	Default.__DEV__ = true
	
	return Default.__DEV__
end)

return { default = Result }