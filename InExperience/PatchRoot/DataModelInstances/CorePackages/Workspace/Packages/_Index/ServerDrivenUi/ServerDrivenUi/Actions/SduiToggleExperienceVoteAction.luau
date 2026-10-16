local Players = game:GetService("Players")
local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local FoundationModule = require(Parent.Foundation)
local Game1 = require(Parent.DataHydration).Game
local SharedFlagsModule = require(Parent.SharedFlags)
local SignalsModule = require(Parent.Signals)
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local GetSduiClientPageScopeFunction = SduiCoreSystemModule.getSduiClientPageScope
local GameVoteFunction = require(Parent.DiscoveryAnalytics).Events.gameVote
local GetSduiPageEntrySnackbarStoreFunction = require(Parent.SduiSharedUtilities).getSduiPageEntrySnackbarStore
local GetFFlagEdpPlayerFeedbackEnabledFunction = SharedFlagsModule.GetFFlagEdpPlayerFeedbackEnabled
local FFlagLuaAppAddUniverseIdToEngagementEvents = SharedFlagsModule.FFlagLuaAppAddUniverseIdToEngagementEvents

local function _(Enabled): string --[[ Line: 28 | Named "convertBooleanToVoteForAnalytics" ]]
	return if Enabled == true then "UpVoted" elseif Enabled == false then "DownVoted" else "NotVoted"
end

return function(p1, _, p2, _) --[[ Line: 38 | Named "SduiToggleExperienceVoteAction" ]]
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), Game1 (copy), Players (copy), GameVoteFunction (copy), FFlagLuaAppAddUniverseIdToEngagementEvents (copy), GetFFlagEdpPlayerFeedbackEnabledFunction (copy), GetSduiClientPageScopeFunction (copy), SignalsModule (copy), GetSduiPageEntrySnackbarStoreFunction (copy), FoundationModule (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing action params",
			name = SduiActionType.ToggleExperienceVote
		}, p2.appPage)
		
		return
	end
	local UniverseId = ActionParams.universeId
	local VoteDirection = ActionParams.voteDirection
	local PlaceId = ActionParams.placeId
	
	if UniverseId == nil or typeof(UniverseId) ~= "string" or VoteDirection == nil or typeof(VoteDirection) ~= "boolean" then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing universeId or voteDirection",
			name = SduiActionType.ToggleExperienceVote
		}, p2.appPage)
		
		return
	end
	local VotesStore = Game1.getVotesStore(false)
	local DataResult = VotesStore.getUserVote(UniverseId).data(false)
	local UserVote = if DataResult then DataResult.userVote else nil
	local VoteDirection1 = if UserVote == VoteDirection then nil else VoteDirection
	GameVoteFunction({
		uid = tostring(Players.LocalPlayer and Players.LocalPlayer.UserId),
		placeId = tostring(PlaceId),
		vote = if VoteDirection1 == true then "UpVoted" elseif VoteDirection1 == false then "DownVoted" else "NotVoted",
		prevVote = if UserVote == true then "UpVoted" elseif UserVote == false then "DownVoted" else "NotVoted",
		universeId = if FFlagLuaAppAddUniverseIdToEngagementEvents then UniverseId else nil
	}, ActionParams.ctx or "")
	
	if GetFFlagEdpPlayerFeedbackEnabledFunction() and PlaceId then
		Game1.getUserVoteFeedbackMetadataStore(false).clearItem(PlaceId)
		
		if p2.configKey then
			GetSduiClientPageScopeFunction(p2.configKey).set("showPlayerFeedback", false)
		end
	end
	local UpdateUserVoteResult = VotesStore.updateUserVote(UniverseId, VoteDirection1)
	local t = {}
	t.dispose = SignalsModule.createEffect(function(p3) --[[ Line: 106 ]]
		-- upvalues: UpdateUserVoteResult (copy), p2 (copy), GetSduiPageEntrySnackbarStoreFunction (upval), FoundationModule (upval), GetFFlagEdpPlayerFeedbackEnabledFunction (upval), PlaceId (copy), Game1 (upval), GetSduiClientPageScopeFunction (upval), t (copy)
		local UpdateUserVoteResultResult = UpdateUserVoteResult(p3)
		
		if UpdateUserVoteResultResult == nil then return end
		if UpdateUserVoteResultResult.type == "error" then
			local ConfigKey = p2.configKey
			
			if ConfigKey then
				local v1 = "Feature.Toast.VoteError.Default"
				local ReasonForNotVoteable = UpdateUserVoteResultResult.reasonForNotVoteable
				
				if ReasonForNotVoteable == "PlayGame" then
					v1 = "Feature.Toast.VoteError.PlayGame"
				elseif ReasonForNotVoteable == "FloodCheckThresholdMet" then
					v1 = "Feature.Toast.VoteError.FloodCheckThresholdMet"
				elseif ReasonForNotVoteable == "AssetNotVoteable" then
					v1 = "Feature.Toast.VoteError.AssetNotVoteable"
				end
				GetSduiPageEntrySnackbarStoreFunction().show(ConfigKey, {
					title = p2.dependencies.localization:Format(v1),
					icon = FoundationModule.Enums.IconName.TriangleExclamation
				})
			end
		elseif UpdateUserVoteResultResult.type == "success" then
			local UserVote = UpdateUserVoteResultResult.userVote
			
			if GetFFlagEdpPlayerFeedbackEnabledFunction() and UserVote ~= nil and PlaceId then
				Game1.getUserVoteFeedbackMetadataStore(false).getAndFetchUserVoteFeedbackMetadata(PlaceId)
				
				if p2.configKey then
					GetSduiClientPageScopeFunction(p2.configKey).set("showPlayerFeedback", true)
				end
			end
		end
		local DisposeFunction: () -> () = t.dispose
		
		if DisposeFunction then
			DisposeFunction()
			t.dispose = nil
		end
	end)
end