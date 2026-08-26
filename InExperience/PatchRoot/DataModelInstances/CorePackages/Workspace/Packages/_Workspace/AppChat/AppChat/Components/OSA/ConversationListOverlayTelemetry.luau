local appChat = script:FindFirstAncestor("AppChat")
local _ = require(appChat.Telemetry.Layers.AppTelemetryLayer)
local modalTelemetryModule = require(appChat.Components.ModalTelemetry)

return {
	Events = {
		ModalRendered = modalTelemetryModule.Events.modalRenderedWithSequence({
			modalSequence = modalTelemetryModule.Enums.ModalSequence.ConversationListOverlay,
			counterFormat = function(p1, _)
				return { modalVariant = p1.modalVariant }
			end,
			eventStreamFormat = function(p1, _)
				return {
					modalVariant = p1.modalVariant,
					conversationId = p1.conversationId,
					impressionId = p1.impressionId
				}
			end
		}),
		ModalAction = modalTelemetryModule.Events.modalActionWithSequence({
			modalSequence = modalTelemetryModule.Enums.ModalSequence.ConversationListOverlay,
			counterFormat = function(p1, _)
				return { modalVariant = p1.modalVariant, action = p1.action }
			end,
			eventStreamFormat = function(p1, _)
				return {
					modalVariant = p1.modalVariant,
					action = p1.action,
					conversationId = p1.conversationId,
					impressionId = p1.impressionId
				}
			end
		}),
		ModalActionResult = modalTelemetryModule.Events.modalActionResultWithSequence({
			modalSequence = modalTelemetryModule.Enums.ModalSequence.ConversationListOverlay,
			counterFormat = function(p1, _)
				return {
					modalVariant = p1.modalVariant,
					action = p1.action,
					actionResult = p1.actionResult
				}
			end,
			eventStreamFormat = function(p1, _)
				return {
					modalVariant = p1.modalVariant,
					action = p1.action,
					actionResult = p1.actionResult,
					conversationId = p1.conversationId,
					impressionId = p1.impressionId
				}
			end
		})
	}
}