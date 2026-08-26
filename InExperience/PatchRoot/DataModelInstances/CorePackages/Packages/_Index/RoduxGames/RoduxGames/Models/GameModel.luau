local tModule = require(script:FindFirstAncestor("RoduxGames").Parent.t)
local creatorModelModule = require(script.Parent.CreatorModel)
local t = {}

function t.new(p1)
	-- upvalues: t (ref)
	assert(t.isValid(p1))
	t.__index = t
	setmetatable(p1, t)
	
	return p1
end

function t.mock(p1)
	-- upvalues: t (ref), creatorModelModule (ref)
	p1 = p1 or {}
	
	return t.new({
		experienceId = p1.experienceId or "experienceId",
		name = p1.name or "name",
		description = p1.description or "description",
		price = p1.price or 666,
		rootPlaceId = p1.rootPlaceId or "rootPlaceId",
		creator = creatorModelModule.mock(p1.creator),
		maxPlayers = p1.maxPlayers or 6,
		playing = p1.playing or 1000
	})
end

function t.format(p1)
	-- upvalues: t (ref), creatorModelModule (ref)
	return t.new({
		experienceId = tostring(p1.id),
		name = p1.name,
		description = p1.description or "",
		price = p1.price or 0,
		rootPlaceId = tostring(p1.rootPlaceId),
		creator = creatorModelModule.format(p1.creator),
		maxPlayers = p1.maxPlayers,
		playing = p1.playing
	})
end

t.isValid = tModule.strictInterface({
	experienceId = tModule.string,
	name = tModule.string,
	description = tModule.string,
	price = tModule.number,
	rootPlaceId = tModule.string,
	creator = creatorModelModule.isValid,
	maxPlayers = tModule.number,
	playing = tModule.number
})

return t