local parent = script:FindFirstAncestor("AppChat").Parent
local appCommonLibModule = require(parent.AppCommonLib)
local reactModule = require(parent.React)
local useCallback = reactModule.useCallback
local useReducer = reactModule.useReducer
local immutable = appCommonLibModule.Immutable

local function externalNavigationByScreenReducer(p1, p2)
	-- upvalues: immutable (ref)
	if p2.callback == nil then
		return immutable.RemoveFromDictionary(p1, p2.screen)
	end
	assert(p2.callback ~= nil, "")
	
	return immutable.Set(p1, p2.screen, p2.callback)
end

return function()
	-- upvalues: useReducer (ref), externalNavigationByScreenReducer (ref), useCallback (ref)
	local var1, var2 = useReducer(externalNavigationByScreenReducer, {})
	
	return var1, useCallback(function(p1, p2)
		-- upvalues: var2 (ref)
		var2({ callback = p1, screen = p2 })
	end, { var2 })
end