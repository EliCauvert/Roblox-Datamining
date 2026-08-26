local userProfiles = script:FindFirstAncestor("UserProfiles")
local parent = userProfiles.Parent
local signalsModule = require(parent.Signals)
local fFlagEnableBlackbirdCheck = require(parent.SharedFlags).FFlagEnableBlackbirdCheck
local userProfileStoreModule = require(userProfiles.Stores.UserProfileStore)
local createComputed = signalsModule.createComputed

return function(p1)
	-- upvalues: fFlagEnableBlackbirdCheck (ref), createComputed (ref), userProfileStoreModule (ref)
	if fFlagEnableBlackbirdCheck and p1 ~= nil and p1 ~= "" then
		local var1 = userProfileStoreModule.get().fetchNamesByUserIds({ p1 })
		
		return createComputed(function(p2)
			-- upvalues: var1 (ref)
			local ok, status = pcall(var1, p2)
			
			if ok and status.status == "success" and #status.data > 0 then
				local var2 = status.data[1]
				
				return var2.getHasRobloxSubscription ~= nil and var2.getHasRobloxSubscription(p2)
			end
		end)
	end
	return createComputed(function()
		return false
	end)
end