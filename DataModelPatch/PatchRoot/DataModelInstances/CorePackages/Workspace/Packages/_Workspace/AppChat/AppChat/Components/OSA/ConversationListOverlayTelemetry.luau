local AppChat = script:FindFirstAncestor("AppChat")
local _ = require(AppChat.Telemetry.Layers.AppTelemetryLayer)
local ModalTelemetryModule = require(AppChat.Components.ModalTelemetry)

return {
	Events = {
		ModalRendered = ModalTelemetryModule.Events.modalRenderedWithSequence({
			modalSequence = ModalTelemetryModule.Enums.ModalSequence.ConversationListOverlay,
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
		ModalAction = ModalTelemetryModule.Events.modalActionWithSequence({
			modalSequence = ModalTelemetryModule.Enums.ModalSequence.ConversationListOverlay,
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
		ModalActionResult = ModalTelemetryModule.Events.modalActionResultWithSequence({
			modalSequence = ModalTelemetryModule.Enums.ModalSequence.ConversationListOverlay,
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