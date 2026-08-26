local parent = script.Parent.Parent.Parent
local getMockNameModule = require(script.Parent.getMockName)
local _ = require(script.Parent.Parent.Types.ContactTypes)
local dashModule = require(parent.Dash)
local t = {}

function t.new(p1)
	-- upvalues: t (ref)
	t.__index = t
	local t_1 = {
		id = p1.id,
		phoneNumbers = p1.phoneNumbers,
		contactName = p1.contactName
	}
	setmetatable(t_1, t)
	
	return t_1
end

function t.mock(p1)
	-- upvalues: getMockNameModule (ref), dashModule (ref), t (ref)
	local var1 = getMockNameModule()
	
	return t.new(dashModule.join({
		id = var1,
		contactName = var1,
		phoneNumbers = { "123456" }
	}, p1))
end

function t.formatFromDevice(p1)
	-- upvalues: t (ref)
	return t.new({
		id = t.generateId(p1),
		contactName = (p1.firstname or "") .. " " .. (p1.lastname or ""),
		phoneNumbers = p1.phonenumber
	})
end

function t.generateId(p1)
	return (p1.firstname or "") .. (p1.lastname or "") .. tostring(p1.phonenumber[1])
end

return t