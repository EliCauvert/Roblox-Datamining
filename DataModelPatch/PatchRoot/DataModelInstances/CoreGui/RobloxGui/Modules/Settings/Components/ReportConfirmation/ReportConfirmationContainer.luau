local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local PromiseModule = require(CorePackages.Packages.Promise)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.withStyle
local FFlagCoreUiMigrateUIBloxToFoundation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local ConstantsModule = require(RobloxGui.Modules.VoiceChat.Constants)
local GetFFlagVoiceARUnblockingUnmutingEnabledModule = require(RobloxGui.Modules.Flags.GetFFlagVoiceARUnblockingUnmutingEnabled)
local ReportActionSelectionModule = require(script.Parent.ReportActionSelection)
local ReportActionAreYouSureModule = require(script.Parent.ReportActionAreYouSure)
local ReportPages = require(CorePackages.Packages.enumerate)("ReportPages", { SelectActions = 1, ConfirmAction = 2 })
local ReportConfirmationContainer = RoactModule.PureComponent:extend("ReportConfirmationContainer")
ReportConfirmationContainer.defaultProps = {
	isVoiceReport = false,
	blockingUtility = require(CorePackages.Workspace.Packages.BlockingUtility),
	voiceChatServiceManager = require(RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default,
	closeMenu = function() end
}
ReportConfirmationContainer.validateProps = TModule.interface({
	player = TModule.strictInterface({
		UserId = TModule.number,
		Name = TModule.string,
		DisplayName = TModule.string
	}),
	isVoiceReport = TModule.boolean,
	closeMenu = TModule.callback,
	blockingAnalytics = TModule.optional(TModule.table),
	reportAbuseAnalytics = TModule.optional(TModule.table)
})

local function _(p1, p2)
	-- upvalues: PromiseModule (copy)
	return PromiseModule.new(function(Callback: (any) -> (), _)
		-- upvalues: p1 (copy), p2 (copy)
		Callback(p1:IsPlayerBlockedByUserId(p2))
	end)
end

function ReportConfirmationContainer.init(p1)
	-- upvalues: GetFFlagVoiceARUnblockingUnmutingEnabledModule (copy), ConstantsModule (copy), ReportPages (copy), PromiseModule (copy)
	local Player = p1.props.player
	local Participants = p1.props.voiceChatServiceManager.participants
	p1:setState({ absoluteWidth = 0 })
	
	if p1.props.onSizeChanged then
		p1.props.onSizeChanged:Connect(function(p2)
			-- upvalues: p1 (copy)
			p1:setState({ absoluteWidth = p2.X })
		end)
	end
	local Participant = Participants[tostring(Player.UserId)]
	p1.userFullName = Player.DisplayName .. "(@" .. Player.Name .. ")"
	
	function p1.onMuteCheckboxActivated(MuteFlipped)
		-- upvalues: p1 (copy)
		p1:setState({ muteFlipped = MuteFlipped })
	end
	
	function p1.onBlockCheckboxActivated(BlockFlipped)
		-- upvalues: p1 (copy)
		p1:setState({ blockFlipped = BlockFlipped })
	end
	
	function p1.processMuteAndBlocking()
		-- upvalues: p1 (copy), Player (copy), GetFFlagVoiceARUnblockingUnmutingEnabledModule (upval), ConstantsModule (upval)
		local BlockFlipped = p1.state.blockFlipped
		local MuteFlipped = p1.state.muteFlipped
		
		if BlockFlipped and not p1.state.targetInitiallyBlocked then
			if p1.props.blockingUtility:BlockPlayerAsync(Player) then
				p1.props.blockingAnalytics:action("SettingsHub", "blockUser", { blockeeUserId = Player.UserId })
			end
		elseif not BlockFlipped and p1.state.targetInitiallyBlocked and GetFFlagVoiceARUnblockingUnmutingEnabledModule() and p1.props.blockingUtility:UnblockPlayerAsync(Player) then
			p1.props.blockingAnalytics:action("SettingsHub", "unblockUser", { blockeeUserId = Player.UserId })
		end
		local Participant = p1.props.voiceChatServiceManager.participants[tostring(Player.UserId)]
		
		if MuteFlipped and not p1.state.targetInitiallyVoiceMuted then
			p1.props.blockingUtility:MutePlayer(Player)
			p1.props.reportAbuseAnalytics:reportEventAndIncrement("muteUser")
			
			if Participant and not Participant.isMutedLocally then
				p1.props.voiceChatServiceManager:ToggleMutePlayer(Player.UserId, ConstantsModule.VOICE_CONTEXT_TYPE.REPORT_MENU)
			end
		elseif not MuteFlipped and p1.state.targetInitiallyVoiceMuted and GetFFlagVoiceARUnblockingUnmutingEnabledModule() then
			p1.props.blockingUtility:UnmutePlayer(Player)
			p1.props.reportAbuseAnalytics:reportEventAndIncrement("unmuteUser")
			
			if Participant and Participant.isMutedLocally then
				p1.props.voiceChatServiceManager:ToggleMutePlayer(Player.UserId, ConstantsModule.VOICE_CONTEXT_TYPE.REPORT_MENU)
			end
		end
		p1.props.closeMenu()
	end
	
	function p1.onActionSelectionDoneActivated(BlockFlipped, MuteFlipped)
		-- upvalues: p1 (copy), ReportPages (upval)
		p1:setState({ blockFlipped = BlockFlipped, muteFlipped = MuteFlipped })
		
		if (BlockFlipped or MuteFlipped) and (MuteFlipped ~= p1.state.targetInitiallyVoiceMuted or BlockFlipped ~= p1.state.targetInitiallyBlocked) then
			p1:setState({ currentPage = ReportPages.ConfirmAction })
			
			return
		else
			p1.processMuteAndBlocking()
		end
	end
	
	function p1.onYesOrNoConfirmation()
		-- upvalues: p1 (copy)
		p1.processMuteAndBlocking()
	end
	
	function p1.onYesOrNoCancel()
		-- upvalues: p1 (copy), ReportPages (upval)
		p1:setState({ currentPage = ReportPages.SelectActions })
	end
	
	p1:setState({ currentPage = ReportPages.SelectActions })
	
	if Participant then
		p1:setState({
			targetInitiallyVoiceMuted = Participant.isMutedLocally,
			muteFlipped = Participant.isMutedLocally
		})
	else
		p1:setState({ targetInitiallyVoiceMuted = false, muteFlipped = false })
	end
	local BlockingUtility = p1.props.blockingUtility
	local UserId = Player.UserId
	PromiseModule.new(function(Callback: (any) -> (), _)
		-- upvalues: BlockingUtility (copy), UserId (copy)
		Callback(BlockingUtility:IsPlayerBlockedByUserId(UserId))
	end):andThen(function(Result)
		-- upvalues: p1 (copy)
		p1:setState({ targetInitiallyBlocked = Result, blockFlipped = Result })
	end)
end

function ReportConfirmationContainer.renderContent(p1)
	-- upvalues: RoactModule (copy), ReportActionSelectionModule (copy), RobloxTranslatorModule (copy), ReportActionAreYouSureModule (copy), ReportPages (copy)
	local CurrentPage = p1.state.currentPage
	local UiScale = 1.3
	
	if p1.props.onSizeChanged then
		local AbsoluteWidth: number = p1.state.absoluteWidth
		UiScale = if AbsoluteWidth >= 800 then 1.3 elseif AbsoluteWidth > 600 then 1 else AbsoluteWidth / 600
	end
	local Element = RoactModule.createElement(ReportActionSelectionModule, {
		titleText = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Heading.Report.ThanksForReport"),
		subtitleText = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.ReportSubmitted.ThankYou"),
		instructionText = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.Report.OtherActionsHeader"),
		muteText = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.ReportSubmitted.MutePlayer", { Player = p1.userFullName }),
		blockText = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.ReportSubmitted.BlockPlayer", { Player = p1.userFullName }),
		doneText = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Action.Report.Done"),
		showVoiceMuting = p1.props.isVoiceReport,
		isVoiceMuted = p1.state.muteFlipped ~= nil and p1.state.muteFlipped or p1.state.targetInitiallyVoiceMuted,
		isBlocked = p1.state.blockFlipped ~= nil and p1.state.blockFlipped or p1.state.targetInitiallyBlocked,
		onMuteCheckboxActivated = p1.onMuteCheckboxActivated,
		onBlockCheckboxActivated = p1.onBlockCheckboxActivated,
		onDoneActivated = p1.onActionSelectionDoneActivated,
		uiScale = UiScale,
		ZIndex = p1.props.ZIndex
	})
	local Element1 = RoactModule.createElement(ReportActionAreYouSureModule, {
		mutedTitleText = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.ReportSubmitted.MutePlayer", { Player = p1.userFullName }),
		blockedTitleText = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.ReportSubmitted.BlockPlayer", { Player = p1.userFullName }),
		mutedAndBlockedTitleText = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.ReportSubmitted.Label.MuteAndBlockPlayer", { DisplayName = p1.userFullName }),
		mutedSubtitleText = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.ReportSubmitted.MutedSubtitleText", { Player = p1.userFullName }),
		blockedSubtitleText = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.ReportSubmitted.BlockedSubtitleText", { Player = p1.userFullName }),
		mutedAndBlockedSubtitleText = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.ReportSubmitted.Label.MuteAndBlockWarning", { Player = p1.userFullName }),
		cancelText = RobloxTranslatorModule:FormatByKey("InGame.InspectMenu.Action.Cancel"),
		confirmText = RobloxTranslatorModule:FormatByKey("InGame.InspectMenu.Action.Confirm"),
		isMuted = p1.state.muteFlipped,
		isBlocked = p1.state.blockFlipped,
		onCancelActivated = p1.onYesOrNoCancel,
		onConfirmActivated = p1.onYesOrNoConfirmation,
		uiScale = UiScale,
		ZIndex = p1.props.ZIndex
	})
	local v1 = nil
	
	if CurrentPage == ReportPages.SelectActions then
		v1 = Element
		
		return v1
	end
	if CurrentPage == ReportPages.ConfirmAction then
		v1 = Element1
	end
	return v1
end

function ReportConfirmationContainer.render(p1)
	-- upvalues: FFlagCoreUiMigrateUIBloxToFoundation (copy), WithStyleFunction (copy)
	return if FFlagCoreUiMigrateUIBloxToFoundation then p1:renderContent() else WithStyleFunction(function(_)
		-- upvalues: p1 (copy)
		return p1:renderContent()
	end)
end

return ReportConfirmationContainer