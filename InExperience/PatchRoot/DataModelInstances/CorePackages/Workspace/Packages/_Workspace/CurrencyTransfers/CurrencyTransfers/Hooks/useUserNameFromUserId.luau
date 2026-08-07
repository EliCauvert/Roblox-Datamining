local parent = script:FindFirstAncestor("CurrencyTransfers").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local userProfilesModule = require(parent.UserProfiles)

return function(p0) --[[ line: 18 | named "useUserNameFromUserId" ]]
	-- upvalues: reactModule (ref), userProfilesModule (ref), signalsModule (ref), signalsReactModule (ref)
	local var4 = p0 and p0 ~= 0
	local var5 = reactModule.useMemo(function() --[[ line: 21 ]]
		-- upvalues: var4 (ref), p0 (ref), userProfilesModule (copy)
		return if var4 and p0 then userProfilesModule.Stores.UserProfileStore.get().fetchNamesByUserIds({ tostring(p0) }) else nil
	end, { var4, p0 })
	
	return signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 30 ]]
		-- upvalues: var5 (ref), signalsModule (copy)
		return if var5 then signalsModule.createComputed(function(p1) --[[ line: 36 ]]
			-- upvalues: var5 (copy)
			local var6 = var5(p1)
			
			if not var6 or var6.status ~= "success" or (not var6.data or #var6.data == 0) then
				return nil
			end
			local var7 = var6.data[1]
			local names = var7 and var7.names
			
			return if names then names.getDisplayName(false) or (names.getUsername(false) or "") else nil
		end) else function(_) --[[ line: 32 ]]
			return nil
		end
	end, { var5 }))
end