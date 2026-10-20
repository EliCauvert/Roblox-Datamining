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
local FFlagEncodeSquadMembersUpdated = require(Parent.SquadsCore.Flags).FFlagEncodeSquadMembersUpdated
local FFlagEnableSquadRegroupExperimentation = DependenciesModule.SharedFlags.FFlagEnableSquadRegroupExperimentation
local FFlagEnablePrivatePartyStartJoin = DependenciesModule.SharedFlags.FFlagEnablePrivatePartyStartJoin
local SquadExperienceInviteType = EnumsModule.SquadExperienceInviteType
local DelayedThread = nil

return function(PlaceId, p1, p2, p3)
	-- upvalues: FFlagEncodeSquadMembersUpdated (copy), EncodeSquadMembersModule (ref), Cryo (copy), HttpService (copy), PromiseModule (copy), AppStorageService (copy), LocalStorageKey (copy), RoduxSquads (copy), DelayedThread (ref), FFlagEnableSquadRegroupExperimentation (copy), SquadExperienceInviteSource (copy), FFlagEnablePrivatePartyStartJoin (copy), SquadExperienceInviteType (copy), NetworkingSquads (copy), EventNamesModule (copy), HttpModule (copy), SquadPromptType (copy)
	return function(p4)
		-- upvalues: FFlagEncodeSquadMembersUpdated (upval), EncodeSquadMembersModule (upval), Cryo (upval), HttpService (upval), PromiseModule (upval), AppStorageService (upval), LocalStorageKey (upval), RoduxSquads (upval), DelayedThread (upval), PlaceId (copy), FFlagEnableSquadRegroupExperimentation (upval), p2 (copy), SquadExperienceInviteSource (upval), FFlagEnablePrivatePartyStartJoin (upval), p3 (copy), SquadExperienceInviteType (upval), NetworkingSquads (upval), p1 (copy), EventNamesModule (upval), HttpModule (upval), SquadPromptType (upval)
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
			
			local function _(IsExperienceInvitePending)
				-- upvalues: p4 (copy), RoduxSquads (upval)
				p4:dispatch(RoduxSquads.Actions.CurrentExperienceInviteStatusUpdated({ isExperienceInvitePending = IsExperienceInvitePending }))
			end
			
			local function CreateExperienceInvite(Callback)
				-- upvalues: DelayedThread (upval), p4 (copy), RoduxSquads (upval), SquadId (copy), PlaceId (upval), Result1 (copy), FFlagEnableSquadRegroupExperimentation (upval), p2 (upval), SquadExperienceInviteSource (upval), FFlagEnablePrivatePartyStartJoin (upval), p3 (upval), SquadExperienceInviteType (upval), NetworkingSquads (upval), p1 (upval), EventNamesModule (upval), ParentChannelId (copy), EncodeSquadMembersModuleResult (copy), Members (copy), HttpService (upval), HttpModule (upval), SquadPromptType (upval)
				if DelayedThread then
					task.cancel(DelayedThread)
					DelayedThread = nil
				end
				p4:dispatch(RoduxSquads.Actions.CurrentExperienceInviteStatusUpdated({ isExperienceInvitePending = true }))
				local config = {
					membershipEntityId = SquadId,
					placeId = PlaceId,
					voteIdentifier = Result1
				}
				local P2 = if FFlagEnableSquadRegroupExperimentation then p2 or SquadExperienceInviteSource.Default else nil
				
				if P2 then
					config.source = P2
				end
				if FFlagEnablePrivatePartyStartJoin then
					config.inviteType = p3 or SquadExperienceInviteType.PlayWithPartyInPublicServer
				end
				return p4:dispatch(NetworkingSquads.CreateExperienceInvite.API(config)):andThen(function(Result)
					-- upvalues: p1 (upval), EventNamesModule (upval), ParentChannelId (upval), PlaceId (upval), EncodeSquadMembersModuleResult (upval), Members (upval), DelayedThread (upval), p4 (upval), RoduxSquads (upval)
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
						-- upvalues: p4 (upval), RoduxSquads (upval), DelayedThread (upval)
						p4:dispatch(RoduxSquads.Actions.CurrentExperienceInviteStatusUpdated({ isExperienceInvitePending = false }))
						DelayedThread = nil
					end)
					
					return ExperienceInviteId
				end):catch(function(Err)
					-- upvalues: p4 (upval), RoduxSquads (upval), HttpService (upval), p1 (upval), EventNamesModule (upval), ParentChannelId (upval), PlaceId (upval), EncodeSquadMembersModuleResult (upval), Members (upval), HttpModule (upval), Callback (copy), SquadPromptType (upval)
					p4:dispatch(RoduxSquads.Actions.CurrentExperienceInviteStatusUpdated({ isExperienceInvitePending = false }))
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
					
					if Err.StatusCode == HttpModule.StatusCodes.CONFLICT then
						p1.setSquadPrompt(p4, {
							onConfirm = function()
								-- upvalues: Callback (upval)
								Callback(Callback)
							end,
							promptType = SquadPromptType.InvitedToExperience
						})
						
						return
					else
						p1.setSquadPrompt(p4, { promptType = SquadPromptType.Error })
					end
				end)
			end
			
			return CreateExperienceInvite(CreateExperienceInvite)
		else
			return PromiseModule.resolve()
		end
	end
end