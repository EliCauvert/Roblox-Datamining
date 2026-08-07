local parent = script:FindFirstAncestor("Moments").Parent
local signalsModule = require(parent.Signals)
local gameGetGameInfoStoreModule = require(parent.DataHydration.GameGetGameInfoStore)
local useSignalState = require(parent.SignalsReact).useSignalState
local t = { name = nil, creatorName = nil, isCreatorVerified = false }
local var3 = signalsModule.createComputed(function() --[[ line: 32 ]]
	return nil
end)

return function(p0) --[[ line: 36 ]]
	-- upvalues: gameGetGameInfoStoreModule (ref), var3 (ref), useSignalState (ref), t (ref)
	local var4 = if p0 and p0 ~= 0 then tostring(p0) else nil
	local var5 = useSignalState(if var4 then gameGetGameInfoStoreModule(false).getAndFetchGameInfo(var4).data else var3)
	
	if var5 == nil then
		return t
	end
	local var7
	local creator = var5.creator
	local t_1 = {
		name = var5.name,
		creatorName = if creator then creator.name else nil
	}
	
	if creator then
		var7 = creator.hasVerifiedBadge == true
		var7 = nil
	else
		var7 = false
	end
	t_1.isCreatorVerified = var7
	
	return t_1
end