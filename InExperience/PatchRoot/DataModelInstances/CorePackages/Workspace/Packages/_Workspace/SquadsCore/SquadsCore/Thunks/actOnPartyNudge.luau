local SquadsCore = script:FindFirstAncestor("SquadsCore")
local Parent = SquadsCore.Parent
local LeaveSquadModule = require(script.Parent.leaveSquad)
local ConstantsModule = require(SquadsCore.Common.Constants)
local LogInExpCoplayTelemetryModule = require(SquadsCore.Analytics.logInExpCoplayTelemetry)
local SquadCoplayJoinModule = require(SquadsCore.Enums.SquadCoplayJoin)
local _ = require(SquadsCore.Enums.SquadLocationEnum)
local SquadPromptTypeModule = require(SquadsCore.Enums.SquadPromptType)
local NetworkingSquadsModule = require(SquadsCore.Http.NetworkingSquads)
local PromiseModule = require(Parent.Promise)
local FFlagPartyDevAPIToRespectThirdPartySettingsEnabled = require(Parent.SharedFlags).FFlagPartyDevAPIToRespectThirdPartySettingsEnabled

local function _(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: NetworkingSquadsModule (copy), ConstantsModule (copy), SquadCoplayJoinModule (copy), LogInExpCoplayTelemetryModule (copy), SquadPromptTypeModule (copy)
	return function(p8)
		-- upvalues: NetworkingSquadsModule (upval), p1 (copy), p2 (copy), p6 (copy), p5 (copy), p7 (copy), ConstantsModule (upval), SquadCoplayJoinModule (upval), LogInExpCoplayTelemetryModule (upval), p4 (copy), p3 (copy), SquadPromptTypeModule (upval)
		return p8:dispatch(NetworkingSquadsModule.ActOnPartyNudge.API({
			leaveExisting = true,
			action = p1,
			nudgeId = p2,
			partyAttemptId = p6,
			squadLocation = p5,
			parentChannelId = p7
		})):andThen(function(Result)
			-- upvalues: p1 (upval), ConstantsModule (upval), SquadCoplayJoinModule (upval), LogInExpCoplayTelemetryModule (upval), p5 (upval), p4 (upval)
			if p1 == ConstantsModule.ACCEPT_START_PARTY_REQUEST_ACTION or p1 == ConstantsModule.ACCEPT_PARTY_INVITE_ACTION then
				local GroupUpId = Result.responseBody.groupUp.groupUpId
				local Members = Result.responseBody.groupUp.members
				
				if GroupUpId and Members then
					LogInExpCoplayTelemetryModule(GroupUpId, Members, p5, if p1 == ConstantsModule.ACCEPT_START_PARTY_REQUEST_ACTION then SquadCoplayJoinModule.SquadNudgeCreation else SquadCoplayJoinModule.SquadNudgeJoin, p4)
				end
			end
		end):catch(function(_)
			-- upvalues: p1 (upval), ConstantsModule (upval), p3 (upval), p8 (copy), SquadPromptTypeModule (upval)
			if p1 == ConstantsModule.ACCEPT_START_PARTY_REQUEST_ACTION or p1 == ConstantsModule.ACCEPT_PARTY_INVITE_ACTION then
				p3(p8, {
					hideCancelButton = true,
					promptType = SquadPromptTypeModule.Error
				})
			end
		end)
	end
end

return function(ACCEPTSTARTPARTYREQUESTACTION, NudgeId, p1, Callback, p2, SquadLocation, p3, PartyAttemptId, ParentChannelId)
	-- upvalues: NetworkingSquadsModule (copy), ConstantsModule (copy), SquadCoplayJoinModule (copy), LogInExpCoplayTelemetryModule (copy), SquadPromptTypeModule (copy), PromiseModule (copy), LeaveSquadModule (copy), FFlagPartyDevAPIToRespectThirdPartySettingsEnabled (copy)
	return function(p4)
		-- upvalues: p1 (copy), ACCEPTSTARTPARTYREQUESTACTION (copy), NudgeId (copy), Callback (copy), p2 (copy), SquadLocation (copy), PartyAttemptId (copy), ParentChannelId (copy), NetworkingSquadsModule (upval), ConstantsModule (upval), SquadCoplayJoinModule (upval), LogInExpCoplayTelemetryModule (upval), SquadPromptTypeModule (upval), PromiseModule (upval), LeaveSquadModule (upval), FFlagPartyDevAPIToRespectThirdPartySettingsEnabled (upval), p3 (copy)
		local State = p4:getState()
		local SquadId = State.Squad and (State.Squad.Squad and (State.Squad.Squad.currentSquad and State.Squad.Squad.currentSquad.squadId))
		
		return if SquadId and SquadId ~= "" and p1 then PromiseModule.new(function(p5, p6)
			-- upvalues: p4 (copy), LeaveSquadModule (upval), SquadPromptTypeModule (upval), Callback (upval), ACCEPTSTARTPARTYREQUESTACTION (upval), NudgeId (upval), p2 (upval), SquadLocation (upval), PartyAttemptId (upval), ParentChannelId (upval), NetworkingSquadsModule (upval), ConstantsModule (upval), SquadCoplayJoinModule (upval), LogInExpCoplayTelemetryModule (upval), FFlagPartyDevAPIToRespectThirdPartySettingsEnabled (upval), p3 (upval)
			p4:dispatch(LeaveSquadModule(SquadPromptTypeModule.JoinAnotherSquad, Callback, function()
				-- upvalues: p4 (upval), ACCEPTSTARTPARTYREQUESTACTION (upval), NudgeId (upval), Callback (upval), p2 (upval), SquadLocation (upval), PartyAttemptId (upval), ParentChannelId (upval), NetworkingSquadsModule (upval), ConstantsModule (upval), SquadCoplayJoinModule (upval), LogInExpCoplayTelemetryModule (upval), SquadPromptTypeModule (upval), p5 (copy), p6 (copy)
				p4:dispatch(function(p7)
					-- upvalues: NetworkingSquadsModule (upval), ACCEPTSTARTPARTYREQUESTACTION (copy), NudgeId (copy), PartyAttemptId (copy), SquadLocation (copy), ParentChannelId (copy), ConstantsModule (upval), SquadCoplayJoinModule (upval), LogInExpCoplayTelemetryModule (upval), p2 (copy), Callback (copy), SquadPromptTypeModule (upval)
					return p7:dispatch(NetworkingSquadsModule.ActOnPartyNudge.API({
						leaveExisting = true,
						action = ACCEPTSTARTPARTYREQUESTACTION,
						nudgeId = NudgeId,
						partyAttemptId = PartyAttemptId,
						squadLocation = SquadLocation,
						parentChannelId = ParentChannelId
					})):andThen(function(Result)
						-- upvalues: ACCEPTSTARTPARTYREQUESTACTION (upval), ConstantsModule (upval), SquadCoplayJoinModule (upval), LogInExpCoplayTelemetryModule (upval), SquadLocation (upval), p2 (upval)
						if ACCEPTSTARTPARTYREQUESTACTION == ConstantsModule.ACCEPT_START_PARTY_REQUEST_ACTION or ACCEPTSTARTPARTYREQUESTACTION == ConstantsModule.ACCEPT_PARTY_INVITE_ACTION then
							local GroupUpId = Result.responseBody.groupUp.groupUpId
							local Members = Result.responseBody.groupUp.members
							
							if GroupUpId and Members then
								LogInExpCoplayTelemetryModule(GroupUpId, Members, SquadLocation, if ACCEPTSTARTPARTYREQUESTACTION == ConstantsModule.ACCEPT_START_PARTY_REQUEST_ACTION then SquadCoplayJoinModule.SquadNudgeCreation else SquadCoplayJoinModule.SquadNudgeJoin, p2)
							end
						end
					end):catch(function(_)
						-- upvalues: ACCEPTSTARTPARTYREQUESTACTION (upval), ConstantsModule (upval), Callback (upval), p7 (copy), SquadPromptTypeModule (upval)
						if ACCEPTSTARTPARTYREQUESTACTION == ConstantsModule.ACCEPT_START_PARTY_REQUEST_ACTION or ACCEPTSTARTPARTYREQUESTACTION == ConstantsModule.ACCEPT_PARTY_INVITE_ACTION then
							Callback(p7, {
								hideCancelButton = true,
								promptType = SquadPromptTypeModule.Error
							})
						end
					end)
				end):andThen(p5):catch(p6)
			end, SquadLocation, not FFlagPartyDevAPIToRespectThirdPartySettingsEnabled or p3))
		end) else p4:dispatch(function(p5)
			-- upvalues: NetworkingSquadsModule (upval), ACCEPTSTARTPARTYREQUESTACTION (copy), NudgeId (copy), PartyAttemptId (copy), SquadLocation (copy), ParentChannelId (copy), ConstantsModule (upval), SquadCoplayJoinModule (upval), LogInExpCoplayTelemetryModule (upval), p2 (copy), Callback (copy), SquadPromptTypeModule (upval)
			return p5:dispatch(NetworkingSquadsModule.ActOnPartyNudge.API({
				leaveExisting = true,
				action = ACCEPTSTARTPARTYREQUESTACTION,
				nudgeId = NudgeId,
				partyAttemptId = PartyAttemptId,
				squadLocation = SquadLocation,
				parentChannelId = ParentChannelId
			})):andThen(function(Result)
				-- upvalues: ACCEPTSTARTPARTYREQUESTACTION (upval), ConstantsModule (upval), SquadCoplayJoinModule (upval), LogInExpCoplayTelemetryModule (upval), SquadLocation (upval), p2 (upval)
				if ACCEPTSTARTPARTYREQUESTACTION == ConstantsModule.ACCEPT_START_PARTY_REQUEST_ACTION or ACCEPTSTARTPARTYREQUESTACTION == ConstantsModule.ACCEPT_PARTY_INVITE_ACTION then
					local GroupUpId = Result.responseBody.groupUp.groupUpId
					local Members = Result.responseBody.groupUp.members
					
					if GroupUpId and Members then
						LogInExpCoplayTelemetryModule(GroupUpId, Members, SquadLocation, if ACCEPTSTARTPARTYREQUESTACTION == ConstantsModule.ACCEPT_START_PARTY_REQUEST_ACTION then SquadCoplayJoinModule.SquadNudgeCreation else SquadCoplayJoinModule.SquadNudgeJoin, p2)
					end
				end
			end):catch(function(_)
				-- upvalues: ACCEPTSTARTPARTYREQUESTACTION (upval), ConstantsModule (upval), Callback (upval), p5 (copy), SquadPromptTypeModule (upval)
				if ACCEPTSTARTPARTYREQUESTACTION == ConstantsModule.ACCEPT_START_PARTY_REQUEST_ACTION or ACCEPTSTARTPARTYREQUESTACTION == ConstantsModule.ACCEPT_PARTY_INVITE_ACTION then
					Callback(p5, {
						hideCancelButton = true,
						promptType = SquadPromptTypeModule.Error
					})
				end
			end)
		end)
	end
end