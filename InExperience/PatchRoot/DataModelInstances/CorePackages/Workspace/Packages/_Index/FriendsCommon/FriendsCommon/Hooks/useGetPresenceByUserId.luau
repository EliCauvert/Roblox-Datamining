local Parent = script:FindFirstAncestor("FriendsCommon").Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local GetResult = require(Parent.DataHydration).Presence.PresenceStore.get()
local FFlagPresenceForceFetchOnRemount = require(Parent.SharedFlags).FFlagPresenceForceFetchOnRemount
local config = { skipFetch = true }

return function(p1, p2) --[[ Line: 20 | Named "useGetPresenceByUserId" ]]
	-- upvalues: ReactModule (copy), config (copy), GetResult (copy), FFlagPresenceForceFetchOnRemount (copy), SignalsReactModule (copy)
	local Text: string = if p1 then tostring(p1) else ""
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 26 ]]
		-- upvalues: Text (copy), config (upval), p2 (copy), GetResult (upval)
		return GetResult.GetPresenceByUserId(Text, if Text == "" then config else p2)
	end, { Text, p2 })
	
	if FFlagPresenceForceFetchOnRemount then
		local IsForceFetch: boolean = p2 ~= nil and p2.forceFetch == true
		ReactModule.useEffect(function() --[[ Line: 33 ]]
			-- upvalues: Text (copy), IsForceFetch (copy), GetResult (upval)
			if Text ~= "" and IsForceFetch then
				GetResult.RefreshPresenceByUserId(Text)
			end
		end, { Text, IsForceFetch })
	end
	return SignalsReactModule.useSignalState(UseMemoResult.data), (SignalsReactModule.useSignalState(UseMemoResult.status))
end