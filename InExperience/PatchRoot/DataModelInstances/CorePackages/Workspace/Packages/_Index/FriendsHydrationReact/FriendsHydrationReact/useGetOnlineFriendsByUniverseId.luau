local Parent = script:FindFirstAncestor("FriendsHydrationReact").Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local SignalsModule = require(Parent.Signals)
local GetResult = require(Parent.DataHydration).Friends.FriendsStore.get()

return function(p1) --[[ Line: 15 | Named "useGetOnlineFriendsByUniverseId" ]]
	-- upvalues: ReactModule (copy), GetResult (copy), SignalsModule (copy), SignalsReactModule (copy)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 16 ]]
		-- upvalues: GetResult (upval), p1 (copy)
		return GetResult.GetOnlineFriendsByUniverseId(p1)
	end, { p1 })
	
	return SignalsReactModule.useSignalState((ReactModule.useMemo(function() --[[ Line: 20 ]]
		-- upvalues: SignalsModule (upval), UseMemoResult (copy)
		return SignalsModule.createComputed(function(p2) --[[ Line: 21 ]]
			-- upvalues: UseMemoResult (upval)
			return UseMemoResult(p2)
		end)
	end, { UseMemoResult }))), (SignalsReactModule.useSignalState((ReactModule.useMemo(function() --[[ Line: 26 ]]
		-- upvalues: GetResult (upval)
		return GetResult.GetOnlineFriendsStatus()
	end, {}))))
end