local SquadsCore = script:FindFirstAncestor("SquadsCore")
local LogInExpCoplayTelemetryModule = require(SquadsCore.Analytics.logInExpCoplayTelemetry)
local SquadCoplayJoinModule = require(SquadsCore.Enums.SquadCoplayJoin)
local _ = require(SquadsCore.Enums.SquadLocationEnum)
local SquadPromptTypeModule = require(SquadsCore.Enums.SquadPromptType)
local NetworkingSquadsModule = require(SquadsCore.Http.NetworkingSquads)

return function(ParentChannelId, Callback, p1, SquadLocation, PartyAttemptId, OnConfirm, ScheduledSquadId) --[[ Line: 11 ]]
	-- upvalues: NetworkingSquadsModule (copy), LogInExpCoplayTelemetryModule (copy), SquadCoplayJoinModule (copy), SquadPromptTypeModule (copy)
	return function(p2) --[[ Line: 20 ]]
		-- upvalues: NetworkingSquadsModule (upval), ParentChannelId (copy), SquadLocation (copy), PartyAttemptId (copy), ScheduledSquadId (copy), LogInExpCoplayTelemetryModule (upval), SquadCoplayJoinModule (upval), p1 (copy), Callback (copy), SquadPromptTypeModule (upval), OnConfirm (copy)
		return p2:dispatch(NetworkingSquadsModule.CreateOrJoinSquad.API({
			leaveExisting = true,
			parentChannelId = ParentChannelId,
			squadLocation = SquadLocation,
			partyAttemptId = PartyAttemptId,
			scheduledSquadId = ScheduledSquadId
		})):andThen(function(Result) --[[ Line: 28 ]]
			-- upvalues: LogInExpCoplayTelemetryModule (upval), SquadLocation (upval), SquadCoplayJoinModule (upval), p1 (upval)
			local GroupUpId = Result.responseBody.groupUp.groupUpId
			local Members = Result.responseBody.groupUp.members
			
			if GroupUpId and Members then
				LogInExpCoplayTelemetryModule(GroupUpId, Members, SquadLocation, SquadCoplayJoinModule.PartyJoin, p1)
			end
		end):catch(function(_) --[[ Line: 43 ]]
			-- upvalues: Callback (upval), p2 (copy), SquadPromptTypeModule (upval), OnConfirm (upval)
			Callback(p2, {
				hideCancelButton = true,
				promptType = SquadPromptTypeModule.Error,
				onConfirm = OnConfirm
			})
		end)
	end
end