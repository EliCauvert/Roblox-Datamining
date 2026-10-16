local Parent = script:FindFirstAncestor("UserBlockingRodux").Parent
local RoduxModule = require(Parent.Rodux)
local CryoModule = require(Parent.Cryo)

return function(p1) --[[ Line: 9 ]]
	-- upvalues: RoduxModule (copy), CryoModule (copy)
	local UserBlockingNetworking = p1.userBlockingNetworking
	
	return RoduxModule.createReducer({}, {
		[UserBlockingNetworking.BlockUserById.Succeeded.name] = function(p2, p3) --[[ Line: 13 ]]
			-- upvalues: CryoModule (upval)
			return CryoModule.Dictionary.join(p2, { [tostring(p3.namedIds.users)] = true })
		end,
		[UserBlockingNetworking.UnblockUserById.Succeeded.name] = function(p2, p3) --[[ Line: 19 ]]
			-- upvalues: CryoModule (upval)
			return CryoModule.Dictionary.join(p2, { [tostring(p3.namedIds.users)] = false })
		end,
		[UserBlockingNetworking.IsBlockedById.Succeeded.name] = function(p2, p3) --[[ Line: 25 ]]
			-- upvalues: CryoModule (upval)
			return CryoModule.Dictionary.join(p2, { [tostring(p3.namedIds.users)] = p3.responseBody or false })
		end
	})
end