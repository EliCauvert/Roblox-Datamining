local Parent = script:FindFirstAncestor("GameTile").Parent
local ReactModule = require(Parent.React)
local OpenGameDetailsFunction = require(Parent.GameDetail).OpenGameDetails
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local FFlagSduiEdpPrefetchPlayability = require(Parent.SharedFlags).FFlagSduiEdpPrefetchPlayability
local FFlagLuaAppSduiEdpEnabled = require(Parent.SharedFlags).FFlagLuaAppSduiEdpEnabled

return function()
	-- upvalues: UseDispatchFunction (copy), UseNavigationFunction (copy), FFlagSduiEdpPrefetchPlayability (copy), FFlagLuaAppSduiEdpEnabled (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), ReactModule (copy), OpenGameDetailsFunction (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseRoactServiceResult = if FFlagSduiEdpPrefetchPlayability and FFlagLuaAppSduiEdpEnabled then UseRoactServiceFunction(RoactNetworking) else nil
	
	return (ReactModule.useCallback(function(p1, p2)
		-- upvalues: UseDispatchResult (copy), OpenGameDetailsFunction (upval), UseNavigationResult (copy), FFlagSduiEdpPrefetchPlayability (upval), FFlagLuaAppSduiEdpEnabled (upval), UseRoactServiceResult (ref)
		UseDispatchResult(OpenGameDetailsFunction(p1, UseNavigationResult, p2, if FFlagSduiEdpPrefetchPlayability and FFlagLuaAppSduiEdpEnabled then UseRoactServiceResult else nil))
	end, {
		UseDispatchResult,
		UseNavigationResult,
		if FFlagSduiEdpPrefetchPlayability and FFlagLuaAppSduiEdpEnabled then UseRoactServiceResult else nil
	}))
end