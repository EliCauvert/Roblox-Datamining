local GetMockNameModule = require(script.Parent.getMockName)
local _ = require(script.Parent.Parent.Types.ContactTypes)
local DashModule = require(script.Parent.Parent.Parent.Dash)
local DeviceContactModule = {}

function DeviceContactModule.new(JoinResult)
	-- upvalues: DeviceContactModule (copy)
	DeviceContactModule.__index = DeviceContactModule
	local config = {
		id = JoinResult.id,
		phoneNumbers = JoinResult.phoneNumbers,
		contactName = JoinResult.contactName
	}
	setmetatable(config, DeviceContactModule)
	
	return config
end

function DeviceContactModule.mock(p1)
	-- upvalues: GetMockNameModule (copy), DashModule (copy), DeviceContactModule (copy)
	local MockNameModule = GetMockNameModule()
	
	return DeviceContactModule.new((DashModule.join({
		id = MockNameModule,
		contactName = MockNameModule,
		phoneNumbers = { "123456" }
	}, p1)))
end

function DeviceContactModule.formatFromDevice(p1)
	-- upvalues: DeviceContactModule (copy)
	return DeviceContactModule.new({
		id = DeviceContactModule.generateId(p1),
		contactName = (p1.firstname or "") .. " " .. (p1.lastname or ""),
		phoneNumbers = p1.phonenumber
	})
end

function DeviceContactModule.generateId(p1): string
	return (p1.firstname or "") .. (p1.lastname or "") .. tostring(p1.phonenumber[1])
end

return DeviceContactModule