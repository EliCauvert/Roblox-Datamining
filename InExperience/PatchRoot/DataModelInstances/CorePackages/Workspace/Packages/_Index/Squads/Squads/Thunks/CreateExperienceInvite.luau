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

local function _(p1)
	local var1 = tonumber(if type(p1) == "table" then p1.retryAfterSeconds else nil)
	
	return if var1 and var1 > 0 then var1 else nil
end

local var1 = nil

return function(p1, p2, p3, p4)
	-- upvalues: fFlagEncodeSquadMembersUpdated (ref), encodeSquadMembersModule (write), cryo (ref), httpService (ref), promiseModule (ref), appStorageService (ref), localStorageKey (ref), fFlagUseSignalsForSquadExperienceInviteStatus (ref), getSquadExperienceInviteStore (ref), roduxSquads (ref), var1 (write), fFlagEnableSquadRegroupExperimentation (ref), luckyRecommendationExperimentation (ref), squadExperienceInviteSource (ref), fFlagEnablePrivatePartyStartJoin (ref), squadExperienceInviteType (ref), networkingSquads (ref), eventNamesModule (ref), httpModule (ref), fFlagSquadExperienceInviteRetryAfter (ref), getExperienceInviteRetryAfterStore (ref), squadPromptType (ref)
	return function(p5)
		-- upvalues: fFlagEncodeSquadMembersUpdated (copy), encodeSquadMembersModule (copy), cryo (copy), httpService (copy), promiseModule (copy), appStorageService (copy), localStorageKey (copy), fFlagUseSignalsForSquadExperienceInviteStatus (copy), getSquadExperienceInviteStore (copy), roduxSquads (copy), var1 (copy), p1 (ref), fFlagEnableSquadRegroupExperimentation (copy), luckyRecommendationExperimentation (copy), p3 (ref), squadExperienceInviteSource (copy), fFlagEnablePrivatePartyStartJoin (copy), p4 (ref), squadExperienceInviteType (copy), networkingSquads (copy), p2 (ref), eventNamesModule (copy), httpModule (copy), fFlagSquadExperienceInviteRetryAfter (copy), getExperienceInviteRetryAfterStore (copy), squadPromptType (copy)
		local state = p5:getState()
		local currentSquad = state.Squad and (state.Squad.Squad and state.Squad.Squad.currentSquad)
		local squadId = currentSquad and currentSquad.squadId
		local parentChannelId = currentSquad and currentSquad.parentChannelId
		local var2 = if currentSquad and currentSquad.members then currentSquad.members else {}
		
		if not fFlagEncodeSquadMembersUpdated then
			encodeSquadMembersModule = function(_)
				-- upvalues: cryo (copy), var2 (ref), httpService (copy)
				var20 = cryo.List.map(var2, function(p6)
					return p6.userId
				end)
				local ok, status = pcall(function()
					-- upvalues: httpService (copy), var20 (write)
					return httpService:JSONEncode(var20)
				end)
				
				return if ok then status else "[]"
			end
		end
		local var3 = encodeSquadMembersModule(var2)
		
		if squadId then
			local ok, status = pcall(function()
				-- upvalues: appStorageService (copy), localStorageKey (copy)
				return appStorageService:GetItem(localStorageKey.BrowserTrackerId)
			end)
			local var4 = if ok then status else ""
			
			local function updateCurrentExperienceInviteStatus(p6)
				-- upvalues: fFlagUseSignalsForSquadExperienceInviteStatus (copy), getSquadExperienceInviteStore (copy), p5 (ref), roduxSquads (copy)
				if fFlagUseSignalsForSquadExperienceInviteStatus then
					getSquadExperienceInviteStore(false).currentExperienceInviteStatusUpdated(p6)
					
					return
				end
				p5:dispatch(roduxSquads.Actions.CurrentExperienceInviteStatusUpdated({ isExperienceInvitePending = p6 }))
			end
			
			local function CreateExperienceInvite(p6)
				-- upvalues: var1 (copy), updateCurrentExperienceInviteStatus (ref), squadId (ref), p1 (copy), var4 (ref), fFlagEnableSquadRegroupExperimentation (copy), luckyRecommendationExperimentation (copy), p3 (copy), squadExperienceInviteSource (copy), fFlagEnablePrivatePartyStartJoin (copy), p4 (copy), squadExperienceInviteType (copy), p5 (ref), networkingSquads (copy), p2 (copy), eventNamesModule (copy), parentChannelId (ref), var3 (ref), var2 (ref), httpService (copy), httpModule (copy), fFlagSquadExperienceInviteRetryAfter (copy), getExperienceInviteRetryAfterStore (copy), squadPromptType (copy)
				if var1 then
					task.cancel(var1)
					var1 = nil
				end
				updateCurrentExperienceInviteStatus(true)
				local t = {
					membershipEntityId = squadId,
					placeId = p1,
					voteIdentifier = var4
				}
				local var5 = if fFlagEnableSquadRegroupExperimentation or luckyRecommendationExperimentation.getLuckyRecommendationEnabled() then p3 or squadExperienceInviteSource.Default else nil
				
				if var5 then
					t.source = var5
				end
				if fFlagEnablePrivatePartyStartJoin then
					t.inviteType = p4 or squadExperienceInviteType.PlayWithPartyInPublicServer
				end
				return p5:dispatch(networkingSquads.CreateExperienceInvite.API(t)):andThen(function(p7)
					-- upvalues: p2 (copy), eventNamesModule (copy), parentChannelId (copy), p1 (copy), var3 (copy), var2 (copy), var1 (copy), updateCurrentExperienceInviteStatus (copy)
					local experienceInviteId = p7.responseBody.experienceInviteId
					p2.fireSquadAnalytics(eventNamesModule.SquadExperienceInviteApiCall, {
						isSuccess = true,
						parentChannelId = parentChannelId,
						experienceInviteId = experienceInviteId,
						invitationPlaceId = tonumber(p1),
						squadMembers = var3,
						squadMembersCount = #var2
					})
					var1 = task.delay(2, function()
						-- upvalues: updateCurrentExperienceInviteStatus (copy), var1 (copy)
						updateCurrentExperienceInviteStatus(false)
						var1 = nil
					end)
					
					return experienceInviteId
				end):catch(function(p7)
					-- upvalues: updateCurrentExperienceInviteStatus (copy), httpService (copy), p2 (copy), eventNamesModule (copy), parentChannelId (copy), p1 (copy), var3 (copy), var2 (copy), httpModule (copy), fFlagSquadExperienceInviteRetryAfter (copy), getExperienceInviteRetryAfterStore (copy), squadId (copy), p5 (copy), p6 (ref), squadPromptType (copy)
					local var6
					updateCurrentExperienceInviteStatus(false)
					local body = p7.Body
					local ok, status = pcall(function()
						-- upvalues: httpService (copy), body (ref)
						return httpService:JSONDecode(body)
					end)
					p2.fireSquadAnalytics(eventNamesModule.SquadExperienceInviteApiCall, {
						isSuccess = false,
						parentChannelId = parentChannelId,
						errorMessage = if ok then status.errorType else nil,
						errorType = if p7.StatusCode then tostring(p7.StatusCode) else nil,
						invitationPlaceId = tonumber(p1),
						squadMembers = var3,
						squadMembersCount = #var2
					})
					
					if p7.StatusCode ~= httpModule.StatusCodes.CONFLICT then
						p2.setSquadPrompt(p5, { promptType = squadPromptType.Error })
						
						return
					elseif fFlagSquadExperienceInviteRetryAfter and ok then
						local var7 = tonumber(if type(status) == "table" then status.retryAfterSeconds else nil)
						var6 = if var7 and var7 > 0 then var7 else nil
					else
						var6 = nil
					end
					if var6 then
						getExperienceInviteRetryAfterStore(false).block(squadId, var6)
						
						return
					end
					p2.setSquadPrompt(p5, {
						onConfirm = function()
							-- upvalues: p6 (copy)
							p6(p6)
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