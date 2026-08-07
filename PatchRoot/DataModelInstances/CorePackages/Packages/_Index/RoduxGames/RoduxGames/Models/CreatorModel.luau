-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:08 2026 Pacific Standard Time.

local roduxGames = script:FindFirstAncestor("RoduxGames")
local tModule = require(roduxGames.Parent.t)
local creatorType = require(roduxGames.Enums).CreatorType
local t = {}

function t.new(p0) --[[ line: 15 ]]
	-- upvalues: t (ref)
	assert(t.isValid(p0))
	t.__index = t
	setmetatable(p0, t)
	
	return p0
end

function t.mock(p1) --[[ line: 27 ]]
	-- upvalues: t (ref), creatorType (ref)
	p1 = p1 or {}
	
	return t.new({
		creatorId = p1.creatorId or "creatorId",
		creatorName = p1.creatorName or "creatorName",
		creatorType = p1.creatorType or creatorType.User
	})
end

function t.format(p2) --[[ line: 39 ]]
	-- upvalues: t (ref), creatorType (ref)
	return t.new({
		creatorId = tostring(p2.id),
		creatorName = p2.name,
		creatorType = creatorType.fromRawValue(p2.type)
	})
end

t.isValid = tModule.strictInterface({
	creatorId = tModule.string,
	creatorName = tModule.string,
	creatorType = tModule.userdata
})

return t