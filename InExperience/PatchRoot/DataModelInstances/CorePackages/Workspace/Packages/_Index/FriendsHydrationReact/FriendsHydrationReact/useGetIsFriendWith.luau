local Parent = script:FindFirstAncestor("FriendsHydrationReact").Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local SignalsModule = require(Parent.Signals)
local DataHydrationModule = require(Parent.DataHydration)
local GetResult = DataHydrationModule.Friends.FriendsStore.get()
local DataStatus = DataHydrationModule.DataStatus

return function(p1) --[[ Line: 14 | Named "useGetIsFriendWith" ]]
	-- upvalues: ReactModule (copy), GetResult (copy), SignalsModule (copy), DataStatus (copy), SignalsReactModule (copy)
	local Text: string = if p1 then tostring(p1) else ""
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 17 ]]
		-- upvalues: Text (copy), GetResult (upval)
		return if Text == "" then nil else GetResult.GetIsFriendWith(Text)
	end, { Text })
	
	return SignalsReactModule.useSignalState((ReactModule.useMemo(function() --[[ Line: 24 ]]
		-- upvalues: SignalsModule (upval), UseMemoResult (copy)
		return SignalsModule.createComputed(function(p2) --[[ Line: 25 ]]
			-- upvalues: UseMemoResult (upval)
			return if UseMemoResult then UseMemoResult.data(p2) else nil
		end)
	end, { UseMemoResult }))), (SignalsReactModule.useSignalState((ReactModule.useMemo(function() --[[ Line: 30 ]]
		-- upvalues: SignalsModule (upval), UseMemoResult (copy), DataStatus (upval)
		return SignalsModule.createComputed(function(p2) --[[ Line: 31 ]]
			-- upvalues: UseMemoResult (upval), DataStatus (upval)
			return if UseMemoResult then UseMemoResult.status(p2) else DataStatus.NotReady
		end)
	end, { UseMemoResult }))))
end