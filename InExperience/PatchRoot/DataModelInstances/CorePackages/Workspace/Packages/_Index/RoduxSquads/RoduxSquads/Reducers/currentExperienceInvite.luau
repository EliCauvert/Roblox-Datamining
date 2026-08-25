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

return function(p0)
	-- upvalues: cryoModule (ref), roduxModule (ref), loggerModule (ref), experienceInviteModel (ref), currentExperienceInviteUpdated (ref), currentExperienceInviteReceived (ref), currentExperienceInviteDismissed (ref)
	local networkingSquads = p0.NetworkingSquads
	
	local var4 = function(p1, p2)
		-- upvalues: cryoModule (copy)
		return if p1 and p1.notification.experienceInviteId == p2.experienceInviteId and (p1.model == nil or p1.model.versionId < p2.versionId) then cryoModule.Dictionary.join(p1, { model = p2 }) else p1
	end
	
	return roduxModule.createReducer(nil, {
		[networkingSquads.CreateExperienceInvite.Succeeded.name] = function(p3, p4)
			-- upvalues: loggerModule (copy)
			loggerModule:debug("Create experience invite success. ExperienceInviteId: {}", p4.responseBody.experienceInviteId)
			
			return p3
		end,
		[networkingSquads.GetExperienceInvite.Succeeded.name] = function(p5, p6)
			-- upvalues: var4 (ref), experienceInviteModel (copy)
			local responseBody = p6.responseBody
			assert(responseBody, "Experience invite must exist.")
			
			return var4(p5, experienceInviteModel.format(responseBody))
		end,
		[networkingSquads.VoteForExperienceInvite.Succeeded.name] = function(p7, p8)
			-- upvalues: loggerModule (copy), var4 (ref), experienceInviteModel (copy)
			local responseBody = p8.responseBody
			loggerModule:debug("Vote experience invite success. ExperienceInviteId: {}", responseBody.experienceInviteId)
			
			return var4(p7, experienceInviteModel.format(responseBody))
		end,
		[currentExperienceInviteUpdated.name] = function(p9, p10)
			-- upvalues: var4 (ref), experienceInviteModel (copy)
			local experienceInvite = p10.payload.experienceInvite
			assert(experienceInvite, "Experience invite must exist.")
			
			return var4(p9, experienceInviteModel.format(experienceInvite))
		end,
		[currentExperienceInviteReceived.name] = function(p11, p12)
			local experienceInviteId = p12.payload.experienceInviteId
			
			return if p11 == nil or p11.notification.experienceInviteId ~= experienceInviteId then {
				notification = {
					experienceInviteId = experienceInviteId,
					membershipEntityId = p12.payload.membershipEntityId,
					notificationId = p12.payload.notificationId,
					isInviter = p12.payload.isInviter
				}
			} else p11
		end,
		[currentExperienceInviteDismissed.name] = function(p13, p14)
			return if p13 and p13.notification.notificationId == p14.payload.notificationId then nil else p13
		end
	})
end