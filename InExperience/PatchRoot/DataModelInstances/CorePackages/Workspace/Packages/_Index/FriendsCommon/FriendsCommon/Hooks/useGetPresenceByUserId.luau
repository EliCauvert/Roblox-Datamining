local parent = script:FindFirstAncestor("FriendsCommon").Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local var1 = require(parent.DataHydration).Presence.PresenceStore.get()
local t = { skipFetch = true }

return function(p1, p2)
	-- upvalues: reactModule (ref), t (ref), var1 (ref), signalsReactModule (ref)
	local var2 = if p1 then tostring(p1) else ""
	local var3 = reactModule.useMemo(function()
		-- upvalues: var2 (ref), t (copy), p2 (ref), var1 (copy)
		return var1.GetPresenceByUserId(var2, if var2 == "" then t else p2)
	end, { var2, p2 })
	
	return signalsReactModule.useSignalState(var3.data), signalsReactModule.useSignalState(var3.status)
end