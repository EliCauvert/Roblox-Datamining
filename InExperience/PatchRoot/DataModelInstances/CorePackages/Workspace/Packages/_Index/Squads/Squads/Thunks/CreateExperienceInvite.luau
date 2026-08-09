local squads = script:FindFirstAncestor("Squads")
local parent = squads.Parent
local httpModule = require(parent.Http)
local localStorageKey = require(parent.LocalStorage).Enums.LocalStorageKey
local promiseModule = require(parent.Promise)
local appStorageService = game:GetService("AppStorageService")
local httpService = game:GetService("HttpService")
local enumsModule = require(parent.SquadsCore.Enums)
local _ = require(parent.SquadsCore.Types)
local dependenciesModule = require(squads.dependencies)
local cryo = dependenciesModule.Cryo
local networkingSquads = dependenciesModule.NetworkingSquads
local roduxSquads = dependenciesModule.RoduxSquads
local squadExperienceInviteSource = enumsModule.SquadExperienceInviteSource
local eventNamesModule = require(parent.SquadsCore.EventNames)
local squadPromptType = enumsModule.SquadPromptType
local encodeSquadMembersModule = require(parent.SquadsCore.encodeSquadMembers)
local fFlagEncodeSquadMembersUpdated = require(parent.SquadsCore.Flags).FFlagEncodeSquadMembersUpdated
local fFlagEnableSquadRegroupExperimentation = dependenciesModule.SharedFlags.FFlagEnableSquadRegroupExperimentation
local fFlagEnablePrivatePartyStartJoin = dependenciesModule.SharedFlags.FFlagEnablePrivatePartyStartJoin
local squadExperienceInviteType = enumsModule.SquadExperienceInviteType
local var9 = nil

