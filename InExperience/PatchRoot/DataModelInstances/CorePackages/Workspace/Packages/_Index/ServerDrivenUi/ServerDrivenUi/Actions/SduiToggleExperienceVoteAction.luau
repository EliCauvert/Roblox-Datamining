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
local fFlagLuaAppAddUniverseIdToEngagementEvents = sharedFlagsModule.FFlagLuaAppAddUniverseIdToEngagementEvents

local function _(p1)
	return if p1 == true then "UpVoted" elseif p1 == false then "DownVoted" else "NotVoted"
end

return function(p1, _, p2, _)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), game (ref), playersService (ref), gameVote (ref), fFlagLuaAppAddUniverseIdToEngagementEvents (ref), getFFlagEdpPlayerFeedbackEnabled (ref), getSduiClientPageScope (ref), signalsModule (ref), getSduiPageEntrySnackbarStore (ref), foundationModule (ref)
	local var1 = if p1 then p1.actionParams else nil
	
	if var1 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing action params",
			name = sduiActionType.ToggleExperienceVote
		}, p2.appPage)
		
		return
	end
	local universeId = var1.universeId
	local voteDirection = var1.voteDirection
	local placeId = var1.placeId
	
	if universeId == nil or typeof(universeId) ~= "string" or (voteDirection == nil or typeof(voteDirection) ~= "boolean") then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing universeId or voteDirection",
			name = sduiActionType.ToggleExperienceVote
		}, p2.appPage)
		
		return
	end
	local ctx = var1.ctx or ""
	local votesStore = game.getVotesStore(false)
	local var2 = votesStore.getUserVote(universeId).data(false)
	local var3 = if var2 then var2.userVote else nil
	local var4 = if var3 == voteDirection then nil else voteDirection
	gameVote({
		uid = tostring(playersService.LocalPlayer and playersService.LocalPlayer.UserId),
		placeId = tostring(placeId),
		vote = if var4 == true then "UpVoted" elseif var4 == false then "DownVoted" else "NotVoted",
		prevVote = if var3 == true then "UpVoted" elseif var3 == false then "DownVoted" else "NotVoted",
		universeId = if fFlagLuaAppAddUniverseIdToEngagementEvents then universeId else nil
	}, ctx)
	
	if getFFlagEdpPlayerFeedbackEnabled() and placeId then
		game.getUserVoteFeedbackMetadataStore(false).clearItem(placeId)
		
		if p2.configKey then
			getSduiClientPageScope(p2.configKey).set("showPlayerFeedback", false)
		end
	end
	local var5 = votesStore.updateUserVote(universeId, var4)
	local t = {}
	t.dispose = signalsModule.createEffect(function(p3)
		-- upvalues: var5 (ref), p2 (ref), getSduiPageEntrySnackbarStore (copy), foundationModule (copy), getFFlagEdpPlayerFeedbackEnabled (copy), placeId (ref), game (copy), getSduiClientPageScope (copy), t (ref)
		local var6 = var5(p3)
		
		if var6 == nil then return end
		if var6.type == "error" then
			local configKey = p2.configKey
			
			if configKey then
				local var7 = "Feature.Toast.VoteError.Default"
				local reasonForNotVoteable = var6.reasonForNotVoteable
				
				if reasonForNotVoteable == "PlayGame" then
					var7 = "Feature.Toast.VoteError.PlayGame"
				elseif reasonForNotVoteable == "FloodCheckThresholdMet" then
					var7 = "Feature.Toast.VoteError.FloodCheckThresholdMet"
				elseif reasonForNotVoteable == "AssetNotVoteable" then
					var7 = "Feature.Toast.VoteError.AssetNotVoteable"
				end
				getSduiPageEntrySnackbarStore().show(configKey, {
					title = p2.dependencies.localization:Format(var7),
					icon = foundationModule.Enums.IconName.TriangleExclamation
				})
			end
		elseif var6.type == "success" then
			if getFFlagEdpPlayerFeedbackEnabled() and var6.userVote ~= nil and placeId then
				game.getUserVoteFeedbackMetadataStore(false).getAndFetchUserVoteFeedbackMetadata(placeId)
				
				if p2.configKey then
					getSduiClientPageScope(p2.configKey).set("showPlayerFeedback", true)
				end
			end
		end
		local dispose = t.dispose
		
		if dispose then
			dispose()
			t.dispose = nil
		end
	end)
end