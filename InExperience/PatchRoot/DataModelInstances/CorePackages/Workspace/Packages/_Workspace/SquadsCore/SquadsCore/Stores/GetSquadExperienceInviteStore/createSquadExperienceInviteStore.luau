local SquadsCore = script:FindFirstAncestor("SquadsCore")
local Parent = SquadsCore.Parent
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.RoduxSquads)
local SignalsModule = require(Parent.Signals)
local CreateSessionScopedSignalFunction = require(Parent.SignalsUtils).createSessionScopedSignal
local ExperienceInviteModel = require(SquadsCore.RoduxSquads).Models.ExperienceInviteModel

local function getAndUpdateState(p1, Model) --[[ Line: 34 ]]
	-- upvalues: CryoModule (copy)
	return if p1 and p1.notification.experienceInviteId == Model.experienceInviteId and (p1.model == nil or p1.model.versionId < Model.versionId) then CryoModule.Dictionary.join(p1, { model = Model }) else p1
end

return function() --[[ Line: 47 ]]
	-- upvalues: CreateSessionScopedSignalFunction (copy), SignalsModule (copy), ExperienceInviteModel (copy), getAndUpdateState (copy)
	local SessionScopedSignal, SessionScopedSignal2 = CreateSessionScopedSignalFunction(false)
	local SessionScopedSignal1, SessionScopedSignal2_1 = CreateSessionScopedSignalFunction(nil)
	
	local function CurrentExperienceInviteUpdated(p1) --[[ Line: 61 ]]
		-- upvalues: ExperienceInviteModel (upval), SessionScopedSignal2_1 (copy), getAndUpdateState (upval)
		assert(p1, "Experience invite must exist.")
		local FormatResult = ExperienceInviteModel.format(p1)
		SessionScopedSignal2_1(function(p2) --[[ Line: 64 ]]
			-- upvalues: getAndUpdateState (upval), FormatResult (copy)
			return getAndUpdateState(p2, FormatResult)
		end)
	end
	
	return {
		getIsExperienceInvitePending = SessionScopedSignal,
		getCurrentExperienceInvite = SessionScopedSignal1,
		getHasCurrentExperienceInvite = SignalsModule.createComputed(function(p1): boolean --[[ Line: 53 ]]
			-- upvalues: SessionScopedSignal1 (copy)
			return SessionScopedSignal1(p1) ~= nil
		end),
		currentExperienceInviteStatusUpdated = function(p1) --[[ Line: 57 ]]
			-- upvalues: SessionScopedSignal2 (copy)
			SessionScopedSignal2(p1)
		end,
		currentExperienceInviteReceived = function(ExperienceInviteId, MembershipEntityId, NotificationId, IsInviter) --[[ Line: 69 ]]
			-- upvalues: SessionScopedSignal2_1 (copy)
			SessionScopedSignal2_1(function(p1) --[[ Line: 76 ]]
				-- upvalues: ExperienceInviteId (copy), MembershipEntityId (copy), NotificationId (copy), IsInviter (copy)
				return if p1 == nil or p1.notification.experienceInviteId ~= ExperienceInviteId then {
					notification = {
						experienceInviteId = ExperienceInviteId,
						membershipEntityId = MembershipEntityId,
						notificationId = NotificationId,
						isInviter = IsInviter
					}
				} else p1
			end)
		end,
		currentExperienceInviteUpdated = CurrentExperienceInviteUpdated,
		currentExperienceInviteDismissed = function(NotificationId) --[[ Line: 91 ]]
			-- upvalues: SessionScopedSignal2_1 (copy)
			SessionScopedSignal2_1(function(p1) --[[ Line: 92 ]]
				-- upvalues: NotificationId (copy)
				return if p1 and p1.notification.notificationId == NotificationId then nil else p1
			end)
		end,
		getExperienceInviteSucceeded = CurrentExperienceInviteUpdated,
		voteForExperienceInviteSucceeded = CurrentExperienceInviteUpdated,
		reset = function() --[[ Line: 100 ]]
			-- upvalues: SessionScopedSignal2 (copy), SessionScopedSignal2_1 (copy)
			SessionScopedSignal2(false)
			SessionScopedSignal2_1(nil)
		end
	}
end