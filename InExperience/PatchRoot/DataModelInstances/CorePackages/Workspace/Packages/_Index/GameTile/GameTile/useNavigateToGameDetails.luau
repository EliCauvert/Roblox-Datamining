local parent = script:FindFirstAncestor("GameTile").Parent
local reactModule = require(parent.React)
local openGameDetails = require(parent.GameDetail).OpenGameDetails
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useNavigation = require(parent.Navigation).useNavigation
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local fFlagSduiEdpPrefetchPlayability = require(parent.SharedFlags).FFlagSduiEdpPrefetchPlayability
local fFlagLuaAppSduiEdpEnabled = require(parent.SharedFlags).FFlagLuaAppSduiEdpEnabled

return function()
	-- upvalues: useDispatch (ref), useNavigation (ref), fFlagSduiEdpPrefetchPlayability (ref), fFlagLuaAppSduiEdpEnabled (ref), useRoactService (ref), roactNetworking (ref), reactModule (ref), openGameDetails (ref)
	local var1 = useDispatch()
	local var2 = useNavigation()
	local var3 = if fFlagSduiEdpPrefetchPlayability and fFlagLuaAppSduiEdpEnabled then useRoactService(roactNetworking) else nil
	
	return reactModule.useCallback(function(p0, p1)
		-- upvalues: var1 (ref), openGameDetails (copy), var2 (ref), fFlagSduiEdpPrefetchPlayability (copy), fFlagLuaAppSduiEdpEnabled (copy), var3 (write)
		var1(openGameDetails(p0, var2, p1, if fFlagSduiEdpPrefetchPlayability and fFlagLuaAppSduiEdpEnabled then var3 else nil))
	end, {
		var1,
		var2,
		if fFlagSduiEdpPrefetchPlayability and fFlagLuaAppSduiEdpEnabled then var3 else nil
	})
end