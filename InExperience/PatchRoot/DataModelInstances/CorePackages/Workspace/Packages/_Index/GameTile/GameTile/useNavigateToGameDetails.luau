local gameTile = script:FindFirstAncestor("GameTile")
local parent = gameTile.Parent
local reactModule = require(parent.React)
local openGameDetails = require(parent.GameDetail).OpenGameDetails
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useNavigation = require(parent.Navigation).useNavigation
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local fFlagLuaAppSduiEdpEnabled = require(parent.SharedFlags).FFlagLuaAppSduiEdpEnabled
local fFlagLuaAppStableNavigateToGameDetailsModule = require(gameTile.Flags.FFlagLuaAppStableNavigateToGameDetails)

return function()
	-- upvalues: useDispatch (ref), useNavigation (ref), fFlagLuaAppSduiEdpEnabled (ref), useRoactService (ref), roactNetworking (ref), fFlagLuaAppStableNavigateToGameDetailsModule (ref), reactModule (ref), openGameDetails (ref)
	local var1 = useDispatch()
	local var2 = useNavigation()
	local var3 = if fFlagLuaAppSduiEdpEnabled then useRoactService(roactNetworking) else nil
	
	if fFlagLuaAppStableNavigateToGameDetailsModule then
		local var4 = reactModule.useRef(var2)
		var4.current = var2
		
		return reactModule.useCallback(function(p1, p2)
			-- upvalues: var1 (ref), openGameDetails (copy), var4 (ref), fFlagLuaAppSduiEdpEnabled (copy), var3 (write)
			var1(openGameDetails(p1, var4.current, p2, if fFlagLuaAppSduiEdpEnabled then var3 else nil))
		end, { var1, if fFlagLuaAppSduiEdpEnabled then var3 else nil })
	end
	return reactModule.useCallback(function(p1, p2)
		-- upvalues: var1 (ref), openGameDetails (copy), var2 (ref), fFlagLuaAppSduiEdpEnabled (copy), var3 (write)
		var1(openGameDetails(p1, var2, p2, if fFlagLuaAppSduiEdpEnabled then var3 else nil))
	end, {
		var1,
		var2,
		if fFlagLuaAppSduiEdpEnabled then var3 else nil
	})
end