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
local getSquadExperienceInviteStore = require(parent.SquadsCore.Stores).GetSquadExperienceInviteStore
local fFlagEncodeSquadMembersUpdated = require(parent.SquadsCore.Flags).FFlagEncodeSquadMembersUpdated
local fFlagEnableSquadRegroupExperimentation = dependenciesModule.SharedFlags.FFlagEnableSquadRegroupExperimentation
local fFlagUseSignalsForSquadExperienceInviteStatus = dependenciesModule.SharedFlags.FFlagUseSignalsForSquadExperienceInviteStatus
local luckyRecommendationExperimentation = dependenciesModule.SocialExperiments.LuckyRecommendationExperimentation
local fFlagEnablePrivatePartyStartJoin = dependenciesModule.SharedFlags.FFlagEnablePrivatePartyStartJoin
local squadExperienceInviteType = enumsModule.SquadExperienceInviteType
local fFlagSquadExperienceInviteRetryAfter = require(parent.SquadsCore.Flags).FFlagSquadExperienceInviteRetryAfter
local getExperienceInviteRetryAfterStore = require(parent.SquadsCore.Stores).GetExperienceInviteRetryAfterStore

local function _(p0) --[[ line: 41 | named "getRetryAfterSeconds" ]]
	local var10 = tonumber(if type(p0) == "table" then p0.retryAfter else nil)
	
	return if var10 and var10 > 0 then var10 else nil
end

local var9 = nil

