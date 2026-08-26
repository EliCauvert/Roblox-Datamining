local navigationSymbolModule = require(script.Parent.NavigationSymbol)
local var1 = navigationSymbolModule("BACK")
local var2 = navigationSymbolModule("INIT")
local var3 = navigationSymbolModule("NAVIGATE")
local var4 = navigationSymbolModule("SET_PARAMS")
local t = {
	Back = var1,
	Init = var2,
	Navigate = var3,
	SetParams = var4
}
setmetatable(t, {
	__index = function(_, p1)
		error(("%q is not a valid member of NavigationActions"):format(tostring(p1)), 2)
	end
})

function t.back(p1)
	-- upvalues: var1 (ref)
	p1 = p1 or {}
	
	return { type = var1, key = p1.key, immediate = p1.immediate }
end

function t.init(p1)
	-- upvalues: var2 (ref)
	return { type = var2, params = (p1 or {}).params }
end

function t.navigate(p1)
	-- upvalues: var3 (ref)
	p1 = p1 or {}
	
	return {
		type = var3,
		routeName = p1.routeName,
		params = p1.params,
		action = p1.action,
		key = p1.key
	}
end

function t.setParams(value)
	-- upvalues: var4 (ref)
	local value_1 = value or {}
	
	return {
		preserveFocus = true,
		type = var4,
		key = value_1.key,
		params = value_1.params
	}
end

return t