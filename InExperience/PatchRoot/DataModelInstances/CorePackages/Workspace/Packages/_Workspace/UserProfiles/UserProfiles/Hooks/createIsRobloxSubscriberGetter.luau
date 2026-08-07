local userProfiles = script:FindFirstAncestor("UserProfiles")
local parent = userProfiles.Parent
local signalsModule = require(parent.Signals)
local fFlagEnableBlackbirdCheck = require(parent.SharedFlags).FFlagEnableBlackbirdCheck
local userProfileStoreModule = require(userProfiles.Stores.UserProfileStore)
local createComputed = signalsModule.createComputed

return function(p0) --[[ line: 14 | named "createIsRobloxSubscriberGetter" ]]
	-- upvalues: fFlagEnableBlackbirdCheck (ref), createComputed (ref), userProfileStoreModule (ref)
	if fFlagEnableBlackbirdCheck and p0 ~= nil and p0 ~= "" then
		local var3 = userProfileStoreModule.get().fetchNamesByUserIds({ p0 })
		
		return createComputed(function(p1) --[[ line: 24 ]]
			-- upvalues: var3 (ref)
			local ok, status = pcall(var3, p1)
			
			if ok and status.status == "success" and #status.data > 0 then
				local var4 = status.data[1]
				
				return var4.getHasRobloxSubscription ~= nil and var4.getHasRobloxSubscription(p1)
			end
		end)
	end
	return createComputed(function() --[[ line: 16 ]]
		return false
	end)
end