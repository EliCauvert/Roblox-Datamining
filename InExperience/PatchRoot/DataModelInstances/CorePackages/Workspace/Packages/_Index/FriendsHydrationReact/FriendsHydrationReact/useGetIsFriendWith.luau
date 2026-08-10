local parent = script:FindFirstAncestor("FriendsHydrationReact").Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local signalsModule = require(parent.Signals)
local dataHydrationModule = require(parent.DataHydration)
local var4 = dataHydrationModule.Friends.FriendsStore.get()
local dataStatus = dataHydrationModule.DataStatus

return function(p0) --[[ line: 14 | named "useGetIsFriendWith" ]]
	-- upvalues: reactModule (ref), var4 (ref), signalsModule (ref), dataStatus (ref), signalsReactModule (ref)
	local var5 = if p0 then tostring(p0) else ""
	local var6 = reactModule.useMemo(function() --[[ line: 17 ]]
		-- upvalues: var5 (ref), var4 (copy)
		return if var5 == "" then nil else var4.GetIsFriendWith(var5)
	end, { var5 })
	
	return signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 24 ]]
		-- upvalues: signalsModule (copy), var6 (ref)
		return signalsModule.createComputed(function(p1) --[[ line: 25 ]]
			-- upvalues: var6 (copy)
			return if var6 then var6.data(p1) else nil
		end)
	end, { var6 })), signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 30 ]]
		-- upvalues: signalsModule (copy), var6 (ref), dataStatus (copy)
		return signalsModule.createComputed(function(p2) --[[ line: 31 ]]
			-- upvalues: var6 (copy), dataStatus (copy)
			return if var6 then var6.status(p2) else dataStatus.NotReady
		end)
	end, { var6 }))
end