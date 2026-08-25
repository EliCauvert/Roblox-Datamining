local roduxCall = script:FindFirstAncestor("RoduxCall")
local parent = roduxCall.Parent
local tModule = require(parent.t)
local cryoModule = require(parent.Cryo)
local enumsModule = require(roduxCall.Enums)
local t = {}

function t.new(p0)
	-- upvalues: t (ref)
	assert(t.isValid(p0))
	t.__index = t
	setmetatable(p0, t)
	
	return p0
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

function t.format(p2)
	-- upvalues: cryoModule (ref), enumsModule (ref)
	return cryoModule.Dictionary.join(p2, {
		userPresenceType = enumsModule.PresenceType[p2.userPresenceType]
	})
end

t.isValid = tModule.strictInterface({
	userId = tModule.number,
	userPresenceType = function(p3)
		-- upvalues: enumsModule (ref)
		return enumsModule.PresenceType[p3] ~= nil
	end,
	lastLocation = tModule.string
})

return t