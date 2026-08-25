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

local _ = function(p0, p1, p2, p3, p4, p5, p6)
	-- upvalues: networkingSquadsModule (ref), fFlagEnableSquadCoplayAnalytic (ref), constantsModule (ref), squadCoplayJoinModule (ref), logInExpCoplayTelemetryModule (ref), squadPromptTypeModule (ref)
	return function(p7)
		-- upvalues: networkingSquadsModule (copy), p0 (ref), p1 (ref), p5 (ref), p4 (ref), p6 (ref), fFlagEnableSquadCoplayAnalytic (copy), constantsModule (copy), squadCoplayJoinModule (copy), logInExpCoplayTelemetryModule (copy), p3 (ref), p2 (ref), squadPromptTypeModule (copy)
		local var10 = p7:dispatch(networkingSquadsModule.ActOnPartyNudge.API({
			leaveExisting = true,
			action = p0,
			nudgeId = p1,
			partyAttemptId = p5,
			squadLocation = p4,
			parentChannelId = p6
		}))
		
		if fFlagEnableSquadCoplayAnalytic then
			var10 = var10:andThen(function(p8)
				-- upvalues: p0 (copy), constantsModule (copy), squadCoplayJoinModule (copy), logInExpCoplayTelemetryModule (copy), p4 (copy), p3 (copy)
				if if p0 ~= constantsModule.ACCEPT_START_PARTY_REQUEST_ACTION then p0 == constantsModule.ACCEPT_PARTY_INVITE_ACTION else true then
					local groupUpId = p8.responseBody.groupUp.groupUpId
					local members = p8.responseBody.groupUp.members
					
					if groupUpId and members then
						logInExpCoplayTelemetryModule(groupUpId, members, p4, if p0 == constantsModule.ACCEPT_START_PARTY_REQUEST_ACTION then squadCoplayJoinModule.SquadNudgeCreation else squadCoplayJoinModule.SquadNudgeJoin, p3)
					end
				end
			end)
		end
		return var10:catch(function(_)
			-- upvalues: p0 (copy), constantsModule (copy), p2 (copy), p7 (ref), squadPromptTypeModule (copy)
			if p0 == constantsModule.ACCEPT_START_PARTY_REQUEST_ACTION or p0 == constantsModule.ACCEPT_PARTY_INVITE_ACTION then
				p2(p7, {
					hideCancelButton = true,
					promptType = squadPromptTypeModule.Error
				})
			end
		end)
	end
end

