local AppChat = script:FindFirstAncestor("AppChat")
local _ = require(AppChat.Telemetry.Layers.AppTelemetryLayer)
local ModalTelemetryModule = require(AppChat.Components.ModalTelemetry)

return {
	Events = {
		ModalRendered = ModalTelemetryModule.Events.modalRenderedWithSequence({
			modalSequence = ModalTelemetryModule.Enums.ModalSequence.ConversationOverlay,
			counterFormat = function(p1, _) --[[ Line: 12 ]]
				return { modalVariant = p1.modalVariant }
			end
		}),
		ModalAction = ModalTelemetryModule.Events.modalActionWithSequence({
			modalSequence = ModalTelemetryModule.Enums.ModalSequence.ConversationOverlay,
			counterFormat = function(p1, _) --[[ Line: 20 ]]
				return { modalVariant = p1.modalVariant, action = p1.action }
			end
		}),
		ModalActionResult = ModalTelemetryModule.Events.modalActionResultWithSequence({
			modalSequence = ModalTelemetryModule.Enums.ModalSequence.ConversationOverlay,
			counterFormat = function(p1, _) --[[ Line: 32 ]]
				return {
					modalVariant = p1.modalVariant,
					action = p1.action,
					actionResult = p1.actionResult
				}
			end
		})
	}
}