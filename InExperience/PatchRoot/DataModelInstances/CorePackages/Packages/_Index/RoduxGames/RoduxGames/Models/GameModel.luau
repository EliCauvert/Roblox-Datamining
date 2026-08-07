local tModule = require(script:FindFirstAncestor("RoduxGames").Parent.t)
local creatorModelModule = require(script.Parent.CreatorModel)
local t = {}

function t.new(p0) --[[ line: 18 ]]
	-- upvalues: t (ref)
	assert(t.isValid(p0))
	t.__index = t
	setmetatable(p0, t)
	
	return p0
end

function t.mock(p1) --[[ line: 30 ]]
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

function t.format(p2) --[[ line: 47 ]]
	-- upvalues: t (ref), creatorModelModule (ref)
	return t.new({
		experienceId = tostring(p2.id),
		name = p2.name,
		description = p2.description or "",
		price = p2.price or 0,
		rootPlaceId = tostring(p2.rootPlaceId),
		creator = creatorModelModule.format(p2.creator),
		maxPlayers = p2.maxPlayers,
		playing = p2.playing
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