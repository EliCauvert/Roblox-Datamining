local Parent = script:FindFirstAncestor("GameTile").Parent
local ReactModule = require(Parent.React)
local OpenGameDetailsFunction = require(Parent.GameDetail).OpenGameDetails
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local FFlagLuaAppSduiEdpEnabled = require(Parent.SharedFlags).FFlagLuaAppSduiEdpEnabled

return function()
	-- upvalues: UseDispatchFunction (copy), UseNavigationFunction (copy), FFlagLuaAppSduiEdpEnabled (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), ReactModule (copy), OpenGameDetailsFunction (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseRoactServiceResult = if FFlagLuaAppSduiEdpEnabled then UseRoactServiceFunction(RoactNetworking) else nil
	local UseRefResult = ReactModule.useRef(UseNavigationResult)
	UseRefResult.current = UseNavigationResult
	
	return ReactModule.useCallback(function(p1, p2)
		-- upvalues: UseDispatchResult (copy), OpenGameDetailsFunction (upval), UseRefResult (copy), FFlagLuaAppSduiEdpEnabled (upval), UseRoactServiceResult (ref)
		UseDispatchResult(OpenGameDetailsFunction(p1, UseRefResult.current, p2, if FFlagLuaAppSduiEdpEnabled then UseRoactServiceResult else nil))
	end, {
		UseDispatchResult,
		if FFlagLuaAppSduiEdpEnabled then UseRoactServiceResult else nil
	})
end