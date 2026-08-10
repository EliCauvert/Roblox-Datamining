local parent = script:FindFirstAncestor("FriendsCommon").Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local var2 = require(parent.DataHydration).Presence.PresenceStore.get()
local t = { skipFetch = true }

return function(p0, p1) --[[ line: 16 | named "useGetPresenceByUserId" ]]
	-- upvalues: reactModule (ref), t (ref), var2 (ref), signalsReactModule (ref)
	local var4 = if p0 then tostring(p0) else ""
	local var5 = reactModule.useMemo(function() --[[ line: 22 ]]
		-- upvalues: var4 (ref), t (copy), p1 (ref), var2 (copy)
		return var2.GetPresenceByUserId(var4, if var4 == "" then t else p1)
	end, { var4, p1 })
	
	return signalsReactModule.useSignalState(var5.data), signalsReactModule.useSignalState(var5.status)
end