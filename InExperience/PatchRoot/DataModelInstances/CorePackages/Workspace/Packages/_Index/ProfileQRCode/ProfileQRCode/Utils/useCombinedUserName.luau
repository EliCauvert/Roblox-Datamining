local Parent = script:FindFirstAncestor("ProfileQRCode").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local GetResult = require(Parent.UserProfiles).Stores.UserProfileStore.get()

return function(p1) --[[ Line: 11 ]]
	-- upvalues: ReactModule (copy), SignalsModule (copy), GetResult (copy), SignalsReactModule (copy)
	return SignalsReactModule.useSignalState((ReactModule.useMemo(function() --[[ Line: 12 ]]
		-- upvalues: p1 (copy), SignalsModule (upval), GetResult (upval)
		return if p1 == "" then function(): string --[[ Line: 14 ]]
			return ""
		end else SignalsModule.createComputed(function(p2) --[[ Line: 19 ]]
			-- upvalues: GetResult (upval), p1 (upval)
			local v1 = GetResult.fetchNamesByUserIds({ p1 })(p2)
			local Entry = v1 and (v1.data and v1.data[1])
			local Names = Entry and Entry.names
			
			return Names and Names.getCombinedName(p2) or ""
		end)
	end, { p1 }))) or ""
end