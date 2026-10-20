local Parent = script:FindFirstAncestor("FriendsCommon").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local GetResult = require(Parent.DataHydration).Presence.PresenceStore.get()

return function(p1, p2)
	-- upvalues: ReactModule (copy), SignalsModule (copy), GetResult (copy), SignalsReactModule (copy)
	local Text: string = if p1 then tostring(p1) else ""
	
	return SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), Text (copy), GetResult (upval), p2 (copy)
		return SignalsModule.createComputed(function(p3)
			-- upvalues: Text (upval), GetResult (upval), p2 (upval)
			return if Text == "" then nil else GetResult.GetPresenceByUserId(Text, p2).data(p3)
		end)
	end, { Text, p2 })))
end