local parent = script:FindFirstAncestor("ProfileQRCode").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local var1 = require(parent.UserProfiles).Stores.UserProfileStore.get()

return function(p1)
	-- upvalues: reactModule (ref), signalsModule (ref), var1 (ref), signalsReactModule (ref)
	return signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: p1 (ref), signalsModule (copy), var1 (copy)
		return if p1 == "" then function()
			return ""
		end else signalsModule.createComputed(function(p2)
			-- upvalues: var1 (copy), p1 (copy)
			local var2 = var1.fetchNamesByUserIds({ p1 })(p2)
			local var3 = var2 and (var2.data and var2.data[1])
			local names = var3 and var3.names
			
			return if names then names.getCombinedName(p2) or "" else ""
		end)
	end, { p1 })) or ""
end