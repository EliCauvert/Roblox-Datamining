local Parent = script:FindFirstAncestor("ExperienceStoreServerDrivenUi").Parent
local DataHydrationModule = require(Parent.DataHydration)
local FoundationModule = require(Parent.Foundation)
local SignalsModule = require(Parent.Signals)
local GetSduiPageEntrySnackbarStoreFunction = require(Parent.SduiSharedUtilities).getSduiPageEntrySnackbarStore
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local config = {
	FloodCheckThresholdMet = "Feature.Toast.VoteError.FloodCheckThresholdMet"
}

local function showVoteErrorSnackbar(p1, ReasonForNotVoteable)
	-- upvalues: config (copy), GetSduiPageEntrySnackbarStoreFunction (copy), FoundationModule (copy), SduiErrorType (copy), SduiActionType (copy)
	local ConfigKey = p1.configKey
	
	if ConfigKey == nil then return end
	local Entry = ReasonForNotVoteable and config[ReasonForNotVoteable] or "Feature.Toast.VoteError.NotSaved"
	local Success, Result = pcall(function()
		-- upvalues: GetSduiPageEntrySnackbarStoreFunction (upval), ConfigKey (copy), p1 (copy), Entry (copy), FoundationModule (upval)
		GetSduiPageEntrySnackbarStoreFunction().show(ConfigKey, {
			title = p1.dependencies.localization:Format(Entry),
			icon = FoundationModule.Enums.IconName.X
		})
	end)
	
	if not Success then
		p1.dependencies.logger.reportError(SduiErrorType.FailedToExecuteAction, {
			name = SduiActionType.ToggleGamePassVote,
			message = tostring(Result)
		}, p1.appPage)
	end
end

local Effects = {}

return function(p1, _, p2)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), DataHydrationModule (copy), Effects (copy), SignalsModule (copy), showVoteErrorSnackbar (copy)
	local ActionParams = p1 and p1.actionParams
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = SduiActionType.ToggleGamePassVote
		}, p2.appPage)
		
		return
	end
	local GamePassId = ActionParams.gamePassId
	local VoteDirection = ActionParams.voteDirection
	
	if GamePassId == nil or typeof(VoteDirection) ~= "boolean" then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing gamePassId or voteDirection",
			name = SduiActionType.ToggleGamePassVote
		}, p2.appPage)
		
		return
	end
	local Text = tostring(GamePassId)
	local GamePassVoteStore = DataHydrationModule.Game.getGamePassVoteStore(false)
	local DataResult = GamePassVoteStore.getGamePassVote(Text).data(false)
	local UserVote = if DataResult then DataResult.userVote else nil
	local UpdateUserVoteResult = GamePassVoteStore.updateUserVote(Text, if UserVote == VoteDirection then nil else VoteDirection, ActionParams.isOwned == false)
	local t = {}
	local Flag = false
	
	local function _()
		-- upvalues: Flag (ref), Effects (upval), t (copy)
		Flag = true
		local Effect: () -> () = Effects[t]
		Effects[t] = nil
		
		if Effect then
			Effect()
		end
	end
	
	local Effect: () -> () = SignalsModule.createEffect(function(p3)
		-- upvalues: UpdateUserVoteResult (copy), Flag (ref), Effects (upval), t (copy), showVoteErrorSnackbar (upval), p2 (copy)
		local UpdateUserVoteResultResult = UpdateUserVoteResult(p3)
		
		if UpdateUserVoteResultResult == nil then return end
		Flag = true
		local Effect: () -> () = Effects[t]
		Effects[t] = nil
		
		if Effect then
			Effect()
		end
		if UpdateUserVoteResultResult.type == "error" then
			showVoteErrorSnackbar(p2, UpdateUserVoteResultResult.reasonForNotVoteable)
		end
	end)
	
	if Flag then
		Effect()
	else
		Effects[t] = Effect
	end
end