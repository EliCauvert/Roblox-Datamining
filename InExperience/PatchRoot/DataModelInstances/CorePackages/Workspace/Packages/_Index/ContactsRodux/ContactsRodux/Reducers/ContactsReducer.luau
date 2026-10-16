local Parent = script.Parent.Parent
local ByContactIdModule = require(Parent.Reducers.Contacts.byContactId)
local ByDeviceContactIdModule = require(Parent.Reducers.Contacts.byDeviceContactId)
local HasSentRequestModule = require(Parent.Reducers.Contacts.hasSentRequest)
local _ = require(Parent.Types.ReducerTypes)
local DeviceContactToRobloxContactModule = require(Parent.Reducers.Contacts.deviceContactToRobloxContact)
local config = {
	byContactId = {},
	byDeviceContactId = {},
	hasSentRequest = {},
	deviceContactToRobloxContact = {}
}

return function(p1) --[[ Line: 16 ]]
	-- upvalues: ByContactIdModule (copy), ByDeviceContactIdModule (copy), HasSentRequestModule (copy), DeviceContactToRobloxContactModule (copy), config (copy)
	local ByContactIdModuleResult = ByContactIdModule(p1)
	local ByDeviceContactIdModuleResult = ByDeviceContactIdModule(p1)
	local HasSentRequestModule1 = HasSentRequestModule(p1)
	local DeviceContactToRobloxContactModuleResult = DeviceContactToRobloxContactModule(p1)
	
	return function(p2, p3) --[[ Line: 22 ]]
		-- upvalues: config (upval), ByContactIdModuleResult (copy), ByDeviceContactIdModuleResult (copy), HasSentRequestModule1 (copy), DeviceContactToRobloxContactModuleResult (copy)
		local P1 = p2 or config
		
		return {
			byContactId = ByContactIdModuleResult(P1.byContactId, p3),
			byDeviceContactId = ByDeviceContactIdModuleResult(P1.byDeviceContactId, p3),
			hasSentRequest = HasSentRequestModule1(P1.hasSentRequest, p3),
			deviceContactToRobloxContact = DeviceContactToRobloxContactModuleResult(P1.deviceContactToRobloxContact, p3)
		}
	end
end