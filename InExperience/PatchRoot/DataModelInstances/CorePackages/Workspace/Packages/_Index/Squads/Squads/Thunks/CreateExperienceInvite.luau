local Squads = script:FindFirstAncestor("Squads")
local Parent = Squads.Parent
local HttpModule = require(Parent.Http)
local LocalStorageKey = require(Parent.LocalStorage).Enums.LocalStorageKey
local PromiseModule = require(Parent.Promise)
local AppStorageService = game:GetService("AppStorageService")
local HttpService = game:GetService("HttpService")
local EnumsModule = require(Parent.SquadsCore.Enums)
local _ = require(Parent.SquadsCore.Types)
local DependenciesModule = require(Squads.dependencies)
local Cryo = DependenciesModule.Cryo
local NetworkingSquads = DependenciesModule.NetworkingSquads
local RoduxSquads = DependenciesModule.RoduxSquads
local SquadExperienceInviteSource = EnumsModule.SquadExperienceInviteSource
local EventNamesModule = require(Parent.SquadsCore.EventNames)
local SquadPromptType = EnumsModule.SquadPromptType
local EncodeSquadMembersModule = require(Parent.SquadsCore.encodeSquadMembers)
local GetSquadExperienceInviteStoreFunction = require(Parent.SquadsCore.Stores).GetSquadExperienceInviteStore
local FFlagEncodeSquadMembersUpdated = require(Parent.SquadsCore.Flags).FFlagEncodeSquadMembersUpdated
local FFlagEnableSquadRegroupExperimentation = DependenciesModule.SharedFlags.FFlagEnableSquadRegroupExperimentation
local FFlagUseSignalsForSquadExperienceInviteStatus = DependenciesModule.SharedFlags.FFlagUseSignalsForSquadExperienceInviteStatus
local LuckyRecommendationExperimentation = DependenciesModule.SocialExperiments.LuckyRecommendationExperimentation
local FFlagEnablePrivatePartyStartJoin = DependenciesModule.SharedFlags.FFlagEnablePrivatePartyStartJoin
local SquadExperienceInviteType = EnumsModule.SquadExperienceInviteType
local GetExperienceInviteRetryAfterStoreFunction = require(Parent.SquadsCore.Stores).GetExperienceInviteRetryAfterStore

local function _(p1)
	local Number: number? = tonumber(if type(p1) == "table" then p1.retryAfterSeconds else nil)
	
	return if Number and Number > 0 then Number else nil
end

local DelayedThread = nil

