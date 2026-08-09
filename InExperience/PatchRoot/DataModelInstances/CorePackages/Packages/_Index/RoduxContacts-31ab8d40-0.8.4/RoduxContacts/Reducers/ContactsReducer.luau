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

return function(p0) --[[ line: 16 ]]
	-- upvalues: t (ref), byContactIdModule (ref), byDeviceContactIdModule (ref), hasSentRequestModule (ref), deviceContactToRobloxContactModule (ref)
	return function(p1, p2) --[[ line: 17 ]]
		-- upvalues: t (copy), byContactIdModule (copy), p0 (ref), byDeviceContactIdModule (copy), hasSentRequestModule (copy), deviceContactToRobloxContactModule (copy)
		p1 = p1 or t
		
		return {
			byContactId = byContactIdModule(p0)(p1.byContactId, p2),
			byDeviceContactId = byDeviceContactIdModule(p0)(p1.byDeviceContactId, p2),
			hasSentRequest = hasSentRequestModule(p0)(p1.hasSentRequest, p2),
			deviceContactToRobloxContact = deviceContactToRobloxContactModule(p0)(p1.deviceContactToRobloxContact, p2)
		}
	end
end