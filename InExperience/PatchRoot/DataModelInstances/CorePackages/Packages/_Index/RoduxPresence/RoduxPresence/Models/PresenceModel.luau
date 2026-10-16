local RoduxPresence = script:FindFirstAncestor("RoduxPresence")
local Parent = RoduxPresence.Parent
local CryoModule = require(Parent.Cryo)
local TModule = require(Parent.t)
local EnumsModule = require(RoduxPresence.Enums)
local PresenceModelModule = {}

function PresenceModelModule.new(p1) --[[ Line: 10 ]]
	-- upvalues: PresenceModelModule (copy)
	assert(PresenceModelModule.isValid(p1))
	PresenceModelModule.__index = PresenceModelModule
	setmetatable(p1, PresenceModelModule)
	
	return p1
end

function PresenceModelModule.mock(p1) --[[ Line: 22 ]]
	-- upvalues: PresenceModelModule (copy)
	local P1 = p1 or {}
	
	return (PresenceModelModule.new({
		gameId = P1.gameId or "Game-OoooOO-Id",
		invisibleModeExpiry = P1.invisibleModeExpiry or "2061-01-01T00:00:00Z",
		lastLocation = P1.lastLocation or "LastLocation",
		lastOnline = P1.lastOnline or "LastOnline-OOOoOO",
		placeId = P1.placeId or 123,
		rootPlaceId = P1.rootPlaceId or 234,
		universeId = P1.universeId or 345,
		userId = P1.userId or 456,
		userPresenceType = P1.userPresenceType or 0
	}))
end

function PresenceModelModule.format(p1) --[[ Line: 40 ]]
	-- upvalues: CryoModule (copy), EnumsModule (copy)
	return CryoModule.Dictionary.join(p1, {
		userPresenceType = EnumsModule.PresenceType.fromRawValue(p1.userPresenceType)
	})
end

PresenceModelModule.isValid = TModule.interface({
	gameId = TModule.optional(TModule.string),
	invisibleModeExpiry = TModule.optional(TModule.string),
	lastLocation = TModule.string,
	lastOnline = TModule.string,
	placeId = TModule.optional(TModule.union(TModule.numberPositive, TModule.string)),
	rootPlaceId = TModule.optional(TModule.union(TModule.numberPositive, TModule.string)),
	universeId = TModule.optional(TModule.union(TModule.numberPositive, TModule.string)),
	userId = TModule.union(TModule.numberPositive, TModule.string),
	userPresenceType = function(p1): boolean --[[ Line: 55 ]]
		-- upvalues: EnumsModule (copy)
		return EnumsModule.PresenceType.fromRawValue(p1) ~= nil
	end
})

return PresenceModelModule