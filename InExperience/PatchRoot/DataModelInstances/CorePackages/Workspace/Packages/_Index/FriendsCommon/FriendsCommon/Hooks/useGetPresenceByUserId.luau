local parent = script:FindFirstAncestor("FriendsCommon").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local var3 = require(parent.DataHydration).Presence.PresenceStore.get()

return function(p0) --[[ line: 12 | named "useGetPresenceByUserId" ]]
	-- upvalues: reactModule (ref), signalsModule (ref), var3 (ref), signalsReactModule (ref)
	local var4 = if p0 then tostring(p0) else ""
	
	return signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 15 ]]
		-- upvalues: signalsModule (copy), var4 (ref), var3 (copy)
		return signalsModule.createComputed(function(p1) --[[ line: 16 ]]
			-- upvalues: var4 (copy), var3 (copy)
			return if var4 == "" then nil else var3.GetPresenceByUserId(var4).data(p1)
		end)
	end, { var4 }))
end