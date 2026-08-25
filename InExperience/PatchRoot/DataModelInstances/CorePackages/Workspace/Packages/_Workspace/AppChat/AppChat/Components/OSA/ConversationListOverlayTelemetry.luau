local appChat = script:FindFirstAncestor("AppChat")
local _ = require(appChat.Telemetry.Layers.AppTelemetryLayer)
local modalTelemetryModule = require(appChat.Components.ModalTelemetry)

return {
	Events = {
		ModalRendered = modalTelemetryModule.Events.modalRenderedWithSequence({
			modalSequence = modalTelemetryModule.Enums.ModalSequence.ConversationListOverlay,
			counterFormat = function(p0, _)
				return { modalVariant = p0.modalVariant }
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
			counterFormat = function(p2, _)
				return { modalVariant = p2.modalVariant, action = p2.action }
			end,
			eventStreamFormat = function(p3, _)
				return {
					modalVariant = p3.modalVariant,
					action = p3.action,
					conversationId = p3.conversationId,
					impressionId = p3.impressionId
				}
			end
		}),
		ModalActionResult = modalTelemetryModule.Events.modalActionResultWithSequence({
			modalSequence = modalTelemetryModule.Enums.ModalSequence.ConversationListOverlay,
			counterFormat = function(p4, _)
				return {
					modalVariant = p4.modalVariant,
					action = p4.action,
					actionResult = p4.actionResult
				}
			end,
			eventStreamFormat = function(p5, _)
				return {
					modalVariant = p5.modalVariant,
					action = p5.action,
					actionResult = p5.actionResult,
					conversationId = p5.conversationId,
					impressionId = p5.impressionId
				}
			end
		})
	}
}