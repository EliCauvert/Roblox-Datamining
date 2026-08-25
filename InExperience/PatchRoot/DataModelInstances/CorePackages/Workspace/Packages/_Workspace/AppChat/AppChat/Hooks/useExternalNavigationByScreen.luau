local parent = script:FindFirstAncestor("AppChat").Parent
local appCommonLibModule = require(parent.AppCommonLib)
local reactModule = require(parent.React)
local useCallback = reactModule.useCallback
local useReducer = reactModule.useReducer
local immutable = appCommonLibModule.Immutable

local function externalNavigationByScreenReducer(p0, p1)
	-- upvalues: immutable (ref)
	if p1.callback == nil then
		return immutable.RemoveFromDictionary(p0, p1.screen)
	end
	assert(p1.callback ~= nil, "")
	
	return immutable.Set(p0, p1.screen, p1.callback)
end

return function()
	-- upvalues: useReducer (ref), externalNavigationByScreenReducer (ref), useCallback (ref)
	local var3, var4 = useReducer(externalNavigationByScreenReducer, {})
	
	return var3, useCallback(function(p2, p3)
		-- upvalues: var4 (ref)
		var4({ callback = p2, screen = p3 })
	end, { var4 })
end