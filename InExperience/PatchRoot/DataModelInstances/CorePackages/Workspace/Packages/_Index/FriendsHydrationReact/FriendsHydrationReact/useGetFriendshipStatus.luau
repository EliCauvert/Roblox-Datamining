local parent = script:FindFirstAncestor("FriendsHydrationReact").Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local signalsModule = require(parent.Signals)
local dataHydrationModule = require(parent.DataHydration)
local var1 = dataHydrationModule.Friends.FriendsStore.get()
local dataStatus = dataHydrationModule.DataStatus

return function(p1, p2)
	-- upvalues: reactModule (ref), var1 (ref), signalsModule (ref), dataStatus (ref), signalsReactModule (ref)
	local var2 = if p1 then tostring(p1) else ""
	local var3 = reactModule.useMemo(function()
		-- upvalues: var2 (ref), var1 (copy), p2 (ref)
		return if var2 == "" then nil else var1.GetFriendshipStatus(var2, p2)
	end, { var2, p2 })
	
	return signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var3 (ref)
		return signalsModule.createComputed(function(p3)
			-- upvalues: var3 (copy)
			return if var3 then var3.data(p3) else nil
		end)
	end, { var3 })), signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var3 (ref), dataStatus (copy)
		return signalsModule.createComputed(function(p3)
			-- upvalues: var3 (copy), dataStatus (copy)
			return if var3 then var3.status(p3) else dataStatus.NotReady
		end)
	end, { var3 }))
end