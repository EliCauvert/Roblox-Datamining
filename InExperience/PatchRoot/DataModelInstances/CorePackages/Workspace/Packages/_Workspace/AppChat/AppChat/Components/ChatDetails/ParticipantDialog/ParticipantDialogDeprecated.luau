local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local _ = require(AppChat.types)
local LoggerModule = require(script.Parent.Logger)
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local MemoFunction = ReactModule.memo
local UseTelemetryModule = require(AppChat.Telemetry.useTelemetry)
local ChatDetailsTelemetryEventsModule = require(AppChat.Components.ChatDetails.ChatDetailsTelemetryEvents)
local ChatDialogTelemetryLayerModule = require(AppChat.Telemetry.Layers.ChatDialogTelemetryLayer)
local ModalBottomSheet = require(Parent.UIBlox).ModalBottomSheet
local config = {
	conversationId = nil,
	participantId = nil,
	showRemoveUserButton = false,
	showViewProfileButton = true,
	showChatButton = false,
	viewProfileText = "localizedText.ViewProfile",
	chatText = "localizedText.Chat",
	reportUserText = "localizedText.ReportUser",
	removeFromGroupText = "localizedText.RemoveFromGroup",
	cancelText = "localizedText.Cancel",
	openViewProfile = function(_) --[[ Line: 61 ]]
		-- upvalues: LoggerModule (copy)
		LoggerModule:warning("openViewProfile was not passed to ParticipantDialogDeprecated")
	end,
	openChat = function(...) --[[ Line: 64 ]]
		-- upvalues: LoggerModule (copy)
		LoggerModule:warning("openChat was not passed to ParticipantDialogDeprecated")
	end,
	openReportUser = function(...) --[[ Line: 67 ]]
		-- upvalues: LoggerModule (copy)
		LoggerModule:warning("openReportUser was not passed to ParticipantDialogDeprecated")
	end,
	openRemoveUserDialog = function(...) --[[ Line: 70 ]]
		-- upvalues: LoggerModule (copy)
		LoggerModule:warning("openRemoveUserDialog was not passed to ParticipantDialogDeprecated")
	end,
	onDismiss = function(_) --[[ Line: 73 ]]
		-- upvalues: LoggerModule (copy)
		LoggerModule:warning("onDismiss was not passed to ParticipantDialogDeprecated")
	end
}

function ParticipantDialogDeprecated(p1) --[[ Line: 80 ]]
	-- upvalues: CryoModule (copy), config (copy), UseTelemetryModule (copy), ChatDialogTelemetryLayerModule (copy), LoggerModule (copy), ChatDetailsTelemetryEventsModule (copy), ReactModule (copy), ModalBottomSheet (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseTelemetryModuleResult = UseTelemetryModule(ChatDialogTelemetryLayerModule.Context)
	local ConversationId = JoinResult.conversationId
	local ParticipantId = JoinResult.participantId
	local ShowRemoveUserButton = JoinResult.showRemoveUserButton
	local OnDismiss = JoinResult.onDismiss or function() --[[ Line: 86 ]] end
	local List = {}
	
	local function _(Text, p2, p3) --[[ Line: 90 | Named "insertAction" ]]
		-- upvalues: List (copy)
		table.insert(List, {
			text = Text,
			stayOnActivated = if p3 then true else nil,
			onActivated = if p3 then nil else p2
		})
	end
	
	if JoinResult.showViewProfileButton then
		table.insert(List, {
			stayOnActivated = nil,
			text = JoinResult.viewProfileText,
			onActivated = function() --[[ Line: 102 ]]
				-- upvalues: LoggerModule (upval), ParticipantId (copy), JoinResult (copy)
				LoggerModule:info("User activated viewProfile | userId: {}", ParticipantId)
				JoinResult.openViewProfile(ParticipantId)
			end
		})
	end
	if JoinResult.showChatButton then
		table.insert(List, {
			stayOnActivated = nil,
			text = JoinResult.chatText,
			onActivated = function() --[[ Line: 109 ]]
				-- upvalues: LoggerModule (upval), ParticipantId (copy), UseTelemetryModuleResult (copy), ChatDetailsTelemetryEventsModule (upval), JoinResult (copy)
				LoggerModule:info("User activated openChat | userId: {}", ParticipantId)
				UseTelemetryModuleResult.emit(ChatDetailsTelemetryEventsModule.ParticipantDialogChatClicked, {})
				JoinResult.openChat(ParticipantId)
			end
		})
	end
	table.insert(List, {
		stayOnActivated = nil,
		text = JoinResult.reportUserText,
		onActivated = function() --[[ Line: 116 ]]
			-- upvalues: LoggerModule (upval), ParticipantId (copy), ConversationId (copy), UseTelemetryModuleResult (copy), ChatDetailsTelemetryEventsModule (upval), JoinResult (copy)
			LoggerModule:info("User activated reportUser | userId: {}, conversationId: {}", ParticipantId, ConversationId)
			UseTelemetryModuleResult.emit(ChatDetailsTelemetryEventsModule.ParticipantDialogReportUserClicked, {})
			JoinResult.openReportUser(ParticipantId, ConversationId)
		end
	})
	
	if ShowRemoveUserButton then
		table.insert(List, {
			stayOnActivated = nil,
			text = JoinResult.removeFromGroupText,
			onActivated = function() --[[ Line: 123 ]]
				-- upvalues: JoinResult (copy), ParticipantId (copy), ConversationId (copy)
				JoinResult.openRemoveUserDialog(ParticipantId, ConversationId)
			end
		})
	end
	table.insert(List, {
		stayOnActivated = nil,
		text = JoinResult.cancelText,
		onActivated = OnDismiss
	})
	
	return ReactModule.createElement(ModalBottomSheet, {
		bottomGap = 10,
		screenWidth = 400,
		showImages = false,
		onDismiss = OnDismiss,
		buttonModels = List
	})
end

return MemoFunction(ParticipantDialogDeprecated)