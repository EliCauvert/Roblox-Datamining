local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local tModule = require(corePackagesService.Packages.t)
local promiseModule = require(corePackagesService.Packages.Promise)
local enumerateModule = require(corePackagesService.Packages.enumerate)
local withStyle = require(corePackagesService.Packages.UIBlox).Core.Style.withStyle
local blockingUtilityModule = require(corePackagesService.Workspace.Packages.BlockingUtility)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local default = require(robloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local constantsModule = require(robloxGui.Modules.VoiceChat.Constants)
local getFFlagVoiceARUnblockingUnmutingEnabledModule = require(robloxGui.Modules.Flags.GetFFlagVoiceARUnblockingUnmutingEnabled)
local reportActionSelectionModule = require(script.Parent.ReportActionSelection)
local reportActionAreYouSureModule = require(script.Parent.ReportActionAreYouSure)
local var12 = enumerateModule("ReportPages", { SelectActions = 1, ConfirmAction = 2 })
local reportConfirmationContainer = roactModule.PureComponent:extend("ReportConfirmationContainer")
reportConfirmationContainer.defaultProps = {
	isVoiceReport = false,
	blockingUtility = blockingUtilityModule,
	voiceChatServiceManager = default,
	closeMenu = function() --[[ line: 33 ]] end
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

local function _(p0, p1) --[[ line: 54 | named "getIsPlayerBlockedByUserId" ]]
	-- upvalues: promiseModule (ref)
	return promiseModule.new(function(p2, _) --[[ line: 55 ]]
		-- upvalues: p0 (ref), p1 (ref)
		p2(p0:IsPlayerBlockedByUserId(p1))
	end)
end

function reportConfirmationContainer.init(p3) --[[ line: 60 ]]
	-- upvalues: getFFlagVoiceARUnblockingUnmutingEnabledModule (ref), constantsModule (ref), var12 (ref), promiseModule (ref)
	local player = p3.props.player
	local participants = p3.props.voiceChatServiceManager.participants
	p3:setState({ absoluteWidth = 0 })
	
	if p3.props.onSizeChanged then
		p3.props.onSizeChanged:Connect(function(p4) --[[ line: 69 ]]
			-- upvalues: p3 (ref)
			p3:setState({ absoluteWidth = p4.X })
		end)
	end
	local userId = participants[tostring(player.UserId)]
	p3.userFullName = player.DisplayName .. "(@" .. player.Name .. ")"
	
	function p3.onMuteCheckboxActivated(p5) --[[ line: 79 ]]
		-- upvalues: p3 (ref)
		p3:setState({ muteFlipped = p5 })
	end
	
	function p3.onBlockCheckboxActivated(p6) --[[ line: 85 ]]
		-- upvalues: p3 (ref)
		p3:setState({ blockFlipped = p6 })
	end
	
	function p3.processMuteAndBlocking() --[[ line: 91 ]]
		-- upvalues: p3 (ref), player (ref), getFFlagVoiceARUnblockingUnmutingEnabledModule (copy), constantsModule (copy)
		local blockFlipped = p3.state.blockFlipped
		local muteFlipped = p3.state.muteFlipped
		
		if blockFlipped and not p3.state.targetInitiallyBlocked then
			if p3.props.blockingUtility:BlockPlayerAsync(player) then
				p3.props.blockingAnalytics:action("SettingsHub", "blockUser", { blockeeUserId = player.UserId })
			end
		elseif not blockFlipped and p3.state.targetInitiallyBlocked and (getFFlagVoiceARUnblockingUnmutingEnabledModule() and p3.props.blockingUtility:UnblockPlayerAsync(player)) then
			p3.props.blockingAnalytics:action("SettingsHub", "unblockUser", { blockeeUserId = player.UserId })
		end
		local userId = p3.props.voiceChatServiceManager.participants[tostring(player.UserId)]
		
		if muteFlipped and not p3.state.targetInitiallyVoiceMuted then
			p3.props.blockingUtility:MutePlayer(player)
			p3.props.reportAbuseAnalytics:reportEventAndIncrement("muteUser")
			
			if userId and not userId.isMutedLocally then
				p3.props.voiceChatServiceManager:ToggleMutePlayer(player.UserId, constantsModule.VOICE_CONTEXT_TYPE.REPORT_MENU)
			end
		elseif not muteFlipped and p3.state.targetInitiallyVoiceMuted and getFFlagVoiceARUnblockingUnmutingEnabledModule() then
			p3.props.blockingUtility:UnmutePlayer(player)
			p3.props.reportAbuseAnalytics:reportEventAndIncrement("unmuteUser")
			
			if userId and userId.isMutedLocally then
				p3.props.voiceChatServiceManager:ToggleMutePlayer(player.UserId, constantsModule.VOICE_CONTEXT_TYPE.REPORT_MENU)
			end
		end
		p3.props.closeMenu()
	end
	
	function p3.onActionSelectionDoneActivated(p7, p8) --[[ line: 148 ]]
		-- upvalues: p3 (ref), var12 (copy)
		p3:setState({ blockFlipped = p7, muteFlipped = p8 })
		
		if (p7 or p8) and (p8 ~= p3.state.targetInitiallyVoiceMuted or p7 ~= p3.state.targetInitiallyBlocked) then
			p3:setState({ currentPage = var12.ConfirmAction })
			
			return
		end
		p3.processMuteAndBlocking()
	end
	
	function p3.onYesOrNoConfirmation() --[[ line: 171 ]]
		-- upvalues: p3 (ref)
		p3.processMuteAndBlocking()
	end
	
	function p3.onYesOrNoCancel() --[[ line: 175 ]]
		-- upvalues: p3 (ref), var12 (copy)
		p3:setState({ currentPage = var12.SelectActions })
	end
	
	p3:setState({ currentPage = var12.SelectActions })
	
	if userId then
		p3:setState({
			targetInitiallyVoiceMuted = userId.isMutedLocally,
			muteFlipped = userId.isMutedLocally
		})
	else
		p3:setState({ targetInitiallyVoiceMuted = false, muteFlipped = false })
	end
	local blockingUtility = p3.props.blockingUtility
	local userId_1 = player.UserId
	promiseModule.new(function(p10, _) --[[ line: 55 ]]
		-- upvalues: blockingUtility (ref), userId_1 (ref)
		p10(blockingUtility:IsPlayerBlockedByUserId(userId_1))
	end):andThen(function(p9) --[[ line: 198 ]]
		-- upvalues: p3 (ref)
		p3:setState({ targetInitiallyBlocked = p9, blockFlipped = p9 })
	end)
end

function reportConfirmationContainer.render(p11) --[[ line: 206 ]]
	-- upvalues: withStyle (ref), roactModule (ref), reportActionSelectionModule (ref), robloxTranslatorModule (ref), reportActionAreYouSureModule (ref), var12 (ref)
	return withStyle(function(_) --[[ line: 207 ]]
		-- upvalues: p11 (ref), roactModule (copy), reportActionSelectionModule (copy), robloxTranslatorModule (copy), reportActionAreYouSureModule (copy), var12 (copy)
		local currentPage = p11.state.currentPage
		local var14 = 1.3
		
		if p11.props.onSizeChanged then
			local absoluteWidth = p11.state.absoluteWidth
			var14 = if absoluteWidth >= 800 then 1.3 elseif absoluteWidth > 600 then 1 else absoluteWidth / 600
		end
		local var15 = roactModule.createElement(reportActionSelectionModule, {
			titleText = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Heading.Report.ThanksForReport"),
			subtitleText = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.ReportSubmitted.ThankYou"),
			instructionText = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.Report.OtherActionsHeader"),
			muteText = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.ReportSubmitted.MutePlayer", { Player = p11.userFullName }),
			blockText = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.ReportSubmitted.BlockPlayer", { Player = p11.userFullName }),
			doneText = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Action.Report.Done"),
			showVoiceMuting = p11.props.isVoiceReport,
			isVoiceMuted = (if p11.state.muteFlipped ~= nil then false else p11.state.muteFlipped) or p11.state.targetInitiallyVoiceMuted,
			isBlocked = (if p11.state.blockFlipped ~= nil then false else p11.state.blockFlipped) or p11.state.targetInitiallyBlocked,
			onMuteCheckboxActivated = p11.onMuteCheckboxActivated,
			onBlockCheckboxActivated = p11.onBlockCheckboxActivated,
			onDoneActivated = p11.onActionSelectionDoneActivated,
			uiScale = var14,
			ZIndex = p11.props.ZIndex
		})
		local var16 = roactModule.createElement(reportActionAreYouSureModule, {
			mutedTitleText = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.ReportSubmitted.MutePlayer", { Player = p11.userFullName }),
			blockedTitleText = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.ReportSubmitted.BlockPlayer", { Player = p11.userFullName }),
			mutedAndBlockedTitleText = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.ReportSubmitted.Label.MuteAndBlockPlayer", { DisplayName = p11.userFullName }),
			mutedSubtitleText = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.ReportSubmitted.MutedSubtitleText", { Player = p11.userFullName }),
			blockedSubtitleText = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.ReportSubmitted.BlockedSubtitleText", { Player = p11.userFullName }),
			mutedAndBlockedSubtitleText = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.ReportSubmitted.Label.MuteAndBlockWarning", { Player = p11.userFullName }),
			cancelText = robloxTranslatorModule:FormatByKey("InGame.InspectMenu.Action.Cancel"),
			confirmText = robloxTranslatorModule:FormatByKey("InGame.InspectMenu.Action.Confirm"),
			isMuted = p11.state.muteFlipped,
			isBlocked = p11.state.blockFlipped,
			onCancelActivated = p11.onYesOrNoCancel,
			onConfirmActivated = p11.onYesOrNoConfirmation,
			uiScale = var14,
			ZIndex = p11.props.ZIndex
		})
		local var17 = nil
		
		if currentPage == var12.SelectActions then
			var17 = var15
			
			return var17
		elseif currentPage == var12.ConfirmAction then
			var17 = var16
		end
		return var17
	end)
end

return reportConfirmationContainer