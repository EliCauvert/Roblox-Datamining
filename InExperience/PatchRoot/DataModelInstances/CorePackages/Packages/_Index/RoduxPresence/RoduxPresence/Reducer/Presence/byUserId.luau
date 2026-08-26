local roduxPresence = script:FindFirstAncestor("RoduxPresence")
local parent = roduxPresence.Parent
local roduxModule = require(parent.Rodux)
local cryoModule = require(parent.Cryo)
local receivedUserPresenceModule = require(roduxPresence.Actions.ReceivedUserPresence)
local presenceModelModule = require(roduxPresence.Models.PresenceModel)
local t = {}

return function(p1)
	-- upvalues: roduxModule (ref), t (ref), receivedUserPresenceModule (ref), presenceModelModule (ref), cryoModule (ref)
	return roduxModule.createReducer(t, {
		[receivedUserPresenceModule.name] = function(p2, p3)
			-- upvalues: presenceModelModule (copy), cryoModule (copy)
			local userId = p3.payload.userId
			local payload = p3.payload
			assert(presenceModelModule.isValid(payload))
			
			return cryoModule.Dictionary.join(p2, { [userId] = presenceModelModule.format(payload) })
		end,
		[p1.presenceNetworking.GetPresencesFromUserIds.Succeeded.name] = function(p2, p3)
			-- upvalues: presenceModelModule (copy), cryoModule (copy)
			local t = {}
			
			for i, v in ipairs(p3.responseBody.userPresences) do
				t[tostring(v.userId)] = presenceModelModule.format(v)
			end
			return cryoModule.Dictionary.join(p2, t)
		end
	})
end