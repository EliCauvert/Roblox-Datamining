local playersService = game:GetService("Players")
local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local dataHydrationModule = require(parent.DataHydration)
local discoveryAnalyticsModule = require(parent.DiscoveryAnalytics)
local foundationModule = require(parent.Foundation)
local game = dataHydrationModule.Game
local sharedFlagsModule = require(parent.SharedFlags)
local signalsModule = require(parent.Signals)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local getSduiClientPageScope = sduiCoreSystemModule.getSduiClientPageScope
local gameVote = discoveryAnalyticsModule.Events.gameVote
local getSduiPageEntrySnackbarStore = require(parent.SduiSharedUtilities).getSduiPageEntrySnackbarStore
local getFFlagEdpPlayerFeedbackEnabled = sharedFlagsModule.GetFFlagEdpPlayerFeedbackEnabled
local fFlagLuaAppVoteOptimisticUpdateRaceFix = sharedFlagsModule.FFlagLuaAppVoteOptimisticUpdateRaceFix

local function _(p0)
	return if p0 == true then "UpVoted" elseif p0 == false then "DownVoted" else "NotVoted"
end

return function(p1, _, p2, _)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), game (ref), fFlagLuaAppVoteOptimisticUpdateRaceFix (ref), playersService (ref), gameVote (ref), getFFlagEdpPlayerFeedbackEnabled (ref), getSduiClientPageScope (ref), signalsModule (ref), getSduiPageEntrySnackbarStore (ref), foundationModule (ref)
	local var7 = if p1 then p1.actionParams else nil
	
	if var7 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing action params",
			name = sduiActionType.ToggleExperienceVote
		}, p2.appPage)
		
		return
	end
	local universeId = var7.universeId
	local voteDirection = var7.voteDirection
	local placeId = var7.placeId
	
	if universeId == nil or typeof(universeId) ~= "string" or (voteDirection == nil or typeof(voteDirection) ~= "boolean") then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing universeId or voteDirection",
			name = sduiActionType.ToggleExperienceVote
		}, p2.appPage)
		
		return
	end
	local ctx = var7.ctx or ""
	local votesStore = game.getVotesStore(false)
	local var10 = (if fFlagLuaAppVoteOptimisticUpdateRaceFix then votesStore.getUserVote(universeId) else votesStore.getAndFetchUserVote(universeId)).data(false)
	local var11 = if var10 then var10.userVote else nil
	local var12 = if var11 == voteDirection then nil else voteDirection
	local t = {
		uid = tostring(playersService.LocalPlayer and playersService.LocalPlayer.UserId),
		placeId = tostring(placeId)
	}
	local var14 = var12
	t.vote = if var14 == true then "UpVoted" elseif var14 == false then "DownVoted" else "NotVoted"
	t.prevVote = if var11 == true then "UpVoted" elseif var11 == false then "DownVoted" else "NotVoted"
	gameVote(t, ctx)
	
	if getFFlagEdpPlayerFeedbackEnabled() and placeId then
		game.getUserVoteFeedbackMetadataStore(false).clearItem(placeId)
		
		if p2.configKey then
			getSduiClientPageScope(p2.configKey).set("showPlayerFeedback", false)
		end
	end
	local var15 = votesStore.updateUserVote(universeId, var12)
	local t_1 = {}
	t_1.dispose = signalsModule.createEffect(function(p3)
		-- upvalues: var15 (ref), p2 (ref), getSduiPageEntrySnackbarStore (copy), foundationModule (copy), getFFlagEdpPlayerFeedbackEnabled (copy), placeId (ref), game (copy), getSduiClientPageScope (copy), t_1 (ref)
		local var17 = var15(p3)
		
		if var17 == nil then return end
		if var17.type == "error" then
			local configKey = p2.configKey
			
			if configKey then
				local var18 = "Feature.Toast.VoteError.Default"
				local reasonForNotVoteable = var17.reasonForNotVoteable
				
				if reasonForNotVoteable == "PlayGame" then
					var18 = "Feature.Toast.VoteError.PlayGame"
				elseif reasonForNotVoteable == "FloodCheckThresholdMet" then
					var18 = "Feature.Toast.VoteError.FloodCheckThresholdMet"
				elseif reasonForNotVoteable == "AssetNotVoteable" then
					var18 = "Feature.Toast.VoteError.AssetNotVoteable"
				end
				getSduiPageEntrySnackbarStore().show(configKey, {
					title = p2.dependencies.localization:Format(var18),
					icon = foundationModule.Enums.IconName.TriangleExclamation
				})
			end
		elseif var17.type == "success" then
			if getFFlagEdpPlayerFeedbackEnabled() and var17.userVote ~= nil and placeId then
				game.getUserVoteFeedbackMetadataStore(false).getAndFetchUserVoteFeedbackMetadata(placeId)
				
				if p2.configKey then
					getSduiClientPageScope(p2.configKey).set("showPlayerFeedback", true)
				end
			end
		end
		local dispose = t_1.dispose
		
		if dispose then
			dispose()
			t_1.dispose = nil
		end
	end)
end