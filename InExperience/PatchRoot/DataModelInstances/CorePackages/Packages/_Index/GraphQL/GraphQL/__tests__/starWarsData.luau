local Parent = script.Parent.Parent.Parent
local _ = require(Parent.LuauPolyfill)
local Array = require(Parent.LuauPolyfill).Array
local PromiseModule = require(Parent.Promise)
local config = {
	type = "Human",
	id = "1000",
	name = "Luke Skywalker",
	homePlanet = "Tatooine",
	friends = { "1002", "1003", "2000", "2001" },
	appearsIn = { 4, 5, 6 }
}
local config1 = {
	type = "Human",
	id = "1001",
	name = "Darth Vader",
	homePlanet = "Tatooine",
	friends = { "1004" },
	appearsIn = { 4, 5, 6 }
}
local config2 = {
	type = "Human",
	id = "1002",
	name = "Han Solo",
	friends = { "1000", "1003", "2001" },
	appearsIn = { 4, 5, 6 }
}
local config3 = {
	type = "Human",
	id = "1003",
	name = "Leia Organa",
	homePlanet = "Alderaan",
	friends = { "1000", "1002", "2000", "2001" },
	appearsIn = { 4, 5, 6 }
}
local config4 = {
	type = "Human",
	id = "1004",
	name = "Wilhuff Tarkin",
	friends = { "1001" },
	appearsIn = { 4 }
}
local config5 = {
	[config.id] = config,
	[config1.id] = config1,
	[config2.id] = config2,
	[config3.id] = config3,
	[config4.id] = config4
}
local config6 = {
	type = "Droid",
	id = "2000",
	name = "C-3PO",
	primaryFunction = "Protocol",
	friends = { "1000", "1002", "1003", "2001" },
	appearsIn = { 4, 5, 6 }
}
local config7 = {
	type = "Droid",
	id = "2001",
	name = "R2-D2",
	primaryFunction = "Astromech",
	friends = { "1000", "1002", "1003" },
	appearsIn = { 4, 5, 6 }
}
local config8 = { [config6.id] = config6, [config7.id] = config7 }

local function getCharacter(p1) --[[ Line: 135 ]]
	-- upvalues: PromiseModule (copy), config5 (copy), config8 (copy)
	return PromiseModule.resolve(config5[p1] or config8[p1])
end

return {
	getHuman = function(p1) --[[ Line: 165 ]]
		-- upvalues: config5 (copy)
		return config5[p1]
	end,
	getCharacter = getCharacter,
	getDroid = function(p1) --[[ Line: 172 ]]
		-- upvalues: config8 (copy)
		return config8[p1]
	end,
	getFriends = function(p1) --[[ Line: 143 ]]
		-- upvalues: Array (copy), getCharacter (copy)
		return Array.map(p1.friends, function(p2) --[[ Line: 145 ]]
			-- upvalues: getCharacter (upval)
			return getCharacter(p2)
		end)
	end,
	getHero = function(p1) --[[ Line: 153 ]]
		-- upvalues: config (copy), config7 (copy)
		return if p1 == 5 then config else config7
	end
}