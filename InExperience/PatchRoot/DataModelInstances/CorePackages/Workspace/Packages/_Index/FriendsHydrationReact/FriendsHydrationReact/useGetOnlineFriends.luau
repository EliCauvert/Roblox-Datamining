local parent = script:FindFirstAncestor("FriendsHydrationReact").Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local signalsModule = require(parent.Signals)
local var1 = require(parent.DataHydration).Friends.FriendsStore.get()

return function()
	-- upvalues: reactModule (ref), var1 (ref), signalsModule (ref), signalsReactModule (ref)
	local var2 = reactModule.useMemo(function()
		-- upvalues: var1 (copy)
		return var1.GetOnlineFriends()
	end, {})
	
	return signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var2 (ref)
		return signalsModule.createComputed(function(p1)
			-- upvalues: var2 (copy)
			return var2(p1)
		end)
	end, { var2 })), signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: var1 (copy)
		return var1.GetOnlineFriendsStatus()
	end, {}))
end