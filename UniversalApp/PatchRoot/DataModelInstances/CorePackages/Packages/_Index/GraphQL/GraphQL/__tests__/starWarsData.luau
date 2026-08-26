local parent = script.Parent.Parent.Parent
local _ = require(parent.LuauPolyfill)
local array = require(parent.LuauPolyfill).Array
local promiseModule = require(parent.Promise)
local t = {
	type = "Human",
	id = "1000",
	name = "Luke Skywalker",
	homePlanet = "Tatooine",
	friends = { "1002", "1003", "2000", "2001" },
	appearsIn = { 4, 5, 6 }
}
local t_1 = {
	type = "Human",
	id = "1001",
	name = "Darth Vader",
	homePlanet = "Tatooine",
	friends = { "1004" },
	appearsIn = { 4, 5, 6 }
}
local t_2 = {
	type = "Human",
	id = "1002",
	name = "Han Solo",
	friends = { "1000", "1003", "2001" },
	appearsIn = { 4, 5, 6 }
}
local t_3 = {
	type = "Human",
	id = "1003",
	name = "Leia Organa",
	homePlanet = "Alderaan",
	friends = { "1000", "1002", "2000", "2001" },
	appearsIn = { 4, 5, 6 }
}
local t_4 = {
	type = "Human",
	id = "1004",
	name = "Wilhuff Tarkin",
	friends = { "1001" },
	appearsIn = { 4 }
}
local t_5 = {
	[t.id] = t,
	[t_1.id] = t_1,
	[t_2.id] = t_2,
	[t_3.id] = t_3,
	[t_4.id] = t_4
}
local t_6 = {
	type = "Droid",
	id = "2000",
	name = "C-3PO",
	primaryFunction = "Protocol",
	friends = { "1000", "1002", "1003", "2001" },
	appearsIn = { 4, 5, 6 }
}
local t_7 = {
	type = "Droid",
	id = "2001",
	name = "R2-D2",
	primaryFunction = "Astromech",
	friends = { "1000", "1002", "1003" },
	appearsIn = { 4, 5, 6 }
}
local t_8 = { [t_6.id] = t_6, [t_7.id] = t_7 }

local function getCharacter(p1)
	-- upvalues: promiseModule (ref), t_5 (ref), t_8 (ref)
	return promiseModule.resolve(t_5[p1] or t_8[p1])
end

return {
	getHuman = function(p1)
		-- upvalues: t_5 (ref)
		return t_5[p1]
	end,
	getCharacter = getCharacter,
	getDroid = function(p1)
		-- upvalues: t_8 (ref)
		return t_8[p1]
	end,
	getFriends = function(p1)
		-- upvalues: array (ref), getCharacter (ref)
		return array.map(p1.friends, function(p2)
			-- upvalues: getCharacter (copy)
			return getCharacter(p2)
		end)
	end,
	getHero = function(p1)
		-- upvalues: t (ref), t_7 (ref)
		return if p1 == 5 then t else t_7
	end
}