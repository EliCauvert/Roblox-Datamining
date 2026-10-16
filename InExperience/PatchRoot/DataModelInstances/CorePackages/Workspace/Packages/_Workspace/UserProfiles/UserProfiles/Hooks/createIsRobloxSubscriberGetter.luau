local UserProfiles = script:FindFirstAncestor("UserProfiles")
local Parent = UserProfiles.Parent
local FFlagEnableBlackbirdCheck = require(Parent.SharedFlags).FFlagEnableBlackbirdCheck
local UserProfileStoreModule = require(UserProfiles.Stores.UserProfileStore)
local CreateComputedFunction = require(Parent.Signals).createComputed

return function(p1) --[[ Line: 14 | Named "createIsRobloxSubscriberGetter" ]]
	-- upvalues: FFlagEnableBlackbirdCheck (copy), CreateComputedFunction (copy), UserProfileStoreModule (copy)
	if FFlagEnableBlackbirdCheck and p1 ~= nil and p1 ~= "" then
		local NamesByUserIds = UserProfileStoreModule.get().fetchNamesByUserIds({ p1 })
		
		return CreateComputedFunction(function(p2) --[[ Line: 24 ]]
			-- upvalues: NamesByUserIds (copy)
			local Success, Result = pcall(NamesByUserIds, p2)
			
			if Success and Result.status == "success" and #Result.data > 0 then
				local Entry = Result.data[1]
				
				if Entry.getHasRobloxSubscription ~= nil then
					return Entry.getHasRobloxSubscription(p2)
				end
			end
			return false
		end)
	else
		return CreateComputedFunction(function(): boolean --[[ Line: 16 ]]
			return false
		end)
	end
end