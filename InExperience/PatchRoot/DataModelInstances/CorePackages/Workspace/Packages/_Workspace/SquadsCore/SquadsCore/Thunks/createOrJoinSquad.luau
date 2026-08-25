local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local logInExpCoplayTelemetryModule = require(squadsCore.Analytics.logInExpCoplayTelemetry)
local squadCoplayJoinModule = require(squadsCore.Enums.SquadCoplayJoin)
local _ = require(squadsCore.Enums.SquadLocationEnum)
local squadPromptTypeModule = require(squadsCore.Enums.SquadPromptType)
local networkingSquadsModule = require(squadsCore.Http.NetworkingSquads)
local fFlagEnableSquadCoplayAnalytic = require(parent.SharedFlags).FFlagEnableSquadCoplayAnalytic

return function(p0, p1, p2, p3, p4, p5, p6)
	-- upvalues: networkingSquadsModule (ref), fFlagEnableSquadCoplayAnalytic (ref), logInExpCoplayTelemetryModule (ref), squadCoplayJoinModule (ref), squadPromptTypeModule (ref)
	return function(p7)
		-- upvalues: networkingSquadsModule (copy), p0 (ref), fFlagEnableSquadCoplayAnalytic (copy), p3 (ref), p4 (ref), p6 (ref), logInExpCoplayTelemetryModule (copy), squadCoplayJoinModule (copy), p2 (ref), p1 (ref), squadPromptTypeModule (copy), p5 (ref)
		local var5 = p7:dispatch(networkingSquadsModule.CreateOrJoinSquad.API({
			leaveExisting = true,
			parentChannelId = p0,
			squadLocation = if fFlagEnableSquadCoplayAnalytic then p3 else nil,
			partyAttemptId = p4,
			scheduledSquadId = p6
		}))
		
		if fFlagEnableSquadCoplayAnalytic then
			var5 = var5:andThen(function(p8)
				-- upvalues: logInExpCoplayTelemetryModule (copy), p3 (copy), squadCoplayJoinModule (copy), p2 (copy)
				local groupUpId = p8.responseBody.groupUp.groupUpId
				local members = p8.responseBody.groupUp.members
				
				if groupUpId and members then
					logInExpCoplayTelemetryModule(groupUpId, members, p3, squadCoplayJoinModule.PartyJoin, p2)
				end
			end)
		end
		return var5:catch(function(_)
			-- upvalues: p1 (copy), p7 (ref), squadPromptTypeModule (copy), p5 (copy)
			p1(p7, {
				hideCancelButton = true,
				promptType = squadPromptTypeModule.Error,
				onConfirm = p5
			})
		end)
	end
end