local appChat = script:FindFirstAncestor("AppChat")
local _ = require(appChat.Telemetry.Layers.ChatConversationTelemetryLayer)
local modalTelemetryModule = require(appChat.Components.ModalTelemetry)

return {
	Events = {
		ModalRendered = modalTelemetryModule.Events.modalRenderedWithSequence({
			modalSequence = modalTelemetryModule.Enums.ModalSequence.ConversationTopModal,
			counterFormat = function(p0, _)
				return { modalVariant = p0.modalVariant }
			end,
			eventStreamFormat = function(p1, _)
				return {
					modalVariant = p1.modalVariant,
					modalContext = p1.modalContext
				}
			end
		}),
		ModalAction = modalTelemetryModule.Events.modalActionWithSequence({
			modalSequence = modalTelemetryModule.Enums.ModalSequence.ConversationTopModal,
			counterFormat = function(p2, _)
				return { modalVariant = p2.modalVariant, action = p2.action }
			end,
			eventStreamFormat = function(p3, _)
				return {
					modalVariant = p3.modalVariant,
					action = p3.action,
					modalContext = p3.modalContext
				}
			end
		})
	}
}