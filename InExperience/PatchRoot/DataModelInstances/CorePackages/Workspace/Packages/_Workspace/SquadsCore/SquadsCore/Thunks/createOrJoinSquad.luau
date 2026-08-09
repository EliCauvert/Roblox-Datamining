local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local logInExpCoplayTelemetryModule = require(squadsCore.Analytics.logInExpCoplayTelemetry)
local squadCoplayJoinModule = require(squadsCore.Enums.SquadCoplayJoin)
local _ = require(squadsCore.Enums.SquadLocationEnum)
local squadPromptTypeModule = require(squadsCore.Enums.SquadPromptType)
local networkingSquadsModule = require(squadsCore.Http.NetworkingSquads)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagEnableSquadCoplayAnalytic = sharedFlagsModule.FFlagEnableSquadCoplayAnalytic
local fFlagEnableScheduledSquads = sharedFlagsModule.FFlagEnableScheduledSquads

return function(p0, p1, p2, p3, p4, p5, p6) --[[ line: 18 ]]
	-- upvalues: networkingSquadsModule (ref), fFlagEnableSquadCoplayAnalytic (ref), fFlagEnableScheduledSquads (ref), logInExpCoplayTelemetryModule (ref), squadCoplayJoinModule (ref), squadPromptTypeModule (ref)
	return function(p7) --[[ line: 27 ]]
		-- upvalues: networkingSquadsModule (copy), p0 (ref), fFlagEnableSquadCoplayAnalytic (copy), p3 (ref), p4 (ref), fFlagEnableScheduledSquads (copy), p6 (ref), logInExpCoplayTelemetryModule (copy), squadCoplayJoinModule (copy), p2 (ref), p1 (ref), squadPromptTypeModule (copy), p5 (ref)
		local var6 = p7:dispatch(networkingSquadsModule.CreateOrJoinSquad.API({
			leaveExisting = true,
			parentChannelId = p0,
			squadLocation = if fFlagEnableSquadCoplayAnalytic then p3 else nil,
			partyAttemptId = p4,
			scheduledSquadId = if fFlagEnableScheduledSquads then p6 else nil
		}))
		
		if fFlagEnableSquadCoplayAnalytic then
			var6 = var6:andThen(function(p8) --[[ line: 37 ]]
				-- upvalues: logInExpCoplayTelemetryModule (copy), p3 (copy), squadCoplayJoinModule (copy), p2 (copy)
				local groupUpId = p8.responseBody.groupUp.groupUpId
				local members = p8.responseBody.groupUp.members
				
				if groupUpId and members then
					logInExpCoplayTelemetryModule(groupUpId, members, p3, squadCoplayJoinModule.PartyJoin, p2)
				end
			end)
		end
		return var6:catch(function(_) --[[ line: 53 ]]
			-- upvalues: p1 (copy), p7 (ref), squadPromptTypeModule (copy), p5 (copy)
			p1(p7, {
				hideCancelButton = true,
				promptType = squadPromptTypeModule.Error,
				onConfirm = p5
			})
		end)
	end
end