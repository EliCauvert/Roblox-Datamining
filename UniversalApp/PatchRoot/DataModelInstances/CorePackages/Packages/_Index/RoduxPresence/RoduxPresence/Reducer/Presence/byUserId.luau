local roduxPresence = script:FindFirstAncestor("RoduxPresence")
local parent = roduxPresence.Parent
local roduxModule = require(parent.Rodux)
local cryoModule = require(parent.Cryo)
local receivedUserPresenceModule = require(roduxPresence.Actions.ReceivedUserPresence)
local presenceModelModule = require(roduxPresence.Models.PresenceModel)
local t = {}

return function(p0)
	-- upvalues: roduxModule (ref), t (ref), receivedUserPresenceModule (ref), presenceModelModule (ref), cryoModule (ref)
	return roduxModule.createReducer(t, {
		[receivedUserPresenceModule.name] = function(p1, p2)
			-- upvalues: presenceModelModule (copy), cryoModule (copy)
			local userId = p2.payload.userId
			local payload = p2.payload
			assert(presenceModelModule.isValid(payload))
			
			return cryoModule.Dictionary.join(p1, { [userId] = presenceModelModule.format(payload) })
		end,
		[p0.presenceNetworking.GetPresencesFromUserIds.Succeeded.name] = function(p3, p4)
			-- upvalues: presenceModelModule (copy), cryoModule (copy)
			local t = {}
			
			for i, v in ipairs(p4.responseBody.userPresences) do
				t[tostring(v.userId)] = presenceModelModule.format(v)
			end
			return cryoModule.Dictionary.join(p3, t)
		end
	})
end