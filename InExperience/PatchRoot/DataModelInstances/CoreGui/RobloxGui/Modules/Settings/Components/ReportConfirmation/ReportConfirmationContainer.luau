local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local tModule = require(corePackagesService.Packages.t)
local promiseModule = require(corePackagesService.Packages.Promise)
local enumerateModule = require(corePackagesService.Packages.enumerate)
local withStyle = require(corePackagesService.Packages.UIBlox).Core.Style.withStyle
local fFlagCoreUiMigrateUIBloxToFoundation = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local blockingUtilityModule = require(corePackagesService.Workspace.Packages.BlockingUtility)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local default = require(robloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local constantsModule = require(robloxGui.Modules.VoiceChat.Constants)
local getFFlagVoiceARUnblockingUnmutingEnabledModule = require(robloxGui.Modules.Flags.GetFFlagVoiceARUnblockingUnmutingEnabled)
local reportActionSelectionModule = require(script.Parent.ReportActionSelection)
local reportActionAreYouSureModule = require(script.Parent.ReportActionAreYouSure)
local var1 = enumerateModule("ReportPages", { SelectActions = 1, ConfirmAction = 2 })
local reportConfirmationContainer = roactModule.PureComponent:extend("ReportConfirmationContainer")
reportConfirmationContainer.defaultProps = {
	isVoiceReport = false,
	blockingUtility = blockingUtilityModule,
	voiceChatServiceManager = default,
	closeMenu = function() end
}
reportConfirmationContainer.validateProps = tModule.interface({
	player = tModule.strictInterface({
		UserId = tModule.number,
		Name = tModule.string,
		DisplayName = tModule.string
	}),
	isVoiceReport = tModule.boolean,
	closeMenu = tModule.callback,
	blockingAnalytics = tModule.optional(tModule.table),
	reportAbuseAnalytics = tModule.optional(tModule.table)
})

local function _(p1, p2)
	-- upvalues: promiseModule (ref)
	return promiseModule.new(function(p3, _)
		-- upvalues: p1 (ref), p2 (ref)
		p3(p1:IsPlayerBlockedByUserId(p2))
	end)
end

function reportConfirmationContainer.init(p1)
	-- upvalues: getFFlagVoiceARUnblockingUnmutingEnabledModule (ref), constantsModule (ref), var1 (ref), promiseModule (ref)
	local player = p1.props.player
	local participants = p1.props.voiceChatServiceManager.participants
	p1:setState({ absoluteWidth = 0 })
	
	if p1.props.onSizeChanged then
		p1.props.onSizeChanged:Connect(function(p2)
			-- upvalues: p1 (ref)
			p1:setState({ absoluteWidth = p2.X })
		end)
	end
	local userId = participants[tostring(player.UserId)]
	p1.userFullName = player.DisplayName .. "(@" .. player.Name .. ")"
	
	function p3.onMuteCheckboxActivated(p2)
		-- upvalues: p1 (ref)
		p1:setState({ muteFlipped = p2 })
	end
	
	function p3.onBlockCheckboxActivated(p2)
		-- upvalues: p1 (ref)
		p1:setState({ blockFlipped = p2 })
	end
	
	function p3.processMuteAndBlocking()
		-- upvalues: p1 (ref), player (ref), getFFlagVoiceARUnblockingUnmutingEnabledModule (copy), constantsModule (copy)
		local blockFlipped = p1.state.blockFlipped
		local muteFlipped = p1.state.muteFlipped
		
		if blockFlipped and not p1.state.targetInitiallyBlocked then
			if p1.props.blockingUtility:BlockPlayerAsync(player) then
				p1.props.blockingAnalytics:action("SettingsHub", "blockUser", { blockeeUserId = player.UserId })
			end
		elseif not blockFlipped and p1.state.targetInitiallyBlocked and (getFFlagVoiceARUnblockingUnmutingEnabledModule() and p1.props.blockingUtility:UnblockPlayerAsync(player)) then
			p1.props.blockingAnalytics:action("SettingsHub", "unblockUser", { blockeeUserId = player.UserId })
		end
		local userId = p1.props.voiceChatServiceManager.participants[tostring(player.UserId)]
		
		if muteFlipped and not p1.state.targetInitiallyVoiceMuted then
			p1.props.blockingUtility:MutePlayer(player)
			p1.props.reportAbuseAnalytics:reportEventAndIncrement("muteUser")
			
			if userId and not userId.isMutedLocally then
				p1.props.voiceChatServiceManager:ToggleMutePlayer(player.UserId, constantsModule.VOICE_CONTEXT_TYPE.REPORT_MENU)
			end
		elseif not muteFlipped and p1.state.targetInitiallyVoiceMuted and getFFlagVoiceARUnblockingUnmutingEnabledModule() then
			p1.props.blockingUtility:UnmutePlayer(player)
			p1.props.reportAbuseAnalytics:reportEventAndIncrement("unmuteUser")
			
			if userId and userId.isMutedLocally then
				p1.props.voiceChatServiceManager:ToggleMutePlayer(player.UserId, constantsModule.VOICE_CONTEXT_TYPE.REPORT_MENU)
			end
		end
		p1.props.closeMenu()
	end
	
	function p3.onActionSelectionDoneActivated(p2, p3)
		-- upvalues: p1 (ref), var1 (copy)
		p1:setState({ blockFlipped = p2, muteFlipped = p3 })
		
		if (p2 or p3) and (p3 ~= p1.state.targetInitiallyVoiceMuted or p2 ~= p1.state.targetInitiallyBlocked) then
			p1:setState({ currentPage = var1.ConfirmAction })
			
			return
		end
		p1.processMuteAndBlocking()
	end
	
	function p3.onYesOrNoConfirmation()
		-- upvalues: p1 (ref)
		p1.processMuteAndBlocking()
	end
	
	function p3.onYesOrNoCancel()
		-- upvalues: p1 (ref), var1 (copy)
		p1:setState({ currentPage = var1.SelectActions })
	end
	
	p1:setState({ currentPage = var1.SelectActions })
	
	if userId then
		p1:setState({
			targetInitiallyVoiceMuted = userId.isMutedLocally,
			muteFlipped = userId.isMutedLocally
		})
	else
		p1:setState({ targetInitiallyVoiceMuted = false, muteFlipped = false })
	end
	local blockingUtility = p1.props.blockingUtility
	local userId_1 = player.UserId
	promiseModule.new(function(p2, _)
		-- upvalues: blockingUtility (ref), userId_1 (ref)
		p2(blockingUtility:IsPlayerBlockedByUserId(userId_1))
	end):andThen(function(p2)
		-- upvalues: p1 (ref)
		p1:setState({ targetInitiallyBlocked = p2, blockFlipped = p2 })
	end)
end

function reportConfirmationContainer.renderContent(p1)
	-- upvalues: roactModule (ref), reportActionSelectionModule (ref), robloxTranslatorModule (ref), reportActionAreYouSureModule (ref), var1 (ref)
	local currentPage = p1.state.currentPage
	local var2 = 1.3
	
	if p1.props.onSizeChanged then
		local absoluteWidth = p1.state.absoluteWidth
		var2 = if absoluteWidth >= 800 then 1.3 elseif absoluteWidth > 600 then 1 else absoluteWidth / 600
	end
	local var3 = roactModule.createElement(reportActionSelectionModule, {
		titleText = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Heading.Report.ThanksForReport"),
		subtitleText = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.ReportSubmitted.ThankYou"),
		instructionText = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.Report.OtherActionsHeader"),
		muteText = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.ReportSubmitted.MutePlayer", { Player = p1.userFullName }),
		blockText = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.ReportSubmitted.BlockPlayer", { Player = p1.userFullName }),
		doneText = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Action.Report.Done"),
		showVoiceMuting = p1.props.isVoiceReport,
		isVoiceMuted = (if p1.state.muteFlipped ~= nil then false else p1.state.muteFlipped) or p1.state.targetInitiallyVoiceMuted,
		isBlocked = (if p1.state.blockFlipped ~= nil then false else p1.state.blockFlipped) or p1.state.targetInitiallyBlocked,
		onMuteCheckboxActivated = p1.onMuteCheckboxActivated,
		onBlockCheckboxActivated = p1.onBlockCheckboxActivated,
		onDoneActivated = p1.onActionSelectionDoneActivated,
		uiScale = var2,
		ZIndex = p1.props.ZIndex
	})
	local var4 = roactModule.createElement(reportActionAreYouSureModule, {
		mutedTitleText = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.ReportSubmitted.MutePlayer", { Player = p1.userFullName }),
		blockedTitleText = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.ReportSubmitted.BlockPlayer", { Player = p1.userFullName }),
		mutedAndBlockedTitleText = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.ReportSubmitted.Label.MuteAndBlockPlayer", { DisplayName = p1.userFullName }),
		mutedSubtitleText = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.ReportSubmitted.MutedSubtitleText", { Player = p1.userFullName }),
		blockedSubtitleText = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.ReportSubmitted.BlockedSubtitleText", { Player = p1.userFullName }),
		mutedAndBlockedSubtitleText = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.ReportSubmitted.Label.MuteAndBlockWarning", { Player = p1.userFullName }),
		cancelText = robloxTranslatorModule:FormatByKey("InGame.InspectMenu.Action.Cancel"),
		confirmText = robloxTranslatorModule:FormatByKey("InGame.InspectMenu.Action.Confirm"),
		isMuted = p1.state.muteFlipped,
		isBlocked = p1.state.blockFlipped,
		onCancelActivated = p1.onYesOrNoCancel,
		onConfirmActivated = p1.onYesOrNoConfirmation,
		uiScale = var2,
		ZIndex = p1.props.ZIndex
	})
	local var5 = nil
	
	if currentPage == var1.SelectActions then
		var5 = var3
		
		return var5
	elseif currentPage == var1.ConfirmAction then
		var5 = var4
	end
	return var5
end

function reportConfirmationContainer.render(p1)
	-- upvalues: fFlagCoreUiMigrateUIBloxToFoundation (ref), withStyle (ref)
	return if fFlagCoreUiMigrateUIBloxToFoundation then p1:renderContent() else withStyle(function(_)
		-- upvalues: p1 (ref)
		return p1:renderContent()
	end)
end

return reportConfirmationContainer