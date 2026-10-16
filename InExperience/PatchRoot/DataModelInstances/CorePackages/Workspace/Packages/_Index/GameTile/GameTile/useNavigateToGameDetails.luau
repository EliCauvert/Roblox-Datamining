local GameTile = script:FindFirstAncestor("GameTile")
local Parent = GameTile.Parent
local ReactModule = require(Parent.React)
local OpenGameDetailsFunction = require(Parent.GameDetail).OpenGameDetails
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local FFlagLuaAppSduiEdpEnabled = require(Parent.SharedFlags).FFlagLuaAppSduiEdpEnabled
local FFlagLuaAppStableNavigateToGameDetailsModule = require(GameTile.Flags.FFlagLuaAppStableNavigateToGameDetails)

return function() --[[ Line: 12 | Named "useNavigateToGameDetails" ]]
	-- upvalues: UseDispatchFunction (copy), UseNavigationFunction (copy), FFlagLuaAppSduiEdpEnabled (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), FFlagLuaAppStableNavigateToGameDetailsModule (copy), ReactModule (copy), OpenGameDetailsFunction (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseRoactServiceResult = if FFlagLuaAppSduiEdpEnabled then UseRoactServiceFunction(RoactNetworking) else nil
	
	if FFlagLuaAppStableNavigateToGameDetailsModule then
		local UseRefResult = ReactModule.useRef(UseNavigationResult)
		UseRefResult.current = UseNavigationResult
		
		return ReactModule.useCallback(function(p1, p2) --[[ Line: 27 ]]
			-- upvalues: UseDispatchResult (copy), OpenGameDetailsFunction (upval), UseRefResult (copy), FFlagLuaAppSduiEdpEnabled (upval), UseRoactServiceResult (ref)
			UseDispatchResult(OpenGameDetailsFunction(p1, UseRefResult.current, p2, if FFlagLuaAppSduiEdpEnabled then UseRoactServiceResult else nil))
		end, {
			UseDispatchResult,
			if FFlagLuaAppSduiEdpEnabled then UseRoactServiceResult else nil
		})
	else
		return (ReactModule.useCallback(function(p1, p2) --[[ Line: 45 ]]
			-- upvalues: UseDispatchResult (copy), OpenGameDetailsFunction (upval), UseNavigationResult (copy), FFlagLuaAppSduiEdpEnabled (upval), UseRoactServiceResult (ref)
			UseDispatchResult(OpenGameDetailsFunction(p1, UseNavigationResult, p2, if FFlagLuaAppSduiEdpEnabled then UseRoactServiceResult else nil))
		end, {
			UseDispatchResult,
			UseNavigationResult,
			if FFlagLuaAppSduiEdpEnabled then UseRoactServiceResult else nil
		}))
	end
end