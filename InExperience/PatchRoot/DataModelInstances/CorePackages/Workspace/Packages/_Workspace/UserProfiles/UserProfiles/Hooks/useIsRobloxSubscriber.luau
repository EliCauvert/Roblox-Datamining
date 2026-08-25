local userProfiles = script:FindFirstAncestor("UserProfiles")
local parent = userProfiles.Parent
local reactModule = require(parent.React)
local createComputed = require(parent.Signals).createComputed
local useSignalState = require(parent.SignalsReact).useSignalState
local fFlagEnableBlackbirdCheck = require(parent.SharedFlags).FFlagEnableBlackbirdCheck
local userProfilesUseIsRobloxSubscriberGetter = game:DefineFastFlag("UserProfilesUseIsRobloxSubscriberGetter", false)
local userProfileStoreModule = require(userProfiles.Stores.UserProfileStore)
local createIsRobloxSubscriberGetterModule = require(script.Parent.createIsRobloxSubscriberGetter)

return function(p0)
	-- upvalues: reactModule (ref), userProfilesUseIsRobloxSubscriberGetter (ref), createIsRobloxSubscriberGetterModule (ref), fFlagEnableBlackbirdCheck (ref), createComputed (ref), userProfileStoreModule (ref), useSignalState (ref)
	return useSignalState(reactModule.useMemo(function()
		-- upvalues: userProfilesUseIsRobloxSubscriberGetter (copy), createIsRobloxSubscriberGetterModule (copy), p0 (ref), fFlagEnableBlackbirdCheck (copy), createComputed (copy), userProfileStoreModule (copy)
		if userProfilesUseIsRobloxSubscriberGetter then
			return createIsRobloxSubscriberGetterModule(p0)
		elseif fFlagEnableBlackbirdCheck and (p0 ~= nil and p0 ~= "") then
			local var5 = userProfileStoreModule.get().fetchNamesByUserIds({ p0 })
			
			return createComputed(function(p1)
				-- upvalues: var5 (ref)
				local ok, status = pcall(var5, p1)
				
				if ok and status.status == "success" and #status.data > 0 then
					local var6 = status.data[1]
					
					return var6.getHasRobloxSubscription ~= nil and var6.getHasRobloxSubscription(p1)
				end
			end)
		end
		return createComputed(function()
			return false
		end)
	end, { p0 }))
end