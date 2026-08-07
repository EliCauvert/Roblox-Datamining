local roduxPresence = script:FindFirstAncestor("RoduxPresence")
local cryoModule = require(roduxPresence.Parent.Cryo)
local getDeepValueModule = require(roduxPresence.getDeepValue)
local receivedUserPresenceModule = require(roduxPresence.Actions.ReceivedUserPresence)

return function(p0, p1, p2) --[[ line: 10 ]]
	-- upvalues: getDeepValueModule (ref), cryoModule (ref), receivedUserPresenceModule (ref)
	local presenceNetworking = p2.presenceNetworking
	
	local function handlePresenceModel(p3, p4) --[[ line: 13 ]]
		-- upvalues: p0 (ref), getDeepValueModule (copy), p1 (ref), cryoModule (copy)
		local var5 = p3[p0]
		local var6 = tostring(p4.userId)
		local var7 = getDeepValueModule(p3, string.format("byUserId.%s.%s", var6, p1))
		
		if var7 and var5[var7] then
			var7 = tostring(var7)
			var5 = cryoModule.Dictionary.join(var5, { [var7] = cryoModule.List.removeValue(var5[var7], var6) })
		end
		local var8 = var5[p4[p1]]
		
		return if var8 and table.find(var8, var6) then var5 else cryoModule.Dictionary.join(var5, {
			[tostring(p4[p1])] = cryoModule.List.join(var8 or {}, { var6 })
		})
	end
	
	return function(p5, p6) --[[ line: 36 ]]
		-- upvalues: receivedUserPresenceModule (copy), handlePresenceModel (ref), presenceNetworking (ref), p0 (ref)
		assert(p5, "state should not be nil")
		
		if p6.type == receivedUserPresenceModule.name then
			return handlePresenceModel(p5, p6.payload)
		elseif p6.type ~= presenceNetworking.GetPresencesFromUserIds.Succeeded.name then
			return p5[p0]
		end
		local var9 = p5[p0]
		
		for i, v in ipairs(p6.responseBody.userPresences) do
			var9 = handlePresenceModel(p5, v)
		end
		return var9
	end
end