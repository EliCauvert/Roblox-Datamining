local parent = script:FindFirstAncestor("GameJoinCard").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local dataHydrationModule = require(parent.DataHydration)
local fFlagJoinabilityCTARefactor = require(parent.SharedFlags).FFlagJoinabilityCTARefactor
local profileCTAStore = dataHydrationModule.Profile.ProfileCTAStore
local dataStatus = dataHydrationModule.DataStatus
local useSignalState = signalsReactModule.useSignalState
local createComputed = signalsModule.createComputed
local var1 = createComputed(function()
	return nil
end)
local var2 = createComputed(function()
	-- upvalues: dataStatus (ref)
	return dataStatus.NotReady
end)

return function(p1, p2, p3)
	-- upvalues: reactModule (ref), fFlagJoinabilityCTARefactor (ref), profileCTAStore (ref), useSignalState (ref), var1 (ref), var2 (ref)
	local var3 = p2 == true
	local var4 = reactModule.useRef(nil)
	local var5 = reactModule.useMemo(function()
		-- upvalues: fFlagJoinabilityCTARefactor (copy), p1 (ref), var3 (ref), profileCTAStore (copy)
		if fFlagJoinabilityCTARefactor and p1 ~= "" and var3 then
			local getJoinUserActions = profileCTAStore.get().getJoinUserActions
			
			return if getJoinUserActions then getJoinUserActions(p1, true) else nil
		end
	end, { p1, var3, p3 })
	
	if var5 then
		var4.current = { userId = p1, result = var5 }
	end
	local current = var4.current
	local var6 = var5
	
	if var6 == nil and current and current.userId == p1 then
		var6 = current.result
	end
	return useSignalState(if var6 then var6.data else var1), useSignalState(if var6 then var6.status else var2)
end