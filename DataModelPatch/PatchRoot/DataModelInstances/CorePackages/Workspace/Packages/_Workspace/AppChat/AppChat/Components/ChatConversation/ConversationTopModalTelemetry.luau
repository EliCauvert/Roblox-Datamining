local AppChat = script:FindFirstAncestor("AppChat")
local _ = require(AppChat.Telemetry.Layers.ChatConversationTelemetryLayer)
local ModalTelemetryModule = require(AppChat.Components.ModalTelemetry)

return {
	Events = {
		ModalRendered = ModalTelemetryModule.Events.modalRenderedWithSequence({
			modalSequence = ModalTelemetryModule.Enums.ModalSequence.ConversationTopModal,
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
		ModalAction = ModalTelemetryModule.Events.modalActionWithSequence({
			modalSequence = ModalTelemetryModule.Enums.ModalSequence.ConversationTopModal,
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