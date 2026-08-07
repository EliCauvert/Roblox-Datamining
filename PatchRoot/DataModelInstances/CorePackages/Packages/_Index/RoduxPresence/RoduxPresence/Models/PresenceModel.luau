-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:09 2026 Pacific Standard Time.

local roduxPresence = script:FindFirstAncestor("RoduxPresence")
local parent = roduxPresence.Parent
local cryoModule = require(parent.Cryo)
local tModule = require(parent.t)
local enumsModule = require(roduxPresence.Enums)
local t = {}

function t.new(p0) --[[ line: 10 ]]
	-- upvalues: t (ref)
	assert(t.isValid(p0))
	t.__index = t
	setmetatable(p0, t)
	
	return p0
end

function t.mock(p1) --[[ line: 22 ]]
	-- upvalues: t (ref)
	p1 = p1 or {}
	
	return t.new({
		gameId = p1.gameId or "Game-OoooOO-Id",
		invisibleModeExpiry = p1.invisibleModeExpiry or "2061-01-01T00:00:00Z",
		lastLocation = p1.lastLocation or "LastLocation",
		lastOnline = p1.lastOnline or "LastOnline-OOOoOO",
		placeId = p1.placeId or 123,
		rootPlaceId = p1.rootPlaceId or 234,
		universeId = p1.universeId or 345,
		userId = p1.userId or 456,
		userPresenceType = p1.userPresenceType or 0
	})
end

function t.format(p2) --[[ line: 40 ]]
	-- upvalues: cryoModule (ref), enumsModule (ref)
	return cryoModule.Dictionary.join(p2, {
		userPresenceType = enumsModule.PresenceType.fromRawValue(p2.userPresenceType)
	})
end

t.isValid = tModule.interface({
	gameId = tModule.optional(tModule.string),
	invisibleModeExpiry = tModule.optional(tModule.string),
	lastLocation = tModule.string,
	lastOnline = tModule.string,
	placeId = tModule.optional(tModule.union(tModule.numberPositive, tModule.string)),
	rootPlaceId = tModule.optional(tModule.union(tModule.numberPositive, tModule.string)),
	universeId = tModule.optional(tModule.union(tModule.numberPositive, tModule.string)),
	userId = tModule.union(tModule.numberPositive, tModule.string),
	userPresenceType = function(p3) --[[ line: 55 ]]
		-- upvalues: enumsModule (ref)
		return enumsModule.PresenceType.fromRawValue(p3) ~= nil
	end
})

return t