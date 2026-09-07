local userProfiles = script:FindFirstAncestor("UserProfiles")
local parent = userProfiles.Parent
local reactModule = require(parent.React)
local createComputed = require(parent.Signals).createComputed
local useSignalState = require(parent.SignalsReact).useSignalState
local fFlagEnableBlackbirdCheck = require(parent.SharedFlags).FFlagEnableBlackbirdCheck
local userProfilesUseIsRobloxSubscriberGetter = game:DefineFastFlag("UserProfilesUseIsRobloxSubscriberGetter", false)
local userProfileStoreModule = require(userProfiles.Stores.UserProfileStore)
local createIsRobloxSubscriberGetterModule = require(script.Parent.createIsRobloxSubscriberGetter)

return function(p1)
	-- upvalues: reactModule (ref), userProfilesUseIsRobloxSubscriberGetter (ref), createIsRobloxSubscriberGetterModule (ref), fFlagEnableBlackbirdCheck (ref), createComputed (ref), userProfileStoreModule (ref), useSignalState (ref)
	return useSignalState(reactModule.useMemo(function()
		-- upvalues: userProfilesUseIsRobloxSubscriberGetter (copy), createIsRobloxSubscriberGetterModule (copy), p1 (ref), fFlagEnableBlackbirdCheck (copy), createComputed (copy), userProfileStoreModule (copy)
		if userProfilesUseIsRobloxSubscriberGetter then
			return createIsRobloxSubscriberGetterModule(p1)
		elseif fFlagEnableBlackbirdCheck and (p1 ~= nil and p1 ~= "") then
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
	end, { p1 }))
end