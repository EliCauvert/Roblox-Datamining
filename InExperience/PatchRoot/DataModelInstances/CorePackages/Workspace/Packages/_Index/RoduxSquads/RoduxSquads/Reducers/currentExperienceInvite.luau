local roduxSquads = script:FindFirstAncestor("RoduxSquads")
local loggerModule = require(roduxSquads.Logger)
local parent = roduxSquads.Parent
local cryoModule = require(parent.Cryo)
local roduxModule = require(parent.Rodux)
local currentExperienceInviteUpdated = require(roduxSquads.Actions).CurrentExperienceInviteUpdated
local currentExperienceInviteDismissed = require(roduxSquads.Actions).CurrentExperienceInviteDismissed
local currentExperienceInviteReceived = require(roduxSquads.Actions).CurrentExperienceInviteReceived
local experienceInviteModel = require(roduxSquads.Models).ExperienceInviteModel
local _ = require(script.Parent.Parent.RoduxSquadsTypes)

return function(p1)
	-- upvalues: cryoModule (ref), roduxModule (ref), loggerModule (ref), experienceInviteModel (ref), currentExperienceInviteUpdated (ref), currentExperienceInviteReceived (ref), currentExperienceInviteDismissed (ref)
	local networkingSquads = p1.NetworkingSquads
	
	local var1 = function(p2, p3)
		-- upvalues: cryoModule (copy)
		return if p2 and p2.notification.experienceInviteId == p3.experienceInviteId and (p2.model == nil or p2.model.versionId < p3.versionId) then cryoModule.Dictionary.join(p2, { model = p3 }) else p2
	end
	
	return roduxModule.createReducer(nil, {
		[networkingSquads.CreateExperienceInvite.Succeeded.name] = function(p2, p3)
			-- upvalues: loggerModule (copy)
			loggerModule:debug("Create experience invite success. ExperienceInviteId: {}", p3.responseBody.experienceInviteId)
			
			return p2
		end,
		[networkingSquads.GetExperienceInvite.Succeeded.name] = function(p2, p3)
			-- upvalues: var1 (ref), experienceInviteModel (copy)
			local responseBody = p3.responseBody
			assert(responseBody, "Experience invite must exist.")
			
			return var1(p2, experienceInviteModel.format(responseBody))
		end,
		[networkingSquads.VoteForExperienceInvite.Succeeded.name] = function(p2, p3)
			-- upvalues: loggerModule (copy), var1 (ref), experienceInviteModel (copy)
			local responseBody = p3.responseBody
			loggerModule:debug("Vote experience invite success. ExperienceInviteId: {}", responseBody.experienceInviteId)
			
			return var1(p2, experienceInviteModel.format(responseBody))
		end,
		[currentExperienceInviteUpdated.name] = function(p2, p3)
			-- upvalues: var1 (ref), experienceInviteModel (copy)
			local experienceInvite = p3.payload.experienceInvite
			assert(experienceInvite, "Experience invite must exist.")
			
			return var1(p2, experienceInviteModel.format(experienceInvite))
		end,
		[currentExperienceInviteReceived.name] = function(p2, p3)
			local experienceInviteId = p3.payload.experienceInviteId
			
			return if p2 == nil or p2.notification.experienceInviteId ~= experienceInviteId then {
				notification = {
					experienceInviteId = experienceInviteId,
					membershipEntityId = p3.payload.membershipEntityId,
					notificationId = p3.payload.notificationId,
					isInviter = p3.payload.isInviter
				}
			} else p2
		end,
		[currentExperienceInviteDismissed.name] = function(p2, p3)
			return if p2 and p2.notification.notificationId == p3.payload.notificationId then nil else p2
		end
	})
end