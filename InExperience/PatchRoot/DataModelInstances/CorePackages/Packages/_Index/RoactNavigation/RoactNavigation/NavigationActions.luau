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
	__index = function(_, p0) --[[ line: 24 ]]
		error(("%q is not a valid member of NavigationActions"):format(tostring(p0)), 2)
	end
})

function t.back(p1) --[[ line: 30 ]]
	-- upvalues: var1 (ref)
	p1 = p1 or {}
	
	return { type = var1, key = p1.key, immediate = p1.immediate }
end

function t.init(p2) --[[ line: 40 ]]
	-- upvalues: var2 (ref)
	return { type = var2, params = (p2 or {}).params }
end

function t.navigate(p3) --[[ line: 49 ]]
	-- upvalues: var3 (ref)
	p3 = p3 or {}
	
	return {
		type = var3,
		routeName = p3.routeName,
		params = p3.params,
		action = p3.action,
		key = p3.key
	}
end

function t.setParams(value) --[[ line: 61 ]]
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