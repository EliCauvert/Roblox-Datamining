local roduxPresence = script:FindFirstAncestor("RoduxPresence")
local cryoModule = require(roduxPresence.Parent.Cryo)
local getDeepValueModule = require(roduxPresence.getDeepValue)
local receivedUserPresenceModule = require(roduxPresence.Actions.ReceivedUserPresence)

return function(p1, p2, p3)
	-- upvalues: getDeepValueModule (ref), cryoModule (ref), receivedUserPresenceModule (ref)
	local presenceNetworking = p3.presenceNetworking
	
	local function handlePresenceModel(p4, p5)
		-- upvalues: p1 (ref), getDeepValueModule (copy), p2 (ref), cryoModule (copy)
		local var1 = p4[p1]
		local var2 = tostring(p5.userId)
		local var3 = getDeepValueModule(p4, string.format("byUserId.%s.%s", var2, p2))
		
		if var3 and var1[var3] then
			var3 = tostring(var3)
			var1 = cryoModule.Dictionary.join(var1, { [var3] = cryoModule.List.removeValue(var1[var3], var2) })
		end
		local var4 = var1[p5[p2]]
		
		return if var4 and table.find(var4, var2) then var1 else cryoModule.Dictionary.join(var1, {
			[tostring(p5[p2])] = cryoModule.List.join(var4 or {}, { var2 })
		})
	end
	
	return function(p4, p5)
		-- upvalues: receivedUserPresenceModule (copy), handlePresenceModel (ref), presenceNetworking (ref), p1 (ref)
		assert(p4, "state should not be nil")
		
		if p5.type == receivedUserPresenceModule.name then
			return handlePresenceModel(p4, p5.payload)
		elseif p5.type ~= presenceNetworking.GetPresencesFromUserIds.Succeeded.name then
			return p4[p1]
		end
		local var1 = p4[p1]
		
		for i, v in ipairs(p5.responseBody.userPresences) do
			var1 = handlePresenceModel(p4, v)
		end
		return var1
	end
end