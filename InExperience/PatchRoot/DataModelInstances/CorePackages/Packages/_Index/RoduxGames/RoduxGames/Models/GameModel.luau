local TModule = require(script:FindFirstAncestor("RoduxGames").Parent.t)
local CreatorModelModule = require(script.Parent.CreatorModel)
local GameModelModule = {}

function GameModelModule.new(p1)
	-- upvalues: GameModelModule (copy)
	assert(GameModelModule.isValid(p1))
	GameModelModule.__index = GameModelModule
	setmetatable(p1, GameModelModule)
	
	return p1
end

function GameModelModule.mock(Creator)
	-- upvalues: GameModelModule (copy), CreatorModelModule (copy)
	local Creator1 = Creator or {}
	
	return (GameModelModule.new({
		experienceId = Creator1.experienceId or "experienceId",
		name = Creator1.name or "name",
		description = Creator1.description or "description",
		price = Creator1.price or 666,
		rootPlaceId = Creator1.rootPlaceId or "rootPlaceId",
		creator = CreatorModelModule.mock(Creator1.creator),
		maxPlayers = Creator1.maxPlayers or 6,
		playing = Creator1.playing or 1000
	}))
end

function GameModelModule.format(Creator)
	-- upvalues: GameModelModule (copy), CreatorModelModule (copy)
	return (GameModelModule.new({
		experienceId = tostring(Creator.id),
		name = Creator.name,
		description = Creator.description or "",
		price = Creator.price or 0,
		rootPlaceId = tostring(Creator.rootPlaceId),
		creator = CreatorModelModule.format(Creator.creator),
		maxPlayers = Creator.maxPlayers,
		playing = Creator.playing
	}))
end

GameModelModule.isValid = TModule.strictInterface({
	experienceId = TModule.string,
	name = TModule.string,
	description = TModule.string,
	price = TModule.number,
	rootPlaceId = TModule.string,
	creator = CreatorModelModule.isValid,
	maxPlayers = TModule.number,
	playing = TModule.number
})

return GameModelModule