return function(p9, p10, p11, p12, p13, p14, p15, p16, p17)
	-- upvalues: networkingSquadsModule (ref), fFlagEnableSquadCoplayAnalytic (ref), constantsModule (ref), squadCoplayJoinModule (ref), logInExpCoplayTelemetryModule (ref), squadPromptTypeModule (ref), fixPartyNudgeNilThunkWhenLeave (ref), promiseModule (ref), leaveSquadModule (ref), fFlagPartyDevAPIToRespectThirdPartySettingsEnabled (ref)
	return function(p18)
		-- upvalues: p11 (ref), p9 (ref), p10 (ref), p12 (ref), p13 (ref), p14 (ref), p16 (ref), p17 (ref), networkingSquadsModule (copy), fFlagEnableSquadCoplayAnalytic (copy), constantsModule (copy), squadCoplayJoinModule (copy), logInExpCoplayTelemetryModule (copy), squadPromptTypeModule (copy), fixPartyNudgeNilThunkWhenLeave (copy), promiseModule (copy), leaveSquadModule (copy), fFlagPartyDevAPIToRespectThirdPartySettingsEnabled (copy), p15 (ref)
		local state = p18:getState()
		local squadId = state.Squad and (state.Squad.Squad and (state.Squad.Squad.currentSquad and state.Squad.Squad.currentSquad.squadId))
		
		if squadId and squadId ~= "" and p11 then
			return if fixPartyNudgeNilThunkWhenLeave then promiseModule.new(function(p21, p22)
				-- upvalues: p18 (ref), leaveSquadModule (copy), squadPromptTypeModule (copy), p12 (copy), p9 (copy), p10 (copy), p13 (copy), p14 (copy), p16 (copy), p17 (copy), networkingSquadsModule (copy), fFlagEnableSquadCoplayAnalytic (copy), constantsModule (copy), squadCoplayJoinModule (copy), logInExpCoplayTelemetryModule (copy), fFlagPartyDevAPIToRespectThirdPartySettingsEnabled (copy), p15 (copy)
				p18:dispatch(leaveSquadModule(squadPromptTypeModule.JoinAnotherSquad, p12, function()
					-- upvalues: p18 (copy), p9 (copy), p10 (copy), p12 (copy), p13 (copy), p14 (copy), p16 (copy), p17 (copy), networkingSquadsModule (copy), fFlagEnableSquadCoplayAnalytic (copy), constantsModule (copy), squadCoplayJoinModule (copy), logInExpCoplayTelemetryModule (copy), squadPromptTypeModule (copy), p21 (ref), p22 (ref)
					p18:dispatch(function(p23)
						-- upvalues: networkingSquadsModule (copy), p9 (ref), p10 (ref), p16 (ref), p14 (ref), p17 (ref), fFlagEnableSquadCoplayAnalytic (copy), constantsModule (copy), squadCoplayJoinModule (copy), logInExpCoplayTelemetryModule (copy), p13 (ref), p12 (ref), squadPromptTypeModule (copy)
						local var10 = p23:dispatch(networkingSquadsModule.ActOnPartyNudge.API({
							leaveExisting = true,
							action = p9,
							nudgeId = p10,
							partyAttemptId = p16,
							squadLocation = p14,
							parentChannelId = p17
						}))
						
						if fFlagEnableSquadCoplayAnalytic then
							var10 = var10:andThen(function(p24)
								-- upvalues: p9 (copy), constantsModule (copy), squadCoplayJoinModule (copy), logInExpCoplayTelemetryModule (copy), p14 (copy), p13 (copy)
								if if p9 ~= constantsModule.ACCEPT_START_PARTY_REQUEST_ACTION then p9 == constantsModule.ACCEPT_PARTY_INVITE_ACTION else true then
									local groupUpId = p24.responseBody.groupUp.groupUpId
									local members = p24.responseBody.groupUp.members
									
									if groupUpId and members then
										logInExpCoplayTelemetryModule(groupUpId, members, p14, if p9 == constantsModule.ACCEPT_START_PARTY_REQUEST_ACTION then squadCoplayJoinModule.SquadNudgeCreation else squadCoplayJoinModule.SquadNudgeJoin, p13)
									end
								end
							end)
						end
						return var10:catch(function(_)
							-- upvalues: p9 (copy), constantsModule (copy), p12 (copy), p23 (ref), squadPromptTypeModule (copy)
							if p9 == constantsModule.ACCEPT_START_PARTY_REQUEST_ACTION or p9 == constantsModule.ACCEPT_PARTY_INVITE_ACTION then
								p12(p23, {
									hideCancelButton = true,
									promptType = squadPromptTypeModule.Error
								})
							end
						end)
					end):andThen(p21):catch(p22)
				end, p14, if fFlagPartyDevAPIToRespectThirdPartySettingsEnabled then p15 else true))
			end) else p18:dispatch(leaveSquadModule(squadPromptTypeModule.JoinAnotherSquad, p12, function()
				-- upvalues: p18 (ref), p9 (copy), p10 (copy), p12 (copy), p13 (copy), p14 (copy), p16 (copy), p17 (copy), networkingSquadsModule (copy), fFlagEnableSquadCoplayAnalytic (copy), constantsModule (copy), squadCoplayJoinModule (copy), logInExpCoplayTelemetryModule (copy), squadPromptTypeModule (copy)
				p18:dispatch(function(p19)
					-- upvalues: networkingSquadsModule (copy), p9 (ref), p10 (ref), p16 (ref), p14 (ref), p17 (ref), fFlagEnableSquadCoplayAnalytic (copy), constantsModule (copy), squadCoplayJoinModule (copy), logInExpCoplayTelemetryModule (copy), p13 (ref), p12 (ref), squadPromptTypeModule (copy)
					local var10 = p19:dispatch(networkingSquadsModule.ActOnPartyNudge.API({
						leaveExisting = true,
						action = p9,
						nudgeId = p10,
						partyAttemptId = p16,
						squadLocation = p14,
						parentChannelId = p17
					}))
					
					if fFlagEnableSquadCoplayAnalytic then
						var10 = var10:andThen(function(p20)
							-- upvalues: p9 (copy), constantsModule (copy), squadCoplayJoinModule (copy), logInExpCoplayTelemetryModule (copy), p14 (copy), p13 (copy)
							if if p9 ~= constantsModule.ACCEPT_START_PARTY_REQUEST_ACTION then p9 == constantsModule.ACCEPT_PARTY_INVITE_ACTION else true then
								local groupUpId = p20.responseBody.groupUp.groupUpId
								local members = p20.responseBody.groupUp.members
								
								if groupUpId and members then
									logInExpCoplayTelemetryModule(groupUpId, members, p14, if p9 == constantsModule.ACCEPT_START_PARTY_REQUEST_ACTION then squadCoplayJoinModule.SquadNudgeCreation else squadCoplayJoinModule.SquadNudgeJoin, p13)
								end
							end
						end)
					end
					return var10:catch(function(_)
						-- upvalues: p9 (copy), constantsModule (copy), p12 (copy), p19 (ref), squadPromptTypeModule (copy)
						if p9 == constantsModule.ACCEPT_START_PARTY_REQUEST_ACTION or p9 == constantsModule.ACCEPT_PARTY_INVITE_ACTION then
							p12(p19, {
								hideCancelButton = true,
								promptType = squadPromptTypeModule.Error
							})
						end
					end)
				end)
			end, p14, if fFlagPartyDevAPIToRespectThirdPartySettingsEnabled then p15 else true))
		end
		local var13 = p9
		local var14 = p10
		local var15 = p12
		local var16 = p13
		local var17 = p14
		local var18 = p16
		local var19 = p17
		
		return p18:dispatch(function(p25)
			-- upvalues: networkingSquadsModule (copy), var13 (ref), var14 (ref), var18 (ref), var17 (ref), var19 (ref), fFlagEnableSquadCoplayAnalytic (copy), constantsModule (copy), squadCoplayJoinModule (copy), logInExpCoplayTelemetryModule (copy), var16 (ref), var15 (ref), squadPromptTypeModule (copy)
			local var10 = p25:dispatch(networkingSquadsModule.ActOnPartyNudge.API({
				leaveExisting = true,
				action = var13,
				nudgeId = var14,
				partyAttemptId = var18,
				squadLocation = var17,
				parentChannelId = var19
			}))
			
			if fFlagEnableSquadCoplayAnalytic then
				var10 = var10:andThen(function(p26)
					-- upvalues: var13 (copy), constantsModule (copy), squadCoplayJoinModule (copy), logInExpCoplayTelemetryModule (copy), var17 (copy), var16 (copy)
					if if var13 ~= constantsModule.ACCEPT_START_PARTY_REQUEST_ACTION then var13 == constantsModule.ACCEPT_PARTY_INVITE_ACTION else true then
						local groupUpId = p26.responseBody.groupUp.groupUpId
						local members = p26.responseBody.groupUp.members
						
						if groupUpId and members then
							logInExpCoplayTelemetryModule(groupUpId, members, var17, if var13 == constantsModule.ACCEPT_START_PARTY_REQUEST_ACTION then squadCoplayJoinModule.SquadNudgeCreation else squadCoplayJoinModule.SquadNudgeJoin, var16)
						end
					end
				end)
			end
			return var10:catch(function(_)
				-- upvalues: var13 (copy), constantsModule (copy), var15 (copy), p25 (ref), squadPromptTypeModule (copy)
				if var13 == constantsModule.ACCEPT_START_PARTY_REQUEST_ACTION or var13 == constantsModule.ACCEPT_PARTY_INVITE_ACTION then
					var15(p25, {
						hideCancelButton = true,
						promptType = squadPromptTypeModule.Error
					})
				end
			end)
		end)
	end
end