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
	-- upvalues: byContactIdModule (ref), byDeviceContactIdModule (ref), hasSentRequestModule (ref), deviceContactToRobloxContactModule (ref), t (ref)
	local var5 = byContactIdModule(p0)
	local var6 = byDeviceContactIdModule(p0)
	local var7 = hasSentRequestModule(p0)
	local var8 = deviceContactToRobloxContactModule(p0)
	
	return function(p1, p2) --[[ line: 22 ]]
		-- upvalues: t (copy), var5 (ref), var6 (ref), var7 (ref), var8 (ref)
		p1 = p1 or t
		
		return {
			byContactId = var5(p1.byContactId, p2),
			byDeviceContactId = var6(p1.byDeviceContactId, p2),
			hasSentRequest = var7(p1.hasSentRequest, p2),
			deviceContactToRobloxContact = var8(p1.deviceContactToRobloxContact, p2)
		}
	end
end