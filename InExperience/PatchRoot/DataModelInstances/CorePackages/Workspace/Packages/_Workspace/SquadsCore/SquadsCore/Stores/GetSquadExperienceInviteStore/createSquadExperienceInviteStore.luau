local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local cryoModule = require(parent.Cryo)
local _ = require(parent.RoduxSquads)
local signalsModule = require(parent.Signals)
local createSessionScopedSignal = require(parent.SignalsUtils).createSessionScopedSignal
local experienceInviteModel = require(squadsCore.RoduxSquads).Models.ExperienceInviteModel

local function getAndUpdateState(p1, p2)
	-- upvalues: cryoModule (ref)
	return if p1 and p1.notification.experienceInviteId == p2.experienceInviteId and (p1.model == nil or p1.model.versionId < p2.versionId) then cryoModule.Dictionary.join(p1, { model = p2 }) else p1
end

return function()
	-- upvalues: createSessionScopedSignal (ref), signalsModule (ref), experienceInviteModel (ref), getAndUpdateState (ref)
	local var1, var2 = createSessionScopedSignal(false)
	local var3, var4 = createSessionScopedSignal(nil)
	
	local var5 = function(p1)
		-- upvalues: experienceInviteModel (copy), var4 (ref), getAndUpdateState (copy)
		assert(p1, "Experience invite must exist.")
		local var6 = experienceInviteModel.format(p1)
		var4(function(p2)
			-- upvalues: getAndUpdateState (copy), var6 (ref)
			return getAndUpdateState(p2, var6)
		end)
	end
	
	return {
		getIsExperienceInvitePending = var1,
		getCurrentExperienceInvite = var3,
		getHasCurrentExperienceInvite = signalsModule.createComputed(function(p1)
			-- upvalues: var3 (ref)
			return var3(p1) ~= nil
		end),
		currentExperienceInviteStatusUpdated = function(p1)
			-- upvalues: var2 (ref)
			var2(p1)
		end,
		currentExperienceInviteReceived = function(p1, p2, p3, p4)
			-- upvalues: var4 (ref)
			var4(function(p5)
				-- upvalues: p1 (ref), p2 (ref), p3 (ref), p4 (ref)
				return if p5 == nil or p5.notification.experienceInviteId ~= p1 then {
					notification = {
						experienceInviteId = p1,
						membershipEntityId = p2,
						notificationId = p3,
						isInviter = p4
					}
				} else p5
			end)
		end,
		currentExperienceInviteUpdated = var5,
		currentExperienceInviteDismissed = function(p1)
			-- upvalues: var4 (ref)
			var4(function(p2)
				-- upvalues: p1 (ref)
				return if p2 and p2.notification.notificationId == p1 then nil else p2
			end)
		end,
		getExperienceInviteSucceeded = var5,
		voteForExperienceInviteSucceeded = var5,
		reset = function()
			-- upvalues: var2 (ref), var4 (ref)
			var2(false)
			var4(nil)
		end
	}
end