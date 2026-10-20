local Parent = script:FindFirstAncestor("AppChat").Parent
local ReactModule = require(Parent.React)
local UseCallbackFunction = ReactModule.useCallback
local UseReducerFunction = ReactModule.useReducer
local Immutable = require(Parent.AppCommonLib).Immutable

local function externalNavigationByScreenReducer(p1, p2)
	-- upvalues: Immutable (copy)
	if p2.callback == nil then
		return Immutable.RemoveFromDictionary(p1, p2.screen)
	else
		assert(p2.callback ~= nil, "")
		
		return Immutable.Set(p1, p2.screen, p2.callback)
	end
end

return function()
	-- upvalues: UseReducerFunction (copy), externalNavigationByScreenReducer (copy), UseCallbackFunction (copy)
	local UseReducerResult, UseReducerResult2 = UseReducerFunction(externalNavigationByScreenReducer, {})
	
	return UseReducerResult, (UseCallbackFunction(function(Callback, Screen)
		-- upvalues: UseReducerResult2 (copy)
		UseReducerResult2({ callback = Callback, screen = Screen })
	end, { UseReducerResult2 }))
end