local appChat = script:FindFirstAncestor("AppChat")
local _ = require(appChat.Telemetry.Layers.ChatConversationTelemetryLayer)
local modalTelemetryModule = require(appChat.Components.ModalTelemetry)

return {
	Events = {
		ModalRendered = modalTelemetryModule.Events.modalRenderedWithSequence({
			modalSequence = modalTelemetryModule.Enums.ModalSequence.ConversationTopModal,
			counterFormat = function(p1, _)
				return { modalVariant = p1.modalVariant }
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
			counterFormat = function(p1, _)
				return { modalVariant = p1.modalVariant, action = p1.action }
			end,
			eventStreamFormat = function(p1, _)
				return {
					modalVariant = p1.modalVariant,
					action = p1.action,
					modalContext = p1.modalContext
				}
			end
		})
	}
}