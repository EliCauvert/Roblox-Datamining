local RoduxPresence = script:FindFirstAncestor("RoduxPresence")
local Parent = RoduxPresence.Parent
local RoduxModule = require(Parent.Rodux)
local CryoModule = require(Parent.Cryo)
local ReceivedUserPresenceModule = require(RoduxPresence.Actions.ReceivedUserPresence)
local PresenceModelModule = require(RoduxPresence.Models.PresenceModel)
local t = {}

return function(p1)
	-- upvalues: RoduxModule (copy), t (copy), ReceivedUserPresenceModule (copy), PresenceModelModule (copy), CryoModule (copy)
	return RoduxModule.createReducer(t, {
		[ReceivedUserPresenceModule.name] = function(p2, p3)
			-- upvalues: PresenceModelModule (upval), CryoModule (upval)
			local UserId = p3.payload.userId
			local Payload = p3.payload
			assert(PresenceModelModule.isValid(Payload))
			
			return CryoModule.Dictionary.join(p2, { [UserId] = PresenceModelModule.format(Payload) })
		end,
		[p1.presenceNetworking.GetPresencesFromUserIds.Succeeded.name] = function(p2, p3)
			-- upvalues: PresenceModelModule (upval), CryoModule (upval)
			local FormatResults = {}
			
			for _, userPresence in ipairs(p3.responseBody.userPresences) do
				FormatResults[tostring(userPresence.userId)] = PresenceModelModule.format(userPresence)
			end
			return CryoModule.Dictionary.join(p2, FormatResults)
		end
	})
end