local NotificationsOrchestrator = script:FindFirstAncestor("NotificationsOrchestrator")
local _ = require(NotificationsOrchestrator.Enums.SlotGroup)
local _ = require(NotificationsOrchestrator.Types)
local GlobalSlotGroupConfig = {
	capacity = 1,
	frequency = {
		maxImpressions = 10,
		window = "session",
		cooldownSeconds = 60
	}
}
local SlotGroupConfigByGroupId = {}

return {
	GlobalSlotGroupConfig = GlobalSlotGroupConfig,
	SlotGroupConfigByGroupId = SlotGroupConfigByGroupId,
	getSlotGroupConfig = function(p1)
		-- upvalues: SlotGroupConfigByGroupId (copy), GlobalSlotGroupConfig (copy)
		return SlotGroupConfigByGroupId[p1] or GlobalSlotGroupConfig
	end
}