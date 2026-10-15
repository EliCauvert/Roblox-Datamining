local parent = script:FindFirstAncestor("Moments").Parent
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local gameGetGameInfoStoreModule = require(parent.DataHydration.GameGetGameInfoStore)
local fFlagMomentsServeEDPVideos = require(parent.SharedFlags).FFlagMomentsServeEDPVideos
local useSignalState = signalsReactModule.useSignalState
local t = {
	name = nil,
	creatorName = nil,
	isCreatorVerified = false,
	rootPlaceId = nil
}
local var1 = signalsModule.createComputed(function()
	return nil
end)

return function(p1)
	-- upvalues: gameGetGameInfoStoreModule (ref), var1 (ref), useSignalState (ref), t (ref), fFlagMomentsServeEDPVideos (ref)
	local var2 = if p1 and p1 ~= 0 then tostring(p1) else nil
	local var3 = useSignalState(if var2 then gameGetGameInfoStoreModule(false).getAndFetchGameInfo(var2).data else var1)
	
	if var3 == nil then
		return t
	end
	local var4
	local creator = var3.creator
	local t_1 = {
		name = var3.name,
		creatorName = if creator then creator.name else nil
	}
	
	if creator then
		var4 = creator.hasVerifiedBadge == true
		var4 = nil
	else
		var4 = false
	end
	t_1.isCreatorVerified = var4
	t_1.rootPlaceId = if fFlagMomentsServeEDPVideos then tonumber(var3.rootPlaceId) else nil
	
	return t_1
end