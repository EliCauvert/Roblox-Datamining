local parent = script.Parent.Parent
local types = parent.Types
local byContactIdModule = require(parent.Reducers.Contacts.byContactId)
local byDeviceContactIdModule = require(parent.Reducers.Contacts.byDeviceContactId)
local hasSentRequestModule = require(parent.Reducers.Contacts.hasSentRequest)
local _ = require(types.ReducerTypes)
local deviceContactToRobloxContactModule = require(parent.Reducers.Contacts.deviceContactToRobloxContact)
local t = {
	byContactId = {},
	byDeviceContactId = {},
	hasSentRequest = {},
	deviceContactToRobloxContact = {}
}

return function(p1)
	-- upvalues: byContactIdModule (ref), byDeviceContactIdModule (ref), hasSentRequestModule (ref), deviceContactToRobloxContactModule (ref), t (ref)
	local var1 = byContactIdModule(p1)
	local var2 = byDeviceContactIdModule(p1)
	local var3 = hasSentRequestModule(p1)
	local var4 = deviceContactToRobloxContactModule(p1)
	
	return function(p2, p3)
		-- upvalues: t (copy), var1 (ref), var2 (ref), var3 (ref), var4 (ref)
		p2 = p2 or t
		
		return {
			byContactId = var1(p2.byContactId, p3),
			byDeviceContactId = var2(p2.byDeviceContactId, p3),
			hasSentRequest = var3(p2.hasSentRequest, p3),
			deviceContactToRobloxContact = var4(p2.deviceContactToRobloxContact, p3)
		}
	end
end