local Parent = script.Parent.Parent
local MessageBus = require(Parent.MessageBus).MessageBus
local _ = require(script.Parent.SystemInfoProtocolTypes)
local SystemInfoProtocolModule = {
	GET_SYSTEM_INFO_DESCRIPTOR = {
		fid = MessageBus.getMessageId("SystemInfo", "getSystemInfo"),
		validateParams = require(Parent.t).table
	},
	InfoNames = {
		MANUFACTURER = "manufacturer",
		DEVICE_NAME = "deviceName",
		MAX_MEMORY = "maxMemory",
		MAX_RESOLUTION = "maxResolution",
		BASE_OS = "baseOs",
		SYSTEM_VERSION = "systemVersion",
		APP_VERSION = "appVersion",
		CPU_MAKE = "cpuMake",
		IS_64BIT = "is64bit",
		CPU_LOGICAL_COUNT = "cpuLogicalCount",
		CPU_CORE_COUNT = "cpuCoreCount",
		CPU_PHYS_COUNT = "cpuPhysCount",
		CPU_SPEED = "cpuSpeed",
		GPU = "GPU",
		AVAIL_RAM = "availRAM",
		NETWORK_TYPE = "networkType",
		BATTERY_LEVEL = "batteryLevel",
		THERMAL_STATUS = "thermalStatus"
	}
}
SystemInfoProtocolModule.ALL_INFO_NAMES = {
	SystemInfoProtocolModule.InfoNames.MANUFACTURER,
	SystemInfoProtocolModule.InfoNames.DEVICE_NAME,
	SystemInfoProtocolModule.InfoNames.MAX_MEMORY,
	SystemInfoProtocolModule.InfoNames.MAX_RESOLUTION,
	SystemInfoProtocolModule.InfoNames.BASE_OS,
	SystemInfoProtocolModule.InfoNames.SYSTEM_VERSION,
	SystemInfoProtocolModule.InfoNames.APP_VERSION,
	SystemInfoProtocolModule.InfoNames.CPU_MAKE,
	SystemInfoProtocolModule.InfoNames.IS_64BIT,
	SystemInfoProtocolModule.InfoNames.CPU_LOGICAL_COUNT,
	SystemInfoProtocolModule.InfoNames.CPU_CORE_COUNT,
	SystemInfoProtocolModule.InfoNames.CPU_PHYS_COUNT,
	SystemInfoProtocolModule.InfoNames.CPU_SPEED,
	SystemInfoProtocolModule.InfoNames.GPU,
	SystemInfoProtocolModule.InfoNames.AVAIL_RAM,
	SystemInfoProtocolModule.InfoNames.NETWORK_TYPE
}

if game:GetEngineFeature("NewSystemInfoFeaturesEnabled") then
	table.insert(SystemInfoProtocolModule.ALL_INFO_NAMES, SystemInfoProtocolModule.InfoNames.BATTERY_LEVEL)
	table.insert(SystemInfoProtocolModule.ALL_INFO_NAMES, SystemInfoProtocolModule.InfoNames.THERMAL_STATUS)
end
SystemInfoProtocolModule.__index = SystemInfoProtocolModule

function SystemInfoProtocolModule.new(p1)
	-- upvalues: MessageBus (copy), SystemInfoProtocolModule (copy)
	return (setmetatable({ messageBus = p1 or MessageBus }, SystemInfoProtocolModule))
end

function SystemInfoProtocolModule:getSystemInfo(p1)
	return self.messageBus.call(self.GET_SYSTEM_INFO_DESCRIPTOR, p1)
end

SystemInfoProtocolModule.default = SystemInfoProtocolModule.new()

return SystemInfoProtocolModule