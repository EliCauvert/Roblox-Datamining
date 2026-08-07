local parent = script.Parent.Parent
local messageBus = require(parent.MessageBus).MessageBus
local _ = require(script.Parent.SystemInfoProtocolTypes)
local t = {
	GET_SYSTEM_INFO_DESCRIPTOR = {
		fid = messageBus.getMessageId("SystemInfo", "getSystemInfo"),
		validateParams = require(parent.t).table
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
t.ALL_INFO_NAMES = {
	t.InfoNames.MANUFACTURER, t.InfoNames.DEVICE_NAME, t.InfoNames.MAX_MEMORY,
	t.InfoNames.MAX_RESOLUTION, t.InfoNames.BASE_OS, t.InfoNames.SYSTEM_VERSION,
	t.InfoNames.APP_VERSION, t.InfoNames.CPU_MAKE, t.InfoNames.IS_64BIT,
	t.InfoNames.CPU_LOGICAL_COUNT, t.InfoNames.CPU_CORE_COUNT,
	t.InfoNames.CPU_PHYS_COUNT, t.InfoNames.CPU_SPEED, t.InfoNames.GPU,
	t.InfoNames.AVAIL_RAM, t.InfoNames.NETWORK_TYPE
}

if game:GetEngineFeature("NewSystemInfoFeaturesEnabled") then
	table.insert(t.ALL_INFO_NAMES, t.InfoNames.BATTERY_LEVEL)
	table.insert(t.ALL_INFO_NAMES, t.InfoNames.THERMAL_STATUS)
end
t.__index = t

function t.new(p0) --[[ line: 76 ]]
	-- upvalues: messageBus (ref), t (ref)
	return setmetatable({ messageBus = p0 or messageBus }, t)
end

function t:getSystemInfo(b) --[[ line: 97 ]]
	return self.messageBus.call(self.GET_SYSTEM_INFO_DESCRIPTOR, b)
end

t.default = t.new()

return t