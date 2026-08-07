local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)
local roduxModule = require(corePackagesService.Packages.Rodux)
local actions = script.Parent.Parent.Actions

local function createCurrentEmotes(p0, p1) --[[ line: 24 ]]
	local t = {}
	
	for i, v in ipairs(p1) do
		local slot = v.Slot
		local name = v.Name
		
		if slot and name and p0[name] then
			t[slot] = name
		end
	end
	return t
end

return roduxModule.createReducer({
	numberEmotesLoaded = -1,
	emotesInfo = {},
	equippedEmotes = {},
	currentEmotes = {}
}, {
	[require(actions.EmotesChanged).name] = function(p2, p3) --[[ line: 42 ]]
		-- upvalues: cryoModule (ref), createCurrentEmotes (ref)
		return cryoModule.Dictionary.join(p2, {
			emotesInfo = p3.emotes,
			currentEmotes = createCurrentEmotes(p3.emotes, p2.equippedEmotes)
		})
	end,
	[require(actions.EquippedEmotesChanged).name] = function(p4, p5) --[[ line: 49 ]]
		-- upvalues: cryoModule (ref), createCurrentEmotes (ref)
		return cryoModule.Dictionary.join(p4, {
			equippedEmotes = p5.equippedEmotes,
			currentEmotes = createCurrentEmotes(p4.emotesInfo, p5.equippedEmotes)
		})
	end,
	[require(actions.NumberEmotesLoadedChanged).name] = function(p6, p7) --[[ line: 56 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p6, { numberEmotesLoaded = p7.numberEmotesLoaded })
	end
})