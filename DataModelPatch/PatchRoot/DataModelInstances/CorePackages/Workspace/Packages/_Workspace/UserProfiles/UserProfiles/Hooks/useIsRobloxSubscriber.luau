local UserProfiles = script:FindFirstAncestor("UserProfiles")
local Parent = UserProfiles.Parent
local ReactModule = require(Parent.React)
local CreateComputedFunction = require(Parent.Signals).createComputed
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local FFlagEnableBlackbirdCheck = require(Parent.SharedFlags).FFlagEnableBlackbirdCheck
local UserProfilesUseIsRobloxSubscriberGetter = game:DefineFastFlag("UserProfilesUseIsRobloxSubscriberGetter", false)
local UserProfileStoreModule = require(UserProfiles.Stores.UserProfileStore)
local CreateIsRobloxSubscriberGetterModule = require(script.Parent.createIsRobloxSubscriberGetter)

return function(p1)
	-- upvalues: ReactModule (copy), UserProfilesUseIsRobloxSubscriberGetter (copy), CreateIsRobloxSubscriberGetterModule (copy), FFlagEnableBlackbirdCheck (copy), CreateComputedFunction (copy), UserProfileStoreModule (copy), UseSignalStateFunction (copy)
	return (UseSignalStateFunction((ReactModule.useMemo(function()
		-- upvalues: UserProfilesUseIsRobloxSubscriberGetter (upval), CreateIsRobloxSubscriberGetterModule (upval), p1 (copy), FFlagEnableBlackbirdCheck (upval), CreateComputedFunction (upval), UserProfileStoreModule (upval)
		if UserProfilesUseIsRobloxSubscriberGetter then
			return CreateIsRobloxSubscriberGetterModule(p1)
		elseif FFlagEnableBlackbirdCheck and (p1 ~= nil and p1 ~= "") then
			local NamesByUserIds = UserProfileStoreModule.get().fetchNamesByUserIds({ p1 })
			
			return CreateComputedFunction(function(p2)
				-- upvalues: NamesByUserIds (copy)
				local Success, Result = pcall(NamesByUserIds, p2)
				
				if Success and Result.status == "success" and #Result.data > 0 then
					local Entry = Result.data[1]
					
					if Entry.getHasRobloxSubscription ~= nil then
						return (Entry.getHasRobloxSubscription(p2))
					end
				end
				return false
			end)
		else
			return CreateComputedFunction(function(): boolean
				return false
			end)
		end
	end, { p1 }))))
end