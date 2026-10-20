local RoduxSquads = script:FindFirstAncestor("RoduxSquads")
local LoggerModule = require(RoduxSquads.Logger)
local Parent = RoduxSquads.Parent
local CryoModule = require(Parent.Cryo)
local RoduxModule = require(Parent.Rodux)
local CurrentExperienceInviteUpdated = require(RoduxSquads.Actions).CurrentExperienceInviteUpdated
local CurrentExperienceInviteDismissed = require(RoduxSquads.Actions).CurrentExperienceInviteDismissed
local CurrentExperienceInviteReceived = require(RoduxSquads.Actions).CurrentExperienceInviteReceived
local ExperienceInviteModel = require(RoduxSquads.Models).ExperienceInviteModel
local _ = require(script.Parent.Parent.RoduxSquadsTypes)

return function(p1)
	-- upvalues: CryoModule (copy), RoduxModule (copy), LoggerModule (copy), ExperienceInviteModel (copy), CurrentExperienceInviteUpdated (copy), CurrentExperienceInviteReceived (copy), CurrentExperienceInviteDismissed (copy)
	local NetworkingSquads = p1.NetworkingSquads
	
	local function v11(p2, FormatResult)
		-- upvalues: CryoModule (upval)
		return if p2 and p2.notification.experienceInviteId == FormatResult.experienceInviteId and (p2.model == nil or p2.model.versionId < FormatResult.versionId) then CryoModule.Dictionary.join(p2, { model = FormatResult }) else p2
	end
	
	return RoduxModule.createReducer(nil, {
		[NetworkingSquads.CreateExperienceInvite.Succeeded.name] = function(p2, p3)
			-- upvalues: LoggerModule (upval)
			LoggerModule:debug("Create experience invite success. ExperienceInviteId: {}", p3.responseBody.experienceInviteId)
			
			return p2
		end,
		[NetworkingSquads.GetExperienceInvite.Succeeded.name] = function(p2, p3)
			-- upvalues: v11 (copy), ExperienceInviteModel (upval)
			local ResponseBody = p3.responseBody
			assert(ResponseBody, "Experience invite must exist.")
			
			return v11(p2, ExperienceInviteModel.format(ResponseBody))
		end,
		[NetworkingSquads.VoteForExperienceInvite.Succeeded.name] = function(p2, p3)
			-- upvalues: LoggerModule (upval), v11 (copy), ExperienceInviteModel (upval)
			local ResponseBody = p3.responseBody
			LoggerModule:debug("Vote experience invite success. ExperienceInviteId: {}", ResponseBody.experienceInviteId)
			
			return v11(p2, ExperienceInviteModel.format(ResponseBody))
		end,
		[CurrentExperienceInviteUpdated.name] = function(p2, p3)
			-- upvalues: v11 (copy), ExperienceInviteModel (upval)
			local ExperienceInvite = p3.payload.experienceInvite
			assert(ExperienceInvite, "Experience invite must exist.")
			
			return v11(p2, ExperienceInviteModel.format(ExperienceInvite))
		end,
		[CurrentExperienceInviteReceived.name] = function(p2, p3)
			local ExperienceInviteId = p3.payload.experienceInviteId
			
			return if p2 == nil or p2.notification.experienceInviteId ~= ExperienceInviteId then {
				notification = {
					experienceInviteId = ExperienceInviteId,
					membershipEntityId = p3.payload.membershipEntityId,
					notificationId = p3.payload.notificationId,
					isInviter = p3.payload.isInviter
				}
			} else p2
		end,
		[CurrentExperienceInviteDismissed.name] = function(p2, p3)
			return if p2 and p2.notification.notificationId == p3.payload.notificationId then nil else p2
		end
	})
end