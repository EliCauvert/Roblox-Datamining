local parent = script:FindFirstAncestor("UserBlockingRodux").Parent
local roduxModule = require(parent.Rodux)
local cryoModule = require(parent.Cryo)

return function(p0) --[[ line: 9 ]]
	-- upvalues: roduxModule (ref), cryoModule (ref)
	local userBlockingNetworking = p0.userBlockingNetworking
	
	return roduxModule.createReducer({}, {
		[userBlockingNetworking.BlockUserById.Succeeded.name] = function(p1, p2) --[[ line: 13 ]]
			-- upvalues: cryoModule (copy)
			return cryoModule.Dictionary.join(p1, { [tostring(p2.namedIds.users)] = true })
		end,
		[userBlockingNetworking.UnblockUserById.Succeeded.name] = function(p3, p4) --[[ line: 19 ]]
			-- upvalues: cryoModule (copy)
			return cryoModule.Dictionary.join(p3, { [tostring(p4.namedIds.users)] = false })
		end,
		[userBlockingNetworking.IsBlockedById.Succeeded.name] = function(p5, p6) --[[ line: 25 ]]
			-- upvalues: cryoModule (copy)
			return cryoModule.Dictionary.join(p5, { [tostring(p6.namedIds.users)] = p6.responseBody or false })
		end
	})
end