local appChat = script:FindFirstAncestor("AppChat")
local _ = require(appChat.Telemetry.Layers.AppTelemetryLayer)
local modalTelemetryModule = require(appChat.Components.ModalTelemetry)

return {
	Events = {
		ModalRendered = modalTelemetryModule.Events.modalRenderedWithSequence({
			modalSequence = modalTelemetryModule.Enums.ModalSequence.ConversationOverlay,
			counterFormat = function(p0, _) --[[ line: 12 ]]
				return { modalVariant = p0.modalVariant }
			end
		}),
		ModalAction = modalTelemetryModule.Events.modalActionWithSequence({
			modalSequence = modalTelemetryModule.Enums.ModalSequence.ConversationOverlay,
			counterFormat = function(p1, _) --[[ line: 20 ]]
				return { modalVariant = p1.modalVariant, action = p1.action }
			end
		}),
		ModalActionResult = modalTelemetryModule.Events.modalActionResultWithSequence({
			modalSequence = modalTelemetryModule.Enums.ModalSequence.ConversationOverlay,
			counterFormat = function(p2, _) --[[ line: 32 ]]
				return {
					modalVariant = p2.modalVariant,
					action = p2.action,
					actionResult = p2.actionResult
				}
			end
		})
	}
}