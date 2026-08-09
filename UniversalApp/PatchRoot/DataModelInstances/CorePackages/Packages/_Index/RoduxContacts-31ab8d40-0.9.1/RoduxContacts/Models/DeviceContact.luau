local parent = script.Parent.Parent.Parent
local getMockNameModule = require(script.Parent.getMockName)
local _ = require(script.Parent.Parent.Types.ContactTypes)
local dashModule = require(parent.Dash)
local t = {}

function t.new(p0) --[[ line: 9 ]]
	-- upvalues: t (ref)
	t.__index = t
	local t_1 = {
		id = p0.id,
		phoneNumbers = p0.phoneNumbers,
		contactName = p0.contactName
	}
	setmetatable(t_1, t)
	
	return t_1
end

function t.mock(p1) --[[ line: 23 ]]
	-- upvalues: getMockNameModule (ref), dashModule (ref), t (ref)
	local var4 = getMockNameModule()
	
	return t.new(dashModule.join({ id = var4, contactName = var4, phoneNumbers = { 123456 } }, p1))
end

function t.formatFromDevice(p2) --[[ line: 39 ]]
	-- upvalues: t (ref)
	return t.new({
		id = t.generateId(p2),
		contactName = (p2.firstname or "") .. " " .. (p2.lastname or ""),
		phoneNumbers = p2.phonenumber
	})
end

function t.generateId(p3) --[[ line: 49 ]]
	return (p3.firstname or "") .. (p3.lastname or "") .. tostring(p3.phonenumber[1])
end

return t