return function(p1, p2, p3, p4) --[[ line: 53 ]]
	-- upvalues: fFlagEncodeSquadMembersUpdated (ref), encodeSquadMembersModule (write), cryo (ref), httpService (ref), promiseModule (ref), appStorageService (ref), localStorageKey (ref), fFlagUseSignalsForSquadExperienceInviteStatus (ref), getSquadExperienceInviteStore (ref), roduxSquads (ref), var9 (write), fFlagEnableSquadRegroupExperimentation (ref), luckyRecommendationExperimentation (ref), squadExperienceInviteSource (ref), fFlagEnablePrivatePartyStartJoin (ref), squadExperienceInviteType (ref), networkingSquads (ref), eventNamesModule (ref), httpModule (ref), fFlagSquadExperienceInviteRetryAfter (ref), getExperienceInviteRetryAfterStore (ref), squadPromptType (ref)
	return function(p5) --[[ line: 54 ]]
		-- upvalues: fFlagEncodeSquadMembersUpdated (copy), encodeSquadMembersModule (copy), cryo (copy), httpService (copy), promiseModule (copy), appStorageService (copy), localStorageKey (copy), fFlagUseSignalsForSquadExperienceInviteStatus (copy), getSquadExperienceInviteStore (copy), roduxSquads (copy), var9 (copy), p1 (ref), fFlagEnableSquadRegroupExperimentation (copy), luckyRecommendationExperimentation (copy), p3 (ref), squadExperienceInviteSource (copy), fFlagEnablePrivatePartyStartJoin (copy), p4 (ref), squadExperienceInviteType (copy), networkingSquads (copy), p2 (ref), eventNamesModule (copy), httpModule (copy), fFlagSquadExperienceInviteRetryAfter (copy), getExperienceInviteRetryAfterStore (copy), squadPromptType (copy)
		local state = p5:getState()
		local currentSquad = state.Squad and (state.Squad.Squad and state.Squad.Squad.currentSquad)
		local squadId = currentSquad and currentSquad.squadId
		local parentChannelId = currentSquad and currentSquad.parentChannelId
		local var15 = if currentSquad and currentSquad.members then currentSquad.members else {}
		
		if not fFlagEncodeSquadMembersUpdated then
			encodeSquadMembersModule = function(_) --[[ line: 64 ]]
				-- upvalues: cryo (copy), var15 (ref), httpService (copy)
				var20 = cryo.List.map(var15, function(p6) --[[ line: 65 ]]
					return p6.userId
				end)
				local ok, status = pcall(function() --[[ line: 69 ]]
					-- upvalues: httpService (copy), var20 (write)
					return httpService:JSONEncode(var20)
				end)
				
				return if ok then status else "[]"
			end
		end
		local var16 = encodeSquadMembersModule(var15)
		
		if squadId then
			local ok, status = pcall(function() --[[ line: 87 ]]
				-- upvalues: appStorageService (copy), localStorageKey (copy)
				return appStorageService:GetItem(localStorageKey.BrowserTrackerId)
			end)
			local var17 = if ok then status else ""
			
			local function updateCurrentExperienceInviteStatus(p7) --[[ line: 92 ]]
				-- upvalues: fFlagUseSignalsForSquadExperienceInviteStatus (copy), getSquadExperienceInviteStore (copy), p5 (ref), roduxSquads (copy)
				if fFlagUseSignalsForSquadExperienceInviteStatus then
					getSquadExperienceInviteStore(false).currentExperienceInviteStatusUpdated(p7)
					
					return
				end
				p5:dispatch(roduxSquads.Actions.CurrentExperienceInviteStatusUpdated({ isExperienceInvitePending = p7 }))
			end
			
			local function CreateExperienceInvite(p8) --[[ line: 102 ]]
				-- upvalues: var9 (copy), updateCurrentExperienceInviteStatus (ref), squadId (ref), p1 (copy), var17 (ref), fFlagEnableSquadRegroupExperimentation (copy), luckyRecommendationExperimentation (copy), p3 (copy), squadExperienceInviteSource (copy), fFlagEnablePrivatePartyStartJoin (copy), p4 (copy), squadExperienceInviteType (copy), p5 (ref), networkingSquads (copy), p2 (copy), eventNamesModule (copy), parentChannelId (ref), var16 (ref), var15 (ref), httpService (copy), httpModule (copy), fFlagSquadExperienceInviteRetryAfter (copy), getExperienceInviteRetryAfterStore (copy), squadPromptType (copy)
				if var9 then
					task.cancel(var9)
					var9 = nil
				end
				updateCurrentExperienceInviteStatus(true)
				local t = {
					membershipEntityId = squadId,
					placeId = p1,
					voteIdentifier = var17
				}
				local var22 = if fFlagEnableSquadRegroupExperimentation or luckyRecommendationExperimentation.getLuckyRecommendationEnabled() then p3 or squadExperienceInviteSource.Default else nil
				
				if var22 then
					t.source = var22
				end
				if fFlagEnablePrivatePartyStartJoin then
					t.inviteType = p4 or squadExperienceInviteType.PlayWithPartyInPublicServer
				end
				return p5:dispatch(networkingSquads.CreateExperienceInvite.API(t)):andThen(function(p10) --[[ line: 131 ]]
					-- upvalues: p2 (copy), eventNamesModule (copy), parentChannelId (copy), p1 (copy), var16 (copy), var15 (copy), var9 (copy), updateCurrentExperienceInviteStatus (copy)
					local experienceInviteId = p10.responseBody.experienceInviteId
					p2.fireSquadAnalytics(eventNamesModule.SquadExperienceInviteApiCall, {
						isSuccess = true,
						parentChannelId = parentChannelId,
						experienceInviteId = experienceInviteId,
						invitationPlaceId = tonumber(p1),
						squadMembers = var16,
						squadMembersCount = #var15
					})
					var9 = task.delay(2, function() --[[ line: 142 ]]
						-- upvalues: updateCurrentExperienceInviteStatus (copy), var9 (copy)
						updateCurrentExperienceInviteStatus(false)
						var9 = nil
					end)
					
					return experienceInviteId
				end):catch(function(p9) --[[ line: 148 ]]
					-- upvalues: updateCurrentExperienceInviteStatus (copy), httpService (copy), p2 (copy), eventNamesModule (copy), parentChannelId (copy), p1 (copy), var16 (copy), var15 (copy), httpModule (copy), fFlagSquadExperienceInviteRetryAfter (copy), getExperienceInviteRetryAfterStore (copy), squadId (copy), p5 (copy), p8 (ref), squadPromptType (copy)
					local var23
					updateCurrentExperienceInviteStatus(false)
					local body = p9.Body
					local ok, status = pcall(function() --[[ line: 152 ]]
						-- upvalues: httpService (copy), body (ref)
						return httpService:JSONDecode(body)
					end)
					p2.fireSquadAnalytics(eventNamesModule.SquadExperienceInviteApiCall, {
						isSuccess = false,
						parentChannelId = parentChannelId,
						errorMessage = if ok then status.errorType else nil,
						errorType = if p9.StatusCode then tostring(p9.StatusCode) else nil,
						invitationPlaceId = tonumber(p1),
						squadMembers = var16,
						squadMembersCount = #var15
					})
					
					if p9.StatusCode ~= httpModule.StatusCodes.CONFLICT then
						p2.setSquadPrompt(p5, { promptType = squadPromptType.Error })
						
						return
					elseif fFlagSquadExperienceInviteRetryAfter and ok then
						local var24 = tonumber(if type(status) == "table" then status.retryAfter else nil)
						var23 = if var24 and var24 > 0 then var24 else nil
					else
						var23 = nil
					end
					if var23 then
						getExperienceInviteRetryAfterStore(false).block(squadId, var23)
						
						return
					end
					p2.setSquadPrompt(p5, {
						onConfirm = function() --[[ line: 181 ]]
							-- upvalues: p8 (copy)
							p8(p8)
						end,
						promptType = squadPromptType.InvitedToExperience
					})
				end)
			end
			
			return CreateExperienceInvite(CreateExperienceInvite)
		end
		return promiseModule.resolve()
	end
end