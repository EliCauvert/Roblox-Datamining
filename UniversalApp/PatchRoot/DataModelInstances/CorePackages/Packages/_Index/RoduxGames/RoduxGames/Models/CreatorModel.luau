local roduxGames = script:FindFirstAncestor("RoduxGames")
local tModule = require(roduxGames.Parent.t)
local creatorType = require(roduxGames.Enums).CreatorType
local t = {}

function t.new(p1)
	-- upvalues: t (ref)
	assert(t.isValid(p1))
	t.__index = t
	setmetatable(p1, t)
	
	return p1
end

function t.mock(p1)
	-- upvalues: t (ref), creatorType (ref)
	p1 = p1 or {}
	
	return t.new({
		creatorId = p1.creatorId or "creatorId",
		creatorName = p1.creatorName or "creatorName",
		creatorType = p1.creatorType or creatorType.User
	})
end

function t.format(p1)
	-- upvalues: t (ref), creatorType (ref)
	return t.new({
		creatorId = tostring(p1.id),
		creatorName = p1.name,
		creatorType = creatorType.fromRawValue(p1.type)
	})
end

t.isValid = tModule.strictInterface({
	creatorId = tModule.string,
	creatorName = tModule.string,
	creatorType = tModule.userdata
})

return t