local NotificationsOrchestrator = script:FindFirstAncestor("NotificationsOrchestrator")
local _ = require(NotificationsOrchestrator.Enums.SlotId)
local _ = require(NotificationsOrchestrator.Types)
local GlobalSlotConfig = {
	lifecycle = {
		frequency = {
			maxImpressions = 10,
			window = "session",
			cooldownSeconds = 60
		},
		visibility = { delayMs = 0, autoDismissAfterMs = 0 }
	}
}
local SlotConfigBySlotId = {}

return {
	GlobalSlotConfig = GlobalSlotConfig,
	SlotConfigBySlotId = SlotConfigBySlotId,
	getSlotConfig = function(p1)
		-- upvalues: SlotConfigBySlotId (copy), GlobalSlotConfig (copy)
		return SlotConfigBySlotId[p1] or GlobalSlotConfig
	end
}