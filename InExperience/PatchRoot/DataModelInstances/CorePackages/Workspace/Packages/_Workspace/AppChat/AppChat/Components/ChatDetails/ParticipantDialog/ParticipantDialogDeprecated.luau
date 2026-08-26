local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local _ = require(appChat.types)
local UIBloxModule = require(parent.UIBlox)
local loggerModule = require(script.Parent.Logger)
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local memo = reactModule.memo
local useTelemetryModule = require(appChat.Telemetry.useTelemetry)
local chatDetailsTelemetryEventsModule = require(appChat.Components.ChatDetails.ChatDetailsTelemetryEvents)
local chatDialogTelemetryLayerModule = require(appChat.Telemetry.Layers.ChatDialogTelemetryLayer)
local modalBottomSheet = UIBloxModule.ModalBottomSheet
local t = {
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
	openViewProfile = function(_)
		-- upvalues: loggerModule (ref)
		loggerModule:warning("openViewProfile was not passed to ParticipantDialogDeprecated")
	end,
	openChat = function(...)
		-- upvalues: loggerModule (ref)
		loggerModule:warning("openChat was not passed to ParticipantDialogDeprecated")
	end,
	openReportUser = function(...)
		-- upvalues: loggerModule (ref)
		loggerModule:warning("openReportUser was not passed to ParticipantDialogDeprecated")
	end,
	openRemoveUserDialog = function(...)
		-- upvalues: loggerModule (ref)
		loggerModule:warning("openRemoveUserDialog was not passed to ParticipantDialogDeprecated")
	end,
	onDismiss = function(_)
		-- upvalues: loggerModule (ref)
		loggerModule:warning("onDismiss was not passed to ParticipantDialogDeprecated")
	end
}

function ParticipantDialogDeprecated(p1)
	-- upvalues: cryoModule (ref), t (ref), useTelemetryModule (ref), chatDialogTelemetryLayerModule (ref), loggerModule (ref), chatDetailsTelemetryEventsModule (ref), reactModule (ref), modalBottomSheet (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	local var2 = useTelemetryModule(chatDialogTelemetryLayerModule.Context)
	local conversationId = var1.conversationId
	local participantId = var1.participantId
	local showRemoveUserButton = var1.showRemoveUserButton
	local onDismiss = var1.onDismiss or function() end
	local t_1 = {}
	
	local function _(p2, p3, p4)
		-- upvalues: t_1 (ref)
		table.insert(t_1, {
			text = p2,
			stayOnActivated = if p4 then true else nil,
			onActivated = if p4 then nil else p3
		})
	end
	
	if var1.showViewProfileButton then
		table.insert(t_1, {
			stayOnActivated = nil,
			text = var1.viewProfileText,
			onActivated = function()
				-- upvalues: loggerModule (copy), participantId (ref), var1 (ref)
				loggerModule:info("User activated viewProfile | userId: {}", participantId)
				var1.openViewProfile(participantId)
			end
		})
	end
	if var1.showChatButton then
		table.insert(t_1, {
			stayOnActivated = nil,
			text = var1.chatText,
			onActivated = function()
				-- upvalues: loggerModule (copy), participantId (ref), var2 (ref), chatDetailsTelemetryEventsModule (copy), var1 (ref)
				loggerModule:info("User activated openChat | userId: {}", participantId)
				var2.emit(chatDetailsTelemetryEventsModule.ParticipantDialogChatClicked, {})
				var1.openChat(participantId)
			end
		})
	end
	table.insert(t_1, {
		stayOnActivated = nil,
		text = var1.reportUserText,
		onActivated = function()
			-- upvalues: loggerModule (copy), participantId (ref), conversationId (ref), var2 (ref), chatDetailsTelemetryEventsModule (copy), var1 (ref)
			loggerModule:info("User activated reportUser | userId: {}, conversationId: {}", participantId, conversationId)
			var2.emit(chatDetailsTelemetryEventsModule.ParticipantDialogReportUserClicked, {})
			var1.openReportUser(participantId, conversationId)
		end
	})
	
	if showRemoveUserButton then
		table.insert(t_1, {
			stayOnActivated = nil,
			text = var1.removeFromGroupText,
			onActivated = function()
				-- upvalues: var1 (ref), participantId (ref), conversationId (ref)
				var1.openRemoveUserDialog(participantId, conversationId)
			end
		})
	end
	table.insert(t_1, {
		stayOnActivated = nil,
		text = var1.cancelText,
		onActivated = onDismiss
	})
	
	return reactModule.createElement(modalBottomSheet, {
		bottomGap = 10,
		screenWidth = 400,
		showImages = false,
		onDismiss = onDismiss,
		buttonModels = t_1
	})
end

return memo(ParticipantDialogDeprecated)