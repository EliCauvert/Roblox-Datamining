local NotificationsOrchestrator = script:FindFirstAncestor("NotificationsOrchestrator")
local SlotIdModule = require(NotificationsOrchestrator.Enums.SlotId)
local SlotGroupModule = require(NotificationsOrchestrator.Enums.SlotGroup)

return {
	[SlotIdModule.EducationTooltipOnHamburger] = SlotGroupModule.PopUps,
	[SlotIdModule.EducationTooltipOnShopIcon] = SlotGroupModule.PopUps
}