return function(PlaceId, p1, p2, p3)
	-- upvalues: FFlagEncodeSquadMembersUpdated (copy), EncodeSquadMembersModule (ref), Cryo (copy), HttpService (copy), PromiseModule (copy), AppStorageService (copy), LocalStorageKey (copy), FFlagUseSignalsForSquadExperienceInviteStatus (copy), GetSquadExperienceInviteStoreFunction (copy), RoduxSquads (copy), DelayedThread (ref), FFlagEnableSquadRegroupExperimentation (copy), LuckyRecommendationExperimentation (copy), SquadExperienceInviteSource (copy), FFlagEnablePrivatePartyStartJoin (copy), SquadExperienceInviteType (copy), NetworkingSquads (copy), EventNamesModule (copy), HttpModule (copy), GetExperienceInviteRetryAfterStoreFunction (copy), SquadPromptType (copy)
	return function(p4)
		-- upvalues: FFlagEncodeSquadMembersUpdated (upval), EncodeSquadMembersModule (upval), Cryo (upval), HttpService (upval), PromiseModule (upval), AppStorageService (upval), LocalStorageKey (upval), FFlagUseSignalsForSquadExperienceInviteStatus (upval), GetSquadExperienceInviteStoreFunction (upval), RoduxSquads (upval), DelayedThread (upval), PlaceId (copy), FFlagEnableSquadRegroupExperimentation (upval), LuckyRecommendationExperimentation (upval), p2 (copy), SquadExperienceInviteSource (upval), FFlagEnablePrivatePartyStartJoin (upval), p3 (copy), SquadExperienceInviteType (upval), NetworkingSquads (upval), p1 (copy), EventNamesModule (upval), HttpModule (upval), GetExperienceInviteRetryAfterStoreFunction (upval), SquadPromptType (upval)
		local State = p4:getState()
		local CurrentSquad = State.Squad and (State.Squad.Squad and State.Squad.Squad.currentSquad)
		local SquadId = CurrentSquad and CurrentSquad.squadId
		local ParentChannelId = CurrentSquad and CurrentSquad.parentChannelId
		local Members = if CurrentSquad and CurrentSquad.members then CurrentSquad.members else {}
		
		if not FFlagEncodeSquadMembersUpdated then
			EncodeSquadMembersModule = function(_)
				-- upvalues: Cryo (upval), Members (copy), HttpService (upval)
				local MapResult = Cryo.List.map(Members, function(p5)
					return p5.userId
				end)
				local Success, Result = pcall(function()
					-- upvalues: HttpService (upval), MapResult (ref)
					return HttpService:JSONEncode(MapResult)
				end)
				
				return if Success then Result else "[]"
			end
		end
		local EncodeSquadMembersModuleResult = EncodeSquadMembersModule(Members)
		
		if SquadId then
			local Success, Result = pcall(function()
				-- upvalues: AppStorageService (upval), LocalStorageKey (upval)
				return AppStorageService:GetItem(LocalStorageKey.BrowserTrackerId)
			end)
			local Result1 = if Success then Result else ""
			
			local function updateCurrentExperienceInviteStatus(IsExperienceInvitePending)
				-- upvalues: FFlagUseSignalsForSquadExperienceInviteStatus (upval), GetSquadExperienceInviteStoreFunction (upval), p4 (copy), RoduxSquads (upval)
				if FFlagUseSignalsForSquadExperienceInviteStatus then
					GetSquadExperienceInviteStoreFunction(false).currentExperienceInviteStatusUpdated(IsExperienceInvitePending)
					
					return
				else
					p4:dispatch(RoduxSquads.Actions.CurrentExperienceInviteStatusUpdated({ isExperienceInvitePending = IsExperienceInvitePending }))
				end
			end
			
			local function CreateExperienceInvite(Callback)
				-- upvalues: DelayedThread (upval), updateCurrentExperienceInviteStatus (copy), SquadId (copy), PlaceId (upval), Result1 (copy), FFlagEnableSquadRegroupExperimentation (upval), LuckyRecommendationExperimentation (upval), p2 (upval), SquadExperienceInviteSource (upval), FFlagEnablePrivatePartyStartJoin (upval), p3 (upval), SquadExperienceInviteType (upval), p4 (copy), NetworkingSquads (upval), p1 (upval), EventNamesModule (upval), ParentChannelId (copy), EncodeSquadMembersModuleResult (copy), Members (copy), HttpService (upval), HttpModule (upval), GetExperienceInviteRetryAfterStoreFunction (upval), SquadPromptType (upval)
				if DelayedThread then
					task.cancel(DelayedThread)
					DelayedThread = nil
				end
				updateCurrentExperienceInviteStatus(true)
				local config = {
					membershipEntityId = SquadId,
					placeId = PlaceId,
					voteIdentifier = Result1
				}
				local P3 = if FFlagEnableSquadRegroupExperimentation or LuckyRecommendationExperimentation.getLuckyRecommendationEnabled() then p2 or SquadExperienceInviteSource.Default else nil
				
				if P3 then
					config.source = P3
				end
				if FFlagEnablePrivatePartyStartJoin then
					config.inviteType = p3 or SquadExperienceInviteType.PlayWithPartyInPublicServer
				end
				return p4:dispatch(NetworkingSquads.CreateExperienceInvite.API(config)):andThen(function(Result)
					-- upvalues: p1 (upval), EventNamesModule (upval), ParentChannelId (upval), PlaceId (upval), EncodeSquadMembersModuleResult (upval), Members (upval), DelayedThread (upval), updateCurrentExperienceInviteStatus (upval)
					local ExperienceInviteId = Result.responseBody.experienceInviteId
					p1.fireSquadAnalytics(EventNamesModule.SquadExperienceInviteApiCall, {
						isSuccess = true,
						parentChannelId = ParentChannelId,
						experienceInviteId = ExperienceInviteId,
						invitationPlaceId = tonumber(PlaceId),
						squadMembers = EncodeSquadMembersModuleResult,
						squadMembersCount = #Members
					})
					DelayedThread = task.delay(2, function()
						-- upvalues: updateCurrentExperienceInviteStatus (upval), DelayedThread (upval)
						updateCurrentExperienceInviteStatus(false)
						DelayedThread = nil
					end)
					
					return ExperienceInviteId
				end):catch(function(Err)
					-- upvalues: updateCurrentExperienceInviteStatus (upval), HttpService (upval), p1 (upval), EventNamesModule (upval), ParentChannelId (upval), PlaceId (upval), EncodeSquadMembersModuleResult (upval), Members (upval), HttpModule (upval), GetExperienceInviteRetryAfterStoreFunction (upval), SquadId (upval), p4 (upval), Callback (copy), SquadPromptType (upval)
					updateCurrentExperienceInviteStatus(false)
					local Body = Err.Body
					local Success, Result = pcall(function()
						-- upvalues: HttpService (upval), Body (copy)
						return HttpService:JSONDecode(Body)
					end)
					p1.fireSquadAnalytics(EventNamesModule.SquadExperienceInviteApiCall, {
						isSuccess = false,
						parentChannelId = ParentChannelId,
						errorMessage = if Success then Result.errorType else nil,
						errorType = if Err.StatusCode then tostring(Err.StatusCode) else nil,
						invitationPlaceId = tonumber(PlaceId),
						squadMembers = EncodeSquadMembersModuleResult,
						squadMembersCount = #Members
					})
					
					if Err.StatusCode ~= HttpModule.StatusCodes.CONFLICT then
						p1.setSquadPrompt(p4, { promptType = SquadPromptType.Error })
						
						return
					end
					local Number1 = nil
					if Success then
						local Number: number? = tonumber(if type(Result) == "table" then Result.retryAfterSeconds else nil)
						Number1 = if Number and Number > 0 then Number else nil
					else
						Number1 = nil
					end
					if Number1 then
						GetExperienceInviteRetryAfterStoreFunction(false).block(SquadId, Number1)
						
						return
					else
						p1.setSquadPrompt(p4, {
							onConfirm = function()
								-- upvalues: Callback (upval)
								Callback(Callback)
							end,
							promptType = SquadPromptType.InvitedToExperience
						})
					end
				end)
			end
			
			return CreateExperienceInvite(CreateExperienceInvite)
		else
			return PromiseModule.resolve()
		end
	end
end