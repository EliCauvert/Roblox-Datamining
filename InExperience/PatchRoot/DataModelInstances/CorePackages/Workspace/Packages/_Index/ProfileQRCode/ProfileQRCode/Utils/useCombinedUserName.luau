local parent = script:FindFirstAncestor("ProfileQRCode").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local var3 = require(parent.UserProfiles).Stores.UserProfileStore.get()

return function(p0)
	-- upvalues: reactModule (ref), signalsModule (ref), var3 (ref), signalsReactModule (ref)
	return signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: p0 (ref), signalsModule (copy), var3 (copy)
		return if p0 == "" then function()
			return ""
		end else signalsModule.createComputed(function(p1)
			-- upvalues: var3 (copy), p0 (copy)
			local var4 = var3.fetchNamesByUserIds({ p0 })(p1)
			local var5 = var4 and (var4.data and var4.data[1])
			local names = var5 and var5.names
			
			return if names then names.getCombinedName(p1) or "" else ""
		end)
	end, { p0 })) or ""
end