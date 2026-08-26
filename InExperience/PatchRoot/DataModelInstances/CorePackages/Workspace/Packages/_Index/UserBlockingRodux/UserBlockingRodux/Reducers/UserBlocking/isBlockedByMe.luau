local parent = script:FindFirstAncestor("UserBlockingRodux").Parent
local roduxModule = require(parent.Rodux)
local cryoModule = require(parent.Cryo)

return function(p1)
	-- upvalues: roduxModule (ref), cryoModule (ref)
	local userBlockingNetworking = p1.userBlockingNetworking
	
	return roduxModule.createReducer({}, {
		[userBlockingNetworking.BlockUserById.Succeeded.name] = function(p2, p3)
			-- upvalues: cryoModule (copy)
			return cryoModule.Dictionary.join(p2, { [tostring(p3.namedIds.users)] = true })
		end,
		[userBlockingNetworking.UnblockUserById.Succeeded.name] = function(p2, p3)
			-- upvalues: cryoModule (copy)
			return cryoModule.Dictionary.join(p2, { [tostring(p3.namedIds.users)] = false })
		end,
		[userBlockingNetworking.IsBlockedById.Succeeded.name] = function(p2, p3)
			-- upvalues: cryoModule (copy)
			return cryoModule.Dictionary.join(p2, { [tostring(p3.namedIds.users)] = p3.responseBody or false })
		end
	})
end