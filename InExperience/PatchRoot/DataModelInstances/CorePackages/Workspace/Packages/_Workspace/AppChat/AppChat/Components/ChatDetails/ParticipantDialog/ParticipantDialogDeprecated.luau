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

function ParticipantDialogDeprecated(p0)
	-- upvalues: cryoModule (ref), t (ref), useTelemetryModule (ref), chatDialogTelemetryLayerModule (ref), loggerModule (ref), chatDetailsTelemetryEventsModule (ref), reactModule (ref), modalBottomSheet (ref)
	local var9 = cryoModule.Dictionary.join(t, p0)
	local var10 = useTelemetryModule(chatDialogTelemetryLayerModule.Context)
	local conversationId = var9.conversationId
	local participantId = var9.participantId
	local showRemoveUserButton = var9.showRemoveUserButton
	local onDismiss = var9.onDismiss or function() end
	local t_1 = {}
	
	local function _(p1, p2, p3)
		-- upvalues: t_1 (ref)
		table.insert(t_1, {
			text = p1,
			stayOnActivated = if p3 then true else nil,
			onActivated = if p3 then nil else p2
		})
	end
	
	if var9.showViewProfileButton then
		table.insert(t_1, {
			stayOnActivated = nil,
			text = var9.viewProfileText,
			onActivated = function()
				-- upvalues: loggerModule (copy), participantId (ref), var9 (ref)
				loggerModule:info("User activated viewProfile | userId: {}", participantId)
				var9.openViewProfile(participantId)
			end
		})
	end
	if var9.showChatButton then
		table.insert(t_1, {
			stayOnActivated = nil,
			text = var9.chatText,
			onActivated = function()
				-- upvalues: loggerModule (copy), participantId (ref), var10 (ref), chatDetailsTelemetryEventsModule (copy), var9 (ref)
				loggerModule:info("User activated openChat | userId: {}", participantId)
				var10.emit(chatDetailsTelemetryEventsModule.ParticipantDialogChatClicked, {})
				var9.openChat(participantId)
			end
		})
	end
	table.insert(t_1, {
		stayOnActivated = nil,
		text = var9.reportUserText,
		onActivated = function()
			-- upvalues: loggerModule (copy), participantId (ref), conversationId (ref), var10 (ref), chatDetailsTelemetryEventsModule (copy), var9 (ref)
			loggerModule:info("User activated reportUser | userId: {}, conversationId: {}", participantId, conversationId)
			var10.emit(chatDetailsTelemetryEventsModule.ParticipantDialogReportUserClicked, {})
			var9.openReportUser(participantId, conversationId)
		end
	})
	
	if showRemoveUserButton then
		table.insert(t_1, {
			stayOnActivated = nil,
			text = var9.removeFromGroupText,
			onActivated = function()
				-- upvalues: var9 (ref), participantId (ref), conversationId (ref)
				var9.openRemoveUserDialog(participantId, conversationId)
			end
		})
	end
	table.insert(t_1, {
		stayOnActivated = nil,
		text = var9.cancelText,
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