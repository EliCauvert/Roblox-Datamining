local parent = script:FindFirstAncestor("CurrencyTransfers").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local userProfilesModule = require(parent.UserProfiles)

return function(p1)
	-- upvalues: reactModule (ref), userProfilesModule (ref), signalsModule (ref), signalsReactModule (ref)
	local var1 = p1 and p1 ~= 0
	local var2 = reactModule.useMemo(function()
		-- upvalues: var1 (ref), p1 (ref), userProfilesModule (copy)
		return if var1 and p1 then userProfilesModule.Stores.UserProfileStore.get().fetchNamesByUserIds({ tostring(p1) }) else nil
	end, { var1, p1 })
	
	return signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: var2 (ref), signalsModule (copy)
		return if var2 then signalsModule.createComputed(function(p2)
			-- upvalues: var2 (copy)
			local var3 = var2(p2)
			
			if not var3 or var3.status ~= "success" or (not var3.data or #var3.data == 0) then
				return nil
			end
			local var4 = var3.data[1]
			local names = var4 and var4.names
			
			return if names then names.getDisplayName(false) or (names.getUsername(false) or "") else nil
		end) else function(_)
			return nil
		end
	end, { var2 }))
end