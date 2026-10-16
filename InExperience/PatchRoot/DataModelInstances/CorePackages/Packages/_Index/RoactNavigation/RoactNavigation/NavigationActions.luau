local NavigationSymbolModule = require(script.Parent.NavigationSymbol)
local BACK = NavigationSymbolModule("BACK")
local INIT = NavigationSymbolModule("INIT")
local NAVIGATE = NavigationSymbolModule("NAVIGATE")
local SETPARAMS = NavigationSymbolModule("SET_PARAMS")
local NavigationActionsModule = {
	Back = BACK,
	Init = INIT,
	Navigate = NAVIGATE,
	SetParams = SETPARAMS
}
setmetatable(NavigationActionsModule, {
	__index = function(_, p1) --[[ Line: 24 ]]
		error(("%q is not a valid member of NavigationActions"):format((tostring(p1))), 2)
	end
})

function NavigationActionsModule.back(p1) --[[ Line: 30 ]]
	-- upvalues: BACK (copy)
	local P2 = p1 or {}
	
	return { type = BACK, key = P2.key, immediate = P2.immediate }
end

function NavigationActionsModule.init(p1) --[[ Line: 40 ]]
	-- upvalues: INIT (copy)
	return { type = INIT, params = (p1 or {}).params }
end

function NavigationActionsModule.navigate(p1) --[[ Line: 49 ]]
	-- upvalues: NAVIGATE (copy)
	local P4 = p1 or {}
	
	return {
		type = NAVIGATE,
		routeName = P4.routeName,
		params = P4.params,
		action = P4.action,
		key = P4.key
	}
end

function NavigationActionsModule.setParams(p1) --[[ Line: 61 ]]
	-- upvalues: SETPARAMS (copy)
	local P5 = p1 or {}
	
	return {
		preserveFocus = true,
		type = SETPARAMS,
		key = P5.key,
		params = P5.params
	}
end

return NavigationActionsModule