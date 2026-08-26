local roduxCall = script:FindFirstAncestor("RoduxCall")
local parent = roduxCall.Parent
local tModule = require(parent.t)
local cryoModule = require(parent.Cryo)
local enumsModule = require(roduxCall.Enums)
local t = {}

function t.new(p1)
	-- upvalues: t (ref)
	assert(t.isValid(p1))
	t.__index = t
	setmetatable(p1, t)
	
	return p1
end

function t.mock(p1)
	-- upvalues: t (ref)
	p1 = p1 or {}
	
	return t.new({
		lastLocation = "",
		userId = p1.userId or 12345,
		userPresenceType = p1.userPresenceType or "Offline"
	})
end

function t.format(p1)
	-- upvalues: cryoModule (ref), enumsModule (ref)
	return cryoModule.Dictionary.join(p1, {
		userPresenceType = enumsModule.PresenceType[p1.userPresenceType]
	})
end

t.isValid = tModule.strictInterface({
	userId = tModule.number,
	userPresenceType = function(p1)
		-- upvalues: enumsModule (ref)
		return enumsModule.PresenceType[p1] ~= nil
	end,
	lastLocation = tModule.string
})

return t