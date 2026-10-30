local _ = require(script.Types)
local SlotGroupConfigByGroupIdModule = require(script.Config.SlotGroupConfigByGroupId)
local SlotConfigBySlotIdModule = require(script.Config.SlotConfigBySlotId)
local GetNotificationsStoreModule = require(script.Stores.GetNotificationsStore)

return {
	SlotId = require(script.Enums.SlotId),
	SlotGroup = require(script.Enums.SlotGroup),
	SlotGroupBySlotId = require(script.Config.SlotGroupBySlotId),
	GlobalSlotGroupConfig = SlotGroupConfigByGroupIdModule.GlobalSlotGroupConfig,
	SlotGroupConfigByGroupId = SlotGroupConfigByGroupIdModule.SlotGroupConfigByGroupId,
	getSlotGroupConfig = SlotGroupConfigByGroupIdModule.getSlotGroupConfig,
	GlobalSlotConfig = SlotConfigBySlotIdModule.GlobalSlotConfig,
	SlotConfigBySlotId = SlotConfigBySlotIdModule.SlotConfigBySlotId,
	getSlotConfig = SlotConfigBySlotIdModule.getSlotConfig,
	GetNotificationsStore = GetNotificationsStoreModule,
	submit = function(p1)
		-- upvalues: GetNotificationsStoreModule (copy)
		return GetNotificationsStoreModule(false).submit(p1)
	end,
	revoke = function(p1)
		-- upvalues: GetNotificationsStoreModule (copy)
		GetNotificationsStoreModule(false).revoke(p1)
	end,
	report = function(p1, p2, p3)
		-- upvalues: GetNotificationsStoreModule (copy)
		GetNotificationsStoreModule(false).report(p1, p2, p3)
	end,
	getActiveForSlot = function(p1)
		-- upvalues: GetNotificationsStoreModule (copy)
		return GetNotificationsStoreModule(false).getActiveForSlot(p1)
	end,
	["jest.config"] = script["jest.config"]
}