return function(p0, p1, p2, p3) --[[ line: 32 ]]
	-- upvalues: fFlagEncodeSquadMembersUpdated (ref), encodeSquadMembersModule (write), cryo (ref), httpService (ref), promiseModule (ref), appStorageService (ref), localStorageKey (ref), roduxSquads (ref), var9 (write), fFlagEnableSquadRegroupExperimentation (ref), squadExperienceInviteSource (ref), fFlagEnablePrivatePartyStartJoin (ref), squadExperienceInviteType (ref), networkingSquads (ref), eventNamesModule (ref), httpModule (ref), squadPromptType (ref)
	return function(p4) --[[ line: 33 ]]
		-- upvalues: fFlagEncodeSquadMembersUpdated (copy), encodeSquadMembersModule (copy), cryo (copy), httpService (copy), promiseModule (copy), appStorageService (copy), localStorageKey (copy), roduxSquads (copy), var9 (copy), p0 (ref), fFlagEnableSquadRegroupExperimentation (copy), p2 (ref), squadExperienceInviteSource (copy), fFlagEnablePrivatePartyStartJoin (copy), p3 (ref), squadExperienceInviteType (copy), networkingSquads (copy), p1 (ref), eventNamesModule (copy), httpModule (copy), squadPromptType (copy)
		local state = p4:getState()
		local currentSquad = state.Squad and (state.Squad.Squad and state.Squad.Squad.currentSquad)
		local squadId = currentSquad and currentSquad.squadId
		local parentChannelId = currentSquad and currentSquad.parentChannelId
		local var14 = if currentSquad and currentSquad.members then currentSquad.members else {}
		
		if not fFlagEncodeSquadMembersUpdated then
			encodeSquadMembersModule = function(_) --[[ line: 43 ]]
				-- upvalues: cryo (copy), var14 (ref), httpService (copy)
				var18 = cryo.List.map(var14, function(p5) --[[ line: 44 ]]
					return p5.userId
				end)
				local ok, status = pcall(function() --[[ line: 48 ]]
					-- upvalues: httpService (copy), var18 (write)
					return httpService:JSONEncode(var18)
				end)
				
				return if ok then status else "[]"
			end
		end
		local var15 = encodeSquadMembersModule(var14)
		
		if squadId then
			local ok, status = pcall(function() --[[ line: 66 ]]
				-- upvalues: appStorageService (copy), localStorageKey (copy)
				return appStorageService:GetItem(localStorageKey.BrowserTrackerId)
			end)
			local var16 = if ok then status else ""
			
			local function _(p6) --[[ line: 71 | named "updateCurrentExperienceInviteStatus" ]]
				-- upvalues: p4 (ref), roduxSquads (copy)
				p4:dispatch(roduxSquads.Actions.CurrentExperienceInviteStatusUpdated({ isExperienceInvitePending = p6 }))
			end
			
			local function CreateExperienceInvite(p7) --[[ line: 77 ]]
				-- upvalues: var9 (copy), p4 (ref), roduxSquads (copy), squadId (ref), p0 (copy), var16 (ref), fFlagEnableSquadRegroupExperimentation (copy), p2 (copy), squadExperienceInviteSource (copy), fFlagEnablePrivatePartyStartJoin (copy), p3 (copy), squadExperienceInviteType (copy), networkingSquads (copy), p1 (copy), eventNamesModule (copy), parentChannelId (ref), var15 (ref), var14 (ref), httpService (copy), httpModule (copy), squadPromptType (copy)
				if var9 then
					task.cancel(var9)
					var9 = nil
				end
				p4:dispatch(roduxSquads.Actions.CurrentExperienceInviteStatusUpdated({ isExperienceInvitePending = true }))
				local t = {
					membershipEntityId = squadId,
					placeId = p0,
					voteIdentifier = var16
				}
				local var20 = if fFlagEnableSquadRegroupExperimentation then p2 or squadExperienceInviteSource.Default else nil
				
				if var20 then
					t.source = var20
				end
				if fFlagEnablePrivatePartyStartJoin then
					t.inviteType = p3 or squadExperienceInviteType.PlayWithPartyInPublicServer
				end
				return p4:dispatch(networkingSquads.CreateExperienceInvite.API(t)):andThen(function(p9) --[[ line: 105 ]]
					-- upvalues: p1 (copy), eventNamesModule (copy), parentChannelId (copy), p0 (copy), var15 (copy), var14 (copy), var9 (copy), p4 (copy), roduxSquads (copy)
					local experienceInviteId = p9.responseBody.experienceInviteId
					p1.fireSquadAnalytics(eventNamesModule.SquadExperienceInviteApiCall, {
						isSuccess = true,
						parentChannelId = parentChannelId,
						experienceInviteId = experienceInviteId,
						invitationPlaceId = tonumber(p0),
						squadMembers = var15,
						squadMembersCount = #var14
					})
					var9 = task.delay(2, function() --[[ line: 116 ]]
						-- upvalues: p4 (copy), roduxSquads (copy), var9 (copy)
						p4:dispatch(roduxSquads.Actions.CurrentExperienceInviteStatusUpdated({ isExperienceInvitePending = false }))
						var9 = nil
					end)
					
					return experienceInviteId
				end):catch(function(p8) --[[ line: 122 ]]
					-- upvalues: p4 (copy), roduxSquads (copy), httpService (copy), p1 (copy), eventNamesModule (copy), parentChannelId (copy), p0 (copy), var15 (copy), var14 (copy), httpModule (copy), p7 (ref), squadPromptType (copy)
					p4:dispatch(roduxSquads.Actions.CurrentExperienceInviteStatusUpdated({ isExperienceInvitePending = false }))
					local body = p8.Body
					local ok, status = pcall(function() --[[ line: 126 ]]
						-- upvalues: httpService (copy), body (ref)
						return httpService:JSONDecode(body)
					end)
					p1.fireSquadAnalytics(eventNamesModule.SquadExperienceInviteApiCall, {
						isSuccess = false,
						parentChannelId = parentChannelId,
						errorMessage = if ok then status.errorType else nil,
						errorType = if p8.StatusCode then tostring(p8.StatusCode) else nil,
						invitationPlaceId = tonumber(p0),
						squadMembers = var15,
						squadMembersCount = #var14
					})
					
					if p8.StatusCode == httpModule.StatusCodes.CONFLICT then
						p1.setSquadPrompt(p4, {
							onConfirm = function() --[[ line: 144 ]]
								-- upvalues: p7 (copy)
								p7(p7)
							end,
							promptType = squadPromptType.InvitedToExperience
						})
						
						return
					end
					p1.setSquadPrompt(p4, { promptType = squadPromptType.Error })
				end)
			end
			
			return CreateExperienceInvite(CreateExperienceInvite)
		end
		return promiseModule.resolve()
	end
end