local Parent = script:FindFirstAncestor("FriendsCommon").Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local GetResult = require(Parent.DataHydration).Presence.PresenceStore.get()
local config = { skipFetch = true }

return function(p1, p2)
	-- upvalues: ReactModule (copy), config (copy), GetResult (copy), SignalsReactModule (copy)
	local Text: string = if p1 then tostring(p1) else ""
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Text (copy), config (upval), p2 (copy), GetResult (upval)
		return GetResult.GetPresenceByUserId(Text, if Text == "" then config else p2)
	end, { Text, p2 })
	local IsForceFetch: boolean = p2 ~= nil and p2.forceFetch == true
	ReactModule.useEffect(function()
		-- upvalues: Text (copy), IsForceFetch (copy), GetResult (upval)
		if Text ~= "" and IsForceFetch then
			GetResult.RefreshPresenceByUserId(Text)
		end
	end, { Text, IsForceFetch })
	
	return SignalsReactModule.useSignalState(UseMemoResult.data), (SignalsReactModule.useSignalState(UseMemoResult.status))
end