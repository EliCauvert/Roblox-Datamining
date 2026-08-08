local parent = script:FindFirstAncestor("FriendsHydrationReact").Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local signalsModule = require(parent.Signals)
local var3 = require(parent.DataHydration).Friends.FriendsStore.get()

return function() --[[ line: 15 | named "useGetOnlineFriends" ]]
	-- upvalues: reactModule (ref), var3 (ref), signalsModule (ref), signalsReactModule (ref)
	local var4 = reactModule.useMemo(function() --[[ line: 16 ]]
		-- upvalues: var3 (copy)
		return var3.GetOnlineFriends()
	end, {})
	
	return signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 20 ]]
		-- upvalues: signalsModule (copy), var4 (ref)
		return signalsModule.createComputed(function(p0) --[[ line: 21 ]]
			-- upvalues: var4 (copy)
			return var4(p0)
		end)
	end, { var4 })), signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 26 ]]
		-- upvalues: var3 (copy)
		return var3.GetOnlineFriendsStatus()
	end, {}))
end