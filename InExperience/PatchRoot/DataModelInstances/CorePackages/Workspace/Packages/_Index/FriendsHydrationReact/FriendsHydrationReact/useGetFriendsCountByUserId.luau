local Parent = script:FindFirstAncestor("FriendsHydrationReact").Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local SignalsModule = require(Parent.Signals)
local DataHydrationModule = require(Parent.DataHydration)
local GetResult = DataHydrationModule.Friends.FriendsStore.get()
local DataStatus = DataHydrationModule.DataStatus

return function(p1, p2) --[[ Line: 14 | Named "useGetFriendsCountByUserId" ]]
	-- upvalues: ReactModule (copy), GetResult (copy), SignalsModule (copy), DataStatus (copy), SignalsReactModule (copy)
	local Text: string = if p1 then tostring(p1) else ""
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 20 ]]
		-- upvalues: Text (copy), GetResult (upval), p2 (copy)
		return if Text == "" then nil else GetResult.GetFriendsCountByUserId(Text, p2)
	end, { Text, p2 })
	
	return SignalsReactModule.useSignalState((ReactModule.useMemo(function() --[[ Line: 27 ]]
		-- upvalues: SignalsModule (upval), UseMemoResult (copy)
		return SignalsModule.createComputed(function(p3) --[[ Line: 28 ]]
			-- upvalues: UseMemoResult (upval)
			return if UseMemoResult then UseMemoResult.data(p3) else nil
		end)
	end, { UseMemoResult }))), (SignalsReactModule.useSignalState((ReactModule.useMemo(function() --[[ Line: 33 ]]
		-- upvalues: SignalsModule (upval), UseMemoResult (copy), DataStatus (upval)
		return SignalsModule.createComputed(function(p3) --[[ Line: 34 ]]
			-- upvalues: UseMemoResult (upval), DataStatus (upval)
			return if UseMemoResult then UseMemoResult.status(p3) else DataStatus.NotReady
		end)
	end, { UseMemoResult }))))
end