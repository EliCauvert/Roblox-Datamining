local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local leaveSquadModule = require(script.Parent.leaveSquad)
local constantsModule = require(squadsCore.Common.Constants)
local logInExpCoplayTelemetryModule = require(squadsCore.Analytics.logInExpCoplayTelemetry)
local squadCoplayJoinModule = require(squadsCore.Enums.SquadCoplayJoin)
local _ = require(squadsCore.Enums.SquadLocationEnum)
local squadPromptTypeModule = require(squadsCore.Enums.SquadPromptType)
local networkingSquadsModule = require(squadsCore.Http.NetworkingSquads)
local promiseModule = require(parent.Promise)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagEnableSquadCoplayAnalytic = sharedFlagsModule.FFlagEnableSquadCoplayAnalytic
local fFlagPartyDevAPIToRespectThirdPartySettingsEnabled = sharedFlagsModule.FFlagPartyDevAPIToRespectThirdPartySettingsEnabled
local fixPartyNudgeNilThunkWhenLeave = game:DefineFastFlag("FixPartyNudgeNilThunkWhenLeave", false)

local _ = function(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: networkingSquadsModule (ref), fFlagEnableSquadCoplayAnalytic (ref), constantsModule (ref), squadCoplayJoinModule (ref), logInExpCoplayTelemetryModule (ref), squadPromptTypeModule (ref)
	return function(p8)
		-- upvalues: networkingSquadsModule (copy), p1 (ref), p2 (ref), p6 (ref), p5 (ref), p7 (ref), fFlagEnableSquadCoplayAnalytic (copy), constantsModule (copy), squadCoplayJoinModule (copy), logInExpCoplayTelemetryModule (copy), p4 (ref), p3 (ref), squadPromptTypeModule (copy)
		local var1 = p8:dispatch(networkingSquadsModule.ActOnPartyNudge.API({
			leaveExisting = true,
			action = p1,
			nudgeId = p2,
			partyAttemptId = p6,
			squadLocation = p5,
			parentChannelId = p7
		}))
		
		if fFlagEnableSquadCoplayAnalytic then
			var1 = var1:andThen(function(p9)
				-- upvalues: p1 (copy), constantsModule (copy), squadCoplayJoinModule (copy), logInExpCoplayTelemetryModule (copy), p5 (copy), p4 (copy)
				if if p1 ~= constantsModule.ACCEPT_START_PARTY_REQUEST_ACTION then p1 == constantsModule.ACCEPT_PARTY_INVITE_ACTION else true then
					local groupUpId = p9.responseBody.groupUp.groupUpId
					local members = p9.responseBody.groupUp.members
					
					if groupUpId and members then
						logInExpCoplayTelemetryModule(groupUpId, members, p5, if p1 == constantsModule.ACCEPT_START_PARTY_REQUEST_ACTION then squadCoplayJoinModule.SquadNudgeCreation else squadCoplayJoinModule.SquadNudgeJoin, p4)
					end
				end
			end)
		end
		return var1:catch(function(_)
			-- upvalues: p1 (copy), constantsModule (copy), p3 (copy), p8 (ref), squadPromptTypeModule (copy)
			if p1 == constantsModule.ACCEPT_START_PARTY_REQUEST_ACTION or p1 == constantsModule.ACCEPT_PARTY_INVITE_ACTION then
				p3(p8, {
					hideCancelButton = true,
					promptType = squadPromptTypeModule.Error
				})
			end
		end)
	end
end

return function(p1, p2, p3, p4, p5, p6, p7, p8, p9)
	-- upvalues: networkingSquadsModule (ref), fFlagEnableSquadCoplayAnalytic (ref), constantsModule (ref), squadCoplayJoinModule (ref), logInExpCoplayTelemetryModule (ref), squadPromptTypeModule (ref), fixPartyNudgeNilThunkWhenLeave (ref), promiseModule (ref), leaveSquadModule (ref), fFlagPartyDevAPIToRespectThirdPartySettingsEnabled (ref)
	return function(p10)
		-- upvalues: p3 (ref), p1 (ref), p2 (ref), p4 (ref), p5 (ref), p6 (ref), p8 (ref), p9 (ref), networkingSquadsModule (copy), fFlagEnableSquadCoplayAnalytic (copy), constantsModule (copy), squadCoplayJoinModule (copy), logInExpCoplayTelemetryModule (copy), squadPromptTypeModule (copy), fixPartyNudgeNilThunkWhenLeave (copy), promiseModule (copy), leaveSquadModule (copy), fFlagPartyDevAPIToRespectThirdPartySettingsEnabled (copy), p7 (ref)
		local state = p10:getState()
		local squadId = state.Squad and (state.Squad.Squad and (state.Squad.Squad.currentSquad and state.Squad.Squad.currentSquad.squadId))
		
		if squadId and squadId ~= "" and p3 then
			return if fixPartyNudgeNilThunkWhenLeave then promiseModule.new(function(p11, p12)
				-- upvalues: p10 (ref), leaveSquadModule (copy), squadPromptTypeModule (copy), p4 (copy), p1 (copy), p2 (copy), p5 (copy), p6 (copy), p8 (copy), p9 (copy), networkingSquadsModule (copy), fFlagEnableSquadCoplayAnalytic (copy), constantsModule (copy), squadCoplayJoinModule (copy), logInExpCoplayTelemetryModule (copy), fFlagPartyDevAPIToRespectThirdPartySettingsEnabled (copy), p7 (copy)
				p10:dispatch(leaveSquadModule(squadPromptTypeModule.JoinAnotherSquad, p4, function()
					-- upvalues: p10 (copy), p1 (copy), p2 (copy), p4 (copy), p5 (copy), p6 (copy), p8 (copy), p9 (copy), networkingSquadsModule (copy), fFlagEnableSquadCoplayAnalytic (copy), constantsModule (copy), squadCoplayJoinModule (copy), logInExpCoplayTelemetryModule (copy), squadPromptTypeModule (copy), p11 (ref), p12 (ref)
					p10:dispatch(function(p13)
						-- upvalues: networkingSquadsModule (copy), p1 (ref), p2 (ref), p8 (ref), p6 (ref), p9 (ref), fFlagEnableSquadCoplayAnalytic (copy), constantsModule (copy), squadCoplayJoinModule (copy), logInExpCoplayTelemetryModule (copy), p5 (ref), p4 (ref), squadPromptTypeModule (copy)
						local var1 = p13:dispatch(networkingSquadsModule.ActOnPartyNudge.API({
							leaveExisting = true,
							action = p1,
							nudgeId = p2,
							partyAttemptId = p8,
							squadLocation = p6,
							parentChannelId = p9
						}))
						
						if fFlagEnableSquadCoplayAnalytic then
							var1 = var1:andThen(function(p14)
								-- upvalues: p1 (copy), constantsModule (copy), squadCoplayJoinModule (copy), logInExpCoplayTelemetryModule (copy), p6 (copy), p5 (copy)
								if if p1 ~= constantsModule.ACCEPT_START_PARTY_REQUEST_ACTION then p1 == constantsModule.ACCEPT_PARTY_INVITE_ACTION else true then
									local groupUpId = p14.responseBody.groupUp.groupUpId
									local members = p14.responseBody.groupUp.members
									
									if groupUpId and members then
										logInExpCoplayTelemetryModule(groupUpId, members, p6, if p1 == constantsModule.ACCEPT_START_PARTY_REQUEST_ACTION then squadCoplayJoinModule.SquadNudgeCreation else squadCoplayJoinModule.SquadNudgeJoin, p5)
									end
								end
							end)
						end
						return var1:catch(function(_)
							-- upvalues: p1 (copy), constantsModule (copy), p4 (copy), p13 (ref), squadPromptTypeModule (copy)
							if p1 == constantsModule.ACCEPT_START_PARTY_REQUEST_ACTION or p1 == constantsModule.ACCEPT_PARTY_INVITE_ACTION then
								p4(p13, {
									hideCancelButton = true,
									promptType = squadPromptTypeModule.Error
								})
							end
						end)
					end):andThen(p11):catch(p12)
				end, p6, if fFlagPartyDevAPIToRespectThirdPartySettingsEnabled then p7 else true))
			end) else p10:dispatch(leaveSquadModule(squadPromptTypeModule.JoinAnotherSquad, p4, function()
				-- upvalues: p10 (ref), p1 (copy), p2 (copy), p4 (copy), p5 (copy), p6 (copy), p8 (copy), p9 (copy), networkingSquadsModule (copy), fFlagEnableSquadCoplayAnalytic (copy), constantsModule (copy), squadCoplayJoinModule (copy), logInExpCoplayTelemetryModule (copy), squadPromptTypeModule (copy)
				p10:dispatch(function(p11)
					-- upvalues: networkingSquadsModule (copy), p1 (ref), p2 (ref), p8 (ref), p6 (ref), p9 (ref), fFlagEnableSquadCoplayAnalytic (copy), constantsModule (copy), squadCoplayJoinModule (copy), logInExpCoplayTelemetryModule (copy), p5 (ref), p4 (ref), squadPromptTypeModule (copy)
					local var1 = p11:dispatch(networkingSquadsModule.ActOnPartyNudge.API({
						leaveExisting = true,
						action = p1,
						nudgeId = p2,
						partyAttemptId = p8,
						squadLocation = p6,
						parentChannelId = p9
					}))
					
					if fFlagEnableSquadCoplayAnalytic then
						var1 = var1:andThen(function(p12)
							-- upvalues: p1 (copy), constantsModule (copy), squadCoplayJoinModule (copy), logInExpCoplayTelemetryModule (copy), p6 (copy), p5 (copy)
							if if p1 ~= constantsModule.ACCEPT_START_PARTY_REQUEST_ACTION then p1 == constantsModule.ACCEPT_PARTY_INVITE_ACTION else true then
								local groupUpId = p12.responseBody.groupUp.groupUpId
								local members = p12.responseBody.groupUp.members
								
								if groupUpId and members then
									logInExpCoplayTelemetryModule(groupUpId, members, p6, if p1 == constantsModule.ACCEPT_START_PARTY_REQUEST_ACTION then squadCoplayJoinModule.SquadNudgeCreation else squadCoplayJoinModule.SquadNudgeJoin, p5)
								end
							end
						end)
					end
					return var1:catch(function(_)
						-- upvalues: p1 (copy), constantsModule (copy), p4 (copy), p11 (ref), squadPromptTypeModule (copy)
						if p1 == constantsModule.ACCEPT_START_PARTY_REQUEST_ACTION or p1 == constantsModule.ACCEPT_PARTY_INVITE_ACTION then
							p4(p11, {
								hideCancelButton = true,
								promptType = squadPromptTypeModule.Error
							})
						end
					end)
				end)
			end, p6, if fFlagPartyDevAPIToRespectThirdPartySettingsEnabled then p7 else true))
		end
		local var1 = p1
		local var2 = p2
		local var3 = p4
		local var4 = p5
		local var5 = p6
		local var6 = p8
		local var7 = p9
		
		return p10:dispatch(function(p11)
			-- upvalues: networkingSquadsModule (copy), var1 (ref), var2 (ref), var6 (ref), var5 (ref), var7 (ref), fFlagEnableSquadCoplayAnalytic (copy), constantsModule (copy), squadCoplayJoinModule (copy), logInExpCoplayTelemetryModule (copy), var4 (ref), var3 (ref), squadPromptTypeModule (copy)
			local var8 = p11:dispatch(networkingSquadsModule.ActOnPartyNudge.API({
				leaveExisting = true,
				action = var1,
				nudgeId = var2,
				partyAttemptId = var6,
				squadLocation = var5,
				parentChannelId = var7
			}))
			
			if fFlagEnableSquadCoplayAnalytic then
				var8 = var8:andThen(function(p12)
					-- upvalues: var1 (copy), constantsModule (copy), squadCoplayJoinModule (copy), logInExpCoplayTelemetryModule (copy), var5 (copy), var4 (copy)
					if if var1 ~= constantsModule.ACCEPT_START_PARTY_REQUEST_ACTION then var1 == constantsModule.ACCEPT_PARTY_INVITE_ACTION else true then
						local groupUpId = p12.responseBody.groupUp.groupUpId
						local members = p12.responseBody.groupUp.members
						
						if groupUpId and members then
							logInExpCoplayTelemetryModule(groupUpId, members, var5, if var1 == constantsModule.ACCEPT_START_PARTY_REQUEST_ACTION then squadCoplayJoinModule.SquadNudgeCreation else squadCoplayJoinModule.SquadNudgeJoin, var4)
						end
					end
				end)
			end
			return var8:catch(function(_)
				-- upvalues: var1 (copy), constantsModule (copy), var3 (copy), p11 (ref), squadPromptTypeModule (copy)
				if var1 == constantsModule.ACCEPT_START_PARTY_REQUEST_ACTION or var1 == constantsModule.ACCEPT_PARTY_INVITE_ACTION then
					var3(p11, {
						hideCancelButton = true,
						promptType = squadPromptTypeModule.Error
					})
				end
			end)
		end)
	end
end